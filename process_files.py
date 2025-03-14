#!/usr/bin/env python3
"""
process_files.py:
1. Legge 'sign_report.yml' contenente la lista dei PDF firmati.
2. Raggruppa i file per documento (estrapolando il nome base dal filename).
3. Per ciascun gruppo, individua la versione più recente.
4. Archivia (copia + elimina) soltanto i file con versioni minori, creando in archivio la cartella
   solo per quelle versioni.
5. Genera un 'final_report.yml' con il riepilogo delle operazioni.
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
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' oppure è vuoto.")
        sys.exit(1)
    return data["signed_files"]

def main():
    # Usa il file di report passato come argomento o "sign_report.yml" per default
    report_file = sys.argv[1] if len(sys.argv) > 1 else "sign_report.yml"
    signed_files = load_sign_report(report_file)

    # Raggruppa i file per documento (doc) estraendo la versione dal nome
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

    for doc, versions in grouped.items():
        # Se c'è un solo file, non archivia nulla
        if len(versions) == 1:
            ver, path_ = versions[0]
            print(f"Mantengo l'unica versione per '{doc}': '{path_}' (v{ver})")
            final_report["kept_in_documents"].append({"doc": doc, "version": str(ver), "file": path_})
            continue

        # Trova la versione maggiore
        max_ver = max(v[0] for v in versions)
        for ver, path_ in versions:
            if ver < max_ver:
                # Solo per i file con versione minore, crea la cartella di archivio e sposta il file
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver}")
                os.makedirs(dest_folder, exist_ok=True)
                src_filename = os.path.basename(path_)
                dest_path = os.path.join(dest_folder, src_filename)
                print(f"Sposto '{path_}' -> '{dest_path}' (v{ver})")
                shutil.copy2(path_, dest_path)
                os.remove(path_)
                final_report["archived"].append({
                    "doc": doc,
                    "version": str(ver),
                    "source": path_,
                    "destination": dest_path
                })
            else:
                # La versione maggiore la manteniamo in loco
                print(f"Mantengo la versione più recente per '{doc}': '{path_}' (v{ver})")
                final_report["kept_in_documents"].append({
                    "doc": doc,
                    "version": str(ver),
                    "file": path_
                })

    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)
    print("Operazione completata. Creato 'final_report.yml'.")

if __name__ == "__main__":
    main()
