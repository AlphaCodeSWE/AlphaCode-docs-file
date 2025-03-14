#!/usr/bin/env python3
"""
Script "BOT" che:
1) Legge un report 'sign_report.yml' con i PDF firmati.
2) Per ciascun file, decide se spostarlo/eliminarlo dalla cartella di origine (logica custom).
3) Usa config.yml per sapere dove archiviarli e come gestire le versioni.
4) Genera un 'final_report.yml' con l'esito dell'operazione.
"""

import os
import sys
import re
import shutil
import yaml
from packaging.version import Version, InvalidVersion

def load_sign_report(report_file="sign_report.yml"):
    """Carica l'elenco dei PDF firmati dal file report YAML."""
    with open(report_file, "r") as f:
        return yaml.safe_load(f)

def load_config(config_file=".github/workflows/config.yml"):
    """Carica eventuale configurazione aggiuntiva (directory, regex, ecc.)."""
    if os.path.exists(config_file):
        with open(config_file, "r") as f:
            return yaml.safe_load(f)
    return {}

def main():
    if len(sys.argv) > 1:
        sign_report_file = sys.argv[1]
    else:
        sign_report_file = "sign_report.yml"

    # Carica il report dei file firmati
    if not os.path.exists(sign_report_file):
        print(f"ERRORE: File di report '{sign_report_file}' non trovato.")
        sys.exit(1)

    signed_pdfs = load_sign_report(sign_report_file)  # Ad es. { "signed_files": [ "...", "..." ] }

    # Carica eventuale config (se ti serve)
    config = load_config("config.yml")

    # Esempio di final_report
    final_report = {
        "archived": [],
        "errors": []
    }

    # Logica di spostamento personalizzata
    for pdf in signed_pdfs.get("signed_files", []):
        # sposto in documents/archive/ la "versione minore"
        # Qui puoi inserire la logica esatta che ti serve:
        # 1. Leggere la versione dal nome
        # 2. Confrontare con altre versioni, ecc.
        # Per semplicità, facciamo un "copia + remove".
        dest_folder = "documents/archive"  # personalizza come vuoi
        os.makedirs(dest_folder, exist_ok=True)
        dest_file = os.path.join(dest_folder, os.path.basename(pdf))
        try:
            print(f"COPIA '{pdf}' -> '{dest_file}'")
            shutil.copy2(pdf, dest_file)
            os.remove(pdf)
            final_report["archived"].append(pdf)
        except Exception as e:
            print(f"ERRORE spostando '{pdf}': {e}")
            final_report["errors"].append({pdf: str(e)})

    # Salva un final_report.yml
    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)
    print("Operazione completata. Salvato 'final_report.yml'.")

if __name__ == "__main__":
    main()
