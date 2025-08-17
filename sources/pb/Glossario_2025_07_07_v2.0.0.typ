#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Glossario",
  subtitle: "Raccolta di termini e definizioni",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Nicolò Bovo",
      "Redattori", "Alessandro Di Pasquale",
      "", "Elia Leonetti",
      "Verificatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Manuel Cinnirella",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-07-07",
  version: "2.0.0",
  version_history: (
    "2.0.0", "2025-08-15", "Aggiornamento termini", "Alessandro Di Pasquale, Nicolò Bovo",

    "1.0.0", "2025-07-07", "Ricerca dei termini e stesura finale", "Alessandro Di Pasquale, Elia Leonetti",
    
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

// Rimuove numerazione superflua
#set heading(numbering: (..nums) => {
  let level = nums.pos().len()
  let pattern = if level == 1 {
  } else if level == 2 {
    "1."
  }
  if pattern != none {
    numbering(pattern, nums.pos().last())
  }
})

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Introduzione
Con il presente documento si intende fornire un punto di riferimento per tutti i termini tecnici o specifici che, adoperati nei documenti svolti dal gruppo, potrebbero far sorgere incomprensioni o perplessità a chi dovrà poi usufruirne.

#pagebreak()
= A

== A/B testing
Test comparativo tra due versioni per valutare quale performi meglio.

== Advertising Contestuale
Pubblicità personalizzata basata sul contesto attuale dell'utente, inclusa posizione geografica e interessi.

== AI generativa
Tipo di intelligenza artificiale capace di creare nuovi contenuti (testo, immagini, audio) basandosi su pattern appresi dai dati di training.

== AI/ML (Artificial Intelligence/Machine Learning)
Tecnologie di intelligenza artificiale e apprendimento automatico per l'analisi predittiva e l'automazione.

== Airflow
Piattaforma open-source per sviluppare, schedulare e monitorare flussi di lavoro (pipeline) complessi, utilizzata per l'orchestrazione di processi ETL.

== AlphaCode
Nome del gruppo di studenti responsabile dello sviluppo del progetto NearYou presso l'Università degli Studi di Padova.

== Amministratore
L'amministratore sarà adibito alla corretta configurazione delle infrastrutture e degli ambienti di sviluppo in cui i membri del gruppo avranno modo di lavorare. Vi sarà bisogno di questa figura sin dal principio ed in misura considerevole ma, seppur saltuariamente, dovrà poi fungere da manutentore degli strumenti già messi a disposizione così come dell'aggiunta di nuovi sistemi qualora necessari.

== Analista
Il ruolo dell'analista si impegna significativamente ad inizio progetto, occupandosi di definire le funzionalità ed i requisiti specifici per soddisfare al meglio le necessità del cliente. Successivamente questa figura coprirà un ruolo sempre più marginale dato che sarà meno necessario definire nuovi requisiti.

== Analytics
Processo di analisi sistematica di dati per estrarre informazioni utili e supportare decisioni strategiche.

== API (Application Programming Interface)
Interfaccia che permette la comunicazione tra diverse componenti software attraverso un insieme definito di protocolli e strumenti.

== Apache Airflow
Piattaforma per l'orchestrazione di workflow e gestione di pipeline di dati complesse.

== Apache Kafka
Piattaforma distribuita di streaming eventi per la gestione di flussi di dati in tempo reale.

= B

== Baseline
Versione stabile e consolidata del sistema che serve come punto di riferimento per sviluppi futuri senza regressioni.

== Best Practice
Insieme di pratiche e procedure ritenute corrette, e più efficienti, al fine di conseguire il risultato previsto.

== Bottom-up
Approccio di sviluppo che inizia dai moduli di basso livello e procede verso quelli di alto livello architetturale.

== Branch Coverage
Metrica che misura la percentuale di rami decisionali del codice (if/else, switch) eseguiti durante i test.

== Browser
Applicazione software per navigare sul web, come Chrome, Firefox o Safari.

== Builder Pattern
Pattern creazionale che separa la costruzione di oggetti complessi dalla loro rappresentazione.

== BV (Budget Variance)
Scostamento del budget calcolato come differenza tra PV e AC, che indica se si sta spendendo più o meno del previsto.

== Bytewax
Framework Python per stream processing che consente l'elaborazione di dati in tempo reale con pipeline dichiarative.

= C

== Cache
Memoria temporanea veloce utilizzata per ottimizzare l'accesso ai dati frequentemente richiesti.

== Chrome/Chromium
Browser web sviluppato da Google, basato sul motore di rendering Blink.

== ClickHouse 
Database colonnare ad alte prestazioni ottimizzato per analisi OLAP e query su grandi volumi di dati.

== Code Coverage
Metrica che misura la percentuale di codice sorgente eseguita durante l'esecuzione dei test automatizzati.

== Code Smell
Indicatori nel codice sorgente che suggeriscono problemi di design o implementazione che potrebbero richiedere refactoring.

== Commit
L'operazione che registra in modo permanente le modifiche nel repository.

== Consumer
Componente software che riceve e processa messaggi da un message broker come Kafka.

== Clustering
Raggruppamento di nodi o dati simili per ottimizzare performance e gestione delle risorse.

== CPI (Cost Performance Index)
Indice di efficienza dei costi, calcolato come rapporto tra EV e AC, che indica quanto valore si ottiene per ogni unità di costo spesa.

== CSS (Cascading Style Sheets)
Linguaggio di stile utilizzato per definire la presentazione e il layout di documenti HTML e web.

== Cyclomatic Complexity
Metrica che misura la complessità del codice calcolando il numero di cammini linearmente indipendenti attraverso il grafo di controllo.

= D

== DAG (Directed Acyclic Graph)
Grafo orientato aciclico utilizzato per rappresentare workflow e dipendenze tra task in sistemi di orchestrazione.

== Dashboard
Interfaccia grafica che presenta informazioni e metriche chiave in modo visuale e facilmente comprensibile.

== Deliverable
Con deliverable s'intende qualsiasi oggetto (ad esempio software o documentazione), tangibile o intangibile, che sia prodotto con lo scopo di essere fornito ad una figura terza.

== Deployment
Processo di distribuzione e installazione di software in ambiente di produzione.

== Diario di Bordo
Documento periodico che registra l'avanzamento del progetto, le decisioni prese e le riflessioni del team durante lo sviluppo.

== Docker
Piattaforma di containerizzazione che permette di impacchettare applicazioni e le loro dipendenze in contenitori leggeri e portabili.

== Docker Compose
Strumento per definire e gestire applicazioni multi-container Docker attraverso file di configurazione YAML.

== Driver
Componente software temporaneo che simula il comportamento di moduli chiamanti durante i test di unità.

= E

== EAC (Estimated at Completion)
Stima del costo totale finale del progetto basata sull'andamento attuale delle performance.

== EPSG (European Petroleum Survey Group)
Sistema di codici per identificare sistemi di riferimento spaziale e coordinate geografiche.

== ES6 (ECMAScript 2015)
Versione moderna di JavaScript che introduce nuove funzionalità come arrow functions, classi e moduli.

== ETC (Estimate to Completion)
Stima del costo necessario per completare il lavoro rimanente del progetto.

== ETL (Extract, Transform, Load)
Processo di estrazione, trasformazione e caricamento di dati da diverse sorgenti verso un sistema di destinazione.

== EV (Earned Value)
Valore del lavoro effettivamente completato fino a una data specifica, misurato in termini monetari secondo la pianificazione del budget.

= F

== Factory Pattern
Pattern creazionale che fornisce un'interfaccia per creare oggetti senza specificare la loro classe concreta.

== Failure Density
Metrica che misura il numero di difetti per unità di dimensione del software (tipicamente per linee di codice).

== Fallback
Meccanismo di riserva attivato quando il sistema principale non è disponibile o fallisce.

== FastAPI
Framework web moderno e veloce per costruire API con Python, caratterizzato da alta performance e generazione automatica di documentazione.

== Fetch API
API nativa del browser per effettuare richieste HTTP asincrone in JavaScript.

== Filtering
Processo di selezione e filtraggio di dati basato su criteri specifici come età, interessi o posizione geografica.

== Firefox
Browser web open-source sviluppato dalla Mozilla Foundation.

== Flink
Framework per l'elaborazione distribuita di dati in tempo reale, ottimizzato per analisi a bassa latenza e gestione di stati complessi, ideale per applicazioni di streaming continuo e decisioni in tempo reale.

== Font Awesome
Libreria di icone web utilizzata per aggiungere icone scalabili ai siti web.

== Framework
Insieme di servizi e utilità, volte a fornire una baseline per lo sviluppo di prodotti software.

= G

== Generative AI
Fa riferimento a tutti i modelli di AI sviluppati ed addestrati al fine di generare contenuti di tipo testuale, audio, o immagine, a partire da un contestuale insieme di training.

== Gitpod
Ambiente di sviluppo integrato basato su cloud che fornisce workspace pronti all'uso direttamente dal browser.

== GPS
Sistema di posizionamento globale via satellite per determinare coordinate geografiche precise.

== GPX (GPS eXchange Format)
Formato XML standardizzato per lo scambio di dati GPS tra applicazioni e dispositivi.

== Graceful degradation
Capacità di un sistema di continuare a funzionare con funzionalità ridotte quando alcuni componenti falliscono.

== Grafana
Piattaforma open-source per la visualizzazione e il monitoraggio di metriche attraverso dashboard interattive.

== Grid/Flexbox
Sistemi di layout CSS per creare interfacce web responsive e flessibili.

== Groq
Piattaforma cloud che fornisce accesso a modelli linguistici ad alte prestazioni per applicazioni di intelligenza artificiale.

= H

== Hash
Funzione matematica che converte dati di lunghezza variabile in una stringa di lunghezza fissa.

== Hit rate
Percentuale di richieste soddisfatte dalla cache rispetto al totale delle richieste.

= I

== Incremento
Versione funzionante del software che aggiunge nuove funzionalità mantenendo quelle esistenti operative.

== Indice Gulpease
Formula per misurare la leggibilità di testi in lingua italiana, basata sulla lunghezza delle parole e delle frasi.

== Insights
Risultati analitici significativi derivati dall'elaborazione e analisi di dati.

== Inspection
Tecnica di revisione formale e strutturata del codice che segue procedure definite e utilizza checklist specifiche.

== IntersectionObserver API
API del browser per osservare cambiamenti nell'intersezione di elementi con il viewport, utilizzata per lazy loading.

== ISO/IEC 12207:1995
Standard internazionale che definisce i processi del ciclo di vita del software, dalla concezione al ritiro, fornendo un framework per lo sviluppo e la manutenzione del software.

== ISO/IEC 9126
Standard internazionale per la valutazione della qualità del software, che definisce caratteristiche come funzionalità, affidabilità, usabilità, efficienza, manutenibilità e portabilità.

= J

== JavaScript
Linguaggio di programmazione interpretato utilizzato principalmente per lo sviluppo web client-side.

== JSON (JavaScript Object Notation)
Formato di scambio dati leggero e leggibile dall'uomo, basato su sintassi JavaScript.

== JSON/Avro
Formati di serializzazione dati. JSON è un formato leggibile per lo scambio dati, mentre Avro è un sistema di serializzazione binaria ottimizzato per big data.

== JWT (JSON Web Token)
Standard per la trasmissione sicura di informazioni tra parti come token compatto e auto-contenuto.

= K

== Kafka
Piattaforma distribuita di streaming per la gestione di flussi di dati in tempo reale attraverso il pattern publisher-subscriber.

= L

== LangChain
Framework per sviluppare applicazioni basate su modelli di linguaggio, fornendo strumenti per catene di prompt e integrazione con fonti dati.

== Latenza
Tempo di risposta o ritardo nella trasmissione ed elaborazione di dati.

== Lazy loading
Tecnica di caricamento differito di contenuti che vengono caricati solo quando necessari.

== Leaflet
Libreria JavaScript open-source per creare mappe interattive su web e mobile.

== LLM (Large Language Model)
Modello di intelligenza artificiale addestrato su grandi dataset testuali per generare contenuti naturali.

== localStorage
API del browser per memorizzare dati persistenti nel browser dell'utente.

== Logging
Processo di registrazione sistematica di eventi, errori e informazioni di sistema per il monitoraggio.

== Logger
Modulo software responsabile della registrazione sistematica di eventi, errori e informazioni di debug per il monitoraggio delle applicazioni.

== Loki
Sistema di aggregazione di log scalabile ispirato a Prometheus, ottimizzato per l'analisi di log.

== LRU eviction
Algoritmo di cache che rimuove i dati utilizzati meno di recente quando la cache è piena.

= M

== Message Broker
Middleware che facilita la comunicazione asincrona tra diverse componenti di un sistema distribuito.

== Microservizi
Architettura software basata su servizi piccoli e indipendenti che comunicano attraverso API.

== Milestone
Nel ciclo di vita del progetto, le milestone rappresentano gli step previsti per giungere a completamento; definire delle milestone consente di quantificare il lavoro svolto e dare una misura del progresso.

== Modello Incrementale
Metodologia di sviluppo software che rilascia il prodotto in versioni successive, ognuna con funzionalità aggiuntive.

== Monitoring
Processo continuo di osservazione e misurazione delle prestazioni e dello stato di un sistema.

== MVP (Minimum Viable Product)
Versione minima del prodotto che include solo le funzionalità essenziali necessarie per soddisfare i requisiti obbligatori.

== Mutual TLS
Estensione del protocollo TLS che richiede l'autenticazione reciproca sia del client che del server tramite certificati digitali.

= N

== NearYou
Nome della piattaforma di advertising personalizzato in tempo reale che costituisce l'oggetto del progetto didattico.

= O

== Observer Pattern
Pattern comportamentale che definisce una dipendenza uno-a-molti tra oggetti per notificare cambiamenti di stato.

== OpenAI
Piattaforma di intelligenza artificiale che fornisce accesso a modelli linguistici avanzati tramite API.

== OpenStreetMap
Progetto di mappatura collaborativa che crea mappe geografiche libere e modificabili.

== Organizational project enabling
Insieme di processi volti ad allocare a ciascun task le risorse, umane o materiali, necessarie per ultimarlo.

== OSRM (Open Source Routing Machine)
Motore di routing ad alte prestazioni per il calcolo di percorsi basato su dati OpenStreetMap.

= P

== PB (Product Baseline)
Milestone che rappresenta la versione definitiva del prodotto software pronto per il rilascio.

== Piattaforma di advertising
Infrastruttura software finalizzata a fornire servizi di distribuzione e/o creazione di contenuti pubblicitari.

== Pipeline
Insieme di moduli che collaborano alla realizzazione di uno stesso prodotto finale, organizzati in modo tale che l'output di ciascun modulo diventi l'input del modulo successivo in catena.

== P.o.C. (Proof of Concept)
Prototipo che dimostra la fattibilità di un concetto o teoria con potenziale applicazione pratica.

== Paginazione
Tecnica di divisione di contenuti in pagine separate per migliorare performance e usabilità.

== Payment integration
Integrazione di sistemi di pagamento per processare transazioni finanziarie.

== Point of Interest (POI)
Località specifica identificata dalle coordinate geografiche che può essere utile o interessante per gli utenti.

== Polling
Tecnica di interrogazione periodica di un sistema per verificare cambiamenti o nuovi dati.

== Polyline
Linea composta da più segmenti connessi utilizzata per rappresentare percorsi o forme geometriche.

== Pooling
Tecnica di gestione condivisa di risorse per ottimizzare l'utilizzo e le performance.

== Popup
Finestra o elemento sovrapposto che appare sopra il contenuto principale dell'interfaccia.

== PostGIS
Estensione spaziale per PostgreSQL che aggiunge supporto per oggetti geografici e query geospaziali.

== PostgreSQL
Sistema di gestione di database relazionale open-source con supporto avanzato per tipi di dati e estensioni.

== Producer
Componente software che genera e invia messaggi a un message broker.

== Progettista
Opererà a partire dai requisiti identificati dall'analista per realizzare un design del software che si tradurrà in possibili metodologie per realizzare una soluzione alle esigenze da far implementare a chi funge da programmatore. Il progettista fornirà un contributo costante nello sviluppo del progetto a partire dalla sua definizione iniziale.

== Programmatore
Come anticipato, dovrà garantire una robusta transizione dall'architettura del progetto al software funzionante, mansione che richiede la dedizione temporale più elevata. Perché ciò sia possibile, chi ricopre questo ruolo deve essere provvisto delle competenze tecniche essenziali per lo sviluppo.

== Profilazione utente
La pratica di raccogliere informazioni sugli utenti, coerentemente con il dominio applicativo del prodotto, per poi identificarne interessi e abitudini e fornire a ciascuno un'esperienza parametrizzata sui dati raccolti.

== Project monitoring and control
Processo continuo di revisione e ricerca proattiva di soluzioni migliorative, che risponde alle necessità di tener traccia del progresso svolto, e di determinare processi e metodologie ottimali per il raggiungimento dei risultati richiesti.

== Project planning
Fase del ciclo di vita del progetto dove vengono delineati gli step necessari a raggiungere gli obiettivi fissati.

== Prometheus
Sistema di monitoring e alerting che raccoglie metriche da sistemi configurati, le memorizza e fornisce un linguaggio di query per l'analisi.

== Push gateway
Componente Prometheus per raccogliere metriche da job di breve durata.

== PV (Planned Value)
Valore del lavoro che dovrebbe essere stato completato secondo la pianificazione originale a una data specifica.

= Q

== Query Geospaziali
Interrogazioni di database che operano su dati geografici per analisi basate sulla posizione.

= R

== Real-time
Elaborazione di dati che avviene immediatamente o con latenza minima rispetto al momento di generazione.

== Redis
Database in-memory key-value utilizzato per caching e storage temporaneo ad alte prestazioni.

== Reinforcement learning
Tipo di apprendimento automatico dove un agente impara attraverso interazione e feedback.

== Responsabile
Il responsabile sarà colui che si dedicherà a determinare la direzione in cui il gruppo dovrà operare, tramite un'efficiente gestione delle risorse, una virtù fondamentale nelle prime fasi operative a cui il gruppo sarà dedito, ma che si rivelerà gradualmente meno cruciale grazie al crescente sviluppo dell'autonomia del gruppo nel tempo. Tale ruolo richiederà inoltre competenze comunicative tali da permettere una soddisfacente interazione sia con i membri del gruppo che con terzi.

== Responsive
Design che si adatta automaticamente a diverse dimensioni di schermo e dispositivi.

== REST API (Representational State Transfer Application Programming Interface)
Architettura per servizi web che utilizza il protocollo HTTP per permettere la comunicazione tra sistemi diversi.

== RSI (Requirements Stability Index)
Indice che misura la stabilità dei requisiti nel tempo, calcolando la percentuale di requisiti che rimangono invariati.

== RTB (Requirements and Technology Baseline)
Milestone che stabilisce requisiti consolidati e scelte tecnologiche definitive per il progetto.

= S

== Safari
Browser web sviluppato da Apple per dispositivi macOS e iOS.

== Scalabilità
Capacità di un sistema di gestire carichi di lavoro crescenti mantenendo le performance.

== Serializzazione
Processo di conversione di oggetti in un formato che può essere memorizzato o trasmesso.

== sessionStorage
API del browser per memorizzare dati temporanei validi solo per la sessione corrente.

== Sidebar
Barra laterale nell'interfaccia utente che contiene menu, controlli o informazioni aggiuntive.

== Singleton
Pattern di design che garantisce l'esistenza di una sola istanza di una classe.

== SSL/TLS (Secure Sockets Layer/Transport Layer Security)
Protocolli crittografici che garantiscono comunicazioni sicure su reti informatiche, utilizzati per cifrare i dati trasmessi.

== Statement Coverage
Metrica che misura la percentuale di istruzioni del codice sorgente eseguite durante i test.

== Strategy Pattern
Pattern comportamentale che definisce una famiglia di algoritmi intercambiabili.

== Stream Processing
Elaborazione continua e in tempo reale di flussi di dati non appena arrivano al sistema.

== Streaming
Elaborazione continua di flussi di dati in tempo reale.

== Stress test
Test che verificano il comportamento del sistema sotto condizioni di carico estremo.

== Stub
Componente software temporaneo che simula il comportamento di moduli chiamati durante i test, fornendo risposte predefinite.

== Superset
Piattaforma moderna di business intelligence che permette agli utenti di esplorare e visualizzare dati attraverso dashboard interattive.

== SV (Schedule Variance)
Scostamento temporale calcolato come differenza tra EV e PV, che indica se il progetto è in anticipo o in ritardo.

== Sync Lab
Azienda proponente del capitolato C4 che ha commissionato lo sviluppo della piattaforma NearYou.

= T

== Test di accettazione
Test finali condotti con il committente per verificare che il sistema soddisfi i requisiti e le aspettative definite.

== Test di integrazione
Test che verificano il corretto funzionamento dell'interazione tra diversi moduli o componenti software.

== Test di regressione
Test ripetuti per assicurare che modifiche al codice non abbiano introdotto nuovi difetti nelle funzionalità esistenti.

== Test di sistema
Test che verificano il comportamento dell'intero sistema software rispetto ai requisiti specificati.

== Test di unità
Test che verificano il corretto funzionamento di singoli componenti o moduli software in isolamento.

== Throughput
Velocità di elaborazione dati, misurata come quantità di dati processati per unità di tempo.

== Topic
Argomento o categoria in sistemi di messaggistica per organizzare i flussi di dati.

== Top-down
Approccio di sviluppo che inizia dai moduli di alto livello e procede verso quelli di dettaglio implementativo.

== Tracking
Processo di monitoraggio e tracciamento di eventi, comportamenti o performance del sistema.

== TSR (Test Success Rate)
Percentuale di test superati con successo rispetto al totale dei test eseguiti.

== TTL (Time To Live)
Tempo di validità di un dato prima che venga considerato scaduto o rimosso dalla cache.

== Typst
Sistema di composizione tipografica moderno che combina la potenza di LaTeX con la semplicità di Markdown per la creazione di documenti.

= U
= V

== Verificatore
Il verificatore agirà nella totalità del progetto, garantendo che ogni suo aspetto venga realizzato in maniera qualitativamente valida, completa e robusta.

== Versione
Una versione è un identificativo univoco che indica lo stato di un software o documento, seguendo lo standard Semantic Versioning, nel formato MAJOR.MINOR.PATCH:
+ +1.0.0: Nuova release stabile (o di base),
+ +0.1.0: Nuova release "minore", introduce aggiunte o funzionalità base.
+ +0.0.1: Nuova release di patch, spesso una "messa a punto" (correzioni, nessuna aggiunta considerevole).

= W

== Walkthrough
Tecnica di revisione collaborativa del codice o documentazione condotta informalmente tra sviluppatori.

== Way of working
Modello su cui si fonda l'attività cooperativa del gruppo, che delinea in particolare come si struttura l'interazione tra i vari elementi che lo compongono, al fine di ottimizzare i prodotti e i processi di cui consta l'attività svolta.

== Web Storage API
API del browser che fornisce meccanismi per memorizzare dati localmente.

== WebSocket
Protocollo di comunicazione che fornisce canali di comunicazione full-duplex su una singola connessione TCP, ideale per applicazioni real-time.

== WGS84
Sistema di coordinate geografiche standard utilizzato dal GPS e nella cartografia digitale.

= X
= Y
= Z

== Zip
Formato di compressione che permette di raggruppare più file in un unico archivio.
