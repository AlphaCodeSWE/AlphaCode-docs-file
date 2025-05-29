#import "../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Norme di Progetto",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Manuel Cinnirella",
      "", "Giovanni Battista Matteazzi",
      "Redattori", "Giovanni Battista Matteazzi",
      "", "Alessandro Di Pasquale",
      "", "Nicolò Bovo",
      "", "Romeo Calearo",
      "Validatori", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti",
      "", "Nicolò Bovo",
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/04/18",
  version: "0.3.0",
  version_history: (
    "0.3.0", "2025/05/13", "Estensione del docuento", "Alessandro Di Pasquale, Giovanni Battista Matteazzi, Elia Leonetti", "Nicolò Bovo",
    "0.2.0", "2025/04/22", "Estensione del docuento", "Giovanni Battista Matteazzi, Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo", "Massimo Chioru, Manuel Cinnirella, Elia Leonetti",
    "0.1.0", "2025/04/18", "Bozza del docuento", "Giovanni Battista Matteazzi, Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo", "Massimo Chioru, Manuel Cinnirella, Elia Leonetti",
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Introduzione
== Scopo del documento
Il presente documento si propone di definire in modo organico e condiviso il “Way of Working” adottato dal gruppo AlphaCode per l'esecuzione del progetto didattico, allineandosi ai processi di Project Planning, Project Monitoring & Control e Organizational Project‑Enabling così come descritti nella norma ISO/IEC 12207:1995. In particolare, esso raccoglie e formalizza le best practice, i ruoli, le responsabilità e le attività che ciascun membro del team dovrà seguire, al fine di garantire un approccio professionale, coerente e riproducibile lungo tutto il ciclo di vita del progetto.

Per la sua redazione si è seguito un metodo incrementale: inizialmente è stato sviluppato un impianto base che descrive i processi fondamentali e i deliverable principali; successivamente, con l'avanzare del lavoro e il confronto continuo all'interno del team, sono state aggiunte e raffinate procedure operative, modelli di documentazione e linee guida per la gestione delle modifiche e dei rischi. Ogni nuova versione di questo documento terrà conto delle decisioni prese dal gruppo durante le revisioni periodiche, garantendo così flessibilità e capacità di adattamento senza compromettere la coerenza con gli standard internazionali.

I membri del gruppo AlphaCode si impegnano a consultare regolarmente questo documento e a rispettarne le indicazioni, assicurando così uniformità nei processi di pianificazione, monitoraggio e controllo del progetto. Tale impegno non solo favorisce la trasparenza nei confronti del proponente, ma consente anche di mantenere alta la qualità del lavoro e di tracciare in modo puntuale l'avanzamento delle attività, come prescritto dal processo di Configuration Management della ISO/IEC 12207:1995.

== Scopo del progetto
Lo scopo di NearYou è progettare, realizzare e validare una piattaforma di advertising personalizzato in tempo reale, capace di unire flussi GPS, profilazione utente e generative AI per produrre annunci altamente contestuali. Oltre a implementare simulatori di posizionamento, pipeline Kafka→ClickHouse→PostGIS e modelli LLM, il team AlphaCode condurrà misurazioni mirate per valutare throughput e latenza delle componenti di streaming (Kafka) e orchestrazione (Airflow), l'efficacia e i tempi di risposta delle query geospaziali in PostGIS, e la velocità di generazione e consegna degli annunci via FastAPI. Analizzeremo inoltre l'impatto delle operazioni AI su CPU e memoria e testeremo la resilienza dei microservizi (producer, consumer, webapp) in caso di picchi di traffico o failure di rete. Per confermare scalabilità, robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode eseguirà stress test ad alto carico su tutte le pipeline, verificando la correttezza funzionale e le performance sotto condizioni estreme.

== Riferimenti
=== Riferimenti normativi
- Capitolato d'appalto C4: NearYou, il nuovo protocollo standard per la comunicazione email
- Standard ISO/IEC 12207:1995
=== Riferimenti informativi
- I processi di ciclo di vita del software
- Glossario

= Processi primari
== Fornitura
=== Scopo
Il processo di fornitura, così come previsto dal capitolato NearYou e in linea con i principi della ISO/IEC 12207:1995, costituisce il momento in cui il team AlphaCode definisce formalmente i termini della collaborazione con il proponente (_Sync Lab_). Attraverso un contratto condiviso, vengono stabiliti i requisiti funzionali e non funzionali - dal simulatore GPS fino all'integrazione con i modelli di generative AI - i vincoli tecnologici e di sicurezza (ad esempio l'adozione di Mutual TLS e di database PostGIS/ClickHouse) e le milestone temporali per la consegna di ciascun deliverable. Questo accordo non è un semplice atto burocratico, ma la bussola che guida ogni attività del gruppo, permettendo di tracciare costantemente lo stato di avanzamento, individuare eventuali scostamenti e riallinearsi alle attese del proponente. Solo dopo aver formalizzato questi punti, AlphaCode procede alla redazione del Piano di Progetto, che dettaglia in modo sistematico tempi, risorse, ruoli e modalità di controllo necessari per una realizzazione ordinata e trasparente.

=== Descrizione
Questo processo è diviso nelle seguenti fasi:
- Inizializzazione;
- Preparazione delle risposte alle richieste;
- Contrattazione;
- Pianificazione;
- Esecuzione e controllo;
- Revisione e valutazione;
- Consegna e completamento.

=== Aspettative
Il gruppo _AlphaCode_ si impegna a mantenere una collaborazione costante e professionale con l'azienda proponente _Sync Lab_, facendo riferimento ai contatti indicati nel capitolato, in particolare i referenti tecnici Davide Zorzi e Andrea Dorigo, con Federico Pallaro sempre in copia nelle comunicazioni.

Attraverso un dialogo continuo, il gruppo intende assicurarsi che il lavoro svolto sia allineato alle richieste del capitolato, ricevendo feedback regolari e chiarendo tempestivamente eventuali dubbi. L'obiettivo è garantire che vincoli, requisiti e scadenze siano rispettati, offrendo trasparenza sullo stato di avanzamento del progetto e favorendo una collaborazione efficace durante tutte le fasi dello sviluppo.

=== Comunicazioni con il proponente
Per garantire un flusso comunicativo efficace e trasparente, il gruppo AlphaCode ha concordato con l'azienda proponente _Sync Lab_ una cadenza settimanale per gli incontri esterni tramite piattaforma Google Meet, durante i quali vengono affrontate le principali criticità e discussi i progressi del progetto. Tali riunioni avvengono generalmente in modalità telematica e vedono la partecipazione attiva dei referenti tecnici indicati nel capitolato.

Gli incontri hanno lo scopo di:
- chiarire dubbi sui requisiti o sui vincoli progettuali;
- discutere le tecnologie adottate o future integrazioni;
- raccogliere feedback sulle componenti sviluppate.

Ogni colloquio viene documentato attraverso la stesura di un Verbale Esterno, che include data, partecipanti e contenuti rilevanti emersi dalla discussione. I verbali vengono salvati in una cartella dedicata all'interno della repository ufficiale del progetto, in modo da garantirne la tracciabilità e l'accessibilità per tutte le parti coinvolte.

=== Documentazione fornita
Il gruppo AlphaCode si impegna a produrre e consegnare una documentazione completa e strutturata, rivolta sia all'azienda proponente _Sync Lab_, sia ai committenti Prof. Tullio Vardanega e Prof. Riccardo Cardin.

==== Valutazione dei Capitolati
Il documento di Valutazione dei Capitolati ha lo scopo di analizzare in maniera approfondita i progetti proposti dalle aziende nella giornata del 2025/03/04. Per ogni capitolato presentato, il gruppo AlphaCode ha identificato le esigenze del proponente, le potenziali soluzioni tecniche e le eventuali criticità che avrebbero potuto ostacolare lo sviluppo.

La valutazione si articola in sezioni ben definite che comprendono:

- *Descrizione*: include il nome del progetto, l'azienda proponente e le informazioni principali relative al prodotto, così come presentato;
- *Dominio applicativo*: definisce il contesto in cui il progetto si colloca, con particolare attenzione agli utenti finali e agli scenari d'uso;
- *Dominio tecnologico*: elenca gli strumenti, linguaggi, framework e infrastrutture richiesti;
- *Aspetti positivi*: evidenzia le opportunità di apprendimento e di innovazione legate al progetto;
- *Fattori critici*: analizza eventuali rischi o complessità, sia tecniche che organizzative;
- *Conclusione*: motiva la scelta o la non scelta del capitolato sulla base di criteri condivisi dal gruppo.

Nel caso specifico, il gruppo AlphaCode ha scelto di aderire al Capitolato C4 - NearYou, proposto dall'azienda _Sync Lab_, per l'interesse dimostrato verso le tecnologie di streaming dati, la componente geospaziale e l'integrazione con tecniche di AI generativa.

==== Analisi dei Requisiti
Il documento di Analisi dei Requisiti ha il compito di descrivere nel dettaglio le funzionalità che il sistema NearYou dovrà offrire, oltre ai vincoli da rispettare affinché il prodotto risulti conforme alle aspettative espresse nel capitolato e alle necessità del proponente _Sync Lab_.

All'interno del documento vengono fornite le seguenti informazioni:

- *Descrizione del prodotto*: viene delineato l'obiettivo generale del sistema, ovvero la creazione di una piattaforma per l'advertising personalizzato basata su flussi GPS, profilazione utenti e AI generativa, con evidenza sulle sue principali funzionalità in ambito di raccolta, trasformazione e analisi dei dati.

- *Casi d'uso*: il sistema viene descritto attraverso una serie di scenari d'uso concreti che illustrano come gli utenti interagiscono con la piattaforma. Ogni caso d'uso evidenzia lo scenario, gli attori coinvolti (ad esempio: utenti, amministratori, processi automatici) e le azioni che questi possono compiere.

- *Requisiti funzionali e non funzionali*: sono elencati tutti i requisiti identificati, siano essi forniti esplicitamente dal proponente o dedotti dal gruppo sulla base delle funzionalità richieste. Tali requisiti vengono classificati come:
  - *Obbligatori*: indispensabili per il funzionamento minimo del sistema;
  - *Desiderabili*: utili al miglioramento della qualità e dell'esperienza utente;
  - *Opzionali*: funzionalità aggiuntive implementabili in funzione del tempo disponibile.

L'analisi dei requisiti rappresenta la base per l'intero processo di sviluppo e verrà aggiornata in modo incrementale in caso emergano nuove necessità o cambiamenti durante le fasi progettuali.

==== Piano di Progetto
Il Piano di Progetto è un documento strategico, redatto e mantenuto dal Responsabile di Progetto con il supporto dell'Amministratore, che ha lo scopo di guidare lo sviluppo del sistema NearYou attraverso una pianificazione strutturata, realistica e monitorabile. Viene costantemente aggiornato per riflettere l'evoluzione delle attività, dei vincoli e delle decisioni progettuali.

Il documento comprende:

- *Analisi dei rischi*: il gruppo identifica e classifica le possibili problematiche che potrebbero compromettere il corretto svolgimento delle attività, distinguendo tra:
  - _Rischi organizzativi_, legati a dinamiche di gruppo, pianificazione e comunicazione;
  - _Rischi tecnologici_, relativi all'integrazione di strumenti complessi come Kafka, ClickHouse, PostGIS e modelli AI generativi.
Per ogni rischio vengono definite misure preventive e correttive per contenerne l'impatto.

- *Modello di sviluppo*: viene illustrata la strategia metodologica adottata dal team AlphaCode, che segue un approccio incrementale ed iterativo, ispirato a pratiche agili, per garantire una costante validazione degli obiettivi raggiunti e la massima adattabilità ai feedback.

- *Pianificazione*: il lavoro viene suddiviso in periodi chiave (milestone), ognuno dei quali è corredato da una panoramica delle attività previste, dei ruoli assegnati, delle responsabilità individuali e delle stime di impegno in termini di ore/uomo.

- *Preventivo*: include una stima temporale dettagliata del carico di lavoro previsto per ogni membro del gruppo, tenendo conto delle complessità tecniche e delle dipendenze tra le attività.

- *Consuntivo*: al termine di ciascun periodo pianificato, viene effettuata un'analisi delle attività realmente svolte rispetto a quanto previsto. Questo confronto consente di individuare eventuali scostamenti, valutarne le cause ed effettuare un aggiornamento del piano nelle fasi successive.

Il Piano di Progetto è uno strumento fondamentale per mantenere il controllo sul progresso del lavoro e per garantire il raggiungimento degli obiettivi nei tempi e modi concordati con il proponente.

==== Piano di Qualifica
Il Piano di Qualifica è il documento che delinea le strategie, le metriche e le attività adottate dal gruppo AlphaCode per garantire la qualità del sistema NearYou, sia a livello di processo che di prodotto. Rappresenta un riferimento centrale per tutti i membri del team durante lo sviluppo, al fine di assicurare che il risultato finale sia conforme alle aspettative del proponente e agli standard richiesti.

Il documento è strutturato in quattro sezioni principali:

- *Qualità di processo*: vengono definite le metriche da rispettare per monitorare l'efficacia e l'efficienza del ciclo di sviluppo. Tra questi parametri figurano la tracciabilità dei requisiti, la copertura della verifica e il rispetto delle scadenze prefissate.

- *Qualità di prodotto*: si stabiliscono i criteri per valutare le caratteristiche del software, come manutenibilità, affidabilità, usabilità e performance. Questi aspetti saranno misurati tramite indicatori oggettivi e soggettivi, per garantire un risultato stabile e robusto.

- *Test*: la sezione include la descrizione delle attività di test previste (unit test, test di integrazione, test funzionali, test di carico) e i criteri di accettazione per ogni funzionalità. I test saranno fondamentali per verificare che ogni componente del sistema rispetti i requisiti funzionali e non funzionali.

- *Valutazioni per il miglioramento*: al termine di ogni ciclo di verifica, verranno registrati i risultati ottenuti, segnalate le criticità emerse e proposte azioni correttive. Questo approccio incrementale permetterà di migliorare costantemente la qualità complessiva del progetto.

Il Piano di Qualifica assume quindi un ruolo chiave nell'assicurare che il progetto NearYou sia sviluppato secondo metodologie rigorose e orientate alla qualità, permettendo di mantenere sotto controllo tutti gli aspetti critici legati alla verifica e alla validazione del sistema.

== Sviluppo
=== Scopo
In conformità allo standard ISO/IEC 12207:1995, il processo di sviluppo ha lo scopo di definire e gestire le attività tecniche necessarie per trasformare i requisiti del proponente in un prodotto software conforme e funzionante.
Per il progetto NearYou, il processo include l'analisi dei requisiti, la progettazione architetturale e di dettaglio, l'implementazione delle componenti, l'integrazione dei vari moduli, il collaudo del sistema, la sua installazione in ambiente operativo e l'accettazione finale da parte del committente.
Tutte le attività sono guidate da pratiche di sviluppo incrementali e iterative, con l'obiettivo di assicurare qualità, tracciabilità dei requisiti e aderenza ai vincoli tecnologici stabiliti nel capitolato.

=== Descrizione
Le attività che compongono il processo di sviluppo del progetto NearYou, strutturate secondo lo standard ISO/IEC 12207:1995, sono organizzate in fasi sequenziali e iterabili, ciascuna mirata alla costruzione incrementale del sistema:

- *Definizione del processo di sviluppo*: formalizzazione del flusso operativo e delle pratiche adottate dal gruppo, incluso l'uso di strumenti e metodologie agili.
- *Analisi dei requisiti di sistema*: studio dei requisiti funzionali e non funzionali forniti dal capitolato, con valutazione di vincoli architetturali e tecnologici.
- *Progettazione dell'architettura di sistema*: definizione dei macro-componenti e della loro interazione (es. Kafka, ClickHouse, PostGIS, WebApp).
- *Analisi dei requisiti software*: individuazione delle funzionalità specifiche di ogni modulo software, come il consumer Kafka, i DAG di Airflow, o la web app FastAPI.
- *Progettazione architetturale del software*: suddivisione in microservizi, definizione delle interfacce, scelte tecnologiche (containerizzazione, sicurezza TLS, ecc.).
- *Progettazione dettagliata del software*: specifica dei componenti interni, logiche di business, gestione degli errori, logging, sicurezza e configurabilità.
- *Codifica e testing unitario*: sviluppo del codice con pratiche di qualità e test delle singole unità.
- *Integrazione progressiva*: combinazione delle componenti in ambienti Docker tramite Docker Compose.
- *Test di qualifica del software*: verifica che ogni modulo soddisfi i requisiti previsti (es. throughput del producer, correttezza del consumer, efficienza dei DAG).
- *Integrazione di sistema*: test del sistema completo, inclusi pipeline Kafka→ClickHouse→PostGIS e moduli AI.
- *Test di qualifica di sistema*: valutazione delle prestazioni, affidabilità, sicurezza e scalabilità del sistema.
- *Installazione del sistema in ambiente target*: configurazione degli ambienti Gitpod e/o locali tramite Docker.
- *Supporto all'accettazione*: fornitura di documentazione tecnica e dimostrazione del prodotto, con eventuali sessioni di collaudo da parte del proponente.

==== Implementazione del processo
L'implementazione del processo di sviluppo per il progetto NearYou ha avuto inizio con la scelta di un modello di ciclo di vita incrementale ed iterativo, compatibile con i vincoli temporali e con l'evoluzione graduale dei requisiti. Il team AlphaCode ha definito in modo chiaro i ruoli e le responsabilità di ogni membro, assicurando la copertura di aspetti fondamentali come la redazione della documentazione, la gestione delle configurazioni (tramite Git), la risoluzione dei problemi, e il supporto alla qualità.

Per mantenere coerenza e tracciabilità nel processo, sono stati adottati standard di codifica, strumenti di automazione (come Docker, Gitpod e Airflow), metodi di verifica continua e linguaggi adeguati allo scopo.

Il gruppo ha anche pianificato l'utilizzo di risorse condivise, ambienti di sviluppo replicabili e tool di gestione collaborativa (come GitHub e Discord), per garantire trasparenza, coordinamento e continuità.

==== Analisi dei requisiti di sistema
Nel contesto dell'Analisi dei Requisiti di Sistema, il processo ha coinvolto il team AlphaCode nell'esecuzione e nel supporto delle attività previste dal capitolato NearYou. La prima fase ha richiesto l'analisi dell'uso specifico del sistema in sviluppo, volto alla realizzazione di una piattaforma per l'advertising personalizzato basata sull'integrazione di dati GPS, profilazione utente e generative AI. Tale analisi ha permesso di definire accuratamente i requisiti di sistema.

Questi requisiti includono funzionalità come il consumo e la gestione in tempo reale di flussi Kafka, la persistenza efficiente in ClickHouse, l'esecuzione di query spaziali in PostGIS, la generazione dinamica di annunci tramite modelli LLM, nonché la comunicazione sicura tramite certificati mutual TLS. Sono stati inoltre definiti i requisiti relativi alle performance del sistema, all'affidabilità, alla manutenibilità, alle interfacce, all'operatività e alla sicurezza, insieme ai vincoli di progettazione, ambienti d'esecuzione (containerizzati) e requisiti di qualifica.

La fase successiva ha previsto la valutazione di tali requisiti in base alla loro rintracciabilità rispetto ai bisogni espressi dal proponente, alla coerenza interna, alla testabilità e alla fattibilità architetturale. È stata inoltre verificata la sostenibilità delle operazioni e della manutenzione a lungo termine. I risultati delle analisi sono stati accuratamente documentati nel relativo documento di Analisi dei Requisiti, che costituisce base fondante per le attività di progettazione e sviluppo.

==== Progettazione architetturale del sistema
Nel contesto della progettazione architetturale del sistema NearYou, la prima fase ha previsto la definizione di un'architettura ad alto livello basata su una composizione di microservizi containerizzati, orchestrati tramite Docker Compose. Sono stati identificati i principali componenti del sistema, tra cui: generatori di dati GPS, broker Kafka per lo streaming sicuro (mutual TLS), database analitico ClickHouse, sistema geospaziale PostGIS, orchestratore Airflow, API FastAPI per la generazione di annunci personalizzati tramite modelli LLM e interfaccia Grafana per la visualizzazione dei dati.

Tutti i requisiti del sistema sono stati allocati con precisione ai rispettivi elementi architetturali, distinguendo tra componenti software, operazioni automatizzate (es. DAG di Airflow) e interazioni manuali (es. generazione certificati, monitoraggio).

Successivamente è stata condotta una valutazione dell'architettura proposta, con particolare attenzione alla tracciabilità dei requisiti, alla coerenza tra i moduli, all'adeguatezza degli standard tecnologici adottati, alla fattibilità implementativa dei singoli elementi software e alla manutenibilità del sistema.

==== Analisi dei requisiti software
Nel contesto del progetto NearYou, l'analisi dei requisiti software ha avuto lo scopo di identificare e documentare in maniera strutturata tutte le caratteristiche funzionali e non funzionali necessarie alla realizzazione degli elementi software che compongono la piattaforma. Per ciascun modulo identificato (es. microservizi Kafka, consumer, producer, FastAPI, DAG Airflow), il team ha definito:

- _Specifiche funzionali e prestazionali_, tenendo conto delle capacità di throughput, latenza di risposta, volume dati gestito e resilienza;
- _Interfacce esterne_, in particolare tra Kafka ↔ ClickHouse, ClickHouse ↔ FastAPI e tra API ↔ frontend;
- _Requisiti di sicurezza_, relativi alla comunicazione cifrata tramite TLS, gestione dei certificati mutual TLS e protezione dei dati trasmessi e memorizzati;
- _Aspetti legati all'usabilità e all'interazione utente-sistema nella webapp_, anche in scenari con accesso simultaneo e consultazione dei dati tramite dashboard;
- _Definizione dei dati gestiti_, tra cui eventi GPS, utenti, POI, annunci e le strutture dei relativi database (ClickHouse e PostGIS);
- _Requisiti di deploy_, operatività e manutenzione dei container Docker e dei servizi;
- _Documentazione prevista per l'utente e per lo sviluppatore_ (es. API reference, struttura delle query in Grafana);
A completamento dell'analisi, ogni requisito è stato valutato in base a:
- Rintracciabilità rispetto ai requisiti di sistema;
- Coerenza interna ed esterna con le specifiche architetturali;
- Fattibilità di sviluppo e mantenimento.

=== Progettazione architetturale del software
Per ciascun elemento software identificato nel progetto NearYou, l'attività di progettazione architetturale comprende i seguenti compiti:

- *Conversione dei requisiti in architettura*: Gli sviluppatori traducono i requisiti software in una struttura architetturale ad alto livello, identificando chiaramente i componenti software necessari (ad esempio: modulo simulazione GPS, stream processor Kafka/Flink, servizio LLM con LangChain, dashboard analitica Grafana, web-app frontend). Ogni requisito viene assegnato a un componente specifico, facilitando la successiva progettazione dettagliata. L'intera architettura viene documentata tramite diagrammi C4 (System, Container, Component).

- *Progettazione di alto livello delle interfacce*: Viene definito e documentato il progetto preliminare delle interfacce tra i componenti software (REST API, WebSocket, formati di messaggi JSON/Avro) e le interfacce esterne al sistema (ad esempio database geospaziali).

- *Progettazione di alto livello del database*: Viene progettata la struttura preliminare del database geospaziale (PostGIS) e analitico (ClickHouse), definendo schemi tabellari principali, indici geospaziali e strategie di partizionamento dei dati temporali per ottimizzare query e performance.

- *Valutazione dell'architettura e interfacce*: Viene effettuata una valutazione strutturata dell'architettura proposta e dei progetti preliminari delle interfacce e dei database, verificando in particolare la rintracciabilità dei requisiti, la coerenza interna ed esterna, l'uso adeguato delle tecnologie suggerite (Kafka, Flink, LangChain, PostGIS), la fattibilità della progettazione dettagliata e la semplicità di manutenzione.

- *Revisione formale*: Si conducono una o più revisioni formali (peer review) con tutto il team AlphaCode e l'azienda proponente, validando l'architettura definita e apportando eventuali miglioramenti derivanti dai feedback raccolti.

=== Progettazione dettagliata del software

Per ciascun componente software identificato nel progetto NearYou, l'attività prevede:

- *Progettazione dettagliata dei componenti software*: Definizione puntuale di unità software (moduli Python, funzioni, classi, query SQL) per simulazione dati, stream processing (Kafka/Flink), generazione annunci (LangChain), dashboard analitica e web-app, in modo che ciascuna unità sia immediatamente codificabile e testabile.

- *Progettazione dettagliata delle interfacce*: Documentazione precisa delle API REST, WebSocket e schemi JSON/Avro, incluse specifiche tecniche complete che permettono la codifica diretta senza ambiguità.

- *Progettazione dettagliata del database*: Struttura dettagliata delle tabelle PostGIS (positions, places, ads) e ClickHouse, definendo esattamente campi, tipi, indici e partizioni.

- *Aggiornamento preliminare della documentazione utente*: Revisione e ampliamento della documentazione utente con dettagli tecnici aggiornati e indicazioni operative più complete.

- *Aggiornamento requisiti e pianificazione integrazione software*: Revisione delle strategie e criteri per test di integrazione software (Docker Compose).
- *Valutazione della progettazione dettagliata e test*: Analisi documentata della progettazione dettagliata sulla base di rintracciabilità requisiti, coerenza architetturale, semplicità di manutenzione, fattibilità dei test unitari e integrazione.

- *Revisione formale interna*: Una o più sessioni di revisione obbligatorie del team AlphaCode per verificare la progettazione.

=== Codifica e testing del software
Per ciascuna unità software del progetto NearYou, il programmatore svolge le seguenti attività:

- *Codifica unità software e database*: Sviluppo e documentazione delle unità software (Python 3.12, TypeScript ) e relativi schemi di database (PostGIS, ClickHouse).

- *Esecuzione e documentazione test unitari*: Conduzione sistematica dei test automatizzati per verificare conformità ai requisiti funzionali e tecnici, riportando chiaramente i risultati in report strutturati.

- *Aggiornamento documentazione utente*: Revisione e integrazione continua delle guide operative e manuali utente per riflettere tutte le modifiche effettuate nel software.

- *Aggiornamento requisiti e piano integrazione software*: Affinamento dei requisiti e del piano di test di integrazione basato su Docker Compose.

- *Valutazione codice e test*: 
  - Tracciabilità codice-requisiti;
  - Coerenza interna ed esterna delle unità;
  - Adeguata copertura dei test (≥ 80 %);
  - Conformità agli standard di codifica adottati;
  - Fattibilità tecnica di integrazione e manutenzione.

=== Integrazione del software
Per il progetto NearYou, l'integrazione software comprende:

- *Sviluppo del Piano di Integrazione*: Documentazione delle procedure e sequenze di integrazione delle unità software (moduli Python, servizi Docker), inclusi requisiti di test, dati, responsabilità assegnate e pianificazione delle attività.

- *Esecuzione integrazione e test*: Unione progressiva delle unità software secondo il piano, effettuando test di integrazione con ambienti Docker Compose per verificare il rispetto dei requisiti funzionali e non funzionali definiti nel capitolato.

- *Aggiornamento della documentazione utente*: Revisione e aggiornamento della documentazione operativa per riflettere i cambiamenti dovuti all'integrazione.

- *Preparazione Test di Qualificazione del Software*: Creazione di casi e procedure di test specifiche per ciascun requisito del software integrato, assicurando che l'insieme integrato soddisfi tutti i criteri di qualificazione previsti (copertura ≥ 80%, latenza ≤ \~800 ms).

- *Valutazione integrazione software*: Verifica con particolare attenzione a:
  - Tracciabilità completa ai requisiti di sistema;
  - Coerenza interna/esterna dell'integrazione;
  - Adeguata copertura dei test;
  - Rispetto dei metodi e standard adottati;
  - Conformità dei risultati ai requisiti previsti;
  - Fattibilità operativa e manutentiva della piattaforma.

=== Test di qualifica del software
Per il progetto NearYou, l'attività comprende:

- *Esecuzione test di qualificazione*: Test approfonditi delle funzionalità software integrate, secondo i requisiti definiti nel Piano di Qualifica (copertura test ≥ 80%, latenza ≤ \~800 ms). I risultati sono formalmente documentati.

- *Aggiornamento documentazione utente*: Revisione della documentazione utente per riflettere tutte le modifiche e miglioramenti introdotti dopo i test.

- *Valutazione del prodotto software*: Revisione formale basata su:

  - Copertura completa dei requisiti software;

  - Conformità ai risultati attesi;

  - Fattibilità tecnica e operativa dell'integrazione e dei test di sistema;

  - Manutenibilità e operatività futura del sistema.

*Preparazione per integrazione di sistema*:
Aggiornamento del prodotto software e definizione di una baseline stabile del codice e del design software, pronta per la fase successiva di integrazione di sistema.

=== Integrazione di sistema

Inizialmente, le componenti software del sistema NearYou devono essere integrate tra loro e con gli elementi di simulazione hardware (ad esempio, generatori di dati GPS e sensori simulati), operazioni manuali (come la configurazione dei dataset utente) e altri sistemi esterni (ad esempio, modelli LLM e piattaforme di visualizzazione). Gli aggregati, come il flusso dati (dai simulatori al message broker, allo stream processing, al database e alla generative AI), devono essere testati incrementalmente durante lo sviluppo, verificando la conformità ai requisiti funzionali e non funzionali definiti nel capitolato. L'integrazione e i risultati dei test devono essere documentati in modo dettagliato, inclusi schemi logici del comportamento dei simulatori e report di copertura dei test (≥80%).  

Successivamente, per ciascun requisito di qualificazione del sistema (MVP o prodotto completo), è necessario sviluppare e documentare: 
- *Casi di test*: input (es. percorsi GPS predefiniti, profili utente), output attesi (es. annunci contestuali generati da LLM), criteri di accettazione (es. latenza massima consentita, precisione geospaziale);  
- *Procedure di test*: esecuzione manuale o automatizzata, convalidata in presenza della Proponente.

La valutazione del sistema integrato deve considerare i seguenti criteri, documentando i risultati:  
- *Copertura dei test*: rispetto ai requisiti di sistema (es. supporto di più sorgenti dati, interpolazione contestuale, gestione di percorsi non predefiniti);  
- *Appropriatezza dei metodi*: allineamento con le tecnologie proposte (Kafka, Flink, LangChain) e standard di settore per lo stream processing e l'AI;  
- *Conformità ai risultati attesi*: coerenza tra annunci generati e contesto utente (es. target giovane vs. coppia), corretto salvataggio dei dati su storage ottimizzato (ClickHouse, PostGIS);  
- *Fattibilità del test di qualificazione*: capacità di replicare scenari reali (es. picchi di dati, fallimenti di rete) e integrazione con strumenti di visualizzazione (Superset, web-app);  
- *Fattibilità di operatività e manutenzione*: modularità dell'architettura, documentazione delle scelte progettuali (es. utilizzo di HiveMQ vs. RabbitMQ) e gestione degli eventuali problemi aperti.

=== Test di qualifica del sistema

*Il testing di qualificazione per NearYou deve verificare*:

- Conformità ai requisiti (simulatori GPS, LLM, dashboard base);

- Funzionalità critiche: generazione annunci contestuali (es. target specifici), integrazione con broker (Kafka/HiveMQ), persistenza dati (ClickHouse/PostGIS).

*Criteri di valutazione*:

- *Copertura test*: Requisiti avanzati (interpolazione contestuale, visualizzazione lato utente).

- *Conformità*: Correlazione annunci-contesto utente, precisione geospaziale, prestazioni storage.

- *Fattibilità operativa*: Architettura modulare, documentazione chiara (scelte tecnologiche, es. LangChain).

*Post-verifica*:

- Consegnare pacchetto software con codice, configurazioni, dashboard (Superset/Grafana) e web-app demo.

- Stabilire baseline tramite versionamento (Git) e documentazione progettuale aggiornata.

=== Installazione del software

Il fornitore deve sviluppare un piano di installazione del sistema NearYou, considerando:

- *Ambiente di destinazione*: Configurazione di server/cloud per componenti chiave (message broker, stream processing, database, LLM);

- *Risorse necessarie*: Librerie Python (es. Faker), container Docker (per Kafka, Flink, Superset), accesso a modelli LLM (es. API OpenAI, Groq Cloud o open-source);

- *Supporto alla configurazione*: Assistenza alla Proponente (_Sync Lab_) per integrare dataset predefiniti, percorsi simulati e parametri di personalizzazione annunci.
In caso di sostituzione di sistemi esistenti, garantendo la compatibilità dei formati dati. Il piano deve includere schemi logici e istruzioni dettagliate per l'avvio delle simulazioni (GPS, stato fisico).

*Esecuzione dell'installazione*: Il fornitore installerà il software conformemente al piano, garantendo:

- *Inizializzazione corretta*: Avvio dei broker (Kafka/HiveMQ), connessione allo stream processing (Flink), configurazione dello storage (ClickHouse/PostGIS) e integrazione con LLM (LangChain);

- *Funzionamento atteso*: Verifica che i dati simulati generino annunci contestuali e che le dashboard (Superset/Grafana/web-app) visualizzino posizioni e messaggi in tempo reale;

=== Supporto all'accettazione del software

Il team di sviluppo dovrà coordinarsi in tutte le fasi di verifica e validazione della soluzione, ponendo particolare attenzione all'integrazione dei simulatori GPS, al corretto funzionamento del message broker per lo streaming dei dati e all'implementazione dei moduli di generative AI per la creazione di annunci personalizzati. Le prove, siano esse a livello unitario o integrato, devono dimostrare che l'intero sistema - dalla raccolta e memorizzazione dei dati alla visualizzazione in dashboard - soddisfi i requisiti tecnici e funzionali previsti.  

Per ogni fase, è necessario documentare accuratamente i risultati, includendo le metriche prestazionali e il livello di copertura dei test (minimo 80%), in modo da identificare e risolvere eventuali criticità.

// === LAST EDIT ===

= Processi di supporto
== Documentazione

=== Scopo 
Il processo di documentazione ha lo scopo di garantire tracciabilità, coerenza e qualità nelle attività del progetto *NearYou*, allineandosi alle specifiche del Capitolato C4 di _Sync Lab_. Le norme definiscono linee guida per la gestione della documentazione tecnica e di progetto, con particolare attenzione all'integrazione di tecnologie avanzate (IA, data streaming, geolocalizzazione) e al rispetto dei criteri di completamento definiti dal proponente.

=== Descrizione
Questa sezione regolamenta la creazione, revisione e approvazione di tutti i documenti relativi al progetto, inclusi:  
- Documentazione tecnica (architettura, scelte tecnologiche, test);
- Manuali utente e cliente;
- Documentazione per gli stakeholder (demo, presentazioni finali).  
Le norme garantiscono conformità con i requisiti del capitolato, come l'uso di *LangChain* per gli LLM, l'integrazione di *Apache Kafka* per lo streaming, e i criteri di testing (copertura ≥ 80%).  

=== Aspettative
- *Uniformità*: Utilizzo di template predefiniti per tutti i documenti, inclusi sezioni dedicate a:  
  - Scelte tecnologiche (es. motivazioni per Kafka vs RabbitMQ);  
  - Dettagli sull'integrazione LLM e personalizzazione annunci;  
  - Risultati dei test end-to-end e metriche di copertura.  
- *Conformità al Capitolato*: Rispetto delle specifiche _Sync Lab_ (es. dashboard con Superset/Grafana, simulazione dati GPS).  
- *Tracciabilità*: Registrazione delle decisioni progettuali e allineamento con i referenti aziendali.  

=== Ciclo di vita
Il ciclo di vita di un documento prevede sette fasi principali:

1. *Definizione o modifica del template:*
   Nella prima fase si procede con la definizione o la modifica del modello (template) specifico per il documento. Questo template stabilisce la struttura, gli stili di formattazione e include elementi essenziali quali titolo, autore, data di creazione e altre informazioni basilari necessarie per la corretta identificazione del documento.

2. *Pianificazione e assegnazione delle sezioni:*
   Successivamente, le varie sezioni del documento vengono accuratamente pianificate e assegnate ai rispettivi Redattori, ciascuno responsabile per la redazione della propria parte in linea con le specifiche delle Norme di Progetto.

3. *Raccolta dei contenuti e stesura:*
   In questa fase intermedia, i Redattori raccolgono tutto il materiale necessario e procedono a realizzare una prima versione (bozza) del documento.

4. *Redazione definitiva del documento:*
   Durante la quarta fase, i Redattori elaborano ulteriormente le proprie sezioni, correggendo e perfezionando i contenuti, in caso di necessità, così da assicurare la conformità al modello stabilito e alle Norme di Progetto.

5. *Verifica dei contenuti:*
   La quinta fase prevede un controllo approfondito da parte dei Redattori sui contenuti redatti, assicurandosi che questi rispettino integralmente le Norme di Progetto e siano privi di errori logici, tecnici o di compilazione.

6. *Revisione generale del documento:*
   In questa fase, il documento viene sottoposto a una revisione da parte di un Verificatore incaricato, che ha il compito di assicurare la coerenza complessiva, la correttezza delle modifiche effettuate e la rispondenza del documento agli standard di qualità previsti.

7. *Approvazione finale e pubblicazione:*
   Infine, il documento giunge alla fase conclusiva, in cui un Responsabile effettua l'approvazione finale, certificandone la qualità e l'idoneità al rilascio. Dopo l'approvazione ufficiale, il documento viene pubblicato e distribuito nella sua versione definitiva.

// Next section

=== Sistema di composizione tipografica 
Per garantire coerenza e semplicità nella produzione della documentazione, il gruppo ha adottato *Typst* come strumento principale, in sostituzione di LaTeX. La scelta è motivata dai seguenti vantaggi:  
- *Semplicità d'uso*: Sintassi simile a Markdown, ideale per redattori con competenze eterogenee.  
- *Programmabilità avanzata*: Supporto nativo per logiche condizionali e gestione dinamica dei contenuti, utile per documenti tecnici complessi (es. integrazione di diagrammi architetturali dal capitolato).  
- *Velocità di compilazione*: Generazione immediata di output PDF, ottimizzando i tempi di revisione.  
- *Coerenza grafica*: Template predefiniti nella cartella `template/` della repository `AlphaCode-docs-file`, allineati alle richieste del capitolato.  

=== Struttura dei documenti  
Ogni documento segue una struttura standardizzata per garantire tracciabilità e chiarezza, conforme alle aspettative del proponente _Sync Lab_.  

==== Intestazione
La prima pagina include:  
- *Logo del gruppo e dell'università* (`imgs/group_logo.png`).  
- *Nome del documento* (es. "Analisi dei Requisiti").  
- *Data* della creazione del documento.  
- *Responsabile, Redattori, Validatori*: È un elenco dei ruoli ricoperti dai vari membri nel corso della stesura del documento (es. risultano due responsabili elencati nel caso in cui una versione sia stata scritta sotto un determinato responsabile e la successiva in una rotazione dei ruoli differente). Ruoli definiti in base alle competenze (es. redattore esperto in A.I. per sezioni LLM). 
- *Tabella versionamento*: Partendo dalla più recente in alto verso la prima in basso, contiene una breve descrizione delle modifiche fatte, chi le ha applicate e chi le ha successivamente verificate. In caso di unica versione, la suddetta tabella non risulterà visibile. 
- *Versione attuale*:(e.g. `v0.3.1`).  

==== Registro delle modifiche  
La seconda pagina è dedicata alla tabella di versionamento, la quale permette di tenere traccia delle modifiche applicate al documento. La tabella riporta le seguenti informazioni:
- Versione: il numero di versione del documento;
- Data: data di stesura della relativa versione del documento;
- Descrizione: un'introduzione sintetica alle modifiche effettuate.
- Autori: membri che hanno effettuato le modifiche;
- Validatori: membri che hanno approvato le modifiche;

==== Indice
Organizzato per capitoli e sezioni, con riferimenti alle pagine.

==== Corpo del documento
Strutturato in capitoli e sottosezioni con eventuali:  
- *Descrizioni tecniche*: Dettagli su tecnologie (es. *PostGIS* per dati geospaziali).  
- *Diagrammi*: Riproduzione degli schemi architetturali del capitolato.

==== Corpo del verbale 
Include:  
- *Informazioni sulla riunione*:  
  - Luogo (fisico o virtuale), data, ora, partecipanti (interni/esterni).  
- *Ordine del giorno*: Elenco temi discussi (es. "Integrazione LLM con Apache Flink").  
- *Sintesi e decisioni*: Breve riassunto e accordi presi.
- *Consigli ricevuti*: Solo per i verbali esterni, riguarda quanto ci è stato suggerito dall'azienda su come procedere.
- *Attività individuate*: In formato tabulare, comprendendo l'eventuale Issue di GitHub associata, la descrizione dell'attività e gli assegnatari (stabiliti sulla base dei loro ruoli secondo la rotazione corrente)

==== Documenti del progetto
Elenco dei documenti obbligatori, allineati al capitolato C4:  
1. *Norme di Progetto* (_questo documento_).  
2. *Piano di Progetto*: Timeline e allocazione risorse.
3. *Piano di Qualifica*: Metriche di testing (copertura ≥ 80%).  
4. *Analisi dei Requisiti*: Casi d'uso (es. simulazione GPS, generazione annunci).  
5. *Glossario*: Definizioni tecniche (es. "LLM", "stream processing").  
6. *Lettera di presentazione*: Lettera di presentazione ad RTB compiuta.
7. *Verbali Interni/Esterni*: Registri degli incontri con _Sync Lab_.

=== Regole stilistiche

==== Convenzioni di denominazione dei file
I PDF presenti nella repository dei documenti seguono precise convenzioni per la denominazione, riassunte di seguito:

Formato PascalCase per i nomi dei documenti, ovvero la prima lettera di ciascuna parola è maiuscola e non sono presenti spazi tra le parole.
Assenza di spazi, sostituiti semplicemente dal formato PascalCase.
Indicazione della data (formato YYYY_MM_DD) presente nel nome dei file relativi ai verbali.
Indicazione esplicita della versione, posizionata alla fine del nome del file con formato vX.X.X.

In base a queste regole, i file avranno la seguente struttura di denominazione:

- *Norme di Progetto*: `NormeDiProgetto_YYYY_MM_DD_vX.X.X`
- *Piano di Progetto*: `PianoDiProgetto_YYYY_MM_DD_vX.X.X`
- *Piano di Qualifica*: `PianoDiQualifica_YYYY_MM_DD_vX.X.X`
- *Analisi dei Requisiti*: `AnalisiDeiRequisiti_YYYY_MM_DD_vX.X.X`
- *Glossario*: `Glossario_YYYY_MM_DD_vX.X.X`
- *Verbali Interni*: `VI_YYYY_MM_DD_vX.X.X`
- *Verbali Esterni*: `VE_YYYY_MM_DD_vX.X.X`

Si precisa inoltre che i file sorgenti .typ  includono la versione nel nome, la quale verrà aggiunta anche al documento PDF dopo la compilazione, insieme a signed per indicare che il file è firmato digitalmente.

L'utilizzo uniforme e rigoroso di questo formato facilita notevolmente l'impiego di Git, permettendo di sfruttare appieno le funzioni di tracciamento e confronto delle versioni (funzione "diff")

==== Stile del testo
Nei documenti (ad esclusione dei verbali) sarà obbligatorio utilizzare i seguenti stili tipografici:

_Corsivo_ per:
- Il nome del gruppo (_AlphaCode_);
- Il nome dell'azienda proponente (_Sync Lab_).

*Grassetto* per:
- Termini chiave o importanti;
- Parole introduttive seguite da una descrizione negli elenchi puntati.

`Font monospace` per:
- I nomi dei documenti;
- I nomi dei file;
- I nomi delle repository;
- I nomi delle cartelle;
- I nomi dei branch;
- Frammenti o esempi di codice.

#underline[Sottolineato] per:  
- I collegamenti (link);
- Gli indirizzi email.

LETTERE MAIUSCOLE per:
- Le iniziali dei nomi propri;
- Gli acronimi;
- Le iniziali dei ruoli assegnati ai membri del gruppo.

// ==== Elenchi puntati
// Ogni voce degli elenchi puntati termina con il simbolo “;”, ad eccezione dell'ultima che termina con un punto “.”. Nel caso una voce sia composta da più frasi, può terminare con un punto, indipendentemente dalla sua posizione nell'elenco stesso. L'uso del grassetto è previsto come descritto nella sezione precedente.

=== Formato delle date
Tutte le date presenti nei documenti devono rispettare lo standard internazionale ISO 8601, nel formato seguente: *YYYY-MM-DD*, dove:
- *YYYY* indica l'anno con quattro cifre;
- *MM* indica il mese con due cifre;
- *DD* indica il giorno con due cifre.


=== Strumenti
Gli strumenti selezionati dal gruppo _AlphaCode_ per la produzione e gestione della documentazione sono:
- *Typst*: linguaggio per la composizione e stesura dei documenti, utilizzando typst.app;
- *GitHub*: piattaforma di hosting e controllo versione, con la repository ufficiale del gruppo situata al seguente indirizzo: [https://github.com/AlphaCodeSWE/AlphaCode-docs-file](https://github.com/AlphaCodeSWE/AlphaCode-docs-file);
- *Capitolato*: il documento ufficiale fornito dalla proponente (_Sync Lab_) contenente i requisiti del progetto.

== Verifica
=== Scopo e aspettative

All'interno del ciclo di vita del software, la verifica rappresenta un processo continuo e strutturato che prende avvio fin dalle prime fasi di progettazione e prosegue fino alla manutenzione post-rilascio. Questo processo ha lo scopo di garantire che ogni artefatto prodotto - siano essi codice sorgente, documentazione, casi di test o altri deliverable - rispetti pienamente i requisiti prefissati.

L'obiettivo principale è assicurare che ciascun prodotto realizzato dal gruppo _AlphaCode_ sia conforme agli standard qualitativi attesi in termini di correttezza, completezza e coerenza. Questo viene ottenuto mediante attività di revisione e controllo sistematico che fanno uso di tecniche di analisi e test ben definite.

Per raggiungere tali scopi, è fondamentale seguire procedure consolidate, applicare criteri di verifica affidabili e validare ogni deliverable al termine della sua produzione.

=== Descrizione

Il processo di verifica è svolto da uno o più membri del gruppo _AlphaCode_ incaricati come Verificatori, e viene applicato in modo sistematico a tutti gli artefatti del progetto. La verifica non si configura come un'attività isolata o occasionale, bensì come un processo ciclico e reiterato, che accompagna costantemente lo sviluppo e si adatta all'evoluzione del progetto.

Il riferimento centrale per tutte le attività di verifica è il Piano di Qualifica, un documento che definisce con chiarezza:

- Gli obiettivi specifici della verifica;
- I criteri di accettazione per i diversi artefatti;
- Le tecniche e i metodi adottati per ciascuna attività di controllo.

Le attività di verifica applicabili sono descritte nelle sezioni seguenti.

=== Analisi statica

L'analisi statica è una tecnica di verifica che viene svolta senza la necessità di eseguire il prodotto software. Essa si concentra sull'esame diretto del codice sorgente e della documentazione prodotta, al fine di individuare eventuali incongruenze, difetti o violazioni delle convenzioni stabilite nel progetto.
Questa forma di analisi può essere applicata a qualunque artefatto del progetto e si basa principalmente su due modalità operative:

- *Walkthrough*: una lettura condivisa e collaborativa del contenuto, condotta tra il Verificatore e l'autore dell'artefatto. Serve a individuare anomalie o aree da migliorare, promuovendo anche un confronto diretto e costruttivo.

- *Inspection*: una modalità più strutturata e formale rispetto al walkthrough, che si avvale di una checklist predefinita per analizzare sistematicamente il contenuto. L'inspection è particolarmente indicata per la sua efficienza nel rilevare errori in modo tempestivo e puntuale.

L'analisi statica risulta particolarmente efficace nelle prime fasi del progetto, quando la documentazione è ancora contenuta e facilmente gestibile, consentendo una verifica rapida e accurata di tutti i materiali prodotti. Si configura come una fase fondamentale per ridurre la propagazione di errori nelle fasi successive.

// Next Section 2

=== Analisi dinamica
L'analisi dinamica è una tecnica di verifica che si basa sull'esecuzione effettiva del software per individuare malfunzionamenti, bug e comportamenti inattesi. Tale approccio consente di valutare la qualità del prodotto osservandone il comportamento in condizioni controllate e riproducibili.

Nel contesto del progetto _NearYou_ di _Sync Lab_, l'analisi dinamica riveste un ruolo fondamentale, in particolare per testare la correttezza dell'elaborazione dei dati in streaming, la generazione di messaggi pubblicitari tramite LLM e la coerenza delle visualizzazioni fornite tramite dashboard.

Le principali attività previste in questa fase sono i test, ovvero l'esecuzione del codice con input definiti per verificarne il comportamento atteso. L'efficacia di un test deriva da due caratteristiche chiave:

- *Decidibilità*: un test è considerato valido se, a parità di input, produce sempre lo stesso output;
- *Ripetibilità*: il test deve poter essere eseguito più volte in ambienti diversi senza variazioni di risultato dovute a fattori esterni.

Per massimizzare la copertura e l'affidabilità, il gruppo _AlphaCode_ dovrà definire un opportuno dominio di test, ovvero l'insieme dei casi di prova necessari a verificare i requisiti funzionali e non funzionali, con attenzione particolare alle componenti più critiche, come i sistemi di geolocalizzazione, i filtri per il targeting e i prompt AI.
L'automazione dei test sarà supportata mediante strumenti come:

- *Driver*: componenti attivi che simulano input o comportamenti dell'utente o di sistemi esterni;
- *Stub*: elementi passivi che replicano funzionalità non ancora disponibili o isolate;
- *Logger*: moduli di tracciamento che registrano gli output e i risultati delle esecuzioni.

==== Test di unità
I test di unità sono progettati per verificare singole componenti del sistema in modo isolato, come ad esempio:

- un modulo di simulazione GPS;
- una funzione per il salvataggio su database;
- un handler per l'elaborazione dei prompt.

Questi test vengono generalmente scritti durante lo sviluppo e sono cruciali per intercettare errori nelle fasi iniziali. Possono essere classificati in:

- *Test funzionali*: verificano che, dato un input specifico, l'output prodotto sia corretto e conforme ai requisiti funzionali attesi (es. il generatore di messaggi produce output personalizzati corretti).

- *Test strutturali*: mirano a esplorare tutti i possibili cammini logici del codice, assicurando che ogni ramo o condizione venga eseguita almeno una volta, migliorando la copertura del codice e riducendo il rischio di errori nascosti.

==== Test di integrazione

I *test di integrazione* vengono progettati in seguito alla realizzazione dei test di unità, durante la fase di progettazione architetturale. Il loro scopo è verificare il corretto funzionamento delle interazioni tra i vari moduli software che, singolarmente, sono già stati testati e validati.

Nel contesto del progetto *NearYou*, questi test saranno particolarmente rilevanti per garantire il corretto scambio di dati tra i simulatori di posizione, i moduli di stream processing, il motore di generazione AI e le dashboard di visualizzazione.

L'integrazione tra i moduli avviene secondo un approccio incrementale, che consente di individuare e isolare più facilmente eventuali malfunzionamenti. In caso di errori critici, sarà possibile annullare temporaneamente le modifiche e ripristinare una versione stabile del sistema.

Si possono adottare due strategie principali per condurre i test:

- *Approccio Top-down*: si parte dalle componenti più esterne e interattive, come le interfacce utente o i sistemi di output, integrando progressivamente i moduli di livello inferiore. Questo approccio permette di testare fin da subito le funzionalità principali del sistema e garantisce la disponibilità anticipata di funzionalità ad alto impatto.

- *Approccio Bottom-up*: si inizia con i componenti più interni e a basso livello, come i servizi di gestione dati, database o API locali, per poi risalire alle componenti esterne. Questo metodo consente di costruire una base solida e ben verificata prima di affrontare l'integrazione con moduli più complessi.

==== Test di sistema

I *test di sistema* sono eseguiti dopo il completamento dei test di integrazione e hanno l'obiettivo di verificare che l'intero sistema risponda correttamente ai requisiti definiti nell'Analisi dei Requisiti e nel Capitolato fornito da _Sync Lab_.

Nel caso del progetto *NearYou*, ciò include la verifica del corretto funzionamento di tutte le funzionalità principali: dalla generazione dei messaggi pubblicitari personalizzati alla corretta visualizzazione su mappa, fino all'aggiornamento in tempo reale delle posizioni dei veicoli.

Questi test vengono condotti in un ambiente il più possibile simile a quello di produzione e coprono l'intera infrastruttura software, valutando la robustezza, l'affidabilità e la rispondenza dell'applicazione alle aspettative del committente.

==== Test di regressione

I *test di regressione* vengono eseguiti per assicurarsi che eventuali modifiche o migliorie introdotte nel sistema (nuove funzionalità, bug fix, refactoring) non compromettano il comportamento corretto di funzionalità già verificate in precedenza.

Si tratta di una ripetizione selettiva di test di unità, integrazione e sistema già validati, mirata a identificare possibili effetti collaterali non intenzionali. Questo tipo di test è essenziale in progetti iterativi e modulari come *NearYou*, dove l'aggiunta di nuove componenti (es. nuove fonti dati, nuovi moduli di personalizzazione) può facilmente introdurre errori in parti già funzionanti.

==== Test di accettazione

I *test di accettazione* rappresentano l'ultima fase del processo di verifica e hanno lo scopo di validare il prodotto finale rispetto ai requisiti espressi dal committente, ovvero _Sync Lab_.

Nel caso del progetto *NearYou*, i test di accettazione verificheranno che:

- il sistema generi correttamente messaggi pubblicitari personalizzati;
- i dati siano raccolti, processati e visualizzati in tempo reale;
- la piattaforma rispetti tutte le funzionalità minime previste dalla consegna della P.O.C. o, eventualmente, quelle della versione completa.

Solo il superamento di questa fase certifica ufficialmente la qualità e l'idoneità del software per l'utilizzo previsto.

== Validazione
=== Scopo e aspettative
La validazione rappresenta una fase fondamentale del ciclo di sviluppo, poiché ha l'obiettivo di accertare che il prodotto software realizzato rispecchi fedelmente le aspettative e i requisiti indicati dal committente, in questo caso _Sync Lab_.

Questa fase non si limita alla sola verifica tecnica, ma coinvolge un'analisi complessiva dell'esperienza d'uso e della reale efficacia del sistema rispetto agli obiettivi stabiliti. I principali aspetti su cui si concentra sono:

- *Aderenza ai requisiti*: il sistema deve implementare in modo completo e corretto tutte le funzionalità richieste nel capitolato;
- *Corretto funzionamento*: il comportamento del software deve risultare coerente con la logica di progettazione e senza anomalie durante l'esecuzione;
- *Usabilità*: l'interfaccia utente e le interazioni devono risultare semplici, intuitive e comprensibili per l'utente finale;
- *Efficacia*: il sistema deve essere in grado di soddisfare le esigenze operative, migliorando la rilevanza e l'impatto della comunicazione pubblicitaria.

L'obiettivo ultimo è ottenere un prodotto completo, funzionante e apprezzabile da parte del committente, sia dal punto di vista tecnico che funzionale.

=== Descrizione

La fase di validazione si basa in larga parte sui risultati ottenuti durante la fase di verifica, sfruttando i test documentati nelle sezioni precedenti (unità, integrazione, sistema, regressione e accettazione). L'elemento determinante per concludere con successo la validazione è il superamento del test di accettazione.

Questo test rappresenta la conferma finale che il sistema NearYou sviluppato dal gruppo _AlphaCode_ risponde in maniera piena ai requisiti funzionali e qualitativi attesi. Solo dopo l'esito positivo di questa fase il prodotto potrà essere considerato validato e pronto per l'utilizzo o per ulteriori estensioni.

== Gestione della configurazione
=== Descrizione

Il processo di gestione della configurazione viene applicato lungo l'intero ciclo di vita del progetto e definisce le regole adottate dal gruppo _AlphaCode_ per garantire la tracciabilità e il controllo delle modifiche apportate ai documenti e al codice sorgente. Tale processo assicura che ogni artefatto prodotto sia identificabile, monitorabile e ripristinabile, contribuendo a mantenere ordine e coerenza all'interno del progetto.

=== Scopo

Lo scopo della gestione della configurazione è garantire una corretta organizzazione e supervisione di tutte le modifiche effettuate sulla documentazione e sul codice. Ogni cambiamento sarà tracciabile e documentato, permettendo in qualsiasi momento di risalire:

- alla motivazione della modifica;
- all'autore che l'ha effettuata;
- al contesto temporale e funzionale del cambiamento.

Questo approccio consente una maggiore affidabilità e facilita l'analisi retrospettiva del lavoro svolto.

=== Versionamento

Per gestire in modo ordinato le modifiche ai documenti, _AlphaCode_ adotta una convenzione di versionamento nel formato X.Y.Z, così definita:

- *X*: identifica una nuova release stabile (o di base), (es. revisione, rilascio ufficiale). Può essere incrementata solo previa validazione;
- *Y*: rappresenta una nuova release "minore", introduce aggiunte o funzionalità base;
- *Z*: nuova release di patch che indica una modifica puntuale o minore, spesso una "messa a punto" (correzioni, nessuna aggiunta considerevole).

Ad ogni incremento di una cifra, tutte quelle alla sua destra vengono azzerate (es. da `1.2.3` a `1.3.0`, oppure da `2.0.5` a `2.1.0`).

//TODO PARTE NUOVA FATTA:

=== Tecnologie utilizzate
Per implementare efficacemente la gestione della configurazione, il gruppo _AlphaCode_ utilizza i seguenti strumenti:

- *Git*: sistema di controllo versione distribuito per tracciare ogni modifica ai documenti e al codice sorgente;
- *GitHub*: piattaforma di hosting per repository, gestione versioni, pull request e issue tracking;
- *GitPod*: ambiente di sviluppo cloud che facilita la configurazione e l'accesso uniforme agli ambienti di lavoro;
- *Docker*: per la containerizzazione delle componenti software, garantendo coerenza tra ambienti di sviluppo e di produzione;
- *Discord*: per la comunicazione e coordinamento del team durante le attività di configurazione.

=== Repository

==== Lista Repository
Il gruppo utilizza le seguenti repository all'interno dell'organizzazione GitHub "AlphaCodeSWE":

- `AlphaCode-docs-file`: contiene tutta la documentazione del progetto;
- `NearYou-Code`: contiene il codice sorgente dell'applicazione, inclusi simulatori GPS, moduli di stream processing, e componenti di visualizzazione;
- `AlphaCode-infra`: contiene la configurazione dell'infrastruttura (Docker Compose, script di deployment).

==== Struttura delle repository
La repository dei documenti è organizzata con le seguenti cartelle principali:
- `documents/`: contiene i documenti finali in formato PDF;
- `sources/`: contiene i file sorgenti Typst;
- `template/`: contiene il template condiviso per la documentazione;
- `template/assets/`: contiene immagini e altri file utilizzati nei documenti.
- `template/fonts/`: contiene eventuali font aggiuntivi utilizzati nei documenti.

// TODO aggiornare in PB
La repository del codice è organizzata secondo i principali componenti dell'architettura NearYou:
- `airflow/`: codice per gestire il caricamento periodico delle informazioni sui negozi associati nella mappa;
- `certs/`: certificati per Kafka;
- `deployment/`: configurazione per Kafka, Docker e programma di avvio;
- `docs/`: documenti per informazioni varie;
- `monitoring/`: codice di Grafana (dashboard admin) e Prometeus (monitoraggio risorse hardware);
- `requirements/`: librerie necessarie per il corretto funzionamento del codice python;
- `services/`: codice di dashboard utente e generatore di messaggi A.I.;
- `src/`: contiene cache, logger e simulatore utenti.
- Variabili di sistema e configurazione vari (`.env`, `.compose`, `.gitpod`, etc.).

Questa struttura può essere soggetta a cambiamenti giunti alla fase di PB.

// === Sincronizzazione

// TODO riscriverla;
// ==== Branch
// Non è prevista alcuna tecnica di branching nello sviluppo del P.o.C.
// Per la gestione del codice di M.V.P. il gruppo _AlphaCode_ prevede di adottare la seguente strategia di branching:

// - `main`: contiene la versione stabile e funzionante del software/documentazione;
// - `develop`: ramo principale di sviluppo, dal quale vengono creati i branch specifici per feature;
// - `feature/*`: branch dedicati allo sviluppo di specifiche funzionalità;
// - `bugfix/*`: branch dedicati alla correzione di errori;
// - `release/*`: branch preparatori per il rilascio di nuove versioni.

// ==== Pull Request
// Quando un'attività viene completata, il membro del gruppo che ci ha lavorato apre una Pull Request (PR) su GitHub. La PR deve:
// - Includere una descrizione chiara delle modifiche apportate;
// - Referenziare l'Issue correlata (usando la sintassi `closes #X`);
// - Assegnare almeno un Verificatore per la review.

// Il Verificatore controlla le modifiche, fornisce feedback se necessario, e approva la PR. Solo dopo l'approvazione, le modifiche possono essere unite al branch principale (develop o main).

// == Gestione della qualità

// TODO finire e scrivere tutti i nostri test
// === Metriche e strumenti
// Per garantire un elevato standard qualitativo, _AlphaCode_ adotta specifiche metriche e strumenti:


// Il dettaglio delle metriche è documentato nel Piano di Qualifica, insieme ai valori di soglia minimi accettabili per ciascuna di esse.

== Processi organizzativi

=== Gestione dei processi

==== Coordinamento
Il coordinamento all'interno del gruppo _AlphaCode_ avviene principalmente attraverso:

- *Riunioni periodiche*: incontri per la revisione delle attività, aggiornamenti sullo stato di avanzamento e pianificazione delle prossime attività;
- *Comunicazioni interne*: utilizzo di Discord e Telegram per comunicazioni sincrone e asincrone tra i membri del team;
- *Comunicazioni con il proponente*: interazioni via email e Google Meet con i referenti di _Sync Lab_, seguendo le modalità indicate nel capitolato.

Ogni riunione viene documentata attraverso un verbale, che include:
- Data, ora e partecipanti;
- Ordine del giorno;
- Decisioni prese;
- Attività assegnate.

=== Miglioramento

==== Scopo
Il processo di miglioramento ha lo scopo di ottimizzare continuamente le pratiche di lavoro adottate dal gruppo _AlphaCode_, identificando inefficienze e implementando soluzioni per aumentare la produttività e la qualità del lavoro svolto.

==== Descrizione
Il miglioramento dei processi si articola in:

- *Identificazione di problemi*: raccolta di feedback dai membri del team e analisi dei dati di performance;
- *Proposta di soluzioni*: discussione e valutazione di potenziali miglioramenti;
- *Implementazione dei cambiamenti*: applicazione delle soluzioni scelte;
- *Valutazione dell'efficacia*: monitoraggio dei risultati e raccolta di ulteriori feedback.

==== Metriche
Per valutare l'efficacia del processo di miglioramento, vengono utilizzate le seguenti metriche:

- *Velocità di sviluppo*: numero di task completati;
- *Tasso di regressione*: numero di bug rilevati dopo il rilascio;
- *Tempo di risoluzione dei problemi*: media del tempo necessario per risolvere un'issue;
- *Copertura dei test*: percentuale di codice coperto dai test automatizzati.

=== Formazione

==== Scopo
Il processo di formazione mira a garantire che tutti i membri del gruppo _AlphaCode_ possiedano le competenze necessarie per contribuire efficacemente al progetto *NearYou*, con particolare attenzione alle tecnologie di streaming dati, database geospaziali e modelli di linguaggio.

==== Descrizione
La formazione si articola in:

- *Sessioni di studio individuali*: ogni membro studia autonomamente le tecnologie assegnate;
- *Workshop interni*: sessioni collaborative (sincrone) o spiegazioni scritte (asincrone) per la condivisione di conoscenze;
- *Sessioni tecniche con Sync Lab*: incontri specifici con i referenti aziendali per approfondimenti su tecnologie come Apache Kafka, ClickHouse e LangChain;
- *Pair programming*: sviluppo collaborativo per trasferimento di competenze tra membri del team.

==== Strumenti
Per supportare il processo di formazione, vengono utilizzati:

- *Repository privata* per la condivisione di materiale formativo;
- *Documentazione ufficiale* delle tecnologie adottate;
- *Ambienti sandbox* per sperimentazione e prove tecniche;
- *Tutorial e corsi online* per linguaggi, stream processing, AI generativa, etc.

== Standard di qualità

=== Standard ISO/IEC 9126 per la qualità
Per la valutazione della qualità del software prodotto, _AlphaCode_ fa riferimento allo standard ISO/IEC 9126, che identifica sei caratteristiche principali del software di qualità:

==== Funzionalità
La piattaforma NearYou deve garantire:
- *Adeguatezza*: implementazione completa delle funzionalità di profilazione, generazione di annunci personalizzati e visualizzazione su mappa;
- *Accuratezza*: precisione nella geolocalizzazione e nella personalizzazione degli annunci;
- *Interoperabilità*: capacità di integrazione tra i diversi componenti (streaming, database, LLM);
- *Sicurezza*: protezione dei dati sensibili degli utenti.

==== Affidabilità
Il sistema deve garantire:
- *Maturità*: stabilità durante l'elaborazione dei dati in streaming;
- *Tolleranza agli errori*: capacità di gestire errori nei flussi di dati o nella generazione degli annunci;
- *Recuperabilità*: ripristino del funzionamento dopo eventuali crash o errori.

==== Usabilità
L'interfaccia utente deve assicurare:
- *Comprensibilità*: facilità di interpretazione degli annunci generati;
- *Apprendibilità*: curve di apprendimento rapide per utenti e client;
- *Operabilità*: semplicità di interazione con la dashboard e la web-app.

==== Efficienza
Il sistema deve garantire:
- *Comportamento temporale*: tempi di risposta adeguati per la generazione degli annunci;
- *Utilizzo risorse*: ottimizzazione nell'uso di CPU e memoria, specialmente per i componenti di stream processing.
- *Richieste API*: ottimizzazione numero di chiamate all'API di A.I. per ridurre i costi.

==== Manutenibilità
Il codice deve garantire:
- *Analizzabilità*: facilità nell'individuazione di eventuali bug;
- *Modificabilità*: semplicità nell'aggiungere nuove funzionalità o sorgenti dati;
- *Stabilità*: minimizzazione degli effetti collaterali in caso di modifiche;
- *Testabilità*: copertura di test ≥ 80%.

==== Portabilità
Il software deve garantire:
- *Adattabilità*: capacità di funzionare in diversi ambienti;
- *Installabilità*: facilità di setup tramite configurazione containerizzata;
- *Conformità*: aderenza agli standard tecnologici indicati nel capitolato.

// TODO: finire parte test
// == Metriche di qualità del processo
// Per misurare la qualità del processo di sviluppo, _AlphaCode_ utilizza le seguenti metriche:

// ==== Processi primari
// - *MPC01 - Completezza della documentazione*: percentuale di requisiti adeguatamente documentati;
// - *MPC02 - Rispetto delle scadenze*: numero di milestone raggiunte nei tempi previsti;
// - *MPC03 - Efficienza delle riunioni*: rapporto tra decisioni prese e tempo impiegato.

// TODO sistemare
// ==== Processi di supporto
// - *MPC04 - Copertura dei test*: percentuale di codice coperto da test automatici (target ≥ 80%);
// - *MPC05 - Densità di difetti*: numero di bug rilevati per 1000 righe di codice;
// - *MPC06 - Tempo di risoluzione*: tempo medio necessario per risolvere un'issue.

// == Metriche di qualità del prodotto
// Per misurare la qualità del prodotto software, _AlphaCode_ utilizza le seguenti metriche:

// ==== Funzionalità
// - *MPD01 - Precisione geospaziale*: accuratezza nella determinazione della posizione dell'utente;
// - *MPD02 - Rilevanza degli annunci*: corrispondenza tra profilo utente e annuncio generato.

// ==== Affidabilità
// - *MPD03 - Disponibilità del sistema*: percentuale di tempo in cui il sistema è operativo;
// - *MPD04 - Tempo di risposta*: latenza massima per la generazione di un annuncio.

// TODO sempre dubbio di aggiungere utilizzo richieste API
// ==== Efficienza
// - *MPD05 - Throughput*: numero di messaggi processati al secondo;
// - *MPD06 - Consumo di risorse*: utilizzo di CPU/memoria durante il picco di carico.

// ==== Manutenibilità
// - *MPD07 - Complessità ciclomatica*: misura della complessità del codice;
// - *MPD08 - Coesione dei moduli*: grado di coesione interna dei componenti software.

// Queste metriche saranno monitorate regolarmente e i risultati saranno documentati nel Piano di Qualifica, con aggiornamenti periodici in base all'avanzamento del progetto.



// TODO aggiungere formule
