#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Analisi dei requisiti",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Romeo Calearo",
      "Redattori", "Elia Leonetti",
      "Validatori", "Massimo Chioru",
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/05/08",
  version: "0.1.0",
  version_history: (
    "0.1.0", "2025/05/08", "Bozza del documento", "Elia Leonetti", "Massimo Chioru",
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

#outline(
  title: [Lista delle figure],
  target: figure.where(kind: image),   // tutte le figure con immagini
)

#outline(
  title: [Lista delle tabelle],
  target: figure.where(kind: table),   // figure che contengono table()
)

#pagebreak()

= Introduzione

== Scopo del documento
Il presente documento definisce in modo formale i requisiti funzionali, di qualità e di vincolo del sistema NearYou proposto da Sync Lab attraverso il capitolato C4. L'Analisi dei Requisiti costituisce la base comune per progettazione, implementazione, verifica e validazione del prodotto.

== Scopo del prodotto
NearYou è una piattaforma di advertising personalizzato che genera e veicola annunci su misura per l'utente in funzione del suo contesto istantaneo (profilo, localizzazione, stato fisico, condizioni esterne) sfruttando modelli di Generative AI / LLM. Il prodotto si focalizza su due front-end simulati:
- *un display veicolo* (web-app) rivolto all'utente finale;
- *una dashboard per inserzionisti e operatori* che mostra mezzi, utenti e messaggi in tempo reale.

==  Scenario di riferimento
Il caso d'uso cardine, ripreso dal capitolato, è il noleggio biciclette dotate di display. Mentre l'utente percorre un itinerario, il sistema riceve lo stream di coordinate GPS, arricchisce il contesto con la profilazione utente e, quando opportuna, genera l'annuncio con LLM e lo visualizza solo se l'attività commerciale è nelle vicinanze e coerente con gli interessi dell'utente.

== Riferimenti
=== Riferimenti normativi
- Capitolato d'appalto *C4: NearYou, Smart custom advertising platform*, Sync lab (2024)
- Standard ISO/IEC 12207:2017
- Standard ISO/IEC 29148:2018
=== Riferimenti informativi
- PD1 - Regolamento del Progetto Didattico (v2024/2025)
- Dispense corso: 
  - T5 - Analisi dei Requisiti
  - P2 - Use Case UML
- Glossario

= Descrizione generale

== Obiettivi
Realizzare un MVP in grado di dimostrare la fattibilità della piattaforma, seguito facoltativamente dalla versione completa. Gli obiettivi minimi sono elencati nei criteri di completamento del capitolato

== Funzionalità del prodotto

#figure(
  table(
      columns: 3,
      inset: 10pt,
      table.header([ID],[Descrizione],[Obbligatorio]),
      [F-01],[Simulare stream GPS di veicoli],[Sì],
      [F-02],[Profilare utenti e gestire dataset statici],[Sì],
      [F-03],[Ingestione stream tramite broker],[Sì],
      [F-04],[Processing real-time & arricchimento contesto],[Sì],
      [F-05],[Generazione messaggio con LLM],[Sì],
      [F-06],[Invio messaggio al display veicolo (web-app)],[Sì],
      [F-07],[Visualizzazione mappa & log su dashboard cliente],[Sì],
      [F-08],[Persistenza dati storici (timeseries + geo)],[Sì],
      [F-09],[Gestione campagne / annunci da parte del brand],[Desiderabile],
      [F-10],[Simulazione sorgenti aggiuntive (meteo, stato fisico)],[Facoltativo],
    ),
    caption: [Tabella 1 - Funzionalità del prodotto],
)

== Interfacce

=== Interfacce utente
- *Display veicolo*, web-app responsive, full-screen, contenente area messaggi, indicatore di prossimità e status connettività.
- *Dashboard web*, front-end amministrativo con vista mappa in tempo reale, tabella log eventi, filtri temporali e pannello KPI.

=== Interfacce hardware / logiche
- *Simulatore GPS*, Event broker (Kafka) su WebSocket/HTTP.
- *LLM API* (OpenAI, HuggingFace) invocate via REST.
- *Database geospaziale* (PostGIS) e serie temporali (TimescaleDB) su rete interna.

== Caratteristiche degli utenti
- *Utente finale* (Rider), usa il veicolo e riceve annunci.
- *Inserzionista / Brand manager*, configura campagne e monitora KPI.
- *Operatore di flotta*, supervisiona flusso veicoli e corretto funzionamento.
- *Sistema*, componenti back-end che elaborano e generano i messaggi.

== Vincoli di progetto
- Deliverable eseguibile tramite container Docker.
- Copertura di test ≥ 80 % per componenti core.
- Utilizzo di strumenti open-source per broker, stream-processing, database e data-viz (Kafka, Flink, PostGIS, Grafana).
- Conformità GDPR sui dati personali simulati (pseudonimizzazione).

== Tecnologie suggerite
- Simulazione dati: Python + faker, generatori custom.
- Event streaming: Apache Kafka / RabbitMQ / HiveMQ.
- Stream processing: Apache Flink (real-time) o Spark Structured Streaming.
- LLM orchestration: LangChain.
- Storage: PostGIS (geo), ClickHouse (analisi), TimescaleDB (serie temporali).
- Data-viz: Grafana / Apache Superset.

== Assunzioni e dipendenze
- Numero massimo veicoli in demo: 50; capacità scalare orizzontalmente.
- Connettività di rete stabile tra simulatori, broker e back-end.

== Limitazioni di progetto
- Privacy & GDPR, i dati demo devono essere pseudonimizzati; non è consentito tracciare persone reali.
- Tempo, la Proof of Concept è richiesta per la revisione RTB, l'MVP deve essere presentato e valutato nella revisione PB. L'impegno rendicontabile per ogni componente resta entro il limite regolamentare di 95 ore/persona.
