#!/usr/bin/env python3
"""
process_files.py
---------------------------------
1. Legge 'sign_report.yml' contenente la lista dei PDF firmati.
2. Raggruppa i file per documento usando la cartella padre (es. "candidatura")
   e tutto il nome fino alla data inclusa (es. 'VI_2025_04_09').
3. Per ciascun gruppo con più versioni, individua la versione massima
   e sposta in documents/archive/<MappedParent>_v<versione>
   solo i file con versione inferiore.
4. Genera 'final_report.yml' con il riepilogo delle operazioni.
"""

import os
import re
import sys
import shutil
import yaml
from typing import Tuple, List, Dict

# ------------------------------------------------------------
# RegEx: <Nome>_YYYY_MM_DD_Vx.x.x[.x]_signed.pdf  (case-insensitive)
#        name_date  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#        version               ^^^^^^^^^^^^^^^
# ------------------------------------------------------------
FILE_REGEX = re.compile(
    r'^(?P<name_date>.+?_\d{4}_\d{2}_\d{2})_[Vv](?P<version>\d+(?:\.\d+)+)_signed\.pdf$',
    re.IGNORECASE,
)

# ---------- util -------------------------------------------------------------

def parse_version(v: str) -> Tuple[int, ...]:
    """Converte '1.2.10.0' -> (1, 2, 10, 0) per confronti numerici sicuri."""
    return tuple(int(p) for p in v.split("."))


def load_yaml(path: str) -> Dict:
    with open(path, "r") as f:
        return yaml.safe_load(f) or {}


# ---------- step 1: carica report -------------------------------------------

def load_sign_report(report_file: str = "sign_report.yml") -> List[str]:
    if not os.path.exists(report_file):
        print(f"ERRORE: Il file di report '{report_file}' non esiste.")
        sys.exit(1)

    print(f"DEBUG: Trovato il file di report '{report_file}'.")
    data = load_yaml(report_file)

    if "signed_files" not in data:
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' o è vuoto.")
        sys.exit(1)

    # Escludi file già in archive per evitare duplicati
    return [fp for fp in data["signed_files"] if "documents/archive" not in fp]


# ---------- config -----------------------------------------------------------

def load_config(config_file: str = ".github/config.yml") -> Dict:
    abs_path = os.path.abspath(config_file)
    if not os.path.exists(config_file):
        print(f"DEBUG: Config '{config_file}' non trovato. Uso valori di default.")
        return {"group_map": {}}

    print(f"DEBUG: Trovato config '{config_file}' ({abs_path}).")
    return load_yaml(config_file)


def get_mapped_parent(file_path: str, group_map: Dict[str, str]) -> str:
    # path tipico: documents/<subfolder>/...
    parts = file_path.split(os.sep)
    if len(parts) < 2 or parts[0] != "documents":
        return "Unknown"
    subfolder = parts[1].lower()
    return group_map.get(subfolder, subfolder.capitalize())


# ---------- main -------------------------------------------------------------

def main() -> None:
    report_file = sys.argv[1] if len(sys.argv) > 1 else "sign_report.yml"
    signed_files = load_sign_report(report_file)

    config = load_config(".github/config.yml")
    group_map = config.get("group_map", {})

    archive_root = "documents/archive"
    final_report = {"kept_in_documents": [], "archived": []}

    # ------------------------------------------------------------------
    # Raggruppa i file per (mapped_parent, name_date) = un singolo documento
    # ------------------------------------------------------------------
    grouped: Dict[Tuple[str, str], List[Tuple[Tuple[int, ...], str]]] = {}

    for file_path in signed_files:
        mapped_parent = get_mapped_parent(file_path, group_map)
        filename = os.path.basename(file_path)
        match = FILE_REGEX.match(filename)

        if not match:
            print(f"ERRORE: Il file '{filename}' non rispetta il formato atteso.")
            continue

        version_tuple = parse_version(match["version"])
        name_date = match["name_date"]  # es. 'VI_2025_04_09'
        key = (mapped_parent, name_date)

        grouped.setdefault(key, []).append((version_tuple, file_path))

    # ------------------------------------------------------------------
    # Per ciascun gruppo valuta quali spostare
    # ------------------------------------------------------------------
    for (doc, name_date), files_info in grouped.items():
        versions_present = {ver for ver, _ in files_info}

        if len(versions_present) == 1:
            # Una sola versione ⇒ lascio tutto dov'è
            for ver, path_ in files_info:
                final_report["kept_in_documents"].append(
                    {"doc": doc, "name_date": name_date, "version": ".".join(map(str, ver)), "file": path_}
                )
                print(f"Mantengo l'unica versione per '{doc}/{name_date}': {path_}")
            continue

        max_ver = max(versions_present)
        for ver, src_path in files_info:
            if ver < max_ver:
                ver_str = ".".join(map(str, ver))
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver_str}")
                os.makedirs(dest_folder, exist_ok=True)

                dest_path = os.path.join(dest_folder, os.path.basename(src_path))
                print(f"Sposto '{src_path}' → '{dest_path}' (v{ver_str})")

                try:
                    shutil.move(src_path, dest_path)
                except Exception as e:
                    print(f"ERRORE nello spostamento di '{src_path}': {e}")

                final_report["archived"].append(
                    {
                        "doc": doc,
                        "name_date": name_date,
                        "version": ver_str,
                        "source": src_path,
                        "destination": dest_path,
                    }
                )
            else:
                # versione più recente → resta in documents
                final_report["kept_in_documents"].append(
                    {
                        "doc": doc,
                        "name_date": name_date,
                        "version": ".".join(map(str, ver)),
                        "file": src_path,
                    }
                )

    # ---------- salva report finale -----------------------------------
    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)

    print("Operazione completata. Creato 'final_report.yml'.")


if __name__ == "__main__":
    main()
