#import "../../../../template/template.typ": *
#set outline(title: "Table of contents")
#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Settima Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Elia Leonetti",
      "Redattori", "Giovanni Battista Matteazzi",
      "", "Manuel Cinnirella",
      "Verificatori", "Alessandro Di Pasquale",
      "", "Nicolò Bovo"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-05-29",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-05-29", "Stesura del verbale", "Alessandro Di Pasquale, Romeo Calearo, Manuel Cinnirella, Nicolò Bovo, Elia Leonetti, Giovanni Battista Matteazzi, Massimo Chioru"
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
- *Luogo*: Chiamata Google Meet;
- *Ora di inizio*: 15:00;
- *Ora di fine*: 15:30;
- *Partecipanti interni*: Alessandro Di Pasquale, Giovanni Battista Matteazzi, Manuel Cinnirella, Massimo Chioru;
- *Partecipanti esterni*: Fabio Pallaro;
== Ordine del giorno
- Verifica e valutazione del lavoro svolto fino a questo momento;
- Riflessione sui più adatti pattern architetturali;
- Proposta di incontri in presenza per presentazione P.o.C.#apice("G")
== Aggiornamento lavoro pregresso
- Perfezionamento documentazione mancante;
== Consigli ricevuti
Durante l'incontro l'azienda ha risposto ad alcuni dubbi circa il pattern architetturale più adatto al progetto, anticipando un argomento caratteristico della fase di PB#apice("G"). 
Inoltre è stata valutata una possibile presentazione in sede del P.o.C.#apice("G") come fase intermedia prima di procedere con la fase PB#apice("G"). 
= Attività individuate
#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode#apice("G") Full Team], align(left)[Prossimo incontro con Sync Lab#apice("G") S.r.l. fissato per il 2025-06-12 alle 15:00],
    align(center)[docs], [AlphaCode#apice("G") Full Team], align(left)[Proseguire con la stesura dei documenti]
  )
)
#place(
  bottom + left,
  dx: 10pt,
  dy: -10pt,
)[
  #line(length: 5.3cm, stroke: 0.7pt)
  Firma dell'azienda proponente
]
