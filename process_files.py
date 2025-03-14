#!/usr/bin/env python3
"""
process_files.py:
1. Legge 'sign_report.yml' contenente la lista dei PDF firmati.
2. Raggruppa i file per documento (in base al nome file).
3. Per ogni documento, determina la versione massima (più recente).
4. Archivia (copiando e rimuovendo) solo i file con versioni inferiori rispetto alla massima,
   creando la cartella di destinazione solo per quelle versioni.
5. Genera 'final_report.yml' con il riepilogo delle operazioni.
"""

import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion

# Regex per file del tipo "LetteraPresentazione_v1.0.0_signed.pdf"
FILE_REGEX = re.compile(r'^(?P<doc>.+)_v(?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$')

def load_sign_report(report_file="sign_report.yml"):
    if not os.path.exists(report_file):
        print(f"ERRORE: Il file di report '{report_file}' non esiste.")
        sys.exit(1)
    with open(report_file, "r") as f:
        data = yaml.safe_load(f)
    if not data or "signed_files" not in data:
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' o è vuoto.")
        sys.exit(1)
    return data["signed_files"]

def main():
    # Se viene passato un argomento, usalo come file di report
    report_file = sys.argv[1] if len(sys.argv) > 1 else "sign_report.yml"
    signed_files = load_sign_report(report_file)

    # Raggruppa i file per "doc" in base al filename
    grouped = {}
    for file_path in signed_files:
        filename = os.path.basename(file_path)
        match = FILE_REGEX.match(filename)
        if not match:
            print(f"ERRORE: Il file '{filename}' non rispetta il formato atteso (doc_vX.Y.Z_signed.pdf)")
            continue
        doc = match.group("doc")
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"ERRORE: Versione non valida in '{filename}': {version_str}")
            continue
        grouped.setdefault(doc, []).append((ver, file_path))

    final_report = {"kept_in_documents": [], "archived": []}
    archive_root = "documents/archive"

    # Per ogni documento, archivia solo i file con versione inferiore alla massima
    for doc, versions in grouped.items():
        # Trova la versione massima (più recente)
        max_ver = max(item[0] for item in versions)
        for ver, src_path in versions:
            if ver < max_ver:
                # Crea la cartella di archivio per questa versione (se non esiste)
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver}")
                os.makedirs(dest_folder, exist_ok=True)
                src_filename = os.path.basename(src_path)
                dest_path = os.path.join(dest_folder, src_filename)
                print(f"Sposto la versione meno recente: '{src_path}' -> '{dest_path}'")
                shutil.copy2(src_path, dest_path)
                os.remove(src_path)
                final_report["archived"].append({
                    "doc": doc,
                    "version": str(ver),
                    "source": src_path,
                    "destination": dest_path
                })
            else:
                print(f"Mantengo la versione più recente per '{doc}': '{src_path}' (v{ver})")
                final_report["kept_in_documents"].append({
                    "doc": doc,
                    "version": str(ver),
                    "file": src_path
                })

    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)
    print("Operazione completata. Creato 'final_report.yml'.")

if __name__ == "__main__":
    main()
