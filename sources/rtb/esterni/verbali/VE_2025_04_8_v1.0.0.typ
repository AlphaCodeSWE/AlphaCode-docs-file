#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Seconda Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responabile", "Nicolò Bovo",
      "Redattori", "Alessandro Di Pasquale",
      "", "Romeo Calearo",
      "Verificatori", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi"
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

Sarà essenziale la presenza di un message broker capace di ricevere i dati simulati (per un massimo di uno o due consumer) e di un Agent che lo colleghi al database.

Sulla scelta del database non sono imposte restrizioni di alcun tipo.

L'AI dovrà essere integrata in maniera tale da fornire un messaggio personalizzato, scritto opportunamente, agli utenti basandosi su posizione, interessi personali e dati statistici di partenza.

La visibilità dei dati dovrà essere fornita attraverso un sistema di dashboarding.

== Documenti
L'azienda ha chiesto espressamente di fornire un'anteprima dei documenti realizzati, dotati di changelog, prima di intraprendere lo sprint e, in generale, di comunicare eventuali dubbi a tempo debito così da poter agire per tempo su ipotetici problemi o difficoltà.

== Primi passi
Si richiede, entro il 2025/04/17, di aver concluso almeno una parte significativa della prima frazione di progetto assegnata al gruppo, ovvero un docker compose con un simulatore di dati streaming e un message broker.

== Consigli
Al gruppo è stato consigliato di creare dei percorsi dell'utente prestabiliti su cui testare le varie parti del software, catalogare gli utenti in base alle loro preferenze e creare dei "Points Of Interest" basati su posizione, ambito e simili.