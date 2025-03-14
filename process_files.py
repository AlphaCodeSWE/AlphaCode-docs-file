#!/usr/bin/env python3
"""
Legge sign_report.yml e sposta le versioni minori in documents/archive.
Mantiene la versione più recente in documents/... .
"""
import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion

FILE_REGEX = re.compile(r'^(?P<doc>.+)_v(?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$')

def load_sign_report(report_file="sign_report.yml"):
    if not os.path.exists(report_file):
        print(f"ERRORE: '{report_file}' non trovato.")
        sys.exit(1)

    with open(report_file, "r") as f:
        data = yaml.safe_load(f)

    if not data or "signed_files" not in data:
        print("ERRORE: sign_report.yml non contiene 'signed_files'.")
        sys.exit(1)

    return data["signed_files"]

def main():
    if len(sys.argv) > 1:
        report_file = sys.argv[1]
    else:
        report_file = "sign_report.yml"

    signed_files = load_sign_report(report_file)
    grouped = {}
    for path_ in signed_files:
        filename = os.path.basename(path_)
        match = FILE_REGEX.match(filename)
        if not match:
            print(f"Formato non valido per '{filename}'. Atteso doc_vx.y.z_signed.pdf")
            continue
        doc = match.group("doc")
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"Versione non valida {version_str} in '{filename}'")
            continue

        grouped.setdefault(doc, []).append((ver, path_))

    final_report = {
        "archived": [],
        "kept_in_documents": []
    }
    archive_root = "documents/archive"

    for doc, version_list in grouped.items():
        max_ver = max(v[0] for v in version_list)
        for (ver, fullpath) in version_list:
            if ver < max_ver:
                dest_folder = os.path.join(archive_root, f"{doc}_v{ver}")
                os.makedirs(dest_folder, exist_ok=True)
                dest_file = os.path.join(dest_folder, os.path.basename(fullpath))
                print(f"Sposto la versione più vecchia: {fullpath} -> {dest_file}")
                shutil.copy2(fullpath, dest_file)
                os.remove(fullpath)
                final_report["archived"].append({
                    "doc": doc,
                    "version": str(ver),
                    "source": fullpath,
                    "destination": dest_file
                })
            else:
                print(f"Mantengo la versione più recente: {fullpath} (v{ver})")
                final_report["kept_in_documents"].append({
                    "doc": doc,
                    "version": str(ver),
                    "file": fullpath
                })

    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)
    print("Archiviazione completata. Creato final_report.yml")

if __name__ == "__main__":
    main()
