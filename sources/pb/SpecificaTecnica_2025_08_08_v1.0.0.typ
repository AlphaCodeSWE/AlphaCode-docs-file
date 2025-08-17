#import "../../template/template.typ": *
#set text(lang: "it")

#set outline(title: "Table of contents")

// Stili personalizzati
#let code-block(body) = block(
  fill: luma(245),
  inset: 8pt,
  radius: 4pt,
//   stroke: luma(200),
  width: 100%,
  body
)

#let pattern-box(title, content) = block(
  fill: rgb(240, 248, 255),
  inset: 12pt,
  radius: 6pt,
  stroke: rgb(70, 130, 180),
  width: 100%,
)[
  #text(weight: "bold", size: 12pt, fill: rgb(70, 130, 180))[#title]
  #content
]

#show: bubble.with(
  title: "Specifica Tecnica",
  
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro",
      "Redattori", "Alessandro Di Pasquale",
      "","Nicolò Bovo",
      "", "Elia Leonetti",
      "Verificatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Manuel Cinnirella",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-08-08",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-08-14", "Aggiunta nuove classi, ricontroll del documento", "Nicolò Bovo", "Massimo Chioru",    
    "0.2.0", "2025-08-13", "Aggiunta classi, pattern e test", "Nicolò Bovo", "Massimo Chioru",
    "0.1.0", "2025-04-13", "Stesura iniziale del glossario", "Alessandro Di Pasquale", "Manuel Cinnirella"
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Introduzione
== Scopo del documento

Questo documento di Specifiche Tecniche ha l'obiettivo di illustrare in modo approfondito le decisioni tecnologiche e le soluzioni tecniche adottate dal team di sviluppo per la realizzazione del progetto *NearYou - Smart Custom Advertising Platform*, sviluppato nell'ambito del capitolato 4 proposto da *SyncLab S.r.l.*.

All'interno del documento vengono fornite descrizioni dettagliate delle tecnologie impiegate, delle decisioni architetturali e delle scelte implementative, insieme ai pattern#apice("G") di progettazione utilizzati per costruire l'ecosistema software che costituisce la piattaforma *NearYou*.

Il documento include anche la mappatura dei requisiti funzionali che sono stati soddisfatti durante il processo di sviluppo del prodotto, accompagnata da rappresentazioni grafiche che dimostrano il livello di copertura raggiunto per ciascuno di essi.

== Scopo del progetto

La piattaforma *NearYou Smart Custom Advertising Platform* rappresenta una soluzione innovativa che impiega l'Intelligenza Artificiale Generativa#apice("G") per sviluppare contenuti pubblicitari altamente personalizzati e mirati per ogni singolo utente. Il sistema utilizza diverse tipologie di informazioni, tra cui i dati di geolocalizzazione#apice("G") trasmessi in tempo reale#apice("G"), le caratteristiche demografiche degli utenti e i profili comportamentali acquisiti, con l'obiettivo di ottimizzare l'esperienza dell'utente finale e massimizzare simultaneamente il ritorno sull'investimento e l'efficacia delle strategie di marketing digitale.

Le principali caratteristiche della piattaforma includono:
- *Tracking geospaziale in tempo reale* attraverso elaborazione di stream#apice("G") di dati GPS#apice("G")
- *Generazione automatica di messaggi personalizzati* mediante LLM#apice("G")
- *Sistema di notifiche di prossimità* basato sul calcolo della distanza
- *Dashboard#apice("G") interattiva* con visualizzazione cartografica per monitoraggio utenti
- *Analytics comportamentali avanzate* per analisi 

== Riferimenti
=== Riferimenti informativi
 - Glossario (v2.0.0)
 - Capitolato C4 fornito dall'azienda
=== Riferimenti normativi
- Norme di Progetto (v2.0.0)
- Capitolato C4 fornito dall'azienda

= Tecnologie
== Infrastuttura del sistema 
=== Docker 
*Docker*#apice("G") costituisce la tecnologia di containerizzazione#apice("G") adottata per l'orchestrazione dell'intera infrastruttura applicativa di NearYou. La piattaforma viene utilizzata per incapsulare ogni microservizio#apice("G") in container#apice("G") isolati, garantendo consistenza ambientale tra sviluppo, testing e produzione.
Nel progetto NearYou, Docker facilita:
- *Isolamento dei servizi*: Ogni componente (Kafka#apice("G"), ClickHouse#apice("G"), PostgreSQL#apice("G"), Redis#apice("G")) opera in container dedicati
- *Gestione delle dipendenze*: Eliminazione dei conflitti tra librerie e versioni diverse
- *Deployment#apice("G") semplificato*: Avvio dell'intera stack con un singolo comando _docker-compose up_
- *Scalabilità orizzontale#apice("G"):* Possibilità di replicare servizi aumentando il numero di container
- *Ambiente riproducibile:* Configurazione identica su qualsiasi macchina di sviluppo
*Architettura#apice("G") Container:* Il sistema utilizza un approccio multi-stage con Dockerfile principale (deployment/docker/Dockerfile) per la base Python, Dockerfile OSRM specializzato per il routing, configurazioni dedicate tramite file .env, healthcheck integrati e restart policies automatiche.
=== Docker Compose per l'Orchestrazione

La replicabilità del sistema viene resa possibile grazie a *Docker Compose*#apice("G"), che permette di definire e gestire applicazioni multi-container attraverso file di configurazione YAML#apice("G"). NearYou adotta un approccio modulare con un file principale _docker-compose.yml_ nella root che coordina l'intera infrastruttura tramite la direttiva _include_:

- ./deployment/docker/docker-compose.yml - servizi core dell'applicazione
- ./monitoring/docker-compose.monitoring.yml - servizi di monitoraggio 

Questa architettura modulare facilita la manutenzione e permette l'attivazione selettiva di sottosistemi specifici. L'avvio dell'intera stack avviene con il singolo comando `docker-compose up -d` che coordina l'inizializzazione dei servizi presenti.

*Servizi Core del Sistema:*
1.  *osrm-milano*: Servizio di routing ottimizzato per l'area di Milano
    - Immagine: ghcr.io/project-osrm/osrm-backend:v5.27.1
    
2.  *kafka*: Message broker#apice("G") per lo streaming#apice("G") di dati GPS in tempo reale
    - Immagine: bitnami/kafka:3.4
    
3. *zookeeper*: Coordinatore per Kafka
    - Immagine: bitnami/zookeeper:latest
    
4.  *clickhouse*: Database#apice("G") analitico per l'archiviazione degli utenti e dei relativi eventi 
    - Immagine: clickhouse/clickhouse-server:latest 
    
5. *postgres-postgis*: Database relazionale con estensioni geospaziali per negozi e offerte
    - Immagine: postgis/postgis:15-3.3
    
6. *message-generator*: Microservizio per la generazione di messaggi personalizzati via LLM
    - Immagine: Build custom basata su python:3.10-slim
    
7. *dashboard-user*: Interfaccia web per utenti finali
    - Immagine: Build custom basata su python:3.10-slim
    
8. *producer/consumer*: Pipeline#apice("G") di elaborazione dati tramite Bytewax
    - Immagine: Build custom basata su python:3.10-slim
    
9. *airflow-webserver/scheduler/worker*: Orchestratore per processi ETL#apice("G") di negozi e offerte
    - Immagine: apache/airflow:2.5.0

10. *redis-cache*: Sistema di caching#apice("G") per ottimizzazione performance
    - Immagine: redis:alpine

11. *grafana*: Dashboard di visualizzazione e analytics
    - Immagine: grafana/grafana:latest

*Servizi di Monitoraggio:*
1. *prometheus*: Raccolta metriche applicative
    - Immagine: prom/prometheus:v2.45.0
    
2. *loki*: Aggregazione log centralizzata
    - Immagine: grafana/loki:2.9.1
    
3. *promtail*: Agente per raccolta log
    - Immagine: grafana/promtail:2.9.1

4. *node-exporter* : Monitoraggio risorse sistema
    - Immagine: prom/node-exporter:v1.6.1

5. *redis-exporter*: Esportatore metriche Redis
    - Immagine: oliver006/redis_exporter

L'utilizzo del *Makefile* semplifica le operazioni di sviluppo con comandi come make build e make run_dev, rendendo il sistema accessibile anche a sviluppatori meno esperti con Docker.

== Linguaggi di sviluppo
=== Python
Python#apice("G") è un linguaggio di programmazione interpretato, multiparadigma e ad alto livello che supporta sia la programmazione orientata agli oggetti che quella procedurale. La sua sintassi chiara e la vasta libreria standard lo rendono ideale per applicazioni di data processing, machine learning e sviluppo web.

==== Utilizzo nel progetto:

Python costituisce il linguaggio principale del progetto NearYou, utilizzato per:
  - *Data Pipeline*: Producer per la generazione di dati GPS simulati e consumer per l'elaborazione in tempo reale tramite Bytewax

  - *ETL Processes*: Script Airflow#apice("G") per l'estrazione e caricamento dati negozi da Overpass API#apice("G")
  - *Simulazione utenti*: Generazione di profili utente realistici 
  - *Integrazione LLM*: Interfacciamento con modelli linguistici per la creazione di messaggi personalizzati
  
==== Versione:

La versione di Python utilizzata per lo sviluppo è la *3.10*, come specificato nel Dockerfile base (python:3.10-slim).

==== Librerie e framework:

Per la gestione delle dipendenze è stato utilizzato *pip* con file requirements.txt modulari. Per una visione dettagliata di tutte le librerie utilizzate, è possibile consultare i file presenti nella cartella requirements/ del progetto.

La seguente lista rappresenta le dipendenze più rilevanti:

*Stream Processing*: 
1. *Bytewax*#apice("G")
  - Documentazione: https://docs.bytewax.io 
  - Versione: 0.19.0
  - Descrizione: Framework#apice("G") per stream processing in tempo reale dei dati GPS, permettendo operazioni stateful su flussi di dati in maniera reattiva e scalabile
  
* Database e Storage* :
1. *ClickHouse-driver*
  - Documentazione: https://clickhouse-driver.readthedocs.io 
  - Versione: 0.2.5
  - Descrizione: Driver per la connessione al database analitico ClickHouse per l'archiviazione di eventi utente
2. *Psycopg2-binary*
  - Documentazione: https://www.psycopg.org/docs 
  - Versione: 2.9.6
  - Descrizione: Adapter PostgreSQL per operazioni geospaziali con PostGIS#apice("G"), utilizzato per gestire negozi e offerte
  
*Web Framework e API*:
1. *FastAPI*#apice("G")
  - Documentazione: https://fastapi.tiangolo.com
  - Versione: 0.103.1
  - Descrizione: Framework moderno per API#apice("G") REST#apice("G") 
2. *Uvicorn*
  - Documentazione: https://www.uvicorn.org
  - Versione: 0.23.2
  - Descrizione: Server ASGI#apice("G") per applicazioni asincrone Python, utilizzato per servire le API FastAPI
  
*Machine Learning e LLM* :
1. *LangChain*#apice("G")
  - Documentazione: https://docs.langchain.com
  - Versione: 0.0.286
  - Descrizione: Framework per applicazioni basate su modelli linguistici, utilizzato per la generazione di messaggi personalizzati tramite LLM
  
2. *OpenAI*
   - Documentazione: https://platform.openai.com/docs
   - Versione: 0.28.1
   - Descrizione: SDK#apice("G") per integrazione con modelli linguistici GPT e provider compatibili
   
*Utilities*:
1. *Faker*
  - Documentazione: https://faker.readthedocs.io 
  - Versione: 18.13.0
  - Descrizione: Generazione di dati di test realistici per profili utente e simulazioni
  
2. *Pydantic*#apice("G")
  - Documentazione: https://docs.pydantic.dev
  - Versione: 2.4.2
  - Descrizione: Validazione dati e serializzazione modelli per garantire type safety nelle API
  
3. *Python-dotenv*
  - Documentazione: https://pypi.org/project/python-dotenv
  - Versione: 1.0.0
  - Descrizione: Modulo per caricare variabili d'ambiente da file .env in modo sicuro e configurabile

==== Test

Per effettuare i test e le analisi statiche del codice sono state utilizzate le seguenti librerie:

- *Pytest* per i test di unità e integrazione
- *Black* per la formattazione automatica del codice
- *Flake8* per l'analisi statica del codice
- *MyPy* per il type checking

=== JavaScript

JavaScript#apice("G") è un linguaggio di programmazione interpretato, dinamico e multi-paradigma che consente lo sviluppo di applicazioni web interattive e real-time, eseguito nativamente dai browser moderni senza necessità di compilazione.

==== Utilizzo nel progetto

Nel nostro specifico caso, viene adottato per la creazione dell'interfaccia utente interattiva della dashboard (denominata frontend_user) che si occupa di visualizzare in tempo reale i dati di localizzazione degli utenti, garantendone la sincronizzazione tramite comunicazione WebSocket#apice("G") con il backend#apice("G"), e di gestire l'interazione con le mappe geospaziali per fornire un'esperienza utente fluida e reattiva durante la navigazione e la ricezione di offerte personalizzate.

==== Versione

Per garantire compatibilità con i browser moderni è stato adottato *JavaScript ES6+#apice("G") (ECMAScript 2015+)*.
La scelta di utilizzare JavaScript vanilla elimina la necessità di transpilazione e bundling, garantendo performance ottimali e riducendo la complessità del deployment. Le funzionalità ES6+ utilizzate includono arrow functions, template literals, destructuring assignment e async/await per la gestione asincrona delle comunicazioni.

==== Librerie e framework

Per la gestione dell'interfaccia utente e delle funzionalità geospaziali non è stato utilizzato alcun sistema di build automation, privilegiando l'inclusione diretta tramite CDN#apice("G") per garantire velocità di caricamento e semplicità di manutenzione. Per avere una visione nel dettaglio di tutte le librerie utilizzate all'interno del nostro sistema, è possibile visionare il file index_user.html presente all'interno della cartella services/dashboard/frontend_user del nostro progetto.
La seguente lista rappresenta le dipendenze più rilevanti presenti all'interno del progetto e non vuole essere un mero elenco di tutte le dipendenze e librerie presenti all'interno del nostro sistema frontend#apice("G").

1. *Leaflet*#apice("G") 
  - Documentazione: https://leafletjs.com/reference.html
  - Versione: Latest CDN
  - Descrizione: Framework open-source per la creazione di mappe interattive che permette, nel nostro caso, la visualizzazione in tempo reale delle posizioni degli utenti, dei percorsi di navigazione e dei punti di interesse con supporto per marker personalizzati e popup informativi.

2. *Font Awesome*
  - Documentazione: https://fontawesome.com/docs
  - Versione: 6.4.0
  - Descrizione: Libreria di icone vettoriali scalabili utilizzata per fornire elementi grafici consistenti e accessibili all'interno dell'interfaccia utente della dashboard.

3. *WebSocket API (Nativa)*
   - Documentazione: https://developer.mozilla.org/en-US/docs/Web/API/WebSocket
   - Versione: Standard HTML5
   - Descrizione: API#apice("G") nativa del browser per la comunicazione bidirezionale real-time con il backend, utilizzata per ricevere aggiornamenti di posizione e notifiche personalizzate senza necessità di polling#apice("G").

4. *Fetch API (Nativa)*
  - Documentazione: https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
  - Versione: Standard HTML5
  - Descrizione: API nativa per effettuare richieste HTTP#apice("G") asincrone, utilizzata per l'autenticazione JWT#apice("G"), il recupero dati utente e l'interazione con gli endpoint#apice("G") REST del backend.

5. *Intersection Observer API (Nativa)*
  - Documentazione: https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API
  - Versione: Standard HTML5
  - Descrizione: API nativa utilizzata per implementare il lazy loading delle notifiche e ottimizzare le performance di rendering della dashboard.

==== Test

Per effettuare i test e la validazione del codice JavaScript vengono utilizzati i seguenti strumenti integrati nella pipeline di sviluppo definita nel Makefile:

- *Browser DevTools* per il debugging real-time
- *ESLint* per l'analisi statica del codice (configurazione inclusa nel workflow di sviluppo)
- *Manual Testing* per la validazione dell'esperienza utente e delle funzionalità interattive

=== Data Broker
Il sistema di messaggistica costituisce un componente cruciale all'interno della nostra architettura poiché gestisce la ricezione dei flussi di posizionamento degli utenti e li distribuisce ai moduli consumatori garantendo efficienza e scalabilità orizzontale. Nella nostra implementazione, il message broker acquisisce le coordinate di movimento dal generatore di simulazione e le trasmette al componente di elaborazione stream basato su Bytewax.

==== Apache Kafka
Apache Kafka rappresenta una piattaforma distribuita di event streaming#apice("G"). Concepito per supportare scalabilità massiva, resilienza ai guasti e throughput#apice("G") elevato, viene impiegato per orchestrare i flussi informativi real-time. Specificatamente nella nostra soluzione, Kafka orchestra i canali di trasmissione dati tra il motore di simulazione percorsi utente *(src/data_pipeline/producer.py)* e l'engine di stream processing *(src/data_pipeline/bytewax_flow.py)*.

Nonostante ciò, non l'intero ventaglio di capacità che Apache Kafka mette a disposizione degli sviluppatori è stato implementato nel nostro ecosistema, quali la duplicazione delle informazioni su cluster#apice("G") multipli. Considerando il carattere prototipale dell'applicazione, si è optato per deployare una singola istanza Kafka con protezione SSL#apice("G") per assicurare sicurezza nelle trasmissioni, tuttavia questo approccio non impedisce l'adozione di architetture clusterizzate, le quali possono generare benefici significativi sulla robustezza del sistema.

==== Configurazione protezione comunicazioni
L'ecosistema implementa trasmissioni protette mediante SSL/TLS#apice("G") con credenziali configurate nel modulo *src/configg.py*
#image("../assets/immagini/kafka_sicuro.png")
L'architettura prevede validazione client-side obbligatoria e cifratura end-to-end per preservare integrità e riservatezza delle informazioni di posizionamento degli utilizzatori.

===== Schema dei messaggi di posizionamento
Ogni informazione di coordinate emessa dal generatore di simulazione è strutturata come oggetto JSON#apice("G") contenente le seguenti proprietà:
#image("../assets/immagini/kafka_json.png") 
- *user_id*: Codice identificativo univoco dell'utilizzatore che ha generato l'informazione di posizionamento (si rimanda alla documentazione delle entità utente in ClickHouse per approfondimenti riguardo l'oggetto User).

- *latitude*: Coordinata latitudinale della localizzazione attuale dell'utilizzatore espressa in notazione decimale secondo lo standard WGS84#apice("G").

- *longitude*: Coordinata longitudinale della localizzazione attuale dell'utilizzatore espressa in notazione decimale secondo lo standard WGS84.

- *timestamp*: Marcatura temporale dell'informazione di posizionamento in notazione ISO 8601#apice("G") con fuso orario UTC#apice("G"). Questo attributo risulta essenziale per l'amministrazione della persistenza informativa all'interno di ClickHouse e per la creazione degli annunci targettizzati, poiché consente di prevenire sovrapposizioni tra molteplici informazioni di coordinate emesse dal medesimo utilizzatore.

- *age*: Anagrafica dell'utilizzatore impiegata per la customizzazione delle proposte commerciali e del targeting promozionale.

- *profession*: Occupazione lavorativa dell'utilizzatore sfruttata dal motore di generazione messaggi LLM per produrre contenuti contestualmente pertinenti.

- *interests*: Elenco di passioni dell'utilizzatore delimitate da virgola, adoperate per l'associazione con le tipologie dei punti vendita e la personalizzazione delle comunicazioni commerciali.

Questi payload#apice("G") vengono elaborati dal consumer Bytewax che si occupa dell'enrichment con dettagli sui punti di interesse circostanti e della creazione di comunicazioni personalizzate tramite integrazione con il servizio LLM.

=== Stream Processor
L'engine di elaborazione rappresenta il nucleo operativo dell'intera soluzione sviluppata dal team. Esso gestisce l'acquisizione dei flussi di coordinate, li arricchisce con metadati necessari alla formulazione della richiesta da inoltrare al modello linguistico e garantisce la persistenza di queste informazioni all'interno del sistema di storage.

==== Bytewax
Bytewax costituisce un framework di processing distribuito che consente di eseguire trasformazioni definite stateful#apice("G") su flussi di informazioni in ingresso, bounded o unbounded che siano. È architettato per operazioni continue con latenze#apice("G") e tempi di risposta estremamente ridotti. Nella nostra implementazione Bytewax viene impiegato per elaborare i payload di posizionamento real-time provenienti dai simulatori, assicurandone la memorizzazione all'interno del database e, partendo da questi payload, recuperare il maggior numero di metadati possibili allo scopo di generare la comunicazione più appropriata da recapitare all'utilizzatore finale.

Il dataflow#apice("G") implementato orchestra le seguenti operazioni:
- *Parsing*: Deserializzazione messaggi Kafka in oggetti Python strutturati

- *Enrichment*: Arricchimento con informazioni geospaziali sui negozi circostanti via PostGIS

- *AI Integration*: Chiamata al servizio di generazione messaggi personalizzati

- *Persistence*: Memorizzazione eventi processati in ClickHouse per analytics

==== Creazione comunicazioni personalizzate
Le specifiche richiedono l'impiego di modelli linguistici per la creazione delle comunicazioni sfruttando come input le preferenze dell'utilizzatore finale, la tipologia commerciale e le proposte del punto vendita più prossimo alla localizzazione del sensore. È importante sottolineare che l'importanza maggiore dei parametri risiede nei campi testuali liberi (preferenze dell'utilizzatore e proposte del punto vendita) poiché i modelli linguistici sono specializzati nell'interpretazione di queste tipologie di input.

==== Architettura LLM
Il sistema implementa una logica di generazione messaggi. Questa implementazione garantisce:

- *Scalabilità indipendente*: Il servizio può essere scalato autonomamente in base al carico
- *Fault tolerance*: Errori nella generazione non compromettono il resto del sistema
- *Provider agnostic*: Supporto per multipli fornitori LLM tramite configurazione

==== LangChain Python Integration
La nostra soluzione adopera LangChain nella sua implementazione Python, una libreria che semplifica l'integrazione di modelli linguistici con applicazioni Python. Fornisce un ecosistema di strumenti per operare con LLM, inclusa la costruzione di prompt templates#apice("G") e la gestione delle risposte tramite il modello stesso.

LangChain supporta numerosi provider di modelli linguistici: uno tra questi, da noi implementato, è *Gemma2-9B-IT*#apice("G") tramite Groq#apice("G"). Questo modello è stato selezionato per una ragione specifica: consentire al team di sviluppare il progetto utilizzando API gratuite ad alta velocità, sfruttando l'infrastruttura Groq per inferenza#apice("G") ottimizzata.

Il provider può essere facilmente sostituito per permettere l'utilizzo di altri modelli grazie alla modularità del sistema implementato:

#image("../assets/immagini/llm.png")

La generazione dei messaggi integra inoltre un sistema di cache Redis per ottimizzare le performance e ridurre i costi di inferenza, memorizzando risposte precedenti per combinazioni simili di parametri utente e negozio.

=== Sistema di Persistenza (Database)
==== PostgreSQL con PostGIS

Per la gestione delle informazioni relazionali e geospaziali è stato selezionato PostgreSQL, un RDBMS#apice("G") che garantisce robustezza e notevole versatilità per l'espansione tramite moduli ed estensioni. Nel nostro ecosistema, durante l'inizializzazione viene eseguito automaticamente lo script *deployment/scripts/init_postgres.sh* che costruisce lo schema del database (entità, associazioni, vincoli) secondo i requisiti del progetto e inserisce i metadati necessari a validare il funzionamento del nostro ecosistema.

==== Estensione PostGIS
Per l'elaborazione e la memorizzazione di informazioni geografiche si utilizza l'estensione PostGIS, la quale arricchisce PostgreSQL con il supporto per tipologie, operatori e indici spaziali. Specificatamente l'immagine Docker impiegata è *postgis/postgis:15-3.3*. Oltre a PostgreSQL questa include già la libreria PostGIS e le relative dipendenze.
Questa configurazione consente, nella nostra implementazione, di:

- Memorizzare le coordinate geografiche (latitudine e longitudine) dei punti vendita e delle localizzazioni trasmesse real-time da ogni utilizzatore attivo.
- Eseguire interrogazioni geospaziali all'interno del database per identificare i potenziali punti vendita in relazione ad una specifica localizzazione ed entro un determinato raggio di prossimità.

==== ClickHouse 
Per la gestione di grandi volumi di dati analitici e telemetria utente è stato implementato ClickHouse, un DBMS#apice("G") colonnare ottimizzato per query analitiche OLAP#apice("G"). Il setup automatizzato tramite *deployment/scripts/init_clickhouse.sh* configura:

- *Aggregazione eventi*: Memorizzazione efficiente di milioni di eventi di posizionamento utente
- *Analytics real-time*: Supporto per dashboard Grafana con query sub-secondo
- *Data retention*: Partizionamento automatico per gestione lifecycle dati

==== Architettura Database: schema PostgreSQL (Negozi e Offerte)
#image("../assets/immagini/postgres.png")

==== Architettura Database:  Schema ClickHouse (Eventi e Analytics)
#image("../assets/immagini/clickhouse1.png")
#image("../assets/immagini/clickhouse2.png")
==== Diagramma Relazionale
 #image("../assets/immagini/E.png")
==== Decisioni Architetturali
Alcune scelte progettuali, apparentemente ridondanti, sono state implementate per soddisfare esigenze specifiche, in particolare per strumenti di monitoraggio come Grafana e ottimizzazioni performance.
1. *Strategie di Chiavi Primarie*:
  - *Chiavi surrogate vs naturali*: La tabella shops utilizza una chiave surrogata (shop_id SERIAL) per garantire stabilità dei riferimenti anche in caso di modifiche ai dati geografici. Tuttavia, per le query geospaziali, la colonna geom (Point geometry) funge da identificatore naturale tramite indici spaziali PostGIS.
  - *Chiavi composte temporali*: La tabella user_events adotta un approccio ibrido con event_id come chiave primaria e un indice composto su (user_id, event_time) per ottimizzare le query di time-series#apice("G"). Questo garantisce l'univocità di ogni evento registrato per utente ed evita conflitti temporali.
  
2. *Denormalizzazione Strategica*:
  - *Snapshot dati utente*: La tabella user_visits include campi denormalizzati (user_age, user_profession, shop_name, shop_category) per evitare JOIN#apice("G") costosi durante l'aggregazione analitica. Questo trade-off tra spazio di storage e performance è essenziale per dashboard real-time Grafana.
  - *Snapshot dati utente*: La tabella user_visits include campi denormalizzati (user_age, user_profession, shop_name, shop_category) per evitare JOIN costosi durante l'aggregazione analitica. Questo trade-off tra spazio di storage e performance è essenziale per dashboard real-time Grafana.
  
3. *Ottimizzazioni Geospaziali*
  - *Coordinate vs ID geografici*: Le tabelle mantengono sia coordinate geografiche (latitude, longitude) che riferimenti a entità (shop_id) per supportare due pattern di query: ricerca geospaziale diretta tramite PostGIS e join relazionali per analytics business. Questo duplicato migliora significantly le performance delle query di prossimità.
  - *Partizionamento temporale*: ClickHouse partiziona automaticamente user_visits per mese (PARTITION BY toYYYYMM(visit_start_time)) garantendo performance costanti anche con crescita esponenziale dei dati, facilitando la visualizzazione time-series in Grafana.
  
Queste decisioni bilanciano performance, manutenibilità e integrazione con strumenti di business intelligence, mantenendo la flessibilità per future evoluzioni architetturali.
  
=== Interfaccia utente
Il sistema NearYou fornisce due interfacce distinte per soddisfare esigenze differenti: un'interfaccia utente real-time per l'esperienza finale e un sistema di monitoraggio per l'amministrazione e l'analisi dei dati.

==== Dashboard Utente Real-Time
L'interfaccia utente principale (services/dashboard/frontend_user/) fornisce un'esperienza interattiva real-time che permette agli utilizzatori di:

- *Visualizzazione posizione live*: Tracking#apice("G") in tempo reale della posizione utente con aggiornamenti via WebSocket ogni 3 secondi, mostrando percorsi di navigazione e negozi nelle vicinanze.
- *Mappa interattiva*: Implementazione con Leaflet che visualizza marker dinamici per negozi categorizzati, con popup informativi contenenti offerte personalizzate e dettagli punti vendita.
- *Notifiche personalizzate*: Ricezione real-time di messaggi generati dall'LLM quando l'utente si trova in prossimità di negozi con offerte attive, con sistema di cache per ottimizzare le performance.
- *Gestione profilo*: Visualizzazione statistiche personali (distanza percorsa, negozi visitati, notifiche ricevute) e cronologia delle promozioni ricevute con lazy loading#apice("G").
L'interfaccia utilizza comunicazione WebSocket bidirezionale per garantire aggiornamenti istantanei senza polling, implementando pattern di reconnection automatica e gestione errori per massima affidabilità.

=== Sistema di Monitoraggio Admin - Grafana
Grafana#apice("G") non costituisce un sistema «reattivo», ovvero non reagisce direttamente agli eventi, bensì acquisisce i dati tramite query periodiche indipendentemente dalle modifiche nel database. Per questa ragione non è tecnicamente appropriato definirla «interfaccia real-time», tuttavia le interrogazioni vengono eseguite a intervalli molto ravvicinati (5-15 secondi) simulando quindi con elevata precisione il comportamento dell'interfaccia desiderata.

Le funzionalità principali di Grafana nel nostro ecosistema sono:

- *Monitoraggio analytics*: Grafana raccoglie continuamente i dati degli utilizzatori registrati nel sistema, ovvero identificativo utente, eventi di posizionamento associati, latitudine, longitudine e metadati comportamentali.
- *Visualizzazione dati geospaziali*: I dati di posizionamento acquisiti vengono mostrati in dashboard di tipo geomap interattive, dove le posizioni degli utenti sono rappresentate da layer di tipo route e i punti vendita con relativi messaggi tramite layer di tipo marker con colorazione per categoria.
- *Analytics Comportamentali Dettagliate*: Storico Visite Simulate: Il sistema traccia automaticamente le visite simulate degli utenti presso i negozi tramite la tabella user_visits in ClickHouse. Tra le visualizzazioni implementate vi sono:
  1. *Heatmap#apice("G") Geografica*: Mappa interattiva che mostra concentrazione visite per zona di Milano, con intensità colore basata su revenue generato
  2. *Timeline Comportamenti*: Grafici temporali che evidenziano picchi di attività per fascia oraria e giorno della settimana
  3. *Funnel#apice("G") Conversione*: Visualizzazione del percorso utente da posizionamento → prossimità → messaggio → visita → acquisto
  4. * Segmentazione Utenti*: Analisi comportamentale per età, professione e interessi, mostrando pattern di preferenza per categoria negozi
-  *Metriche di Business Specifiche*: Dashboard dedicate per monitorare KPI#apice("G") come conversion rate delle offerte, revenue per categoria, pattern temporali di utilizzo e performance del sistema di raccomandazioni LLM. 

= Architettura del sistema

NearYou ha adottato la *Lambda Architecture*#apice("G") dopo una valutazione mirata dell'alternativa Kappa#apice("G"). L'analisi ha mostrato che mantenere tutto (inclusi i dati dei negozi / POI#apice("G")) nel flusso real‑time avrebbe introdotto costi senza reale beneficio: i POI cambiano lentamente e non richiedono propagazione sub‑secondo.

Motivazioni della scelta (valutazione Kappa → Lambda):
- Frequenza aggiornamento POI: bassa (variazioni giornaliere / settimanali), quindi lo stream li "sovra‑tratta".
//- Sprechi osservati nei test: CPU per re‑indicizzare dati invariati, banda Kafka per messaggi ridondanti, churn nelle cache.
- Impatto sulla latenza critica: concorrenza inutile con eventi dinamici (posizioni utente, visite simulate, notifiche).
- Complessità operativa: più invalidazioni cache (profili ↔ POI) e maggiore rumore nelle metriche di throughput.
- Requisiti analitici: necessità di ricalcoli completi (feature, segmenti, scoring) meglio serviti da job batch controllati.
- Manutenibilità: separare calcolo intensivo (batch) e reattivo (speed) facilita tuning e scaling indipendenti.

Struttura Lambda applicata:
- Batch Layer#apice("G"): aggiorna periodicamente POI, offerte, feature e pulisce / consolida lo storico (Airflow → PostGIS / ClickHouse).
- Speed Layer#apice("G"): gestisce solo ciò che varia rapidamente (eventi posizione, simulazioni visita, generazione messaggi personalizzati via LLM).
- Serving Layer#apice("G"): espone una vista coerente fondendo "storico consolidato" + "delta recenti" con logiche di watermark#apice("G") e priorità ai dati più freschi.

Benefici concreti:
- Latenza sub‑secondo preservata per notifiche contestuali.
- Riduzione dei costi (meno messaggi, meno cache invalidata, meno I/O superfluo).
- Ricalcoli batch controllati per qualità storica e correzione drift.
- Evoluzione agile: nuove feature introdotte prima nel batch, poi eventualmente ottimizzate nello speed se necessario.

In sintesi, la decisione nasce dall'allineamento tra natura dei dati (POI stabili vs movimento utenti dinamico) e obiettivi operativo‑funzionali: il modello Lambda evita di "simulare dinamicità" dove non serve.
== Lambda Architecture
La Lambda Architecture consente di combinare:
- Calcolo incrementale a bassa latenza (speed) per eventi di posizione e generazione notifiche
- Ricalcoli completi e arricchimenti intensivi (batch) per dataset storici, feature e modelli
- Un layer di serving che unifica vista "storica consolidata" + "delta recenti"

#image("../assets/immagini/tecnologie.png")

=== Strati Principali

==== Batch Layer
Funzioni principali:
- Acquisizione e normalizzazione POI (Overpass API → PostGIS)
- Ricalcolo aggregati storici e metriche di comportamento (ClickHouse)
- Generazione e aggiornamento feature utente (propensione visita, vettori interessi)
- Precomputazione e consolidamento rotte ciclabili (OSRM#apice("G") offline)
- Costruzione tabelle gold (negozi, offerte, mapping categorie, segmenti)
- Pulizia e compattazione eventi (merge partizioni, deduplicazione)
Orchestrazione: Apache Airflow (cicli giornalieri / orari). Output persistito in:
- ClickHouse (storico eventi + aggregati)
- PostgreSQL + PostGIS (geospaziale, relazioni commerciali)

==== Speed Layer
Responsabile della reattività:
- Ingest real-time posizioni via Kafka (topic: gps_stream, partition key=user_id)
- Pipeline Bytewax:
  1. Prossimità geospaziale (query PostGIS, raggio 200m configurabile)
  2. Enrichment rapido profilo (Redis → fallback snapshot ClickHouse)
  3. Generazione messaggio personalizzato (servizio LLM + cache Redis)
  4. Simulazione probabilistica visita (emissione user_visit_delta)
- Persistenza delta "hot" (events_delta, user_visit_delta) in ClickHouse
- Gestione TTL#apice("G") cache (profili, messaggi LLM) per mantenere freschezza

==== Serving Layer
Compone viste logiche e servizi:
- Materializzazione/virtualizzazione: unione batch_base + delta recenti (finestra temporale > last_compaction_ts)
- API (REST/WebSocket) per:
  - Stato corrente utente (posizione, POI vicini, offerte personalizzate)
  - Query analitiche storiche (solo fonte batch)
- Dashboard real-time:
  - WebSocket per streaming posizioni e notifiche
  - Mappa interattiva con layer dinamici (rotte, POI, heatmap visite)
- Redis come acceleration layer (profilo utente a caldo, messaggi LLM già calcolati)

=== Componenti Tecnologici
- Data Sources: Simulatore movimento (OSRM), Overpass API, generatori offerte batch
- Messaging: Apache Kafka (SSL/TLS, consumer group gps_consumers_group)
- Stream Processing: Bytewax (operatori custom business logic)
- Batch Orchestration: Airflow (DAG#apice("G") di estrazione, feature engineering, compattazione)
- Storage:
  - ClickHouse (eventi time-series, analytics OLAP, viste unificate)
  - PostgreSQL + PostGIS (POI, geometrie, offerte, relazioni commerciali)
  - Redis (cache profili, risposte LLM, short-lived state)
- LLM Message Generator: servizio HTTP con caching semantico
- Observability: Prometheus#apice("G") (metriche), Grafana (dashboard), log centralizzati

=== Flusso dei Dati

#image("../assets/immagini/flusso_dati.png")

1. Ingest Posizioni:
   - Producer simula movimento utenti (OSRM) e pubblica eventi GPS su Kafka (gps_stream)
2. Speed Processing:
   - Bytewax consuma in ordine per utente
   - Enrichment geospaziale (PostGIS) + profilo (Redis/ClickHouse)
   - Generazione messaggi personalizzati (LLM) + caching
   - Emissione notifiche (WebSocket) e scrittura delta (ClickHouse)
3. Batch Processing:
   - Airflow estrae nuovi POI, rigenera feature e aggregati
   - Compatta delta in tabelle batch canonicali
   - Aggiorna segmentazioni / offerte, invalida cache profili obsoleti
4. Serving Unificato:
   - Query combinano dati batch + delta con watermark temporale
   - Dashboard riceve stream posizioni + notifiche push
5. Monitoring & Feedback Loop:
   - Metriche ingest lag, throughput, LLM latency, cache hit ratio
   - Alert su deviazioni SLA#apice("G") (lag, error rate, memoria cache)

=== Consistenza e Fusione
- Modello dati append-only nei delta; compattazione batch sostituisce partizioni storiche
- Vista logica:
  SELECT * FROM events_batch WHERE ts < :watermark
  UNION ALL
  SELECT * FROM events_delta WHERE ts >= :watermark
- Deduplicazione su (user_id, event_uuid) durante compattazione
- Priorità ai record più recenti (delta) in caso di conflitto
- Topic di controllo (batch_sync) per invalidazione cache coordinata

=== Riepilogo
NearYou applica pienamente la Lambda Architecture per conciliare latenza real-time e consistenza storica verificabile. La separazione funzionale dei layer permette evoluzione rapida della personalizzazione (LLM + feature store) preservando affidabilità e scalabilità orizzontale dell'intero ecosistema dati.
== Diagramma delle classi
Il diagramma illustra l'organizzazione strutturale del sistema attraverso le classi implementate e le loro interdipendenze. Le classi sono raggruppate per domini funzionali, omettendo i dettagli implementativi delle librerie esterne per mantenere la leggibilità.
// === Layer infrastrutturale
// Questa sezione comprende le classi responsabili della gestione delle risorse di sistema, connessioni database e meccanismi di caching.
// == Struttura delle classi
// === DatabaseConnections
// La classe DatabaseConnections rappresenta il gestore centralizzato delle connessioni ai database utilizzando il pattern singleton con lazy initialization. Gestisce connessioni a PostgreSQL, ClickHouse e client HTTP per garantire efficienza e riuso delle risorse.

// 1. Attributi: 
//   - *pg_pool: Optional[asyncpg.Pool]*: pool di connessioni PostgreSQL per operazioni asincrone
//   - *ch_client: Optional[CHClient]*: client ClickHouse per operazioni di analytics
//   - *http_client: Optional[httpx.AsyncClient]*: client HTTP per chiamate API esterne
= Documentazione delle Classi - Sistema NearYou

== Gestione Configurazione

Questa sezione rappresenta le classi impiegate nella gestione della configurazione del sistema.

=== Struttura delle classi

==== ConfigurationManager
#image("../assets/immagini/configurationmanager.png")

===== Attributi
- `_instance: Optional[ConfigurationManager]` - Istanza singleton#apice("G") della classe
- `_initialized: bool` - Flag per prevenire re-inizializzazione
- `environment: str` - Ambiente di esecuzione (development, production, staging)
- `kafka_broker: str` - Indirizzo del broker Kafka
- `kafka_topic: str` - Topic Kafka per i messaggi GPS
- `clickhouse_host: str` - Host del database ClickHouse
- `postgres_host: str` - Host del database PostgreSQL
- `jwt_secret: str` - Chiave segreta per JWT
- `redis_host: str` - Host del server Redis per cache

===== Costruttori
- `__new__() -> ConfigurationManager` - Implementa pattern Singleton#apice("G")
- `__init__()` - Inizializza configurazioni da variabili d'ambiente

===== Metodi
- `_load_environment_config()` - Carica tutte le configurazioni dalle variabili d'ambiente
- `get_clickhouse_config() -> Dict[str, Any]` - Restituisce configurazione ClickHouse
- `get_postgres_uri() -> str` - Genera URI#apice("G") di connessione PostgreSQL
- `get_postgres_config() -> Dict[str, Any]` - Restituisce configurazione PostgreSQL come dictionary
- `get_redis_config() -> Dict[str, Any]` - Restituisce configurazione Redis
- `validate_critical_configs() -> None` - Valida configurazioni critiche per ambienti di produzione

== Sistema di Cache

Questa sezione rappresenta le classi per la gestione del caching nel sistema.

=== Struttura delle classi

==== MemoryCache
#image("../assets/immagini/memorycache.png")

===== Attributi
- `cache: Dict` - Dictionary per memorizzare coppie chiave-valore con scadenza
- `default_ttl: int` - Time-to-live predefinito in secondi (default 86400)
- `lock: threading.RLock` - Lock per thread-safety
- `cleanup_thread: threading.Thread` - Thread per pulizia automatica chiavi scadute

===== Costruttori
- `__init__(default_ttl: int = 86400)` - Inizializza cache in-memory con pulizia periodica

===== Metodi
- `get(key: str) -> Optional[Any]` - Recupera valore dalla cache
- `set(key: str, value: Any, ttl: Optional[int] = None) -> bool` - Salva valore nella cache
- `delete(key: str) -> bool` - Elimina chiave dalla cache
- `exists(key: str) -> bool` - Verifica se la chiave esiste ed è valida
- `info() -> Dict[str, Any]` - Restituisce statistiche sulla cache
- `_cleanup_expired_keys()` - Thread di background per pulizia chiavi scadute

==== RedisCache
#image("../assets/immagini/rediscache.png")

===== Attributi
- `client: redis.Redis` - Client Redis per connessione al server
- `default_ttl: int` - Time-to-live predefinito per le chiavi

===== Costruttori
- `__init__(host: str, port: int, db: int, password: str, default_ttl: int)` - Inizializza connessione Redis

===== Metodi
- `get(key: str) -> Optional[Any]` - Recupera valore da cache con deserializzazione JSON
- `set(key: str, value: Any, ttl: Optional[int] = None) -> bool` - Salva valore con serializzazione JSON
- `delete(key: str) -> bool` - Elimina chiave dalla cache Redis
- `exists(key: str) -> bool` - Verifica esistenza chiave
- `info() -> Dict[str, Any]` - Restituisce statistiche del server Redis

== Modelli Dati

Questa sezione rappresenta le classi che definiscono i modelli dati del sistema.

=== Struttura delle classi

==== OfferType
#image("../assets/immagini/offertype.png")

===== Attributi
- `PERCENTAGE: str` - Sconto percentuale
- `FIXED_AMOUNT: str` - Importo fisso di sconto  
- `BUY_ONE_GET_ONE: str` - Promozione prendi 2 paghi 1

===== Costruttori
Enum#apice("G") definito staticamente con valori costanti per i tipi di offerta disponibili.

===== Metodi
Nessun metodo specifico, utilizzato come enum per tipizzazione delle offerte.

==== OfferValidatorProtocol
#image("../assets/immagini/offervalidatorprotocol.png")

===== Attributi
Nessun attributo, definisce solo l'interfaccia per la validazione.

===== Costruttori
Protocol interface#apice("G"), non ha costruttori diretti.

===== Metodi
- `validate(offer: Offer) -> bool` - Metodo astratto per validare un'offerta

==== OfferValidator
#image("../assets/immagini/offervalidator.png")

===== Attributi
Nessun attributo di istanza.

===== Costruttori
- `__init__()` - Costruttore standard per implementazione default

===== Metodi
- `validate(offer: Offer) -> bool` - Valida vincoli base dell'offerta (percentuale, date, età)

==== Offer
#image("../assets/immagini/offer.png")

===== Attributi
- `offer_id: Optional[int]` - ID univoco dell'offerta
- `shop_id: int` - ID del negozio che offre la promozione
- `discount_percent: int` - Percentuale di sconto (0-100)
- `description: str` - Descrizione testuale dell'offerta
- `offer_type: str` - Tipo di offerta (da OfferType enum)
- `valid_from: Optional[date]` - Data inizio validità
- `valid_until: Optional[date]` - Data fine validità
- `is_active: bool` - Flag attivazione offerta
- `max_uses: Optional[int]` - Numero massimo di utilizzi
- `current_uses: int` - Utilizzi attuali
- `min_age: Optional[int]` - Età minima target
- `max_age: Optional[int]` - Età massima target
- `target_categories: Optional[List[str]]` - Categorie di interesse target
- `_validator: OfferValidatorProtocol` - Validatore per l'offerta

===== Costruttori
- `__init__()` - Inizializza offerta con parametri opzionali
- `__post_init__()` - Post-inizializzazione per valori di default

===== Metodi
- `set_validator(validator: OfferValidatorProtocol) -> None` - Imposta validatore custom
- `is_valid() -> bool` - Verifica validità usando il validatore corrente
- `to_dict() -> Dict[str, Any]` - Converte in dictionary per DB
- `from_dict(data: Dict[str, Any]) -> Offer` - Crea istanza da dictionary
- `is_valid_for_user(user_age: int, user_interests: List[str]) -> bool` - Verifica compatibilità utente
- `get_display_text(shop_name: str) -> str` - Genera testo descrittivo per display

==== OfferBuilder
#image("../assets/immagini/offerbuilder.png")

===== Attributi
- `_offer: Offer` - Istanza dell'offerta in costruzione

===== Costruttori
- `__init__()` - Inizializza builder#apice("G") e resetta stato

===== Metodi
- `reset() -> OfferBuilder` - Resetta builder per nuovo utilizzo
- `shop(shop_id: int) -> OfferBuilder` - Imposta ID negozio
- `discount(percentage: int) -> OfferBuilder` - Imposta percentuale sconto
- `description(text: str) -> OfferBuilder` - Imposta descrizione
- `offer_type(offer_type: OfferType) -> OfferBuilder` - Imposta tipo offerta
- `valid_period(from_date: date, until_date: date) -> OfferBuilder` - Imposta periodo validità
- `valid_for_days(days: int) -> OfferBuilder` - Imposta validità in giorni da oggi
- `max_uses(uses: int) -> OfferBuilder` - Imposta numero massimo utilizzi
- `age_target(min_age: int, max_age: int) -> OfferBuilder` - Imposta target età
- `interest_target(categories: List[str]) -> OfferBuilder` - Imposta target interessi
- `active(is_active: bool) -> OfferBuilder` - Imposta stato attivazione
- `build() -> Offer` - Costruisce e valida l'offerta finale
- `build_unsafe() -> Offer` - Costruisce senza validazione

==== OfferFactory
#image("../assets/immagini/offerfactory.png")

===== Attributi
Nessun attributo di istanza, tutti metodi statici.

===== Costruttori
Classe con soli metodi statici, nessun costruttore necessario.

===== Metodi
- `create_flash_offer(shop_id: int, shop_name: str, discount: int, hours: int) -> Offer` - Crea offerta flash a breve termine
- `create_student_offer(shop_id: int, shop_name: str, discount: int) -> Offer` - Crea offerta per studenti
- `create_senior_offer(shop_id: int, shop_name: str, discount: int) -> Offer` - Crea offerta per senior
- `create_category_offer(shop_id: int, shop_name: str, category: str, discount: int) -> Offer` - Crea offerta specifica per categoria

==== UserVisit
#image("../assets/immagini/uservisit.png")

===== Attributi
- `visit_id: Optional[int]` - ID univoco della visita
- `user_id: int` - ID dell'utente
- `shop_id: int` - ID del negozio visitato
- `offer_id: int` - ID dell'offerta utilizzata
- `visit_start_time: Optional[datetime]` - Orario inizio visita
- `visit_end_time: Optional[datetime]` - Orario fine visita
- `duration_minutes: int` - Durata visita in minuti
- `offer_accepted: bool` - Flag accettazione offerta
- `estimated_spending: float` - Spesa stimata
- `user_satisfaction: int` - Soddisfazione utente (1-10)
- `day_of_week: Optional[int]` - Giorno della settimana
- `hour_of_day: Optional[int]` - Ora del giorno
- `weather_condition: str` - Condizioni meteorologiche
- `user_age: int` - Età utente
- `user_profession: str` - Professione utente
- `user_interests: str` - Interessi utente
- `shop_name: str` - Nome del negozio
- `shop_category: str` - Categoria del negozio

===== Costruttori
- `__init__()` - Inizializza record visita
- `__post_init__()` - Calcola campi derivati (giorno settimana, ora, durata)

===== Metodi
- `to_dict() -> Dict[str, Any]` - Converte in dictionary per inserimento DB

== Servizi Business Logic

Questa sezione rappresenta le classi che implementano la logica di business con pattern Strategy#apice("G").

=== Struttura delle classi

==== OfferGenerationStrategy
#image("../assets/immagini/offergenerationstrategy.png")

===== Attributi
Classe astratta, nessun attributo specifico.

===== Costruttori
Classe astratta, costruttori implementati dalle sottoclassi.

===== Metodi
- `generate_offers(shop_id: int, shop_name: str, category: str) -> List[Offer]` - Metodo astratto per generare offerte
- `should_generate_offers(category: str) -> bool` - Metodo astratto per decidere se generare offerte

==== StandardOfferStrategy
#image("../assets/immagini/standardofferstrategy.png")

===== Attributi
Nessun attributo di istanza.

===== Costruttori
- `__init__()` - Costruttore standard

===== Metodi
- `should_generate_offers(category: str) -> bool` - Verifica probabilità generazione per categoria
- `generate_offers(shop_id: int, shop_name: str, category: str) -> List[Offer]` - Genera offerte standard randomizzate
- `_create_standard_offer(shop_id: int, shop_name: str, category: str) -> Optional[Offer]` - Crea singola offerta standard

==== AggressiveOfferStrategy
#image("../assets/immagini/aggressiveofferstrategy.png")

===== Attributi
Nessun attributo di istanza.

===== Costruttori
- `__init__()` - Costruttore standard

===== Metodi
- `should_generate_offers(category: str) -> bool` - Sempre True per strategia aggressiva
- `generate_offers(shop_id: int, shop_name: str, category: str) -> List[Offer]` - Genera più offerte con sconti maggiori
- `_create_aggressive_offer(shop_id: int, shop_name: str, category: str) -> Optional[Offer]` - Crea offerta con sconti potenziati

==== ConservativeOfferStrategy
#image("../assets/immagini/conservativeofferstrategy.png")

===== Attributi
Nessun attributo di istanza.

===== Costruttori
- `__init__()` - Costruttore standard

===== Metodi
- `should_generate_offers(category: str) -> bool` - Probabilità ridotta rispetto a standard
- `generate_offers(shop_id: int, shop_name: str, category: str) -> List[Offer]` - Genera meno offerte con sconti moderati
- `_create_conservative_offer(shop_id: int, shop_name: str, category: str) -> Optional[Offer]` - Crea offerta con approccio conservativo

==== OfferStrategyFactory
#image("../assets/immagini/offerstrategyfactory.png")

===== Attributi
- `STRATEGIES: Dict` - Dizionario mapping tipi strategia a classi

===== Costruttori
Classe con metodi di classe, nessun costruttore di istanza.

===== Metodi
- `create_strategy(strategy_type: str) -> OfferGenerationStrategy` - Crea istanza strategia basata su tipo

==== OffersService
#image("../assets/immagini/offersservice.png")

===== Attributi
- `postgres_config: Dict[str, Any]` - Configurazione connessione PostgreSQL
- `strategy: OfferGenerationStrategy` - Strategia di generazione offerte attiva

===== Costruttori
- `__init__(postgres_config: Dict[str, Any], strategy_type: str)` - Inizializza servizio con configurazione e strategia

===== Metodi
- `set_strategy(strategy: OfferGenerationStrategy) -> None` - Cambia strategia a runtime
- `get_connection()` - Ottiene connessione PostgreSQL
- `generate_offers_for_all_shops() -> int` - Genera offerte per tutti i negozi
- `insert_offers(offers: List[Offer]) -> int` - Inserisce offerte nel database
- `get_active_offers_for_shop(shop_id: int) -> List[Dict[str, Any]]` - Recupera offerte attive per negozio
- `cleanup_expired_offers() -> int` - Disattiva offerte scadute

== Data Pipeline

Questa sezione rappresenta le classi per la gestione della pipeline dati con pattern Observer#apice("G").

=== Struttura delle classi

==== Observer
#image("../assets/immagini/observer.png")

===== Attributi
Classe astratta, nessun attributo specifico.

===== Costruttori
Classe astratta, costruttori implementati dalle sottoclassi.

===== Metodi
- `update(event_type: str, data: Dict[str, Any]) -> None` - Metodo astratto per ricevere notifiche

==== Subject
#image("../assets/immagini/subject.png")

===== Attributi
- `_observers: List[Observer]` - Lista degli observer registrati

===== Costruttori
- `__init__()` - Inizializza lista observer vuota

===== Metodi
- `attach(observer: Observer) -> None` - Registra un observer
- `detach(observer: Observer) -> None` - Rimuove un observer
- `notify(event_type: str, data: Dict[str, Any]) -> None` - Notifica tutti gli observer

==== MetricsObserver
#image("../assets/immagini/metricsobserver.png")

===== Attributi
- `metrics: Dict[str, int]` - Dizionario con contatori delle metriche

===== Costruttori
- `__init__()` - Inizializza contatori a zero

===== Metodi
- `update(event_type: str, data: Dict[str, Any]) -> None` - Aggiorna metriche in base al tipo evento
- `get_metrics() -> Dict[str, int]` - Restituisce copia delle metriche attuali
- `reset_metrics() -> None` - Resetta tutti i contatori

==== PerformanceObserver
#image("../assets/immagini/performanceobserver.png")

===== Attributi
- `processing_times: List[float]` - Lista dei tempi di elaborazione
- `start_times: Dict[str, float]` - Dizionario con timestamp di inizio per evento

===== Costruttori
- `__init__()` - Inizializza liste vuote

===== Metodi
- `update(event_type: str, data: Dict[str, Any]) -> None` - Traccia tempi di inizio/fine elaborazione
- `get_avg_processing_time() -> float` - Calcola tempo medio di elaborazione
- `get_latest_processing_times(count: int) -> List[float]` - Restituisce ultimi N tempi

==== DatabaseConnections
#image("../assets/immagini/databaseconnections.png")

===== Attributi
- `_instance: Optional[DatabaseConnections]` - Istanza singleton
- `_pg_pool: asyncpg.Pool` - Pool#apice("G") connessioni PostgreSQL
- `_ch_client: CHClient` - Client ClickHouse
- `_http_client: httpx.AsyncClient` - Client HTTP asincrono
- `_loop: asyncio.EventLoop` - Event loop asincrono
- `_message_cache: Dict` - Cache messaggi in-memory
- `_initialized: bool` - Flag inizializzazione
- `_metrics_observer: MetricsObserver` - Observer per metriche
- `_performance_observer: PerformanceObserver` - Observer per performance

===== Costruttori
- `__new__() -> DatabaseConnections` - Implementa pattern Singleton
- `__init__()` - Inizializza connessioni e observer

===== Metodi
- `loop() -> EventLoop` - Ottiene o crea event loop
- `get_pg_pool() -> asyncpg.Pool` - Ottiene pool PostgreSQL (lazy init)
- `get_ch_client() -> CHClient` - Ottiene client ClickHouse (lazy init)
- `get_http_client() -> httpx.AsyncClient` - Ottiene client HTTP (lazy init)
- `get_cache_key(user_id: int, shop_id: int) -> str` - Genera chiave cache
- `get_cached_message(user_id: int, shop_id: int) -> Optional[str]` - Recupera messaggio da cache
- `cache_message(user_id: int, shop_id: int, message: str) -> None` - Salva messaggio in cache
- `get_metrics() -> Dict[str, Any]` - Ottiene metriche da observer
- `close()` - Chiude tutte le connessioni

== Utilità

Questa sezione rappresenta le classi di supporto e utility del sistema.

=== Struttura delle classi

==== Utilità Database
Funzioni helper per gestione database:
- `wait_for_clickhouse_database(client: Client, db_name: str, timeout: int, max_retries: int) -> bool` - Attende disponibilità database ClickHouse
- `wait_for_broker(host: str, port: int, timeout: int) -> None` - Attende disponibilità broker Kafka

==== Configurazione Logging
Funzioni per configurazione sistema di logging:
- `setup_logging(log_level: Optional[str])` - Configura logging#apice("G") con formato JSON o text

==== Metriche FastAPI
Utilità per integrazione metriche Prometheus:
- `setup_metrics(app: FastAPI, app_name: Optional[str]) -> None` - Configura instrumentazione Prometheus per FastAPI

==== Operatori Pipeline
Funzioni per elaborazione stream dati Bytewax:
- `parse_kafka_message(kafka_msg: KafkaSourceMessage) -> Tuple[str, Dict[str, Any]]` - Parsa messaggi Kafka
- `validate_message(parsed_data: Tuple[str, Dict[str, Any]]) -> bool` - Valida messaggi parsati
- `enrich_with_nearest_shop(item: Tuple[str, Dict]) -> List[Tuple[str, Dict]]` - Arricchisce con negozio più vicino
- `check_proximity_and_generate_message(item: Tuple[str, Dict]) -> List[Tuple[str, Dict]]` - Genera messaggio se in prossimità
- `write_to_clickhouse(item: Tuple[str, Dict]) -> None` - Scrive evento in ClickHouse

== Design Patterns

=== Introduzione

Il progetto NearYou implementa un sistema complesso di raccomandazioni geo-localizzate che utilizza diversi design patterns per garantire modularità, estensibilità e manutenibilità del codice. L'architettura del sistema sfrutta quattro principali design patterns:

- *Singleton Pattern*#apice("G"): Per la gestione centralizzata di configurazioni e connessioni
- *Factory Pattern*#apice("G"): Per la creazione flessibile di cache e strategie
- *Strategy Pattern*: Per algoritmi intercambiabili di generazione offerte
- *Observer Pattern*#apice("G"): Per il monitoraggio real-time del sistema

Questi patterns lavorano insieme per fornire un'architettura robusta e scalabile per un sistema di streaming real-time che processa eventi GPS, genera raccomandazioni personalizzate e monitora le performance del sistema.

=== Singleton Pattern

==== Panoramica

Il Singleton Pattern è implementato in tre componenti chiave del sistema per garantire che esistano singole istanze condivise di risorse critiche:

1. `ConfigurationManager`: Gestione centralizzata della configurazione
2. `CacheManager`: Gestione unificata del sistema di cache  
3. `DatabaseConnections`: Gestione delle connessioni ai database

==== ConfigurationManager

===== Implementazione

#code-block[
```python
class ConfigurationManager:
    """
    Singleton pattern implementation for configuration management.
    Ensures that only one configuration instance exists throughout the application.
    """
    _instance: Optional['ConfigurationManager'] = None
    _initialized = False
    
    def __new__(cls) -> 'ConfigurationManager':
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
    
    def __init__(self):
        # Prevent re-initialization
        if ConfigurationManager._initialized:
            return
        
        ConfigurationManager._initialized = True
        
        # Initialize all configuration values
        self._load_environment_config()
        
        # Validate critical configs in production/staging
        if self.environment in ["production", "staging"]:
            self.validate_critical_configs()
```
]

===== Caratteristiche Avanzate

#pattern-box("Meccanismo di Implementazione")[
- *Thread-Safety*: Implementazione thread-safe attraverso l'override del metodo `__new__`
- *Lazy Initialization*#apice("G"): La configurazione viene caricata solo al primo accesso
- *Prevenzione Re-inizializzazione*: Flag `_initialized` impedisce multiple inizializzazioni
- *Validazione Ambiente*: Controlli specifici per ambienti production/staging
]

===== Vantaggi Architetturali

- *Consistenza Globale*: Tutti i componenti accedono alla stessa configurazione
- *Performance*: Elimina la necessità di rilegger e file di configurazione
- *Memory Efficiency*: Una sola istanza in memoria per tutta l'applicazione
- *Centralizzazione*: Punto unico di accesso per tutte le configurazioni

==== CacheManager

===== Implementazione

#code-block[
```python
class CacheManager:
    """
    Singleton pattern implementation for cache management.
    Ensures single cache instance throughout the application.
    """
    _instance: Optional['CacheManager'] = None
    _cache: Optional[CacheInterface] = None
    
    def __new__(cls) -> 'CacheManager':
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
    
    def initialize(self, cache_type: str = "auto", **config) -> None:
        """Initialize cache with given configuration."""
        if self._cache is None:
            self._cache = CacheFactory.create_cache(cache_type, **config)
            logger.info(f"Cache manager initialized with {type(self._cache).__name__}")
    
    def get_cache(self) -> CacheInterface:
        """Get the cache instance."""
        if self._cache is None:
            raise RuntimeError("Cache not initialized. Call initialize() first.")
        return self._cache
```
]

===== Integrazione con Factory Pattern

Il `CacheManager` utilizza il `CacheFactory` per creare l'istanza di cache appropriata, dimostrando come i design patterns scelti possano collaborare efficacemente:

#code-block[
```python
# Utilizzo integrato
cache_manager = CacheManager()  # Singleton
cache_manager.initialize("auto", **config)  # Factory Pattern
cache = cache_manager.get_cache()  # Accesso unificato
```]

==== DatabaseConnections

===== Implementazione con Observer Pattern

#code-block[
```python
class DatabaseConnections(Subject):
    """
    Singleton pattern for database connections management.
    Also implements Subject for Observer pattern.
    """
    _instance: Optional['DatabaseConnections'] = None
    
    def __new__(cls) -> 'DatabaseConnections':
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            # Initialize Subject
            super(DatabaseConnections, cls._instance).__init__()
            # Initialize default observers
            cls._instance._setup_default_observers()
        return cls._instance
```]

Questa implementazione combina Singleton e Observer patterns, permettendo monitoring centralizzato delle operazioni database.

// TODO qui ok


=== Factory Pattern

==== Panoramica

Il Factory Pattern è implementato principalmente attraverso due factory classes:

1. `CacheFactory`: Creazione di istanze cache (Redis/Memory/Auto)
2. `OfferStrategyFactory`: Creazione di strategie di generazione offerte

==== CacheFactory

===== Implementazione Completa

#code-block[
```python
class CacheFactory:
    """
    Factory pattern implementation for cache creation.
    Creates appropriate cache instances based on configuration.
    """
    
    @staticmethod
    def create_cache(cache_type: str = "auto", **config) -> CacheInterface:
        """Create cache instance based on type and configuration."""
        if cache_type == "memory":
            return CacheFactory._create_memory_cache(**config)
        elif cache_type == "redis":
            return CacheFactory._create_redis_cache(**config)
        elif cache_type == "auto":
            return CacheFactory._create_auto_cache(**config)
        else:
            raise ValueError(f"Unknown cache type: {cache_type}")
    
    @staticmethod
    def _create_auto_cache(**config) -> CacheInterface:
        """Automatically choose cache type based on availability."""
        try:
            redis_cache = CacheFactory._create_redis_cache(**config)
            # Test connection
            redis_cache.set("__test__", "connection_test", ttl=1)
            redis_cache.delete("__test__")
            logger.info("Auto-selected RedisCache (connection successful)")
            return redis_cache
        except Exception as e:
            logger.warning(f"Redis not available ({e}), falling back to MemoryCache")
            return CacheFactory._create_memory_cache(**config)
```
]

===== Caratteristiche Avanzate

#pattern-box("Modalità Auto-Selection")[
La modalità "auto" del `CacheFactory` implementa un meccanismo intelligente di fallback#apice("G"):

1. *Tentativo Redis*: Prova prima a creare e testare una connessione Redis
2. *Test Connessione*: Esegue operazioni di test per verificare la disponibilità
3. *Fallback Automatico*: In caso di errore, usa automaticamente MemoryCache
4. *Logging Intelligente*: Registra le decisioni per debugging e monitoring
]

==== OfferStrategyFactory

===== Implementazione

#code-block[
```python
class OfferStrategyFactory:
    """Factory for creating different offer generation strategies."""
    
    @staticmethod
    def create_strategy(strategy_type: str) -> OfferGenerationStrategy:
        """Create strategy instance based on type."""
        strategy_map = {
            "standard": StandardOfferStrategy,
            "aggressive": AggressiveOfferStrategy,
            "conservative": ConservativeOfferStrategy
        }
        
        strategy_class = strategy_map.get(strategy_type.lower())
        if not strategy_class:
            available = list(strategy_map.keys())
            raise ValueError(f"Unknown strategy type: {strategy_type}. Available: {available}")
        
        return strategy_class()
```
]

===== Estensibilità

Il design permette facile aggiunta di nuove strategie:

#code-block[
```python
# Aggiungere una nuova strategia
class PremiumOfferStrategy(OfferGenerationStrategy):
    # Implementazione strategia premium...
    pass

# Registrazione nella factory
strategy_map["premium"] = PremiumOfferStrategy
```]

=== Strategy Pattern

==== Panoramica

Il Strategy Pattern è implementato per la generazione delle offerte commerciali, permettendo algoritmi intercambiabili per diverse strategie di business.

==== Architettura delle Strategie

===== Interfaccia Base

#code-block[
```python
class OfferGenerationStrategy(ABC):
    """Abstract base class for offer generation strategies."""
    
    @abstractmethod
    def generate_offers(self, shop_id: int, shop_name: str, category: str) -> List[Offer]:
        """Generate offers for a specific shop."""
        pass
    
    @abstractmethod
    def should_generate_offers(self, category: str) -> bool:
        """Determine if offers should be generated for this category."""
        pass
```
]

==== Implementazioni Concrete

===== StandardOfferStrategy

#pattern-box("Strategia Bilanciata")[
- *Sconti*: 5-25% (bilanciato)
- *Durata*: 3-14 giorni (media durata)
- *Probabilità Generazione*: Basata su configurazione categoria
- *Targeting*: Età casuale (30% probabilità)
]

#code-block[
```python
class StandardOfferStrategy(OfferGenerationStrategy):
    """Standard offer generation strategy with randomized parameters."""
    
    def should_generate_offers(self, category: str) -> bool:
        probability = CATEGORY_OFFER_PROBABILITY.get(category.lower(), 0.5)
        should_generate = random.random() <= probability
        return should_generate
    
    def generate_offers(self, shop_id: int, shop_name: str, category: str) -> List[Offer]:
        if not self.should_generate_offers(category):
            return []
        
        num_offers = random.randint(MIN_OFFERS_PER_SHOP, MAX_OFFERS_PER_SHOP)
        offers = []
        
        for i in range(num_offers):
            offer = self._create_standard_offer(shop_id, shop_name, category)
            if offer:
                offers.append(offer)
        
        return offers
```
]

===== AggressiveOfferStrategy

#pattern-box("Strategia Aggressiva")[
- *Sconti*: 15-50% (sconti elevati)
- *Durata*: 1-7 giorni (breve durata, urgenza)
- *Probabilità Generazione*: Sempre genera (100%)
- *Caratteristiche*: Massimizza conversioni immediate
]

#code-block[
```python
class AggressiveOfferStrategy(OfferGenerationStrategy):
    """Aggressive strategy with high discounts and short duration."""
    
    def should_generate_offers(self, category: str) -> bool:
        return True  # Always generate offers in aggressive mode
    
    def _get_aggressive_discount_range(self, category: str) -> Tuple[int, int]:
        """Get higher discount ranges for aggressive strategy."""
        base_range = CATEGORY_DISCOUNT_RANGES.get(category.lower(), DEFAULT_DISCOUNT_RANGE)
        # Boost discounts by 10-25 percentage points
        min_discount = min(50, max(15, base_range[0] + 10))
        max_discount = min(50, base_range[1] + 25)
        return (min_discount, max_discount)
```
]

// ===== ConservativeOfferStrategy

// #pattern-box("Strategia Conservativa")[
// - *Sconti*: 3-15% (sconti ridotti)
// - *Durata*: 7-30 giorni (lunga durata)
// - *Probabilità Generazione*: Ridotta (30% della standard)
// - *Caratteristiche*: Preserva margini, costruisce loyalty
// ]

==== Utilizzo Runtime

===== Switching Dinamico

#code-block[
```python
class OffersService:
    """Service for managing offers with strategy pattern."""
    
    def __init__(self, postgres_config: Dict[str, Any], strategy_type: str = "standard"):
        self.postgres_config = postgres_config
        self.strategy = OfferStrategyFactory.create_strategy(strategy_type)
    
    def set_strategy(self, strategy: OfferGenerationStrategy) -> None:
        """Change strategy at runtime."""
        self.strategy = strategy
        logger.info(f"Strategy changed to: {type(strategy).__name__}")
    
    def generate_shop_offers(self, shop_id: int, shop_name: str, category: str) -> List[Offer]:
        """Generate offers using current strategy."""
        return self.strategy.generate_offers(shop_id, shop_name, category)
```]

=== Observer Pattern

==== Panoramica

Il Observer Pattern è implementato per monitorare eventi del sistema in tempo reale, permettendo raccolta di metriche e monitoring delle performance.

==== Architettura Observer

===== Subject Base

#code-block[
```python
class Subject(ABC):
    """Abstract subject that observers can subscribe to."""
    
    def __init__(self):
        self._observers: List[Observer] = []
    
    def attach(self, observer: Observer) -> None:
        """Attach an observer."""
        if observer not in self._observers:
            self._observers.append(observer)
            logger.debug(f"Attached observer: {type(observer).__name__}")
    
    def detach(self, observer: Observer) -> None:
        """Detach an observer."""
        if observer in self._observers:
            self._observers.remove(observer)
            logger.debug(f"Detached observer: {type(observer).__name__}")
    
    def notify(self, event_type: str, data: Dict[str, Any]) -> None:
        """Notify all observers."""
        for observer in self._observers:
            try:
                observer.update(event_type, data)
            except Exception as e:
                logger.error(f"Error notifying observer {type(observer).__name__}: {e}")
```
]

==== Implementazioni Observer

===== MetricsObserver

#pattern-box("Raccolta Metriche Operative")[
Monitora eventi operativi del sistema:
- Eventi processati
- Messaggi generati  
- Visite simulate
- Errori di sistema
- Cache hits/misses
- Negozi trovati
]

#code-block[
```python
class MetricsObserver(Observer):
    """Observer for collecting metrics."""
    
    def __init__(self):
        self.metrics = {
            "events_processed": 0,
            "messages_generated": 0,
            "visits_simulated": 0,
            "errors": 0,
            "shops_found": 0,
            "cache_hits": 0,
            "cache_misses": 0
        }
    
    def update(self, event_type: str, data: Dict[str, Any]) -> None:
        """Update metrics based on event."""
        if event_type == "event_processed":
            self.metrics["events_processed"] += 1
        elif event_type == "message_generated":
            self.metrics["messages_generated"] += 1
        elif event_type == "visit_simulated":
            self.metrics["visits_simulated"] += 1
        # ... altri eventi
    
    def get_metrics(self) -> Dict[str, int]:
        """Get current metrics snapshot."""
        return self.metrics.copy()
```
]

===== PerformanceObserver

#pattern-box("Monitoring Performance")[
Traccia performance del sistema:
- Tempi di processing eventi
- Latenza operazioni database
- Throughput del sistema
- Analisi trend temporali
]

#code-block[
```python
class PerformanceObserver(Observer):
    """Observer for monitoring performance metrics."""
    
    def __init__(self):
        self.processing_times = []
        self.active_processes = {}
    
    def update(self, event_type: str, data: Dict[str, Any]) -> None:
        """Track processing performance."""
        if event_type == "processing_start":
            event_id = data.get("event_id")
            if event_id:
                self.active_processes[event_id] = time.time()
        
        elif event_type == "processing_end":
            event_id = data.get("event_id")
            if event_id and event_id in self.active_processes:
                start_time = self.active_processes.pop(event_id)
                duration = time.time() - start_time
                self.processing_times.append(duration)
                
                # Keep only last 1000 measurements
                if len(self.processing_times) > 1000:
                    self.processing_times = self.processing_times[-1000:]
```
]

==== DatabaseConnections come Subject

===== Implementazione Integrata

#code-block[
```python
class DatabaseConnections(Subject):
    """Database connections manager that also acts as event subject."""
    
    def __init__(self):
        super().__init__()
        self._setup_default_observers()
    
    def _setup_default_observers(self):
        """Setup default system observers."""
        self.metrics_observer = MetricsObserver()
        self.performance_observer = PerformanceObserver()
        
        self.attach(self.metrics_observer)
        self.attach(self.performance_observer)
        
        logger.info("Default observers attached to DatabaseConnections")
    
    def get_metrics(self) -> Dict[str, Any]:
        """Get comprehensive system metrics."""
        return {
            "metrics": self.metrics_observer.get_metrics(),
            "performance": {
                "avg_processing_time": self.performance_observer.get_avg_processing_time(),
                "total_measurements": len(self.performance_observer.processing_times)
            }
        }
```
]

// #set page(margin: 1cm, orientation: "landscape")
#set text(size: 9pt)

#align(center)[
  == Tabella dei Requisiti - Stato di Implementazione
]

#table(
  columns: 3,
  align: (left, left, center),
  stroke: 0.5pt,
  table.header([*ID*], [*Descrizione*], [*Stato*]),
  
  // === REQUISITI FUNZIONALI ===
  table.cell(colspan: 3, fill: gray.lighten(80%))[*REQUISITI FUNZIONALI*],
  
  // RF1 - Autenticazione e autorizzazione
  [RF1.1], [Il sistema deve supportare autenticazione JWT#apice("G") con username/password via endpoint `/api/token`], [Soddisfatto],
  [RF1.2], [I token#apice("G") devono avere scadenza configurabile tramite `JWT_EXPIRATION_S` (default 1 ora)], [Soddisfatto],
  [RF1.3], [Le credenziali devono essere validate contro database ClickHouse con hash#apice("G") sicuri], [Soddisfatto],
  [RF1.4], [Il sistema deve supportare logout con invalidazione sessione client-side], [Soddisfatto],
  [RF1.5], [WebSocket deve autenticare via token JWT per connessioni real-time], [Soddisfatto],
  
  // RF2 - Tracking posizione e generazione eventi
  [RF2.1], [Il sistema deve simulare movimenti utenti con `producer.py` su percorsi Milano OSRM], [Soddisfatto],
  [RF2.2], [Gli eventi GPS devono essere prodotti in Kafka topic `gps_stream` con SSL], [Soddisfatto],
  [RF2.3], [I percorsi devono essere calcolati usando OSRM self-hosted con profilo cycling], [Soddisfatto],
  [RF2.4], [Gli eventi devono contenere: user_id, latitude, longitude, timestamp, poi_info], [Soddisfatto],
  [RF2.5], [Il producer deve supportare readiness checks per Kafka, ClickHouse e OSRM], [Soddisfatto],
  
  // RF3 - Elaborazione stream e proximity detection
  [RF3.1], [Il sistema deve processare eventi GPS via Bytewax dataflow con Observer pattern], [Soddisfatto],
  [RF3.2], [Deve calcolare distanza usando query PostGIS `ST_DWithin` per soglia 200m], [Soddisfatto],
  [RF3.3], [Deve implementare ConnectionManager singleton per pooling database], [Soddisfatto],
  [RF3.4], [Deve prevenire messaggi duplicati con cache visit tracking], [Soddisfatto],
  [RF3.5], [Deve supportare metriche real-time con PerformanceObserver], [Soddisfatto],
  
  // RF4 - Generazione messaggi personalizzati e sistema offerte
  [RF4.1], [Il sistema deve generare messaggi via HTTP service `/generate-message`], [Soddisfatto],
  [RF4.2], [Deve supportare provider LLM configurabili (Groq/OpenAI) via `LLM_PROVIDER`], [Soddisfatto],
  [RF4.3], [Deve implementare cache Redis per messaggi con TTL configurabile], [Soddisfatto],
  [RF4.4], [Deve gestire offerte con Strategy Pattern (Standard/Aggressive/Conservative)], [Soddisfatto],
  [RF4.5], [Deve supportare Builder Pattern per creazione offerte complesse], [Soddisfatto],
  [RF4.6], [Factory Pattern deve creare offerte tipizzate (Flash/Student/Senior/Category)], [Soddisfatto],
  [RF4.7], [Validation Strategy deve validare vincoli offerte (età, interessi, date)], [Soddisfatto],
  
  // RF5 - Dashboard utente base
  [RF5.1], [Deve servire interfaccia web tramite `/dashboard/user` con static files], [Soddisfatto],
  [RF5.2], [Deve implementare mappa Leaflet con marker categorizzati per shop types], [Soddisfatto],
  [RF5.3], [Deve visualizzare percorso utente come polyline con history], [Soddisfatto],
  [RF5.4], [Deve supportare filtri categoria con mapping predefinito], [Soddisfatto],
  [RF5.5], [Deve implementare fallback WebSocket→HTTP polling automatico], [Soddisfatto],
  
  // RF6 - Storage e persistenza dati
  [RF6.1], [Deve memorizzare eventi in ClickHouse tabelle `user_events` e `user_visits`], [Soddisfatto],
  [RF6.2], [Deve gestire shop data in PostgreSQL/PostGIS con indici spaziali], [Soddisfatto],
  [RF6.3], [Deve mantenere profili utenti in ClickHouse tabella `users`], [Soddisfatto],
  [RF6.4], [Deve tracciare storico visite con vista materializzata `mv_daily_shop_stats`], [Soddisfatto],
  [RF6.5], [Deve supportare offers storage in PostgreSQL con vincoli temporali], [Soddisfatto],
  
  // RF7 - Cache e ottimizzazione base
  [RF7.1], [Deve implementare Redis cache per messaggi LLM con serializzazione JSON], [Soddisfatto],
  [RF7.2], [Deve supportare Memory cache con LRU#apice("G") eviction come fallback], [Soddisfatto],
  [RF7.3], [Deve implementare TTL configurabile via `CACHE_TTL`], [Soddisfatto],
  [RF7.4], [Deve fornire cache statistics e hit rate monitoring], [Soddisfatto],
  
  // // === REQUISITI NON FUNZIONALI ===
  // table.cell(colspan: 3, fill: gray.lighten(80%))[*REQUISITI NON FUNZIONALI (DI QUALITÀ)*],
  
  // // RNF1 - Documentazione
  // [RNF1.1], [Rispetto delle metriche definite nel Piano di Qualifica (v2.0.0)], [Soddisfatto],
  // [RNF1.2], [Rispetto delle norme definite nelle Norme di Progetto (v2.0.0)], [Soddisfatto],
  // [RNF1.3], [Stesura di un documento Manuale Utente per la corretta comprensione dell'utilizzo del sistema], [Soddisfatto],
  
  // // RNF2 - Test
  // [RNF2.1], [Superamento dei test d'unità atti a testimoniare il buon funzionamento del sistema e delle sue componenti], [Soddisfatto],
  // [RNF2.2], [Superamento dei test d'integrazione che garantiscano una corretta collaborazione tra i vari componenti di sistema], [Soddisfatto],
  
  // === REQUISITI FUNZIONALI DESIDERABILI ===
  table.cell(colspan: 3, fill: gray.lighten(80%))[*REQUISITI FUNZIONALI DESIDERABILI*],
  
  // RFD1 - Ottimizzazioni frontend avanzate
  [RFD1.1], [Il sistema dovrebbe implementare lazy loading notifiche con IntersectionObserver#apice("G")], [Soddisfatto],
  [RFD1.2], [Dovrebbe supportare tema scuro/chiaro configurabile dall'utente con localStorage#apice("G")], [Soddisfatto],
  [RFD1.3], [Dovrebbe fornire local cache frontend per shop areas e notifications], [Soddisfatto],
  [RFD1.4], [Dovrebbe limitare e ottimizzare rendering markers (max 100 shops)], [Soddisfatto],
  [RFD1.5], [Dovrebbe implementare design responsivo#apice("G") con breakpoint mobile], [Soddisfatto],
  
  // RFD2 - Monitoring e osservabilità avanzate
  [RFD2.1], [Il sistema dovrebbe esporre analisi Prometheus tramite FastAPI instrumentator#apice("G")], [Soddisfatto],
  [RFD2.2], [Dovrebbe implementare dashboard Grafana con pannelli assemblati dinamicamente], [Soddisfatto],
  [RFD2.3], [Dovrebbe supportare logging strutturato con livelli configurabili], [Soddisfatto],
  [RFD2.4], [Dovrebbe includere exporters per database e servizi (Postgres, Redis, ClickHouse)], [Soddisfatto],
  [RFD2.5], [Dovrebbe supportare Loki/Promtail per log aggregation#apice("G")], [Soddisfatto],
  [RFD2.6], [Dovrebbe implementare cAdvisor#apice("G") per container monitoring], [Soddisfatto],
  
  // RFD3 - Funzionalità utente avanzate
  [RFD3.1], [Il sistema dovrebbe supportare statistiche utente dettagliate per periodi configurabili], [Soddisfatto],
  [RFD3.2], [Dovrebbe implementare paginazione#apice("G") avanzata per notifiche e promozioni], [Soddisfatto],
  [RFD3.3], [Dovrebbe fornire filtri dinamici Grafana (età, professione, categoria, popolarità)], [Soddisfatto],
  [RFD3.4], [Dovrebbe supportare mappe interattive con route visualization#apice("G")], [Soddisfatto],
  [RFD3.5], [Dovrebbe implementare shop visit simulation con feedback realtime], [Soddisfatto],
  
  // RFD4 - Performance e scalabilità
  [RFD4.1], [Il sistema dovrebbe implementare connection pooling#apice("G") avanzato], [Soddisfatto],
  [RFD4.2], [Dovrebbe supportare cache distribuita con clustering#apice("G") Redis], [Soddisfatto],
  [RFD4.3], [Dovrebbe fornire push gateway#apice("G") per metriche batch], [Soddisfatto],
  [RFD4.4], [Dovrebbe implementare graceful degradation#apice("G") per service failures], [Soddisfatto],
  
  // === REQUISITI FUNZIONALI FACOLTATIVI ===
  table.cell(colspan: 3, fill: red.lighten(80%))[*REQUISITI FUNZIONALI FACOLTATIVI*],
  
  // RFF1 - Integrazioni esterne
  [RFF1.1], [Il sistema potrebbe integrare API#apice("G") meteo per context-aware messaging], [Non Implementato],
  [RFF1.2], [Potrebbe supportare payment integration per offer redemption], [Non Implementato],
  
  // RFF2 - AI/ML Enhancement
  [RFF2.1], [Potrebbe utilizzare reinforcement learning#apice("G") per offer optimization], [Non Implementato],
  
  // RFF3 - Business Intelligence avanzato
  [RFF3.1], [Potrebbe supportare A/B testing#apice("G") per offer strategies], [Non Implementato],
)

#align(center)[
  #text(size: 8pt, style: "italic")[
    Totale requisiti: 72 \ 
    Soddisfatti: 68 \ 
    Non implementati: 4 (solo requisiti facoltativi)
  ]
]