#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Ottava Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattori", "Manuel Cinnirella",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi",
      "Verificatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Nicolò Bovo",
      
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-06-07",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-06-07", "Stesura del verbale", "Manuel Cinnirella, Elia Leonetti, Giovanni Battista Matteazzi, Massimo Chioru, Romeo Calearo, Nicolò Bovo"
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
- *Ora di inizio*: 17:30;
- *Ora di fine*: 18:30;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno
 1. Riorganizzazione lavoro e obiettivi a seguito del ricevimento con il Professore Riccardo Cardin.
 2. Discussione sull'integrare uno Stream Processor#apice("G").

= Sintesi dell'incontro
L'incontro è iniziato con una breve fase di ricapitolazione su quanto detto nel ricevimento con il Professor Cardin. In particolare, la discussione è stata volta a determinare se fosse necessaria l'implementazione di uno stream processor#apice("G") del P.o.C.#apice("G")
Inizialmente si era dell'idea che fosse un aggiornamento preferibile in fasi più avanzate del progetto (ovvero nel M.V.P.#apice("G")). Questa valutazione iniziale si è rivelata essere controproducente poiché si sarebbe potuti scadere in debito tecnico, aumento dei costi e non sarebbe stato possibile sfruttare appieno lo scopo del P.o.C.#apice("G")

A tal proposito ByteWax#apice("G") è stata ritenuta la scelta ottimale per il nostro progetto perché mantiene la coerenza con lo stack Python esistente (FastAPI#apice("G"), Airflow#apice("G")) evitando competenze aggiuntive (come Java o Scala), è dimensionato per stream di eventi moderati con logica complessa (chiamate HTTP asincrone, query geospaziali), supporta nativamente async/await per integrazioni OSRM#apice("G") e message generator, si rilascia come singolo container Docker#apice("G") senza necessitare di cluster manager. Infine offre un modello di programmazione intuitivo con pipeline#apice("G") dichiarative (Kafka#apice("G") → arricchimento → ClickHouse#apice("G")) che garantisce codice leggibile e manutenibile.

Tale scelta comporta l'inizio dell'incremento#apice("G") 5 e la successiva modifica dell'Analisi dei Requisiti.

= Decisioni prese
1. Il team si impegna a sviluppare ed implementare uno Stream Processor#apice("G") basato su ByteWax#apice("G").
2. Aggiornare la relativa documentazione.

#pagebreak()

= Rotazione ruoli

I ruoli aggiornati per ciascun membro sono:

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 2,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*Nome e Cognome*]), text(fill: rgb("#f5f5eb"), align(center)[*Ruolo*])),
    [Alessandro Di Pasquale], [Analista#apice("G")],
    [Nicolò Bovo], [Amministratore#apice("G")],
    [Giovanni Battista Matteazzi], [Programmatore#apice("G")],
    [Romeo Calearo], [Verificatore#apice("G")],
    [Massimo Chioru], [Responsabile#apice("G")],
    [Elia Leonetti], [Programmatore#apice("G")],
    [Manuel Cinnirella], [Progettista#apice("G")]
  )
)

= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    [docs], [Alessandro Di Pasquale, Romeo Calearo, Massimo Chioru, Nicolò Bovo], [Aggiornamento dettagli dei documenti pregressi],
    [docs],[Giovanni Battista Matteazzi, Elia Leonetti, Manuel Cinnirella],[Stesura dell'Ottavo Verbale Interno],
    [code],[Giovanni Battista Matteazzi, Elia Leonetti],[Implementazione Stream Processor#apice("G") nel P.o.C.#apice("G")] 
  )
)
