#!/usr/bin/env python3
"""
Script "BOT" per:
1. Caricare config.yml.
2. Processare le directory (candidatura, rtb, pb) contenute in "documents".
3. Per ogni documento, individua la versione minore (esempio) e:
   - Copia il file in "documents/archive/<categoria>/v<version>"
   - Rimuove il file originale dalla cartella sorgente.
4. Genera (opzionale) un file di report (report.yml).
"""

import os
import re
import shutil
import yaml
from packaging.version import Version, InvalidVersion

def load_config(config_file=".github/workflows/config.yml"):
    """Carica il file di configurazione."""
    with open(config_file, "r") as f:
        return yaml.safe_load(f)

def scan_source_directory(source_dir, file_regex, file_pattern):
    """
    Scansiona la directory sorgente e ritorna un dizionario {doc: (file_path, version)}
    scegliendo per ogni documento il file con la versione minore.
    """
    grouped = {}
    regex = re.compile(file_regex)
    for root, _, files in os.walk(source_dir):
        for file in files:
            if not re.match(file_pattern, file):
                continue
            match = regex.match(file)
            if not match:
                print(f"Formato non valido: '{file}'")
                continue
            doc = match.group("doc")
            version_str = match.group("version")
            try:
                ver = Version(version_str)
            except InvalidVersion:
                print(f"Versione non valida in '{file}': {version_str}")
                continue
            file_path = os.path.join(root, file)
            # Mantieni il file con la versione minore
            if doc in grouped:
                _, current_ver = grouped[doc]
                if ver < current_ver:
                    grouped[doc] = (file_path, ver)
            else:
                grouped[doc] = (file_path, ver)
    return grouped

def process_category(category, config, report):
    """
    Per la categoria (es. "candidatura"), cerca i file in "documents/<category>".
    Per ogni documento, sposta (copia+elimina) il file con la versione minore in
    "documents/archive/<mappatura>/v<version>".
    """
    source_dir = os.path.join("documents", category)
    group_name = config["group_map"].get(category, category.capitalize())
    archive_folder = config.get("archive_folder", "documents/archive")
    dest_base = os.path.join(archive_folder, group_name)
    os.makedirs(dest_base, exist_ok=True)
    print(f"Processo categoria '{category}' -> '{dest_base}'")
    
    source_files = scan_source_directory(source_dir, config["file_regex"], config["file_pattern"])
    report[category] = {}

    for doc, (src_file, src_ver) in source_files.items():
        version_folder = os.path.join(dest_base, f"v{src_ver}")
        os.makedirs(version_folder, exist_ok=True)
        dest_file_path = os.path.join(version_folder, os.path.basename(src_file))
        
        print(f"Copia di '{src_file}' -> '{dest_file_path}'")
        shutil.copy2(src_file, dest_file_path)   # Copia il file nella destinazione
        os.remove(src_file)                      # Rimuove il file originale

        # Registra l'operazione nel report
        report[category][doc] = {
            "version": str(src_ver),
            "source": src_file,
            "destination": dest_file_path
        }

    print()

def main():
    config = load_config()  # Carica il file di configurazione
    report = {}
    
    # Assicuriamoci che la cartella archive esista
    os.makedirs(config.get("archive_folder", "documents/archive"), exist_ok=True)
    
    for category in config.get("directories", []):
        source_dir = os.path.join("documents", category)
        if not os.path.isdir(source_dir):
            print(f"Directory non trovata: '{source_dir}'")
            continue
        process_category(category, config, report)

    print("Elaborazione completata.")
    
    # Salva il report come YAML (facoltativo)
    report_file = "report.yml"
    with open(report_file, "w") as f:
        yaml.dump(report, f, default_flow_style=False, sort_keys=False)
    print(f"Report salvato in '{report_file}'.")

if __name__ == '__main__':
    main()
