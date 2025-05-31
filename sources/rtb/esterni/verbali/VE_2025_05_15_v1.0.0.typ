#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Sesta Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Giovanni Battista Matteazzi",
      "Redattori", "Alessandro Di Pasquale",
      "", "Massimo Chioru",
      "Validatori", "Nicolò Bovo",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-05-15",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-05-15", 
    "Stesura del verbale", 
    "Alessandro Di Pasquale, Romeo Calearo, Manuel Cinnirella",
    "Nicolò Bovo, Elia Leonetti, Massimo Chioru",
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
- *Partecipanti interni*: Alessandro Di Pasquale, Giovanni Battista Matteazzi, Massimo Chioru, Nicolò Bovo;
- *Partecipanti esterni*: Andrea Dorigo, Fabio Pallaro;

== Ordine del giorno
- Verifica e valutazione del lavoro svolto fino a questo momento;
- Approvazione P.o.C.;
- Definizione delle prossime fasi di progetto;

== Aggiornamento lavoro pregresso
- Implementazione della mappa all'interno di Grafana per visualizzare in tempo reale i filtri applicati dalla dashboard di admin;
- Aggiunto monitoraggio delle risorse di sistema dalla dashboard di admin;

== Consigli ricevuti
L'azienda ha proposto al gruppo di dedicarsi alla stesura ed al completamento della documentazione mancante, in quanto reputa particolarmente adeguato e completo il P.o.C. realizzato.


= Attività individuate


#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode Full Team], align(left)[Prossimo incontro con Sync Lab S.r.l. fissato per il 2025/05/29 alle 15:00],
    align(center)[docs], [AlphaCode Full Team], align(left)[Proseguire con la stesura dei documenti],
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
