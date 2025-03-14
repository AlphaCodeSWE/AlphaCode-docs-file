#!/usr/bin/env python3
"""
Esempio di script "BOT":
- Legge sign_report.yml (un YAML con 'signed_files' come elenco di file firmati).
- Per ciascun "documento", tiene la versione più recente nella cartella originale
  e sposta in documents/archive/<doc>_v<ver> le versioni più vecchie.
- Genera final_report.yml.
"""

import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion

# Regex: NomeFile_v1.0.0_signed.pdf
# Adatta se i tuoi file sono di tipo NomeFile.v1.0.0_signed.pdf
FILE_REGEX = re.compile(r'^(?P<doc>.+)_v(?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$')

def load_sign_report(report_file="sign_report.yml"):
    """Carica la lista dei file firmati dal file report_file."""
    if not os.path.exists(report_file):
        print(f"ERRORE: Il file di report '{report_file}' non esiste.")
        sys.exit(1)

    with open(report_file, "r") as f:
        data = yaml.safe_load(f)

    if not data or "signed_files" not in data:
        print(f"ERRORE: Formato non valido in '{report_file}'. Manca 'signed_files'.")
        sys.exit(1)

    return data["signed_files"]

def main():
    # Se lo script riceve un argomento, è il nome del file di report
    if len(sys.argv) > 1:
        report_file = sys.argv[1]
    else:
        report_file = "sign_report.yml"

    # 1) Carica i PDF firmati
    signed_files = load_sign_report(report_file)

    # 2) Raggruppa i file per (doc) estraendo la versione
    grouped = {}
    for file_path in signed_files:
        filename = os.path.basename(file_path)
        match = FILE_REGEX.match(filename)
        if not match:
            print(f"ERRORE: Il file '{filename}' non rispetta il formato doc_vx.y.z_signed.pdf")
            continue

        doc = match.group("doc")
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"ERRORE: Versione non valida in '{filename}': {version_str}")
            continue

        if doc not in grouped:
            grouped[doc] = []
        grouped[doc].append((ver, file_path))

    # 3) Per ogni doc, trova la versione maggiore e sposta le versioni minori
    final_report = {
        "kept_in_documents": [],
        "archived": []
    }

    archive_root = "documents/archive"

    for doc, versions in grouped.items():
        max_ver = max(v[0] for v in versions)
        for (ver, file_path) in versions:
            if ver < max_ver:
                # Sposta in archive
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver}")
                os.makedirs(dest_folder, exist_ok=True)
                src_name = os.path.basename(file_path)
                dest_file = os.path.join(dest_folder, src_name)

                print(f"Sposto la versione più vecchia: '{file_path}' -> '{dest_file}'")
                shutil.copy2(file_path, dest_file)
                os.remove(file_path)

                final_report["archived"].append({
                    "doc": doc,
                    "version": str(ver),
                    "source": file_path,
                    "destination": dest_file
                })
            else:
                # Mantieni la versione più recente
                print(f"Mantengo la versione più recente: '{file_path}' (v{ver})")
                final_report["kept_in_documents"].append({
                    "doc": doc,
                    "version": str(ver),
                    "file": file_path
                })

    # 4) Salva final_report.yml
    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)

    print("Operazione completata. Salvato 'final_report.yml'.")

if __name__ == "__main__":
    main()
