
#set page(width: 210mm, height: 297mm, margin: 2.5cm)
#set text(font: "Times New Roman", size: 12pt, leading: 1.2em)


#set page-numbering(off)

#header(
  
  image("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/edit/main/sources/logo.png", width: 2cm, keep-aspect-ratio: true)
  
  align(right, text("alphacodeswe@gmail.com"))
)

#heading [Lettera di Presentazione]


#box(
  fill: rgb(240,240,240),
  inset: 8pt,
  radius: 4pt,
)[
  text(bold("Informazioni documento"), size: 14pt)
 
  text("""
  **Data:** 10/10/2025 
  **Redattori:** Alessandro Di Pasquale,Nicolò Bovo
  **Verificatori:** Elia Leonetti, Romeo Calearo 
  **Amministratore:** Nicolò Bovo  
  """)
]

/// Spazio per la firma/intro
#v(1cm)
Egregio prof. Tulio Vardanega
Egregio prof. Riccardo Cardin

Paragrafo introduttivo e contesto del documento.  

Con la presente il gruppo **AlphaCode** comunica l’intenzione di candidarsi alla realizzazione del capitolato dal titolo “NearYou: Smart custom advertising platform ”, proposto dall’azienda **Sync Lab**.

Il documento allegato fornisce tutte le informazioni dettagliate e la relativa pianificazione del progetto.  
La documentazione è disponibile al link: [https://github.com/AlphaCodeSWE/AlphaCode-docs-file/tree/main/documents](https://github.com/AlphaCodeSWE/AlphaCode-docs-file/tree/main/documents)

#pagebreak

#heading [Dettagli e Allegati]

**Verbali esterni (esempi):**  
- 07/03/2025  
- 12/03/2025 
- 20/03/2025

**Preventivo costi e assunzione impegni**  
- Analisi e valutazione dei singoli capitolati con motivazione delle scelte  
- Il costo stimato del progetto è di circa 13.500,00€ con dettagli consultabili nel documento “Preventivo Costi”.

#v(0.5cm)

#heading [Membri del AlphaCode]

// Tabella con nominativi e matricole
#table(
  columns: 2,
  data: [
    ["Nominativo",          "Matricola" ],
    ["Nicolò Bovo",         "2042885"   ],
    ["Alessandro Di Pasquale",          "2075544"   ],
    ["Romeo Calearo",            "2043678"   ],
    ["Massimo Chioru",     "2013449"   ],
    ["Manuel Cinnirella",             "2042891"   ],
    ["Giovanni Battista Matteazzi",    "2082852"   ],
    ["Elia Leonetti",    "2009998"   ],
  ],
  // Stile tabella
  spread: true,
  align: (left, center),
  row-height: auto,
  cell-border: faint,
)

#v(1cm)

Cordiali saluti,  
Il Team **AlphaCode**

// Fine del documento
