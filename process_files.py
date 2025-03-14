#!/usr/bin/env python3
"""
Esempio di BOT che:
1. Legge 'sign_report.yml' con 'signed_files: [lista di percorsi PDF firmati]'
2. Per ogni file:
   - Determina la "subfolder" (candidatura, rtb, pb) dal percorso
   - Usa una group_map (definita in config.yml) per capire come chiamare la cartella (Candidatura, RTB, PB)
   - Estrae la versione dal nome file (es. LetteraPresentazione_v1.0.0_signed.pdf -> 1.0.0)
   - Crea cartella: documents/archive/<NomeDoc>_v<version> (es. Candidatura_v1.0.0)
   - Copia il file e lo rimuove dalla sorgente
3. Genera final_report.yml
"""

import os
import re
import sys
import shutil
import yaml
from packaging.version import Version, InvalidVersion

# Regex per estrarre la VERSIONE dal file, tipo: LetteraPresentazione_v1.0.0_signed.pdf
# Nota: NON estraiamo 'doc' dal filename, perché lo deduciamo dalla cartella
VERSION_REGEX = re.compile(r'_v(?P<version>\d+\.\d+\.\d+(?:\.\d+)?)_signed\.pdf$')

def load_sign_report(report_file="sign_report.yml"):
    if not os.path.exists(report_file):
        print(f"ERRORE: Il file di report '{report_file}' non esiste.")
        sys.exit(1)

    with open(report_file, "r") as f:
        data = yaml.safe_load(f)

    if not data or "signed_files" not in data:
        print(f"ERRORE: '{report_file}' non contiene 'signed_files:' o e' vuoto.")
        sys.exit(1)

    return data["signed_files"]

def load_config(config_file="config.yml"):
    """
    Carica la mappa 'group_map' dal config.yml, ad es.:
    group_map:
      candidatura: Candidatura
      rtb: RTB
      pb: PB
    """
    if not os.path.exists(config_file):
        print(f"ATTENZIONE: '{config_file}' non trovato. Uso default map.")
        return {"group_map": {}}
    with open(config_file, "r") as f:
        return yaml.safe_load(f)

def get_subfolder_doc(path_, group_map):
    """
    Dato un path come 'documents/candidatura/LetteraPresentazione_v1.0.0_signed.pdf',
    ricava la subfolder ('candidatura') e la mappa a un nome doc, es. 'Candidatura'.
    Se la subfolder non e' presente in group_map, usa subfolder.capitalize().
    """
    # Rimuove eventuale 'documents/' davanti
    rel_path = path_.replace("documents/", "")
    # Prende il nome della subfolder top-level
    parts = rel_path.split(os.sep)  # es. ["candidatura", "LetteraPresentazione_v1.0.0_signed.pdf"]
    if not parts:
        return "Unknown"

    subfolder = parts[0].lower()  # "candidatura"
    if subfolder in group_map:
        return group_map[subfolder]
    else:
        return subfolder.capitalize()

def main():
    # 1) Legge eventuale argomento per 'sign_report.yml'
    if len(sys.argv) > 1:
        report_file = sys.argv[1]
    else:
        report_file = "sign_report.yml"

    # 2) Carica i PDF firmati
    signed_files = load_sign_report(report_file)

    # 3) Carica config.yml per group_map
    config = load_config("config.yml")
    group_map = config.get("group_map", {})

    final_report = {
        "archived": [],
        "kept_in_documents": []
    }

    archive_root = "documents/archive"

    for src_path in signed_files:
        # Estrai la subfolder dal path
        doc_name = get_subfolder_doc(src_path, group_map)
        # Estrai la versione dal nome file
        filename = os.path.basename(src_path)
        match = VERSION_REGEX.search(filename)
        if not match:
            print(f"ERRORE: Nome file '{filename}' non contiene '_vX.Y.Z_signed.pdf'")
            continue
        version_str = match.group("version")
        try:
            ver = Version(version_str)
        except InvalidVersion:
            print(f"ERRORE: Versione non valida in '{filename}': {version_str}")
            continue

        # Crea la cartella di destinazione: documents/archive/<DocName>_v<version>
        dest_folder = os.path.join(archive_root, f"{doc_name}_v{ver}")
        os.makedirs(dest_folder, exist_ok=True)

        # Se c'e' gia' un file piu' recente da qualche parte, dovresti controllarlo, ma qui
        # supponiamo di spostare sempre TUTTI i file trovati. Oppure potresti deciderne la logica.
        src_basename = os.path.basename(src_path)
        dest_path = os.path.join(dest_folder, src_basename)

        # Copia e rimuove
        print(f"Sposto '{src_path}' in '{dest_path}' (Doc={doc_name}, Ver={ver})")
        shutil.copy2(src_path, dest_path)
        os.remove(src_path)

        final_report["archived"].append({
            "doc": doc_name,
            "version": str(ver),
            "source": src_path,
            "destination": dest_path
        })

    # Se vuoi mantenere la "versione piu' recente" dov'e', devi prima raggruppare e confrontare.
    # Qui stiamo spostando TUTTI i file con _signed.pdf. 
    # 
    # Se intendi SPOSTARE SOLO LE VERSIONI MENO RECENTI, DEVI raggruppare i file e trovarne la max
    # come nelle versioni precedenti. Qui, invece, e' un esempio di spostamento di tutti i PDF.

    with open("final_report.yml", "w") as f:
        yaml.dump(final_report, f, default_flow_style=False, sort_keys=False)

    print("Operazione completata. Creato 'final_report.yml'.")

if __name__ == "__main__":
    main()
