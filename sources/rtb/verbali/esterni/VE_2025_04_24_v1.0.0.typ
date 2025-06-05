#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Quarta Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Manuel Cinnirella",
      "Redattori", "Alessandro Di Pasquale",
      "", "Romeo Calearo","", "Massimo Chioru",
      "Verificatori", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi",
      "", "Nicolò Bovo"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-04-24",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-04-24", "Stesura del verbale", "Alessandro Di Pasquale, Romeo Calearo, Massimo Chioru",
    "Giovanni Battista Matteazzi, Elia Leonetti, Nicolò Bovo"
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
- *Partecipanti interni*: Giovanni Battista Matteazzi, Alessandro Di Pasquale, Nicolò Bovo, Massimo Chioru, Manuel Cinnirella, Elia Leonetti.
- *Partecipanti esterni*: Andrea Dorigo, Fabio Pallaro, Daniele Zorzi.

== Ordine del giorno
- Verifica e valutazione del lavoro svolto fino a questo momento.
- Definizione delle prossime fasi di progetto.
- Condivisione con il gruppo delle chiavi per l'API di OpenAI

== Aggiornamento lavoro pregresso
- Il gruppo ha implementato un sistema per la generazione di percorsi GPX utilizzando OSRM (Open Source Routing Machine), e le mappe gratuite fornite da OpenStreetMap.
  È stato impiegato l'ambiente di sviluppo Gitpod, sfruttando le ore gratuite disponibili, mentre per l'integrazione di un modello linguistico è stato utilizzato Groq.
- È stato richiesto un riepilogo generale del funzionamento del sistema, che è stato descritto come segue: 
 - Producer: genera e invia dati di coordinate GPS;
 - Consumer: riceve i dati, li memorizza in un database e aggiorna la mappa;
 - Frontend: interroga periodicamente il backend per ottenere dati aggiornati e aggiornare la visualizzazione della mappa;
 - Integrazione del modello linguistico: implementata tramite l'utilizzo di Apache Kafka, al fine di generare contenuti testuali personalizzati sulla base dei dati raccolti.

== Consigli ricevuti
L'azienda ha chiesto se fosse stato integrato Grafana per il monitoraggio e la visualizzazione dei dati. È stato risposto che, ad oggi, Grafana non è stato utilizzato, poiché il lavoro si è concentrato sulla generazione e sull'aggiornamento della mappa, senza prevedere una componente analitica avanzata. Alcuni dubbi sono stati sollevati circa la difficile integrazione di filtri in assenza di Grafana, il cui utilizzo verrà valutato nel prossimo sprint.


= Attività individuate


#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode Full Team], align(left)[Prossimo incontro con Sync Lab S.r.l. fissato per il 2025-05-05 alle 17:00],
    align(center)[id], [Manuel Cinnirella, Massimo Chioru], align(left)[Valutare l'integrazione di Grafana all'interno del sistema],
    align(center)[id], [Manuel Cinnirella, Massimo Chioru], align(left)[Decidere le modalità di implementazione di un modulo di analytics per la gestione e visualizzazione dei dati raccolti],
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
