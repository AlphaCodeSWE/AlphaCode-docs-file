#import "../../../../template/template.typ": *
#set outline(title: "Table of contents")
#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Nona Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Giovanni Battista Matteazzi",
      "Redattori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Alessandro Di Pasquale",
      "Verificatori", "Manuel Cinnirella",
      "", "Nicolò Bovo",
      "", "Elia Leonetti",
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-06-26",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-06-26", "Stesura del verbale", "Massimo Chioru, Romeo Calearo, Alessandro Di Pasquale, Manuel Cinnirella, Nicolò Bovo, Elia Leonetti, Giovanni Battista Matteazzi"
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
- *Ora di fine*: 15:15;
- *Partecipanti interni*: Giovanni Battista Matteazzi, Alessandro Di Pasquale, Nicolò Bovo, Manuel Cinnirella.
- *Partecipanti esterni*: Fabio Pallaro.
== Ordine del giorno
- Breve discussione sullo stato attuale della documentazione
- Coordinamento per i prossimi incontri
== Aggiornamento lavoro pregresso
- Stesura e completamento della documentazione del progetto
== Consigli ricevuti
Nel corso della riunione, l'azienda ha preso atto dell'avanzamento delle attività documentali e ha comunicato che non saranno fissati nuovi incontri fino al superamento della RTB#apice("G"). Sarà compito del gruppo AlphaCode#apice("G") ricontattarla per pianificare una futura riunione una volta superata tale fase.
= Attività individuate
#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
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
