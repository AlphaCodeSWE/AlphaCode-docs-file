#import "../../../../template/template.typ": *
#set outline(title: "Table of contents")
#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Quinta Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Romeo Calearo",
      "Redattori", "Alessandro Di Pasquale",
      "", "Nicolò Bovo","", "Elia Leonetti",
      "Verificatori", "Massimo Chioru",
      "", "Giovanni Battista Matteazzi",
      "", "Manuel Cinnirella"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-05-05",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-05-05", "Stesura del verbale", "Alessandro Di Pasquale, Nicolò Bovo, Elia Leonetti, Massimo Chioru, Giovanni Battista Matteazzi, Manuel Cinnirella"
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
- *Ora di inizio*: 17:00;
- *Ora di fine*: 17:30;
- *Partecipanti interni*: Alessandro Di Pasquale, Nicolò Bovo, Manuel Cinnirella, Elia Leonetti, Romeo Calearo.
- *Partecipanti esterni*: Andrea Dorigo, Fabio Pallaro, Daniele Zorzi.
== Ordine del giorno
- Verifica e valutazione del lavoro svolto fino a questo momento.
- Definizione delle prossime fasi di progetto.
== Aggiornamento lavoro pregresso
- Baseline#apice("G") degli incrementi#apice("G") precedenti mantenuta: L'Incremento#apice("G") 1 (simulatore GPS#apice("G")) e l'Incremento#apice("G") 2 (dashboard#apice("G")) rimangono completamente operativi durante l'implementazione delle nuove funzionalità di analytics#apice("G").
- Completamento Incremento#apice("G") 2 e avvio Incremento#apice("G") 3: Il gruppo ha presentato il completamento dell'Incremento#apice("G") 2 (Dashboard#apice("G") e Visualizzazione) e procede con l'avvio dell'Incremento#apice("G") 3 (Sistema di Analytics#apice("G")). 
- Integrazione di Grafana#apice("G") all'interno del sistema, con cui è possibile filtrare per età, interessi, professione, etc. i vari utenti disponibili.
== Consigli ricevuti
- L'azienda ha indirizzato il gruppo verso una configurazione di Grafana#apice("G") tale da permettere la visualizzazione dei filtri applicati anche su una mappa, permettendo così di poterne usufruire più agevolmente ed in maniera capillare.
- Validazione consegne successive: L'azienda ha confermato l'efficacia dell'approccio incrementale#apice("G"), apprezzando come le nuove funzionalità di analytics#apice("G") si integrino senza compromettere le funzionalità esistenti.
#pagebreak()
= Attività individuate
#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode#apice("G") Full Team], align(left)[Prossimo incontro con Sync Lab#apice("G") S.r.l. fissato per il 2025-05-12 alle 17:00],
    align(center)[Incremento 3], [Nicolò Bovo, Manuel Cinnirella], align(left)[Integrazione mappa in Grafana#apice("G") per visualizzare meglio i filtri applicati],
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
