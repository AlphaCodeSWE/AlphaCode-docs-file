#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Sesta Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Manuel Cinnirella",
      "Redattori", "Alessandro Di Pasquale",
      "", "Elia Leonetti",
      "Validatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Nicolò Bovo",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/04/18",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025/04/18", "Stesura del verbale", "Manuel Cinnirella", "Elia Leonetti"
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Contenuti del verbale
== Informazioni sulla riunione

- *Luogo*: Chiamata Discord;
- *Ora di inizio*: 17:00;
- *Ora di fine*: 18:00;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno

 1. Ricapitolazione dei punti principali emersi durante il meeting con l'azienda Sync Lab.
 2. Aggiornamento dei membri che non hanno partecipato all'incontro con l'azienda.
 3. Definizione delle attività e dei passaggi operativi da avviare a breve termine.

= Sintesi dell'incontro
Il giorno successivo all'incontro esterno del 17 aprile, il gruppo si è riunito per rielaborare quanto emerso e definire i prossimi passi. Durante l'avvio della riunione, i membri che non avevano partecipato a quella esterna sono stati prontamente aggiornati sui contenuti principali: l'efficacia del simulatore GPS, operativo in versione base ma in attesa di ottimizzazioni per generare percorsi GPX più verosimili. In seguito, il gruppo ha valutato diverse soluzioni per integrare un modulo di intelligenza artificiale, prendendo in esame sia opzioni commerciali come OpenAI sia librerie open source, come Groq Cloud.

= Decisioni prese
1. Il team si impegna a migliorare il simulatore GPS affinché produca percorsi GPX più fedeli alla realtà
2. È stata ufficializzata l'adozione di Groq come piattaforma per il modello linguistico, garantendo così elevate prestazioni e costi nulli.


= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    [#link("")[code ]], [Romeo Calearo, Elia Leonetti], [Sviluppo generazione di percorsi GPX realistici],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/7")[docs \#7]], [Massimo Chioru, Nicolò Bovo], [Stesura del Terzo Verbale Esterno],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/9")[docs \#9]],[Alessandro Di Pasquale, Elia Leonetti],[Stesura del Sesto Verbale Interno]
  )
)
