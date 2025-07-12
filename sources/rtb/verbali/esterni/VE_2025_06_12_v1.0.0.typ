#import "../../../../template/template.typ": *
#set outline(title: "Table of contents")
#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Ottava Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Massimo Chioru",
      "Redattori", "Alessandro Di Pasquale",
      "", "Giovanni Battista Matteazzi",
      "", "Manuel Cinnirella",
      "Verificatori", "Romeo Calearo",
      "", "Nicolò Bovo",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-06-12",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-06-12", "Stesura del verbale", "Alessandro Di Pasquale, Giovanni Battista Matteazzi, Manuel Cinnirella, Nicolò Bovo, Romeo Calearo, Massimo Chioru, Elia Leonetti"
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
- *Partecipanti interni*: Alessandro Di Pasquale, Giovanni Battista Matteazzi, Manuel Cinnirella, Nicolò Bovo, Massimo Chioru;
- *Partecipanti esterni*: Fabio Pallaro, Andrea Dorigo;
== Ordine del giorno
- Discussione sulle modifiche al P.o.C.#apice("G") e sullo stato della documentazione
== Aggiornamento lavoro pregresso
- Nessuna regressione agli incrementi#apice("G") precedenti. 
- Consegna dell'Incremento#apice("G") 5: Introduzione Stream Processor#apice("G") e approvazione finale del P.o.C.#apice("G");
- Perfezionamento documentazione mancante;
== Consigli ricevuti
Durante l'incontro l'azienda, dopo essersi informata sui vantaggi derivanti dall'implementazione delle ultime modifiche, ha approvato gli ultimi aggiornamenti al P.o.C.#apice("G") 
= Attività individuate
#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode#apice("G") Full Team], align(left)[Prossimo incontro con Sync Lab#apice("G") S.r.l. fissato per il 2025-06-26 alle 15:00],
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
