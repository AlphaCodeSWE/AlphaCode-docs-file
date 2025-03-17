#!/usr/bin/env python3
"""
process_files.py:
1. Legge 'sign_report.yml' contenente la lista dei PDF firmati.
2. Raggruppa i file per documento utilizzando la cartella padre (es. "candidatura")
   e il nome base del file (estratto prima della data).
3. Per ciascun gruppo, individua la versione massima (più recente) che rimane nella cartella originale;
   archivia (sposta) solo i file con versioni inferiori, creando la cartella in 
   documents/archive/<MappedParent>_v<version>.
4. Genera 'final_report.yml' con il riepilogo delle operazioni.
"""

import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion
#regole suffisso file
FILE_REGEX = re.compile(
    r'^(?P<name>.+?)_\d{4}_\d{2}_\d{2}_[Vv](?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$', re.IGNORECASE
)


def load_sign_report(report_file="sign_report.yml"):
    if not os.path.exists(report_file):
        print(f"ERRORE: Il file di report '{report_file}' non esiste.")
        sys.exit(1)
    with open(report_file, "r") as f:
        data = yaml.safe_load(f)
    if not data or "signed_files" not in data:
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' o è vuoto.")
        sys.exit(1)
    # Escludi file già in archive per evitare duplicati
    return [fp for fp in data["signed_files"] if "documents/archive" not in fp]

def load_config(config_file="config.yml"):
    if not os.path.exists(config_file):
        return {"group_map": {}}
    with open(config_file, "r") as f:
        return yaml.safe_load(f)

def get_mapped_parent(file_path, group_map):
    # Assumiamo che il file sia in un percorso come: documents/<subfolder>/...
    parts = file_path.split(os.sep)
    if len(parts) < 2 or parts[0] != "documents":
        return "Unknown"
    subfolder = parts[1].lower()  # es. "candidatura"
    return group_map.get(subfolder, subfolder.capitalize())

def main():
    report_file = sys.argv[1] if len(sys.argv) > 1 else "sign_report.yml"
    signed_files = load_sign_report(report_file)
    config = load_config("config.yml")
    group_map = config.get("group_map", {})

    final_report = {"kept_in_documents": [], "archived": []}
    archive_root = "documents/archive"

    # Raggruppa i file per mapped parent (es. "Candidatura")
    grouped = {}
    for file_path in signed_files:
        mapped_parent = get_mapped_parent(file_path, group_map)
        filename = os.path.basename(file_path)
        match = FILE_REGEX.match(filename)
        if not match:
            print(f"ERRORE: Il file '{filename}' non rispetta il formato atteso.")
            continue
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"ERRORE: Versione non valida in '{filename}': {version_str}")
            continue
        grouped.setdefault(mapped_parent, []).append((ver, file_path))

    # Per ogni gruppo, individua la versione massima e archivia solo quelle inferiori
    for doc, files_info in grouped.items():
        if len(files_info) == 1:
            ver, path_ = files_info[0]
            print(f"Mantengo l'unica versione per '{doc}': '{path_}' (v{ver})")
            final_report["kept_in_documents"].append({"doc": doc, "version": str(ver), "file": path_})
            continue

        max_ver = max(item[0] for item in files_info)
        for ver, src_path in files_info:
            if ver < max_ver:
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver}")
                os.makedirs(dest_folder, exist_ok=True)
                src_filename = os.path.basename(src_path)
                dest_path = os.path.join(dest_folder, src_filename)
                print(f"Sposto '{src_path}' -> '{dest_path}' (v{ver})")
                # Usa shutil.move() per spostare il file (copia e rimuove automaticamente)
                try:
                    shutil.move(src_path, dest_path)
                    print(f"File originale eliminato: '{src_path}'")
                except Exception as e:
                    print(f"ERRORE nello spostamento di '{src_path}': {e}")
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
