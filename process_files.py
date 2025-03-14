#!/usr/bin/env python3
"""
process_files.py:
1. Legge 'sign_report.yml' (o un altro file passato come argomento) con la chiave 'signed_files:'
   e la lista dei PDF firmati (es: NomeDoc_v1.0.0_signed.pdf).
2. Per ogni 'doc', individua la versione piu' alta e la mantiene nella cartella originale.
   Le versioni meno recenti vengono spostate in documents/archive/<doc>_v<version>/.
3. Esegue la rimozione del file originale dalla cartella documents/... (copia e poi remove).
4. Crea un 'final_report.yml' con il riepilogo delle operazioni.
"""

import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion

# Regex: NomeDoc_v1.0.0_signed.pdf
# Adatta se i file si chiamano in modo diverso (es. NomeDoc.v1.0.0_signed.pdf).
FILE_REGEX = re.compile(r'^(?P<doc>.+)_v(?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$')

def load_sign_report(report_file="sign_report.yml"):
    """Carica la lista dei PDF firmati dal file di report."""
    if not os.path.exists(report_file):
        print(f"ERRORE: File di report '{report_file}' non trovato.")
        sys.exit(1)

    with open(report_file, "r") as f:
        data = yaml.safe_load(f)

    if not data or "signed_files" not in data:
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' o e' vuoto.")
        sys.exit(1)

    return data["signed_files"]

def main():
    # Se l'utente passa un argomento, usalo come nome del file di report
    if len(sys.argv) > 1:
        report_file = sys.argv[1]
    else:
        report_file = "sign_report.yml"

    signed_files = load_sign_report(report_file)

    # Raggruppiamo i file per "doc" (es. "NomeDoc") e "version" (es. 1.0.0)
    grouped = {}
    for file_path in signed_files:
        filename = os.path.basename(file_path)
        match = FILE_REGEX.match(filename)
        if not match:
            print(f"ERRORE: Il file '{filename}' non rispetta il formato doc_vX.Y.Z_signed.pdf")
            continue

        doc = match.group("doc")
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"ERRORE: Versione non valida in '{filename}': {version_str}")
            continue

        grouped.setdefault(doc, []).append((ver, file_path))

    # final_report con due liste: kept_in_documents e archived
    final_report = {
        "kept_in_documents": [],
        "archived": []
    }

    # Cartella dove archiviamo le versioni meno recenti
    archive_root = "documents/archive"

    # Per ogni doc, trova la versione max e sposta le altre in archive
    for doc, version_list in grouped.items():
        max_ver = max(v[0] for v in version_list)

        for (ver, src_path) in version_list:
            if ver < max_ver:
                # Creiamo la cartella: documents/archive/<doc>_v<version>/
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver}")
                os.makedirs(dest_folder, exist_ok=True)

                src_filename = os.path.basename(src_path)
                dest_path = os.path.join(dest_folder, src_filename)

                print(f"Sposto la versione meno recente: '{src_path}' -> '{dest_path}'")
                # Copia nella cartella di archivio
                shutil.copy2(src_path, dest_path)
                # Rimuove il file dalla cartella sorgente
                os.remove(src_path)

                final_report["archived"].append({
                    "doc": doc,
                    "version": str(ver),
                    "source": src_path,
                    "destination": dest_path
                })
            else:
                # Manteniamo la versione piu' recente dov'e'
                print(f"Mantengo la versione piu' recente: '{src_path}' (v{ver})")
                final_report["kept_in_documents"].append({
                    "doc": doc,
                    "version": str(ver),
                    "file": src_path
                })

    # Salviamo un final_report.yml con il riepilogo
    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)

    print("Operazione completata. Creato 'final_report.yml'.")

if __name__ == "__main__":
    main()
