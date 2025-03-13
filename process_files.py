#!/usr/bin/env python3
"""
Script per:
1. Caricare config.yml.
2. Processare le directory (candidatura, rtb, pb) e spostare i file aggiornati.
"""

import os
import re
import shutil
import yaml
from packaging.version import Version, InvalidVersion

def load_config(config_file="config.yml"):
    """Carica config.yml."""
    with open(config_file, "r") as f:
        return yaml.safe_load(f)

def get_existing_files(dest_folder, file_regex):
    """Ritorna {doc: (file_path, version)} dalla cartella di destinazione."""
    existing = {}
    pattern = re.compile(file_regex)
    if not os.path.isdir(dest_folder):
        return existing
    for file in os.listdir(dest_folder):
        match = pattern.match(file)
        if match:
            doc = match.group("doc")
            version_str = match.group("version")
            try:
                ver = Version(version_str)
            except InvalidVersion:
                continue
            existing[doc] = (os.path.join(dest_folder, file), ver)
    return existing

def scan_source_directory(source_dir, file_regex, file_pattern):
    """Ritorna {doc: (file_path, version)} dalla directory sorgente."""
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
            if doc in grouped:
                _, current_ver = grouped[doc]
                if ver > current_ver:
                    grouped[doc] = (file_path, ver)
            else:
                grouped[doc] = (file_path, ver)
    return grouped

def process_category(category, config):
    """Processa la categoria e sposta file aggiornati."""
    dest_folder_name = config["group_map"].get(category, category.capitalize())
    archive_folder = config.get("archive_folder", "documents/archive")
    dest_folder = os.path.join(archive_folder, dest_folder_name)
    os.makedirs(dest_folder, exist_ok=True)
    print(f"Categoria '{category}' -> '{dest_folder}'")
    
    existing_files = get_existing_files(dest_folder, config["file_regex"])
    source_files = scan_source_directory(category, config["file_regex"], config["file_pattern"])
    
    for doc, (src_file, src_ver) in source_files.items():
        update = False
        if doc in existing_files:
            dest_file, dest_ver = existing_files[doc]
            if src_ver > dest_ver:
                print(f"Aggiornamento '{doc}': {dest_ver} -> {src_ver}")
                os.remove(dest_file)
                update = True
            else:
                print(f"Nessun aggiornamento per '{doc}'")
                continue
        else:
            update = True
        
        if update:
            dest_file_path = os.path.join(dest_folder, os.path.basename(src_file))
            print(f"Spostamento: '{src_file}' -> '{dest_file_path}'")
            shutil.move(src_file, dest_file_path)
    print()

def main():
    config = load_config("config.yml")
    os.makedirs(config.get("archive_folder", "documents/archive"), exist_ok=True)
    for category in config.get("directories", []):
        if not os.path.isdir(category):
            print(f"Directory non trovata: '{category}'")
            continue
        process_category(category, config)
    print("Elaborazione completata.")

if __name__ == '__main__':
    main()
