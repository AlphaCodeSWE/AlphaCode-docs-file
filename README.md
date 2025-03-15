# 📌 Gruppo-19 - AlphaCode - Corso di Laurea in Informatica (A.A. 2024/2025) - UniPd  

Benvenuto nella repository ufficiale del **Gruppo AlphaCode**, dedicata alla gestione della documentazione interna ed esterna del progetto.  

## 📂 Struttura della Repository 

La repository è organizzata come segue:  

- **`documents/`** → Contiene i documenti finali in formato `.pdf`.  
- **`sources/`** → Contiene i file sorgente in formato `.typ`, creati con [Typst](https://typst.app/).  
- **`template/`** → Contiene i template per la creazione dei documenti.  
- **`sample/`** → Contiene il main.  

## 🖋️ Firma Digitale  

Tutti i documenti ufficiali sono **firmati digitalmente**. La firma viene applicata utilizzando [nodo-jsignpdf](https://github.com/deltazero-cz/node-jsignpdf), che si basa su [JSignPDF](https://github.com/intoolswetrust/jsignpdf) di [@kwart](https://github.com/kwart).  

Per la firma vengono utilizzati:  

- **Variabili segrete della repository**:  
  - `SIGN_CERT`: Contiene il certificato digitale (`certificate.p12`).  
  - `SIGN_CERT_PASSWORD`: Contiene la password del certificato.  
- **Script per la firma**:  
  - `sign.js`  
  - `build-typst.yml`  

## 🌐 Accesso ai Documenti  

- La **versione aggiornata** di ogni documento è consultabile anche dal sito web ufficiale [AlphaCode](https://alphacodeswe.github.io/AlphaCode-sito/).  
- Le **versioni precedenti** sono raggiungibili nel sito web attraverso la sezione [Contatti](https://alphacodeswe.github.io/AlphaCode-sito/contatti/) e, o direttamente nell'[Archivio](https://alphacodeswe.github.io/AlphaCode-docs-file/archive/).
- Le diverse fasi di sviluppo dei documenti vengono archiviate nelle [release](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/releases).  

# Membri del gruppo:
| Nome e Cognome | Matricola  | Mail   |
|-----------|-------------|-------------|
| Nicolò Bovo    | 2042885 | nicolo.bovo.1@studenti.unipd.it      |
|Alessandro Di Pasquale   | 2075544 | alessandro.dipasquale@studenti.unipd.it    |
| Romeo Calearo   | 2043678 | romeo.calearo@studenti.unipd.it     |
| Massimo Chioru  | 2013449| massimo.chioru@studenti.unipd.it     |
| Manuel Cinnirella  |2042891 | manuel.cinnirella@studenti.unipd.it    |
| Giovanni Battista Matteazzi    | 2082852 |giovannibattista.matteazzi@studenti.unipd.it     |
| Elia Leonetti  |2009998| elia.leonetti@studenti.unipd.it    |

[![Build Typst Documentation](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/actions/workflows/build-typst.yml/badge.svg)](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/actions/workflows/build-typst.yml)


