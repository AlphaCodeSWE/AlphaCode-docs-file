Ecco il codice per il tuo `README.md` da caricare su GitHub:  

```markdown
# 📌 Gruppo AlphaCode - Corso di Laurea in Informatica (A.A. 2024/2025) - UniPd  

Benvenuto nella repository ufficiale del **Gruppo AlphaCode**, dedicata alla gestione della documentazione interna ed esterna del progetto.  

## 📂 Struttura della Repository  

La repository è organizzata come segue:  

- **`documents/`** → Contiene i documenti finali in formato `.pdf`.  
- **`sources/`** → Contiene i file sorgente in formato `.typ`, creati con **Typst**.  
- **`template/`** → Contiene i template per la creazione dei documenti.  
- **`sample/`** → Contiene esempi di documenti per riferimento.  

## 🖋️ Firma Digitale  

Tutti i documenti ufficiali sono **firmati digitalmente**. La firma viene applicata utilizzando **nodo-jsignpdf**, che si basa su **JSignPDF** di [@kwart](https://github.com/kwart).  

Per la firma vengono utilizzati:  

- **Variabili segrete della repository**:  
  - `SIGN_CERT`: Contiene il certificato digitale (`certificate.p12`).  
  - `SIGN_CERT_PASSWORD`: Contiene la password del certificato.  
- **Script per la firma**:  
  - `sign.js`  
  - `build-typst.yml`  

## 🌐 Accesso ai Documenti  

- La **versione aggiornata** di ogni documento è disponibile sul sito web ufficiale di **AlphaCode**.  
- Le **versioni precedenti** sono archiviate nel sito web, nella stessa sezione, o nell'**Archivio**.  
- Le diverse fasi di sviluppo dei documenti (prima della versione finale) vengono archiviate nelle **release**, sempre accessibili tramite la sezione **Contatti** del sito web.  

---  

🔗 Per ulteriori informazioni, visita il sito ufficiale di **AlphaCode**.  
```

Questo file `README.md` è formattato in **Markdown** e pronto per essere caricato su **GitHub**.




# Informazioni generali
- Gruppo AlphaCode del corso di Laurea in Informatica, A.A. 2024/2025, UniPd
- In questa reposity sono presenti tutti i documenti: verbali e documentazione sia interna che esterna
- Tutti i documenti sono prodotti utilizzando [Typst](https://typst.app/)
- I documenti in formato **.pdf** si trovano all'interno di [documents](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/tree/main/documents), mentre i file **.typ** sono all'intero di [sources](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/tree/main/sources)
- I template dei file sono presenti nella cartella **template** e **sample**
- I documenti sono tutti firmati digitalmente. Il codice è basato su [nodo-jsignpdf](https://github.com/deltazero-cz/node-jsignpdf), che utilizza a sua volta [JSignPDF](https://github.com/intoolswetrust/jsignpdf) di [@kwart](https://github.com/kwart/). Nella reposity sono state configurate delle variabili segrete : SIGN_CERT:certificate.p12 e SIGN_CERT_PASSWORD . Per la firma vera e propria sono usati i file sign.js e build-typst.yml . 
- La versione aggioranta di ogni documento è anche raggiungibile dal sito web: [AlphaCode](https://alphacodeswe.github.io/AlphaCode-sito/pages/contatti.html), mentre le versioni passate sempre nel sito web, stessa sezione, o nell'[Archivio](https://alphacodeswe.github.io/AlphaCode-docs-file/archive/)
- Le varie fasi prima del documento finale, vengono archiviate nella [release](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/releases) e sempre raggiungibile tramite il sito web, nella sezione contatti.
# Gruppo 19
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


