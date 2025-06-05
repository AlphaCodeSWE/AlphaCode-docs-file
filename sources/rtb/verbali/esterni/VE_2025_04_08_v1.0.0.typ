#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Seconda Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responabile", "Alessandro Di Pasquale",
      "Redattori", "Alessandro Di Pasquale",
      "", "Romeo Calearo",
      "Verificatori", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi",
      "", "Nicolò Bovo"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-04-08",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-04-12", "Stesura del verbale", "Alessandro Di Pasquale","Romeo Calearo",
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
- *Luogo*: Chiamta Google Meet, piattaforma usata dall'azienda Sync Lab;
- *Ora di inizio*: 17:00;
- *Ora di fine*: 17:50;
- *Partecipanti interni*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Elia Leonetti, Massimo Chioru.
- *Partecipanti esterni*: Andrea Dorigo, Daniele Zorzi, Fabio Pallaro.

== Ordine del giorno
- Apprendere maggiori dettagli sugli obiettivi di progetti
- Definire la prima frazione di progetto da realizzare
- Accedere al canale Discord aziendale da cui comunicare più velocemente in caso di necessità (mantenendo gli incontri programmati su Google Meet)

= Sintesi dell'incontro
L'incontro è stato fortemente guidato dall'azienda che ci ha fornito tutte le informazioni necessarie a fornire una panoramica di progetto più approfondita, con particolare attenzione nel definire lo stack tecnologico di cui il gruppo potrà avvalersi per la realizzazione del progetto. Nel dettaglio:

== Specifiche del Software
Il software dovrà rispondere a precise necessità tecnologiche e funzionali.

Si vuole una struttura a container, ottenibile tramite Docker.

Si ritiene necessario realizzare un simulatore di dati streaming, senza vincoli sul linguaggio da adoperare per riuscirci.

Sarà essenziale la presenza di un message broker, come Kafka o RabbitMQ, capace di ricevere i dati simulati (per un massimo di uno o due consumer) e di un Agent che lo colleghi al database.

Sulla scelta del database non sono imposte restrizioni di alcun tipo, è possibile utilizzare PostgreSQL o ClickHouse.

L'AI dovrà essere integrata in maniera tale da fornire un messaggio personalizzato, scritto opportunamente, agli utenti basandosi su posizione, interessi personali e dati statistici di partenza. I messaggi generati saranno poi scritti nel database.

La visibilità dei dati dovrà essere fornita attraverso un sistema di dashboarding.

== Documenti
L'azienda ha chiesto espressamente di fornire un'anteprima dei documenti realizzati, dotati di changelog, prima di intraprendere lo sprint e, in generale, di comunicare eventuali dubbi a tempo debito così da poter agire per tempo su ipotetici problemi o difficoltà.

== Primi passi
Si richiede, entro il 2025/04/17, di aver concluso almeno una parte significativa della prima frazione di progetto assegnata al gruppo, ovvero un docker compose con un simulatore di dati streaming e un message broker.
In parallelo sarà necessario impostare i flussi di lavoro per coordinare il gruppo, adottare strumenti di project management e iniziare lo studio delle tecnologie da utilizzare.

== Consigli
Al gruppo è stato consigliato di creare dei percorsi dell'utente prestabiliti su cui testare le varie parti del software, catalogare gli utenti in base alle loro preferenze e creare dei "Points Of Interest" basati su posizione, ambito e simili. I percorsi potranno essere rappresentati tramite file GPX contenenti le coordinate e con i relativi "Point of Interest" lungo il tragitto.

= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode Full Team], align(left)[Prossimo incontro con Sync Lab S.r.l. fissato per il 2025-04-17 alle 17:00],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/6")[docs \#6]], [AlphaCode Full Team], align(left)[Fare un docker compose con un simulatore di dati streaming e un message broker],
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
