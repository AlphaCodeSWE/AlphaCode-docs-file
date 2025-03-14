#!/usr/bin/env python3
"""
process_files.py:
1. Legge 'sign_report.yml' contenente la lista dei PDF firmati.
2. Per ciascun file, determina la cartella padre (ad es. "candidatura") e la versione dal nome del file.
3. Raggruppa i file per cartella padre.
4. Per ogni gruppo, individua la versione massima (la più recente) che rimane nella cartella originale.
5. Archivia (copia e rimuove) i file con versioni inferiori, creando la cartella in
   documents/archive/<MappedParent>_v<version>, dove <MappedParent> è il nome della cartella padre mappato (es. "candidatura" -> "Candidatura").
6. Genera 'final_report.yml' con il riepilogo.
"""

import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion

# Regex per file del tipo "LetteraPresentazione_v1.0.0_signed.pdf"
FILE_REGEX = re.compile(r'^(?P<name>.+)_v(?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$')

def load_sign_report(report_file="sign_report.yml"):
    if not os.path.exists(report_file):
        print(f"ERRORE: File di report '{report_file}' non trovato.")
        sys.exit(1)
    with open(report_file, "r") as f:
        data = yaml.safe_load(f)
    if not data or "signed_files" not in data:
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' o è vuoto.")
        sys.exit(1)
    return data["signed_files"]

def load_config(config_file="config.yml"):
    """
    Carica il file config.yml, se esiste, per ottenere la mappa 'group_map'
    ad es.:
    group_map:
      candidatura: Candidatura
      rtb: RTB
      pb: PB
    """
    if not os.path.exists(config_file):
        return {"group_map": {}}
    with open(config_file, "r") as f:
        return yaml.safe_load(f)

def main():
    report_file = sys.argv[1] if len(sys.argv) > 1 else "sign_report.yml"
    signed_files = load_sign_report(report_file)
    config = load_config("config.yml")
    group_map = config.get("group_map", {})

    # Raggruppa i file in base alla cartella padre (l'ultima parte del percorso subito dopo "documents")
    grouped = {}
    for file_path in signed_files:
        # Esempio file_path: documents/candidatura/LetteraPresentazione_v1.0.0_signed.pdf
        # Estrae la cartella padre: "candidatura"
        parts = file_path.split(os.sep)
        if len(parts) < 2:
            print(f"ERRORE: Percorso non valido: {file_path}")
            continue
        parent = parts[1].lower()  # assumiamo che la struttura sia "documents/<parent>/..."
        # Mappa il nome se presente in group_map, altrimenti usa parent.capitalize()
        mapped_parent = group_map.get(parent, parent.capitalize())

        # Estrae la versione dal nome del file
        filename = os.path.basename(file_path)
        match = FILE_REGEX.match(filename)
        if not match:
            print(f"ERRORE: Il file '{filename}' non rispetta il formato atteso (nome_vX.Y.Z_signed.pdf)")
            continue
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"ERRORE: Versione non valida in '{filename}': {version_str}")
            continue

        key = mapped_parent  # raggruppa per nome mappato
        grouped.setdefault(key, []).append((ver, file_path))

    final_report = {"kept_in_documents": [], "archived": []}
    archive_root = "documents/archive"

    for doc, files_info in grouped.items():
        # Se c'è un solo file, lo manteniamo
        if len(files_info) == 1:
            ver, path_ = files_info[0]
            print(f"Mantengo l'unica versione per '{doc}': '{path_}' (v{ver})")
            final_report["kept_in_documents"].append({"doc": doc, "version": str(ver), "file": path_})
            continue

        # Trova la versione massima (più recente)
        max_ver = max(item[0] for item in files_info)
        for ver, path_ in files_info:
            if ver < max_ver:
                # Crea la cartella: documents/archive/<Doc>_v<version>
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
