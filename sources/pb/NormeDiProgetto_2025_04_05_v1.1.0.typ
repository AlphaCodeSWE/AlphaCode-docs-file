#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Norme di Progetto",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Manuel Cinnirella, Giovanni Battista Matteazzi",
      "", "Alessandro Di Pasquale, Nicolò Bovo",
      "", "Massimo Chioru, Elia Leonetti",
      "Redattori", "Giovanni Battista Matteazzi",
      "", "Alessandro Di Pasquale, Nicolò Bovo",
      "", "Massimo Chioru, Manuel Cinnirella",
      "Verificatori", "Romeo Calearo, Giovanni Battista Matteazzi",
      "", "Romeo Calearo, Manuel Cinnirella",
      "", "Alessandro Di Pasquale, Nicolò Bovo",
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-04-05",
  version: "1.1.0",
  version_history: (   
    "1.1.0", "2025-08-08", "Correzioni di struttura e coerenza", "Massimo Chioru, Alessandro Di Pasquale, Nicolò Bovo", "Romeo Calearo",

    "1.0.0", "2025-07-07", "Controllo finale del documento", "Massimo Chioru, Giovanni Battista Matteazzi", "Romeo Calearo",

    "0.9.0", "2025-06-18", "Estensione del documento", "Alessandro Di Pasquale, Manuel Cinnirella", "Giovanni Battista Matteazzi",

    "0.5.0", "2025-05-20", "Estensione del documento", "Massimo Chioru, Manuel Cinnirella ", "Romeo Calearo",

    "0.1.0", "2025-04-05", "Bozza del documento"," Alessandro Di Pasquale, Nicolò Bovo", "Manuel Cinnirella",
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
Il presente documento si propone di definire in modo organico e condiviso il "Way of Working#apice("G")" adottato dal gruppo AlphaCode#apice("G") per l'esecuzione del progetto didattico, allineandosi ai processi di Project Planning, Project Monitoring & Control e Organizational Project‑Enabling così come descritti nella norma ISO/IEC 12207:1995#apice("G"). In particolare, esso raccoglie e formalizza le best practice, i ruoli, le responsabilità e le attività che ciascun membro del team dovrà seguire, al fine di garantire un approccio professionale, coerente e riproducibile lungo tutto il ciclo di vita del progetto.

Per la sua redazione si è seguito un metodo incrementale: inizialmente è stato sviluppato un impianto base che descrive i processi fondamentali e i deliverable principali; successivamente, con l'avanzare del lavoro e il confronto continuo all'interno del team, sono state aggiunte e raffinate procedure operative, modelli di documentazione e linee guida per la gestione delle modifiche e dei rischi. Ogni nuova versione di questo documento terrà conto delle decisioni prese dal gruppo durante le revisioni periodiche, garantendo così flessibilità e capacità di adattamento senza compromettere la coerenza con gli standard internazionali.

I membri del gruppo AlphaCode si impegnano a consultare regolarmente questo documento e a rispettarne le indicazioni, assicurando così uniformità nei processi di pianificazione, monitoraggio e controllo del progetto. Tale impegno non solo favorisce la trasparenza nei confronti del proponente, ma consente anche di mantenere alta la qualità del lavoro e di tracciare in modo puntuale l'avanzamento delle attività, come prescritto dal processo di Configuration Management della ISO/IEC 12207:1995#apice("G").

== Scopo del progetto
Lo scopo di NearYou#apice("G") è progettare, realizzare e validare una piattaforma di advertising personalizzata in tempo reale#apice("G"), capace di unire flussi GPS#apice("G"), profilazione utente e AI generativa#apice("G") per produrre annunci altamente contestuali. Oltre a implementare simulatori di posizionamento, pipeline#apice("G") Kafka#apice("G")→ClickHouse#apice("G")→PostGIS#apice("G") e modelli LLM#apice("G"), il team AlphaCode#apice("G") condurrà misurazioni mirate per valutare throughput#apice("G") e latenza#apice("G") delle componenti di streaming#apice("G") (Kafka#apice("G")) e orchestrazione#apice("G") (Airflow#apice("G")), l'efficacia e i tempi di risposta delle query geospaziali#apice("G") in PostGIS#apice("G"), e la velocità di generazione e consegna degli annunci via FastAPI#apice("G"). Analizzeremo inoltre l'impatto delle operazioni AI#apice("G") su CPU e memoria e testeremo la resilienza dei microservizi#apice("G") (producer#apice("G"), consumer#apice("G"), webapp#apice("G")) in caso di picchi di traffico o failure#apice("G") di rete. Per confermare scalabilità#apice("G"), robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode#apice("G") eseguirà stress test#apice("G") ad alto carico su tutte le pipeline#apice("G"), verificando la correttezza funzionale e le performance sotto condizioni estreme.

== Riferimenti
=== Riferimenti normativi
- Capitolato d'appalto C4: NearYou, sistema di advertising
- Standard ISO/IEC 12207:1995
=== Riferimenti informativi
- I processi di ciclo di vita del software
- Glossario (v1.0.0)

= Processi primari
== Fornitura
=== Scopo
Il processo di fornitura, così come previsto dal capitolato NearYou#apice("G") e in linea con i principi della ISO/IEC 12207:1995#apice("G"), costituisce il momento in cui il team AlphaCode#apice("G") definisce formalmente i termini della collaborazione con il proponente (_Sync Lab#apice("G")_). Attraverso un contratto condiviso, vengono stabiliti i requisiti funzionali e non funzionali - dal simulatore GPS#apice("G") fino all'integrazione con i modelli di AI generativa#apice("G") - i vincoli tecnologici e di sicurezza (ad esempio l'adozione di SSL/TLS#apice("G") e di database PostGIS#apice("G")/ClickHouse#apice("G")) e le milestone temporali per la consegna di ciascun deliverable. Questo accordo non è un semplice atto burocratico, ma la bussola che guida ogni attività del gruppo, permettendo di tracciare costantemente lo stato di avanzamento, individuare eventuali scostamenti e riallinearsi alle attese del proponente. Solo dopo aver formalizzato questi punti, AlphaCode#apice("G") procede alla redazione del Piano di Progetto, che dettaglia in modo sistematico tempi, risorse, ruoli e modalità di controllo necessari per una realizzazione ordinata e trasparente.

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
Il gruppo _AlphaCode#apice("G")_ si impegna a mantenere una collaborazione costante e professionale con l'azienda proponente _Sync Lab#apice("G")_, facendo riferimento ai contatti indicati nel capitolato, in particolare i referenti tecnici Davide Zorzi e Andrea Dorigo, con Federico Pallaro sempre in copia nelle comunicazioni.

Attraverso un dialogo continuo, il gruppo intende assicurarsi che il lavoro svolto sia allineato alle richieste del capitolato, ricevendo feedback regolari e chiarendo tempestivamente eventuali dubbi. L'obiettivo è garantire che vincoli, requisiti e scadenze siano rispettati, offrendo trasparenza sullo stato di avanzamento del progetto e favorendo una collaborazione efficace durante tutte le fasi dello sviluppo.

=== Comunicazioni con il proponente
Per garantire un flusso comunicativo efficace e trasparente, il gruppo AlphaCode#apice("G") ha concordato con l'azienda proponente _Sync Lab#apice("G")_ una cadenza settimanale per gli incontri esterni tramite piattaforma Google Meet, durante i quali vengono affrontate le principali criticità e discussi i progressi del progetto. Tali riunioni avvengono generalmente in modalità telematica e vedono la partecipazione attiva dei referenti tecnici indicati nel capitolato.

Gli incontri hanno lo scopo di:
- chiarire dubbi sui requisiti o sui vincoli progettuali;
- discutere le tecnologie adottate o future integrazioni;
- raccogliere feedback sulle componenti sviluppate.

Ogni colloquio viene documentato attraverso la stesura di un Verbale Esterno, che include data, partecipanti e contenuti rilevanti emersi dalla discussione. I verbali vengono salvati in una cartella dedicata all'interno della repository ufficiale del progetto, in modo da garantirne la tracciabilità e l'accessibilità per tutte le parti coinvolte.

=== Documentazione fornita
Il gruppo AlphaCode#apice("G") si impegna a produrre e consegnare una documentazione completa e strutturata, rivolta sia all'azienda proponente _Sync Lab#apice("G")_, sia ai committenti Prof. Tullio Vardanega e Prof. Riccardo Cardin.

==== Valutazione dei Capitolati
Il documento di Valutazione dei Capitolati ha lo scopo di analizzare in maniera approfondita i progetti proposti dalle aziende nella giornata del 2025/03/04. Per ogni capitolato presentato, il gruppo AlphaCode#apice("G") ha identificato le esigenze del proponente, le potenziali soluzioni tecniche e le eventuali criticità che avrebbero potuto ostacolare lo sviluppo.

La valutazione si articola in sezioni ben definite che comprendono:

- *Descrizione*: include il nome del progetto, l'azienda proponente e le informazioni principali relative al prodotto, così come presentato;
- *Dominio applicativo*: definisce il contesto in cui il progetto si colloca, con particolare attenzione agli utenti finali e agli scenari d'uso;
- *Dominio tecnologico*: elenca gli strumenti, linguaggi, framework e infrastrutture richiesti;
- *Aspetti positivi*: evidenzia le opportunità di apprendimento e di innovazione legate al progetto;
- *Fattori critici*: analizza eventuali rischi o complessità, sia tecniche che organizzative;
- *Conclusione*: motiva la scelta o la non scelta del capitolato sulla base di criteri condivisi dal gruppo.

Nel caso specifico, il gruppo AlphaCode#apice("G") ha scelto di aderire al Capitolato C4 - NearYou#apice("G"), proposto dall'azienda _Sync Lab#apice("G")_, per l'interesse dimostrato verso le tecnologie di streaming#apice("G") dati, la componente geospaziale#apice("G") e l'integrazione con tecniche di AI#apice("G") generativa.

==== Analisi dei Requisiti
Il documento di Analisi dei Requisiti ha il compito di descrivere nel dettaglio le funzionalità che il sistema NearYou#apice("G") dovrà offrire, oltre ai vincoli da rispettare affinché il prodotto risulti conforme alle aspettative espresse nel capitolato e alle necessità del proponente _Sync Lab#apice("G")_.

All'interno del documento vengono fornite le seguenti informazioni:

- *Descrizione del prodotto*: viene delineato l'obiettivo generale del sistema, ovvero la creazione di una piattaforma per l'advertising personalizzato basata su flussi GPS#apice("G"), profilazione utenti e AI#apice("G") generativa, con evidenza sulle sue principali funzionalità in ambito di raccolta, trasformazione e analisi dei dati.

- *Casi d'uso*: il sistema viene descritto attraverso una serie di scenari d'uso concreti che illustrano come gli utenti interagiscono con la piattaforma. Ogni caso d'uso evidenzia lo scenario, gli attori coinvolti (ad esempio: utenti, amministratori#apice("G"), processi automatici) e le azioni che questi possono compiere.

- *Requisiti funzionali e non funzionali*: sono elencati tutti i requisiti identificati, siano essi forniti esplicitamente dal proponente o dedotti dal gruppo sulla base delle funzionalità richieste. Tali requisiti vengono classificati come:
  - *Obbligatori*: indispensabili per il funzionamento minimo del sistema;
  - *Desiderabili*: utili al miglioramento della qualità e dell'esperienza utente;
  - *Opzionali*: funzionalità aggiuntive implementabili in funzione del tempo disponibile.
  - *Facoltativi*: funzionalità che potrebbero essere implementate in futuro, ma non sono essenziali per il rilascio iniziale.

L'analisi dei requisiti rappresenta la base per l'intero processo di sviluppo e verrà aggiornata in modo incrementale#apice("G") in caso emergano nuove necessità o cambiamenti durante le fasi progettuali.

==== Piano di Progetto
Il Piano di Progetto è un documento strategico, redatto e mantenuto dal Responsabile#apice("G") di Progetto con il supporto dell'Amministratore#apice("G"), che ha lo scopo di guidare lo sviluppo del sistema NearYou#apice("G") attraverso una pianificazione strutturata, realistica e monitorabile. Viene costantemente aggiornato per riflettere l'evoluzione delle attività, dei vincoli e delle decisioni progettuali.

Il documento comprende:

- *Analisi dei rischi*: il gruppo identifica e classifica le possibili problematiche che potrebbero compromettere il corretto svolgimento delle attività, distinguendo tra:
  - _Rischi organizzativi_, legati a dinamiche di gruppo, pianificazione e comunicazione;
  - _Rischi tecnologici_, relativi all'integrazione di strumenti complessi come Kafka#apice("G"), ClickHouse#apice("G"), PostGIS#apice("G") e modelli AI#apice("G") generativi.
Per ogni rischio vengono definite misure preventive e correttive per contenerne l'impatto.

- *Modello di sviluppo*: viene illustrata la strategia metodologica adottata dal team AlphaCode#apice("G"), che segue un approccio incrementale#apice("G") ed iterativo, ispirato a pratiche agili, per garantire una costante validazione degli obiettivi raggiunti e la massima adattabilità ai feedback. Al termine della fase di RTB, è stato deciso di adottare, per la fase di PB#apice("G"), il modello con sprint Scrum, così da strutturare il lavoro in cicli brevi e focalizzati, favorendo trasparenza, ispezione e adattamento continuo, e consentendo una fase di correzione e ritorno sugli elementi che necessitano di miglioramento.

- *Pianificazione*: il lavoro viene suddiviso in periodi chiave (milestone), ognuno dei quali è corredato da una panoramica delle attività previste, dei ruoli assegnati, delle responsabilità individuali e delle stime di impegno in termini di ore/uomo.

- *Preventivo*: include una stima temporale dettagliata del carico di lavoro previsto per ogni membro del gruppo, tenendo conto delle complessità tecniche e delle dipendenze tra le attività.

- *Consuntivo*: al termine di ciascun periodo pianificato, viene effettuata un'analisi delle attività realmente svolte rispetto a quanto previsto. Questo confronto consente di individuare eventuali scostamenti, valutarne le cause ed effettuare un aggiornamento del piano nelle fasi successive.

Il Piano di Progetto è uno strumento fondamentale per mantenere il controllo sul progresso del lavoro e per garantire il raggiungimento degli obiettivi nei tempi e modi concordati con il proponente.

==== Piano di Qualifica
Il Piano di Qualifica è il documento che delinea le strategie, le metriche e le attività adottate dal gruppo AlphaCode#apice("G") per garantire la qualità del sistema NearYou#apice("G"), sia a livello di processo che di prodotto. Rappresenta un riferimento centrale per tutti i membri del team durante lo sviluppo, al fine di assicurare che il risultato finale sia conforme alle aspettative del proponente e agli standard richiesti.

Il documento è strutturato in quattro sezioni principali:

- *Qualità di processo*: vengono definite le metriche da rispettare per monitorare l'efficacia e l'efficienza del ciclo di sviluppo. Tra questi parametri figurano la tracciabilità dei requisiti, la copertura della verifica e il rispetto delle scadenze prefissate.

- *Qualità di prodotto*: si stabiliscono i criteri per valutare le caratteristiche del software, come manutenibilità, affidabilità, usabilità e performance. Questi aspetti saranno misurati tramite indicatori oggettivi e soggettivi, per garantire un risultato stabile e robusto.

- *Test*: la sezione include la descrizione delle attività di test previste (test funzionali) e i criteri di accettazione per ogni funzionalità. I test saranno fondamentali per verificare che ogni componente del sistema rispetti i requisiti.

- *Valutazioni per il miglioramento*: al termine di ogni ciclo di verifica, verranno registrati i risultati ottenuti, segnalate le criticità emerse e proposte azioni correttive. Questo approccio incrementale#apice("G") permetterà di migliorare costantemente la qualità complessiva del progetto.

Il Piano di Qualifica assume quindi un ruolo chiave nell'assicurare che il progetto NearYou#apice("G") sia sviluppato secondo metodologie rigorose e orientate alla qualità, permettendo di mantenere sotto controllo tutti gli aspetti critici legati alla verifica e alla validazione del sistema.

==== Glossario
Il Glossario costituisce un dizionario tecnico completo che raccoglie e definisce tutti i termini specialistici, acronimi e concetti utilizzati nella documentazione del progetto _NearYou#apice("G")_. Questo documento serve come riferimento unificato per garantire una comprensione univoca e coerente della terminologia adottata.

Il documento presenta:

- *Organizzazione alfabetica*: tutti i termini sono ordinati alfabeticamente per facilitare la consultazione rapida e l'individuazione delle definizioni necessarie.

- *Definizioni tecniche*: ogni termine include una spiegazione chiara e precisa del suo significato nel contesto del progetto, con particolare attenzione ai concetti legati a:
  - Tecnologie utilizzate (Docker#apice("G"), Kafka#apice("G"), ClickHouse#apice("G"), PostGIS#apice("G"), LLM#apice("G"), ecc.)
  - Metodologie di sviluppo (design patterns, architetture, testing)
  - Metriche e indicatori di progetto (EV, AC, CPI, SPI, ecc.)
  - Terminologia del dominio applicativo (advertising, geolocalizzazione, streaming#apice("G") dati)

- *Acronimi e abbreviazioni*: espansione completa di tutte le sigle utilizzate nei documenti, con spiegazione del loro significato e contesto d'uso.

- *Concetti del dominio*: definizione di termini specifici del settore advertising e delle tecnologie geospaziali#apice("G"), essenziali per la comprensione del progetto.

Il Glossario garantisce che tutti i stakeholder del progetto - membri del team, committenti e proponente - condividano una comprensione uniforme della terminologia utilizzata, riducendo ambiguità e migliorando la qualità della comunicazione tecnica.

== Sviluppo
=== Scopo
In conformità allo standard ISO/IEC 12207:1995#apice("G"), il processo di sviluppo ha lo scopo di definire e gestire le attività tecniche necessarie per trasformare i requisiti del proponente in un prodotto software conforme e funzionante.
Per il progetto NearYou#apice("G"), il processo include l'analisi dei requisiti, la progettazione architetturale e di dettaglio, l'implementazione delle componenti, l'integrazione dei vari moduli, il collaudo del sistema, la sua installazione in ambiente operativo e l'accettazione finale da parte del committente.
Tutte le attività sono guidate da pratiche di sviluppo incrementali#apice("G") e iterative, con l'obiettivo di assicurare qualità, tracciabilità dei requisiti e aderenza ai vincoli tecnologici stabiliti nel capitolato.

==== Implementazione del processo
L'implementazione del processo di sviluppo per il progetto NearYou#apice("G") ha avuto inizio con la scelta di un modello di ciclo di vita incrementale#apice("G") ed iterativo, compatibile con i vincoli temporali e con l'evoluzione graduale dei requisiti. Il team AlphaCode#apice("G") ha definito in modo chiaro i ruoli e le responsabilità di ogni membro, assicurando la copertura di aspetti fondamentali come la redazione della documentazione, la gestione delle configurazioni (tramite Git#apice("G")), la risoluzione dei problemi, e il supporto alla qualità.

Per mantenere coerenza e tracciabilità nel processo, sono stati adottati standard di codifica, strumenti di automazione (come Docker#apice("G"), Gitpod e Airflow#apice("G")), metodi di verifica continua e linguaggi adeguati allo scopo.

Il gruppo ha anche pianificato l'utilizzo di risorse condivise, ambienti di sviluppo replicabili e tool di gestione collaborativa (come GitHub#apice("G") e Discord), per garantire trasparenza, coordinamento e continuità.

=== Descrizione
Le attività che compongono il processo di sviluppo del progetto NearYou#apice("G"), strutturate secondo lo standard ISO/IEC 12207:1995#apice("G"), sono organizzate in fasi sequenziali e iterabili, ciascuna mirata alla costruzione incrementale#apice("G") del sistema:

- *Definizione del processo di sviluppo*: formalizzazione del flusso operativo e delle pratiche adottate dal gruppo, incluso l'uso di strumenti e metodologie agili.
- *Analisi dei requisiti di sistema*: studio dei requisiti funzionali e non funzionali forniti dal capitolato, con valutazione di vincoli architetturali e tecnologici.
- *Progettazione dell'architettura di sistema*: definizione dei macro-componenti e della loro interazione (es. Kafka#apice("G"), ClickHouse#apice("G"), PostGIS#apice("G"), WebApp#apice("G")).
- *Analisi dei requisiti software*: individuazione delle funzionalità specifiche di ogni modulo software, come il consumer#apice("G") Kafka#apice("G"), i DAG#apice("G") di Airflow#apice("G"), o la web app FastAPI#apice("G").
- *Progettazione architetturale del software*: suddivisione in microservizi#apice("G"), definizione delle interfacce, scelte tecnologiche (containerizzazione#apice("G"), sicurezza SSL/TLS#apice("G"), ecc.).
- *Progettazione dettagliata del software*: specifica dei componenti interni, logiche di business, gestione degli errori, logging#apice("G"), sicurezza e configurabilità.
- *Codifica e testing unitario*: sviluppo del codice con pratiche di qualità e test delle singole unità.
- *Integrazione progressiva*: combinazione delle componenti in ambienti Docker#apice("G") tramite Docker Compose#apice("G").
- *Test di qualifica del software*: verifica che ogni modulo soddisfi i requisiti previsti (es. throughput#apice("G") del producer#apice("G"), correttezza del consumer#apice("G"), efficienza dei DAG#apice("G")).
- *Integrazione di sistema*: test del sistema completo, inclusi pipeline#apice("G") Kafka#apice("G")→ClickHouse#apice("G")→PostGIS#apice("G") e moduli AI#apice("G").
- *Test di qualifica di sistema*: valutazione delle prestazioni, affidabilità, sicurezza e scalabilità#apice("G") del sistema.
- *Installazione del sistema in ambiente target*: configurazione degli ambienti Gitpod e/o locali tramite Docker#apice("G").
- *Supporto all'accettazione*: fornitura di documentazione tecnica e dimostrazione del prodotto, con eventuali sessioni di collaudo da parte del proponente.

==== Analisi dei requisiti di sistema
Nel contesto dell'Analisi dei Requisiti di Sistema, il processo ha coinvolto il team AlphaCode#apice("G") nell'esecuzione e nel supporto delle attività previste dal capitolato NearYou#apice("G"). La prima fase ha richiesto l'analisi dell'uso specifico del sistema in sviluppo, volto alla realizzazione di una piattaforma per l'advertising personalizzato basata sull'integrazione di dati GPS#apice("G"), profilazione utente e AI generativa#apice("G"). Tale analisi ha permesso di definire accuratamente i requisiti di sistema.

Questi requisiti includono funzionalità come il consumo e la gestione in tempo reale#apice("G") di flussi Kafka#apice("G"), la persistenza efficiente in ClickHouse#apice("G"), l'esecuzione di query#apice("G") spaziali in PostGIS#apice("G"), la generazione dinamica di annunci tramite modelli LLM#apice("G"), nonché la comunicazione sicura tramite certificati SSL/TLS#apice("G"). Sono stati inoltre definiti i requisiti relativi alle performance del sistema, all'affidabilità, alla manutenibilità, alle interfacce, all'operatività e alla sicurezza, insieme ai vincoli di progettazione, ambienti d'esecuzione (containerizzati#apice("G")) e requisiti di qualifica.

La fase successiva ha previsto la valutazione di tali requisiti in base alla loro rintracciabilità rispetto ai bisogni espressi dal proponente, alla coerenza interna, alla testabilità e alla fattibilità architetturale. È stata inoltre verificata la sostenibilità delle operazioni e della manutenzione a lungo termine. I risultati delle analisi sono stati accuratamente documentati nel relativo documento di Analisi dei Requisiti, che costituisce base fondante per le attività di progettazione e sviluppo.

==== Analisi dei requisiti software
Nel contesto del progetto NearYou#apice("G"), l'analisi dei requisiti software ha avuto lo scopo di identificare e documentare in maniera strutturata tutte le caratteristiche funzionali e non funzionali necessarie alla realizzazione degli elementi software che compongono la piattaforma. Per ciascun modulo identificato (es. microservizi#apice("G") Kafka#apice("G"), consumer#apice("G"), producer#apice("G"), FastAPI#apice("G"), DAG#apice("G") Airflow#apice("G")), il team ha definito:

- _Specifiche funzionali e prestazionali_, tenendo conto delle capacità di throughput#apice("G"), latenza#apice("G") di risposta, volume dati gestito e resilienza;
- _Interfacce esterne_, in particolare tra Kafka#apice("G") ↔ ClickHouse#apice("G"), ClickHouse#apice("G") ↔ FastAPI#apice("G") e tra API#apice("G") ↔ frontend;
- _Requisiti di sicurezza_, relativi alla comunicazione cifrata tramite SSL/TLS#apice("G"), gestione dei certificati SSL/TLS#apice("G") e protezione dei dati trasmessi e memorizzati;
- _Aspetti legati all'usabilità e all'interazione utente-sistema nella webapp#apice("G")_, anche in scenari con accesso simultaneo e consultazione dei dati tramite dashboard#apice("G");
- _Definizione dei dati gestiti_, tra cui eventi GPS#apice("G"), utenti, POI, annunci e le strutture dei relativi database#apice("G") (ClickHouse#apice("G") e PostGIS#apice("G"));
- _Requisiti di deploy#apice("G")_, operatività e manutenzione dei container Docker#apice("G") e dei servizi;
- _Documentazione prevista per l'utente e per lo sviluppatore_ (es. API#apice("G") reference, struttura delle query#apice("G") in Grafana#apice("G"));
A completamento dell'analisi, ogni requisito è stato valutato in base a:
- Rintracciabilità rispetto ai requisiti di sistema;
- Coerenza interna ed esterna con le specifiche architetturali;
- Fattibilità di sviluppo e mantenimento.

==== Progettazione architetturale del sistema
Nel contesto della progettazione architetturale del sistema NearYou#apice("G"), la prima fase ha previsto la definizione di un'architettura ad alto livello basata su una composizione di microservizi#apice("G") containerizzati#apice("G"), orchestrati tramite Docker Compose#apice("G"). Sono stati identificati i principali componenti del sistema, tra cui: generatori di dati GPS#apice("G"), broker#apice("G") Kafka#apice("G") per lo streaming#apice("G") sicuro (SSL/TLS#apice("G")), Bytewax#apice("G") come stream processor#apice("G"), database#apice("G") analitico ClickHouse#apice("G"), sistema geospaziale#apice("G") PostGIS#apice("G"), orchestratore#apice("G") Airflow#apice("G"), API#apice("G") FastAPI#apice("G") per la generazione di annunci personalizzati tramite modelli LLM#apice("G") e interfaccia Grafana#apice("G") per la visualizzazione dei dati.

Tutti i requisiti del sistema sono stati allocati con precisione ai rispettivi elementi architetturali, distinguendo tra componenti software, operazioni automatizzate (es. DAG#apice("G") di Airflow#apice("G")) e interazioni manuali (es. generazione certificati, monitoraggio#apice("G")).

Successivamente è stata condotta una valutazione dell'architettura proposta, con particolare attenzione alla tracciabilità dei requisiti, alla coerenza tra i moduli, all'adeguatezza degli standard tecnologici adottati, alla fattibilità implementativa dei singoli elementi software e alla manutenibilità del sistema.

=== Progettazione architetturale del software
Per ciascun elemento software identificato nel progetto NearYou, l'attività di progettazione architetturale comprende i seguenti compiti:

- *Conversione dei requisiti in architettura*: Gli sviluppatori traducono i requisiti software in una struttura architetturale ad alto livello, identificando chiaramente i componenti software necessari (ad esempio: modulo simulazione GPS#apice("G"), stream processor#apice("G") Kafka#apice("G")/Bytewax#apice("G"), servizio LLM#apice("G") con LangChain, dashboard#apice("G") analitica Grafana#apice("G"), web-app frontend). Ogni requisito viene assegnato a un componente specifico, facilitando la successiva progettazione dettagliata. L'intera architettura viene documentata tramite diagrammi C4 (System, Container, Component).

- *Progettazione di alto livello delle interfacce*: Definizione e documentazione del progetto preliminare delle interfacce tra i componenti software (REST API#apice("G"), WebSocket#apice("G"), formati di messaggi JSON#apice("G")/Avro#apice("G")) e le interfacce esterne al sistema (ad esempio database#apice("G") geospaziali#apice("G")).

- *Progettazione di alto livello del database#apice("G")*: Definizione della struttura preliminare del database#apice("G") geospaziale#apice("G") (PostGIS#apice("G")) e analitico (ClickHouse#apice("G")), indicando soltanto schemi tabellari principali, indici geospaziali#apice("G") e strategie di partizionamento dei dati temporali, senza entrare nei dettagli dei campi o dei tipi.

- *Valutazione dell'architettura e interfacce*: Esecuzione di una valutazione strutturata dell'architettura proposta e dei progetti preliminari delle interfacce e dei database#apice("G"), verificando rintracciabilità dei requisiti, coerenza interna ed esterna, adeguatezza delle tecnologie suggerite (Kafka#apice("G"), Bytewax#apice("G"), LangChain, PostGIS#apice("G")), fattibilità della progettazione dettagliata e semplicità di manutenzione.

- *Revisione formale*: Conduzione di una o più revisioni formali (peer review) con tutto il team AlphaCode#apice("G") e l'azienda proponente, validando l'architettura definita e apportando eventuali miglioramenti derivanti dai feedback raccolti.

=== Progettazione dettagliata del software
Per ciascun componente software identificato nel progetto NearYou#apice("G"), l'attività prevede:

- *Progettazione dettagliata dei componenti software*: Definizione puntuale di unità software (moduli Python, funzioni, classi, query#apice("G") SQL) per simulazione dati, stream processing#apice("G") (Kafka#apice("G")/Bytewax#apice("G")), generazione annunci (LangChain), dashboard#apice("G") analitica e web-app, in modo che ciascuna unità sia immediatamente codificabile e testabile.

- *Progettazione dettagliata delle interfacce*: Documentazione tecnica precisa delle API#apice("G") REST, WebSocket#apice("G") e schemi JSON#apice("G")/Avro#apice("G"), incluse specifiche complete per la codifica diretta senza ambiguità.

- *Progettazione dettagliata del database#apice("G")*: Definizione completa della struttura delle tabelle PostGIS#apice("G") (positions, places, ads) e ClickHouse#apice("G"), specificando campi, tipi di dato, indici e partizioni.

- *Aggiornamento preliminare della documentazione utente* *(in fase di progettazione)*: Revisione e ampliamento della documentazione utente con dettagli tecnici aggiornati e indicazioni operative più complete.

- *Aggiornamento requisiti e pianificazione integrazione software*: Revisione delle strategie e dei criteri per test di integrazione software (Docker Compose#apice("G")).

- *Valutazione della progettazione dettagliata e test*: Analisi documentata sulla base di rintracciabilità requisiti, coerenza architetturale, semplicità di manutenzione, fattibilità dei test unitari e di integrazione.

- *Revisione formale interna*: Una o più sessioni di revisione obbligatorie del team AlphaCode#apice("G") per verificare la progettazione.

=== Codifica e testing del software
Per ciascuna unità software del progetto NearYou, il programmatore svolge le seguenti attività:

- *Codifica unità software e database#apice("G")*: Sviluppo e documentazione delle unità software (Python 3.12, JavaScript#apice("G") ) e relativi schemi di database#apice("G") (PostGIS#apice("G"), ClickHouse#apice("G")).

- *Esecuzione e documentazione test unitari*: Conduzione sistematica dei test automatizzati per verificare conformità ai requisiti funzionali e tecnici, riportando chiaramente i risultati in report strutturati.

- *Aggiornamento documentazione utente* *(in corso d'opera, post-codifica)*: Revisione e integrazione continua delle guide operative e manuali utente per riflettere tutte le modifiche effettuate nel software.

- *Aggiornamento requisiti e piano integrazione software*: Affinamento dei requisiti e del piano di test di integrazione basato su Docker Compose#apice("G").

- *Valutazione codice e test*: 
  - Tracciabilità codice-requisiti;
  - Coerenza interna ed esterna delle unità;
  - Adeguata copertura dei test (≥ 80 %);
  - Conformità agli standard di codifica adottati;
  - Fattibilità tecnica di integrazione e manutenzione.

=== Integrazione del software
Per il progetto NearYou#apice("G"), l'integrazione software comprende:

- *Sviluppo del Piano di Integrazione*: Documentazione delle procedure#apice("G") e sequenze di integrazione delle unità software (moduli Python, servizi Docker#apice("G")), inclusi requisiti di test, dati, responsabilità assegnate e pianificazione delle attività.

- *Esecuzione integrazione e test*: Unione progressiva delle unità software secondo il piano, effettuando test di integrazione con ambienti Docker Compose#apice("G") per verificare il rispetto dei requisiti funzionali e non funzionali definiti nel capitolato.

- *Aggiornamento della documentazione utente* *(post-integrazione)*: Revisione e aggiornamento della documentazione operativa per riflettere i cambiamenti dovuti all'integrazione.

- *Preparazione Test di Qualificazione del Software*: Creazione di casi e procedure di test specifiche per ciascun requisito del software integrato, assicurando che l'insieme integrato soddisfi tutti i criteri di qualificazione previsti (copertura ≥ 80%).

- *Valutazione integrazione software*: Verifica con particolare attenzione a:
  - Tracciabilità completa ai requisiti di sistema;
  - Coerenza interna/esterna dell'integrazione;
  - Adeguata copertura dei test;
  - Rispetto dei metodi e standard adottati;
  - Conformità dei risultati ai requisiti previsti;
  - Fattibilità operativa e manutentiva della piattaforma.

=== Test di qualifica del software
Per il progetto NearYou#apice("G"), l'attività comprende:

- *Esecuzione test di qualificazione*: Test approfonditi delle funzionalità software integrate, secondo i requisiti definiti nel Piano di Qualifica (copertura test ≥ 80%). I risultati sono formalmente documentati.

- *Aggiornamento documentazione utente* *(post-test di qualifica)*: Revisione della documentazione utente per riflettere tutte le modifiche e miglioramenti introdotti dopo i test.

- *Valutazione del prodotto software*: Revisione formale basata su:

  - Copertura completa dei requisiti software;

  - Conformità ai risultati attesi;

  - Fattibilità tecnica e operativa dell'integrazione e dei test di sistema;

  - Manutenibilità e operatività futura del sistema.

*Preparazione per integrazione di sistema*:
Aggiornamento del prodotto software e definizione di una baseline#apice("G") stabile del codice e del design software, pronta per la fase successiva di integrazione di sistema.

=== Integrazione di sistema

Inizialmente, le componenti software del sistema NearYou#apice("G") devono essere integrate tra loro e con gli elementi di simulazione hardware (ad esempio, generatori di dati GPS#apice("G") e sensori simulati), operazioni manuali (come la configurazione dei dataset utente) e altri sistemi esterni (ad esempio, modelli LLM#apice("G") e piattaforme di visualizzazione). Gli aggregati, come il flusso dati (dai simulatori al message broker#apice("G"), allo stream processing#apice("G"), al database#apice("G") e alla AI generativa#apice("G")), devono essere testati incrementalmente#apice("G") durante lo sviluppo, verificando la conformità ai requisiti funzionali e non funzionali definiti nel capitolato. L'integrazione e i risultati dei test devono essere documentati in modo dettagliato, inclusi schemi logici del comportamento dei simulatori e report di copertura dei test (≥80%).

Successivamente, per ciascun requisito di qualificazione del sistema (MVP o prodotto completo), è necessario sviluppare e documentare: 
- *Casi di test*: input (es. percorsi GPS#apice("G") predefiniti, profili utente), output attesi (es. annunci contestuali generati da LLM#apice("G")), criteri di accettazione (es. latenza#apice("G") massima consentita, precisione geospaziale#apice("G"));  
- *Procedure#apice("G") di test*: esecuzione manuale o automatizzata, convalidata in presenza della Proponente.

La valutazione del sistema integrato deve considerare i seguenti criteri, documentando i risultati:  
- *Copertura dei test*: rispetto ai requisiti di sistema (es. supporto di più sorgenti dati, interpolazione contestuale, gestione di percorsi non predefiniti);  
- *Appropriatezza dei metodi*: allineamento con le tecnologie proposte (Kafka#apice("G"), Bytewax#apice("G"), LangChain) e standard di settore per lo stream processing#apice("G") e l'AI#apice("G");  
- *Conformità ai risultati attesi*: coerenza tra annunci generati e contesto utente (es. target giovane vs. coppia), corretto salvataggio dei dati su storage ottimizzato (ClickHouse#apice("G"), PostGIS#apice("G"));  
- *Fattibilità del test di qualificazione*: capacità di replicare scenari reali (es. picchi di dati, failure#apice("G") di rete) e integrazione con strumenti di visualizzazione (Superset, web-app);  
- *Fattibilità di operatività e manutenzione*: modularità dell'architettura, documentazione delle scelte progettuali (es. utilizzo di HiveMQ vs. RabbitMQ) e gestione degli eventuali problemi aperti.

=== Test di qualifica del sistema

*Il testing di qualificazione per NearYou#apice("G") deve verificare*:

- Conformità ai requisiti (simulatori GPS#apice("G"), LLM#apice("G"), dashboard#apice("G") base);

- Funzionalità critiche: generazione annunci contestuali (es. target specifici), integrazione con broker#apice("G") (Kafka#apice("G")/HiveMQ), persistenza dati (ClickHouse#apice("G")/PostGIS#apice("G")).

*Criteri di valutazione*:

- *Copertura test*: Requisiti avanzati (interpolazione contestuale, visualizzazione lato utente).

- *Conformità*: Correlazione annunci-contesto utente, precisione geospaziale#apice("G"), prestazioni storage.

- *Fattibilità operativa*: Architettura modulare, documentazione chiara (scelte tecnologiche, es. LangChain).

*Post-verifica*:

- Consegnare pacchetto software con codice, configurazioni, dashboard#apice("G") (Superset/Grafana#apice("G")) e web-app demo.

- Stabilire baseline#apice("G") tramite versionamento (Git#apice("G")) e documentazione progettuale aggiornata.

=== Installazione del software

Il fornitore deve sviluppare un piano di installazione del sistema NearYou#apice("G"), considerando:

- *Ambiente di destinazione*: Configurazione di server/cloud per componenti chiave (message broker#apice("G"), stream processing#apice("G"), database#apice("G"), LLM#apice("G"));

- *Risorse necessarie*: Librerie Python (es. Faker#apice("G")), container Docker#apice("G") (per Kafka#apice("G"), Bytewax#apice("G"), Superset), accesso a modelli LLM#apice("G") (es. API#apice("G") OpenAI#apice("G"), Groq#apice("G") Cloud o open-source);

- *Supporto alla configurazione*: Assistenza alla Proponente (_Sync Lab#apice("G")_) per integrare dataset predefiniti, percorsi simulati e parametri di personalizzazione annunci.
In caso di sostituzione di sistemi esistenti, garantendo la compatibilità dei formati dati. Il piano deve includere schemi logici e istruzioni dettagliate per l'avvio delle simulazioni (GPS#apice("G"), stato fisico).

*Esecuzione dell'installazione*: Il fornitore installerà il software conformemente al piano, garantendo:

- *Inizializzazione corretta*: Avvio dei broker#apice("G") (Kafka#apice("G")/HiveMQ), connessione allo stream processing#apice("G") (Bytewax#apice("G")), configurazione dello storage (ClickHouse#apice("G")/PostGIS#apice("G")) e integrazione con LLM#apice("G") (LangChain);

- *Funzionamento atteso*: Verifica che i dati simulati generino annunci contestuali e che le dashboard#apice("G") (Superset/Grafana#apice("G")/web-app) visualizzino posizioni e messaggi in tempo reale#apice("G");

=== Supporto all'accettazione del software

Il team di sviluppo dovrà coordinarsi in tutte le fasi di verifica e validazione della soluzione, ponendo particolare attenzione all'integrazione dei simulatori GPS#apice("G"), al corretto funzionamento del message broker#apice("G") per lo streaming#apice("G") dei dati e all'implementazione dei moduli di AI generativa#apice("G") per la creazione di annunci personalizzati. Le prove, siano esse a livello unitario o integrato, devono dimostrare che l'intero sistema - dalla raccolta e memorizzazione dei dati alla visualizzazione in dashboard#apice("G") - soddisfi i requisiti tecnici e funzionali previsti.  

Per ogni fase, è necessario documentare accuratamente i risultati, includendo le metriche prestazionali e il livello di copertura dei test (minimo 80%), in modo da identificare e risolvere eventuali criticità.

= Processi di supporto
== Documentazione

=== Scopo 
Il processo di documentazione ha lo scopo di garantire tracciabilità, coerenza e qualità nelle attività del progetto *NearYou#apice("G")*, allineandosi alle specifiche del Capitolato C4 di _Sync Lab#apice("G")_. Le norme definiscono linee guida per la gestione della documentazione tecnica e di progetto, con particolare attenzione all'integrazione di tecnologie avanzate (AI#apice("G"), streaming#apice("G") dati, geolocalizzazione) e al rispetto dei criteri di completamento definiti dal proponente.

=== Descrizione
Questa sezione regolamenta la creazione, revisione e approvazione di tutti i documenti relativi al progetto, inclusi:  
- Documentazione tecnica (architettura, scelte tecnologiche, test);
- Manuali utente e cliente;
- Documentazione per gli stakeholder (demo, presentazioni finali).  
Le norme garantiscono conformità con i requisiti del capitolato, come l'uso di *LangChain* per gli LLM#apice("G"), l'integrazione di *Apache Kafka#apice("G")* per lo streaming#apice("G"), e i criteri di testing (copertura ≥ 80%).  

=== Aspettative
- *Uniformità*: Utilizzo di template predefiniti per tutti i documenti, inclusi sezioni dedicate a:  
  - Scelte tecnologiche (es. motivazioni per Kafka vs RabbitMQ);  
  - Dettagli sull'integrazione LLM e personalizzazione annunci;  
  - Risultati dei test end-to-end e metriche di copertura.  
- *Conformità al Capitolato*: Rispetto delle specifiche _Sync Lab#apice("G")_ (es. dashboard#apice("G") con Superset/Grafana#apice("G"), simulazione dati GPS#apice("G")).  
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

=== Sistema di composizione tipografica 
Per garantire coerenza e semplicità nella produzione della documentazione, il gruppo ha adottato *Typst#apice("G")* come strumento principale, in sostituzione di LaTeX#apice("G"). La scelta è motivata dai seguenti vantaggi:  
- *Semplicità d'uso*: Sintassi simile a Markdown, ideale per redattori con competenze eterogenee.  
- *Programmabilità avanzata*: Supporto nativo per logiche condizionali e gestione dinamica dei contenuti, utile per documenti tecnici complessi (es. integrazione di diagrammi architetturali dal capitolato).  
- *Velocità di compilazione*: Generazione immediata di output PDF, ottimizzando i tempi di revisione.  
- *Coerenza grafica*: Template predefiniti nella cartella `template/` della repository `AlphaCode#apice("G")-docs-file`, allineati alle richieste del capitolato.  

=== Struttura dei documenti  
Ogni documento segue una struttura standardizzata per garantire tracciabilità e chiarezza, conforme alle aspettative del proponente _Sync Lab#apice("G")_.  

==== Intestazione
La prima pagina include:  
- *Logo del gruppo e dell'università* (`imgs/group_logo.png`).  
- *Nome del documento* (es. "Analisi dei Requisiti").  
- *Data* della creazione del documento.  
- *Responsabile#apice("G"), Redattori, Validatori*: È un elenco dei ruoli ricoperti dai vari membri nel corso della stesura del documento (es. risultano due responsabili#apice("G") elencati nel caso in cui una versione sia stata scritta sotto un determinato responsabile#apice("G") e la successiva in una rotazione dei ruoli differente). Ruoli definiti in base alle competenze (es. redattore esperto in AI#apice("G") per sezioni LLM#apice("G")). 
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
- *Descrizioni tecniche*: Dettagli su tecnologie (es. *PostGIS#apice("G")* per dati geospaziali#apice("G")).  
- *Diagrammi*: Riproduzione degli schemi architetturali del capitolato.

==== Corpo del verbale 
Include:  
- *Informazioni sulla riunione*:  
  - Luogo (fisico o virtuale), data, ora, partecipanti (interni/esterni).  
- *Ordine del giorno*: Elenco temi discussi (es. "Integrazione LLM#apice("G") con Apache Bytewax#apice("G")").  
- *Sintesi e decisioni*: Breve riassunto e accordi presi.
- *Consigli ricevuti*: Solo per i verbali esterni, riguarda quanto ci è stato suggerito dall'azienda su come procedere.
- *Attività individuate*: In formato tabulare, comprendendo l'eventuale Issue di GitHub#apice("G") associata, la descrizione dell'attività e gli assegnatari (stabiliti sulla base dei loro ruoli secondo la rotazione corrente). Sarà attribuito un ID tra i seguenti:
  - ORG: attività di organizzazione;
  - DOCS: attività relativa alla documentazione;
  - incremento#apice("G") N: attività relativa all'incremento#apice("G") di numero N;
  - Code/project: attività relativa allo sviluppo software.

==== Documenti del progetto
Elenco dei documenti obbligatori, allineati al capitolato C4:  
1. *Norme di Progetto* (_questo documento_).  
2. *Piano di Progetto*: Timeline e allocazione risorse.
3. *Piano di Qualifica*: Metriche di testing (copertura ≥ 80%).  
4. *Analisi dei Requisiti*: Casi d'uso (es. simulazione GPS#apice("G"), generazione annunci).  
5. *Glossario*: Definizioni tecniche (es. "LLM#apice("G")", "stream processing#apice("G")").  
6. *Lettera di presentazione*: Lettera di presentazione ad RTB compiuta.
7. *Verbali Interni/Esterni*: Registri degli incontri con _Sync Lab#apice("G")_.

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

L'utilizzo uniforme e rigoroso di questo formato facilita notevolmente l'impiego di Git#apice("G"), permettendo di sfruttare appieno le funzioni di tracciamento#apice("G") e confronto delle versioni (funzione "diff")

==== Stile del testo
Nei documenti (ad esclusione dei verbali) sarà obbligatorio utilizzare i seguenti stili tipografici:

_Corsivo_ per:
- Il nome del gruppo (_AlphaCode#apice("G")_);
- Il nome dell'azienda proponente (_Sync Lab#apice("G")_).

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

=== Formato delle date
Tutte le date presenti nei nomi dei documenti devono rispettare il formato seguente: *YYYY_MM_DD*, dove:

- *YYYY* indica l'anno con quattro cifre;
- *MM* indica il mese con due cifre;
- *DD* indica il giorno con due cifre.

Le date riportate all'interno dei documenti, invece, seguiranno la formattazione *YYYY-MM-DD*, come da ISO 8601.

=== Strumenti
Gli strumenti selezionati dal gruppo _AlphaCode#apice("G")_ per la produzione e gestione della documentazione sono:
- *Typst#apice("G")*: linguaggio per la composizione e stesura dei documenti, utilizzando typst.app;
- *GitHub#apice("G")*: piattaforma di hosting e controllo versione, con la repository ufficiale del gruppo situata al seguente indirizzo: [https://github.com/AlphaCodeSWE/AlphaCode-docs-file](https://github.com/AlphaCodeSWE/AlphaCode-docs-file);
- *Capitolato*: il documento ufficiale fornito dalla proponente (_Sync Lab#apice("G")_) contenente i requisiti del progetto.

== Verifica
=== Scopo e aspettative

All'interno del ciclo di vita del software, la verifica rappresenta un processo continuo e strutturato che prende avvio fin dalle prime fasi di progettazione e prosegue fino alla manutenzione post-rilascio. Questo processo ha lo scopo di garantire che ogni artefatto prodotto - siano essi codice sorgente, documentazione, casi di test o altri deliverable - rispetti pienamente i requisiti prefissati.

L'obiettivo principale è assicurare che ciascun prodotto realizzato dal gruppo _AlphaCode#apice("G")_ sia conforme agli standard qualitativi attesi in termini di correttezza, completezza e coerenza. Questo viene ottenuto mediante attività di revisione e controllo sistematico che fanno uso di tecniche di analisi e test ben definite.

Per raggiungere tali scopi, è fondamentale seguire procedure consolidate, applicare criteri di verifica affidabili e validare ogni deliverable al termine della sua produzione.

=== Descrizione

Il processo di verifica è svolto da uno o più membri del gruppo _AlphaCode#apice("G")_ incaricati come Verificatori#apice("G"), e viene applicato in modo sistematico a tutti gli artefatti del progetto. La verifica non si configura come un'attività isolata o occasionale, bensì come un processo ciclico e reiterato, che accompagna costantemente lo sviluppo e si adatta all'evoluzione del progetto.

Il riferimento centrale per tutte le attività di verifica è il Piano di Qualifica, un documento che definisce con chiarezza:

- Gli obiettivi specifici della verifica;
- I criteri di accettazione per i diversi artefatti;
- Le tecniche e i metodi adottati per ciascuna attività di controllo.

Le attività di verifica applicabili sono descritte nelle sezioni seguenti.

=== Analisi statica

L'analisi statica è una tecnica di verifica che viene svolta senza la necessità di eseguire il prodotto software. Essa si concentra sull'esame diretto del codice sorgente e della documentazione prodotta, al fine di individuare eventuali incongruenze, difetti o violazioni delle convenzioni stabilite nel progetto.
Questa forma di analisi può essere applicata a qualunque artefatto del progetto e si basa principalmente su due modalità operative:

- *Walkthrough*: una lettura condivisa e collaborativa del contenuto, condotta tra il Verificatore#apice("G") e l'autore dell'artefatto. Serve a individuare anomalie o aree da migliorare, promuovendo anche un confronto diretto e costruttivo.

- *Inspection*: una modalità più strutturata e formale rispetto al walkthrough, che si avvale di una checklist predefinita per analizzare sistematicamente il contenuto. L'inspection è particolarmente indicata per la sua efficienza nel rilevare errori in modo tempestivo e puntuale.

L'analisi statica risulta particolarmente efficace nelle prime fasi del progetto, quando la documentazione è ancora contenuta e facilmente gestibile, consentendo una verifica rapida e accurata di tutti i materiali prodotti. Si configura come una fase fondamentale per ridurre la propagazione di errori nelle fasi successive.

=== Analisi dinamica
L'analisi dinamica è una tecnica di verifica che si basa sull'esecuzione effettiva del software per individuare malfunzionamenti, bug e comportamenti inattesi. Tale approccio consente di valutare la qualità del prodotto osservandone il comportamento in condizioni controllate e riproducibili.

Nel contesto del progetto _NearYou#apice("G")_ di _Sync Lab#apice("G")_, l'analisi dinamica riveste un ruolo fondamentale, in particolare per testare la correttezza dell'elaborazione dei dati in streaming#apice("G"), la generazione di messaggi pubblicitari tramite LLM#apice("G") e la coerenza delle visualizzazioni fornite tramite dashboard#apice("G").

Le principali attività previste in questa fase sono i test, ovvero l'esecuzione del codice con input definiti per verificarne il comportamento atteso. L'efficacia di un test deriva da due caratteristiche chiave:

- *Decidibilità*: un test è considerato valido se, a parità di input, produce sempre lo stesso output;
- *Ripetibilità*: il test deve poter essere eseguito più volte in ambienti diversi senza variazioni di risultato dovute a fattori esterni.

Per massimizzare la copertura e l'affidabilità, il gruppo _AlphaCode#apice("G")_ dovrà definire un opportuno dominio di test, ovvero l'insieme dei casi di prova necessari a verificare i requisiti funzionali e non funzionali, con attenzione particolare alle componenti più critiche, come i sistemi di geolocalizzazione, i filtri per il targeting#apice("G") e i prompt AI#apice("G").
L'automazione dei test sarà supportata mediante strumenti come:

- *Driver*: componenti attivi che simulano input o comportamenti dell'utente o di sistemi esterni;
- *Stub*: elementi passivi che replicano funzionalità non ancora disponibili o isolate;
- *Logger*: moduli di tracciamento che registrano gli output e i risultati delle esecuzioni.

==== Test di unità
I test di unità sono progettati per verificare singole componenti del sistema in modo isolato, come ad esempio:

- un modulo di simulazione GPS#apice("G");
- una funzione per il salvataggio su database#apice("G");
- un handler per l'elaborazione dei prompt.

Questi test vengono generalmente scritti durante lo sviluppo e sono cruciali per intercettare errori nelle fasi iniziali. Possono essere classificati in:

- *Test funzionali*: verificano che, dato un input specifico, l'output prodotto sia corretto e conforme ai requisiti funzionali attesi (es. il generatore di messaggi produce output personalizzati corretti).

- *Test strutturali*: mirano a esplorare tutti i possibili cammini logici del codice, assicurando che ogni ramo o condizione venga eseguita almeno una volta, migliorando la copertura del codice e riducendo il rischio di errori nascosti.

==== Test di integrazione

I *test di integrazione* vengono progettati in seguito alla realizzazione dei test di unità, durante la fase di progettazione architetturale. Il loro scopo è verificare il corretto funzionamento delle interazioni tra i vari moduli software che, singolarmente, sono già stati testati e validati.

Nel contesto del progetto *NearYou#apice("G")*, questi test saranno particolarmente rilevanti per garantire il corretto scambio di dati tra i simulatori di posizione, i moduli di stream processing#apice("G"), il motore di generazione AI#apice("G") e le dashboard#apice("G") di visualizzazione.

L'integrazione tra i moduli avviene secondo un approccio incrementale#apice("G"), che consente di individuare e isolare più facilmente eventuali malfunzionamenti. In caso di errori critici, sarà possibile annullare temporaneamente le modifiche e ripristinare una versione stabile del sistema.

Si possono adottare due strategie principali per condurre i test:

- *Approccio Top-down*: si parte dalle componenti più esterne e interattive, come le interfacce utente o i sistemi di output, integrando progressivamente i moduli di livello inferiore. Questo approccio permette di testare fin da subito le funzionalità principali del sistema e garantisce la disponibilità anticipata di funzionalità ad alto impatto.

- *Approccio Bottom-up*: si inizia con i componenti più interni e a basso livello, come i servizi di gestione dati, database#apice("G") o API#apice("G") locali, per poi risalire alle componenti esterne. Questo metodo consente di costruire una base solida e ben verificata prima di affrontare l'integrazione con moduli più complessi.

==== Test di sistema

I *test di sistema* sono eseguiti dopo il completamento dei test di integrazione e hanno l'obiettivo di verificare che l'intero sistema risponda correttamente ai requisiti definiti nell'Analisi dei Requisiti e nel Capitolato fornito da _Sync Lab#apice("G")_.

Nel caso del progetto *NearYou#apice("G")*, ciò include la verifica del corretto funzionamento di tutte le funzionalità principali: dalla generazione dei messaggi pubblicitari personalizzati alla corretta visualizzazione su mappa, fino all'aggiornamento in tempo reale#apice("G") delle posizioni dei veicoli.

Questi test vengono condotti in un ambiente il più possibile simile a quello di produzione e coprono l'intera infrastruttura software, valutando la robustezza, l'affidabilità e la rispondenza dell'applicazione alle aspettative del committente.

==== Test di regressione

I *test di regressione* vengono eseguiti per assicurarsi che eventuali modifiche o migliorie introdotte nel sistema (nuove funzionalità, bug fix, refactoring) non compromettano il comportamento corretto di funzionalità già verificate in precedenza.

Si tratta di una ripetizione selettiva di test di unità, integrazione e sistema già validati, mirata a identificare possibili effetti collaterali non intenzionali. Questo tipo di test è essenziale in progetti iterativi e modulari come *NearYou#apice("G")*, dove l'aggiunta di nuove componenti (es. nuove fonti dati, nuovi moduli di personalizzazione) può facilmente introdurre errori in parti già funzionanti.

==== Test di accettazione

I *test di accettazione* rappresentano l'ultima fase del processo di verifica e hanno lo scopo di validare il prodotto finale rispetto ai requisiti espressi dal committente, ovvero _Sync Lab#apice("G")_.

Nel caso del progetto *NearYou#apice("G")*, i test di accettazione verificheranno che:

- il sistema generi correttamente messaggi pubblicitari personalizzati;
- i dati siano raccolti, processati e visualizzati in tempo reale#apice("G");
- la piattaforma rispetti tutte le funzionalità minime previste dalla consegna della P.o.C.#apice("G") o, eventualmente, quelle della versione completa.

Solo il superamento di questa fase certifica ufficialmente la qualità e l'idoneità del software per l'utilizzo previsto.

== Validazione
=== Scopo e aspettative
La validazione rappresenta una fase fondamentale del ciclo di sviluppo, poiché ha l'obiettivo di accertare che il prodotto software realizzato rispecchi fedelmente le aspettative e i requisiti indicati dal committente, in questo caso _Sync Lab#apice("G")_.

Questa fase non si limita alla sola verifica tecnica, ma coinvolge un'analisi complessiva dell'esperienza d'uso e della reale efficacia del sistema rispetto agli obiettivi stabiliti. I principali aspetti su cui si concentra sono:

- *Aderenza ai requisiti*: il sistema deve implementare in modo completo e corretto tutte le funzionalità richieste nel capitolato;
- *Corretto funzionamento*: il comportamento del software deve risultare coerente con la logica di progettazione e senza anomalie durante l'esecuzione;
- *Usabilità*: l'interfaccia utente e le interazioni devono risultare semplici, intuitive e comprensibili per l'utente finale;
- *Efficacia*: il sistema deve essere in grado di soddisfare le esigenze operative, migliorando la rilevanza e l'impatto della comunicazione pubblicitaria.

L'obiettivo ultimo è ottenere un prodotto completo, funzionante e apprezzabile da parte del committente, sia dal punto di vista tecnico che funzionale.

=== Descrizione

La fase di validazione si basa in larga parte sui risultati ottenuti durante la fase di verifica, sfruttando i test documentati nelle sezioni precedenti (unità, integrazione, sistema, regressione e accettazione). L'elemento determinante per concludere con successo la validazione è il superamento del test di accettazione.

Questo test rappresenta la conferma finale che il sistema NearYou#apice("G") sviluppato dal gruppo _AlphaCode#apice("G")_ risponde in maniera piena ai requisiti funzionali e qualitativi attesi. Solo dopo l'esito positivo di questa fase il prodotto potrà essere considerato validato e pronto per l'utilizzo o per ulteriori estensioni.

== Gestione della configurazione
=== Descrizione

Il processo di gestione della configurazione viene applicato lungo l'intero ciclo di vita del progetto e definisce le regole adottate dal gruppo _AlphaCode#apice("G")_ per garantire la tracciabilità e il controllo delle modifiche apportate ai documenti e al codice sorgente. Tale processo assicura che ogni artefatto prodotto sia identificabile, monitorabile#apice("G") e ripristinabile, contribuendo a mantenere ordine e coerenza all'interno del progetto.

=== Scopo

Lo scopo della gestione della configurazione è garantire una corretta organizzazione e supervisione di tutte le modifiche effettuate sulla documentazione e sul codice. Ogni cambiamento sarà tracciabile e documentato, permettendo in qualsiasi momento di risalire:

- alla motivazione della modifica;
- all'autore che l'ha effettuata;
- al contesto temporale e funzionale del cambiamento.

Questo approccio consente una maggiore affidabilità e facilita l'analisi retrospettiva del lavoro svolto.

=== Versionamento

Per gestire in modo ordinato le modifiche ai documenti, _AlphaCode#apice("G")_ adotta una convenzione di versionamento nel formato X.Y.Z, così definita:

- *X*: identifica una nuova release stabile (o di base), (es. revisione, rilascio ufficiale). Può essere incrementata solo previa validazione;
- *Y*: rappresenta una nuova release "minore", introduce aggiunte o funzionalità base;
- *Z*: nuova release di patch che indica una modifica puntuale o minore, spesso una "messa a punto" (correzioni, nessuna aggiunta considerevole).

Ad ogni incremento di una cifra, tutte quelle alla sua destra vengono azzerate (es. da `1.2.3` a `1.3.0`, oppure da `2.0.5` a `2.1.0`).

=== Tecnologie utilizzate
Per implementare efficacemente la gestione della configurazione, il gruppo _AlphaCode#apice("G")_ utilizza i seguenti strumenti:

- *Git#apice("G")*: sistema di controllo versione distribuito per tracciare ogni modifica ai documenti e al codice sorgente;
- *GitHub#apice("G")*: piattaforma di hosting per repository, gestione versioni, pull request e issue tracking#apice("G");
- *GitPod*: ambiente di sviluppo cloud che facilita la configurazione e l'accesso uniforme agli ambienti di lavoro;
- *Docker#apice("G")*: per la containerizzazione#apice("G") delle componenti software, garantendo coerenza tra ambienti di sviluppo e di produzione;
- *Discord*: per la comunicazione e coordinamento del team durante le attività di configurazione.

=== Repository

==== Lista Repository
Il gruppo utilizza le seguenti repository all'interno dell'organizzazione GitHub#apice("G") "AlphaCodeSWE":

- `AlphaCode#apice("G")-docs-file`: contiene tutta la documentazione del progetto;
- `NearYou#apice("G")-Code`: contiene il codice sorgente dell'applicazione, inclusi simulatori GPS#apice("G"), moduli di stream processing#apice("G"), e componenti di visualizzazione;

==== Struttura delle repository
La repository dei documenti è organizzata con le seguenti cartelle principali:
- `documents/`: contiene i documenti finali in formato PDF;
- `sources/`: contiene i file sorgenti Typst;
- `template/`: contiene il template condiviso per la documentazione;
- `template/assets/`: contiene immagini e altri file utilizzati nei documenti.
- `template/fonts/`: contiene eventuali font aggiuntivi utilizzati nei documenti.

La repository del codice è organizzata secondo i principali componenti dell'architettura NearYou#apice("G"):
- `airflow/`: codice per gestire il caricamento periodico delle informazioni sui negozi associati nella mappa;
- `certs/`: certificati per Kafka#apice("G");
- `deployment#apice("G")/`: configurazione per Kafka#apice("G"), Docker#apice("G") e programma di avvio;
- `docs/`: documenti per informazioni varie;
- `monitoring#apice("G")/`: codice di Grafana#apice("G") (dashboard#apice("G") amministratore#apice("G")) e Prometeus (monitoraggio#apice("G") risorse hardware#apice("G"));
- `requirements/`: librerie necessarie per il corretto funzionamento del codice python;
- `services/`: codice di dashboard#apice("G") utente e generatore di messaggi AI#apice("G");
- `src/`: contiene cache#apice("G"), logger#apice("G") e simulatore utenti.
- Variabili di sistema e configurazione vari (`.env`, `.compose`, `.gitpod`, etc.).

Questa struttura può essere soggetta a cambiamenti giunti alla fase di PB#apice("G").

== Processi organizzativi

=== Gestione dei processi

==== Coordinamento
Il coordinamento all'interno del gruppo _AlphaCode#apice("G")_ avviene principalmente attraverso:

- *Riunioni periodiche*: incontri per la revisione delle attività, aggiornamenti sullo stato di avanzamento e pianificazione delle prossime attività;
- *Comunicazioni interne*: utilizzo di Discord e Telegram per comunicazioni sincrone e asincrone tra i membri del team;
- *Comunicazioni con il proponente*: interazioni via email e Google Meet con i referenti di _Sync Lab#apice("G")_, seguendo le modalità indicate nel capitolato.

Ogni riunione viene documentata attraverso un verbale, che include:
- Data, ora e partecipanti;
- Ordine del giorno;
- Decisioni prese;
- Attività assegnate.

=== Miglioramento

==== Scopo
Il processo di miglioramento ha lo scopo di ottimizzare continuamente le pratiche di lavoro adottate dal gruppo _AlphaCode#apice("G")_, identificando inefficienze e implementando soluzioni per aumentare la produttività e la qualità del lavoro svolto.

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
Il processo di formazione mira a garantire che tutti i membri del gruppo _AlphaCode#apice("G")_ possiedano le competenze necessarie per contribuire efficacemente al progetto *NearYou#apice("G")*, con particolare attenzione alle tecnologie di streaming#apice("G") dati, database#apice("G") geospaziali#apice("G") e modelli di linguaggio.

==== Descrizione
La formazione si articola in:

- *Sessioni di studio individuali*: ogni membro studia autonomamente le tecnologie assegnate;
- *Workshop interni*: sessioni collaborative (sincrone) o spiegazioni scritte (asincrone) per la condivisione di conoscenze;
- *Sessioni tecniche con _Sync Lab_*: incontri specifici con i referenti aziendali per approfondimenti su tecnologie come Apache Kafka, ClickHouse e LangChain;
- *Pair programming*: sviluppo collaborativo per trasferimento di competenze tra membri del team.

==== Strumenti
Per supportare il processo di formazione, vengono utilizzati:

- *Repository privata* per la condivisione di materiale formativo;
- *Documentazione ufficiale* delle tecnologie adottate;
- *Ambienti sandbox* per sperimentazione e prove tecniche;
- *Tutorial e corsi online* per linguaggi, stream processing#apice("G"), AI generativa, etc.

== Standard di qualità

=== Standard ISO/IEC 9126 per la qualità
Per la valutazione della qualità del software prodotto, _AlphaCode_ fa riferimento allo standard ISO/IEC 9126#apice("G"), che identifica sei caratteristiche principali del software di qualità:

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
- *Richieste API*: ottimizzazione numero di chiamate all'API#apice("G") di A.I. per ridurre i costi.

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

= Metriche per la qualità <metriche>

== Metriche per la qualità del processo

=== Processi primari
==== Fornitura
- *MPC-PV*: <MPC-PV>
  - *Nome*: _Planned Value_
  - *Descrizione*: Rappresenta il valore che si stima di aver generato fino al momento corrente.
  - *Formula*:
  $ "PV" = "%LSP" * "BAC" $
  - *Parametri*:
    - *%LSP*: Percentuale di Lavoro Svolto secondo Pianificazione (ore previste rispetto al totale delle ore disponibili).
    - *BAC*: _Budget at Completion_, cioè il costo complessivo del progetto, definito nella fase di candidatura.

- *MPC-EV*: <MPC-EV>
  - *Nome*: _Earned Value_
  - *Descrizione*: Rappresenta il valore del lavoro realmente completato fino al momento corrente.
  - *Formula*:
  $ "EV" = "%LSE" * "BAC" $
  - *Parametri*:
    - *%LSE*: Percentuale di Lavoro Svolto Effettivamente (ore utilizzate rispetto al totale disponibile).
    - *BAC*: _Budget at Completion_.

- *MPC-AC*: <MPC-AC>
  - *Nome*: _Actual Cost_
  - *Descrizione*: Rappresenta i costi realmente sostenuti dall'avvio del progetto fino al momento corrente. È possibile recuperare tale valore in ogni momento attraverso la consultazione del Piano di Progetto.

- *MPC-EAC*: <MPC-EAC>
  - *Nome*: _Estimated at Completion_
  - *Descrizione*: Rappresenta il costo previsto per completare il progetto mantenendo l'attuale livello di efficienza nell'impiego delle risorse.
  - *Formula*:
  $ "EAC" = "BAC" / "CPI" $
  - *Parametri*:
    - *BAC*: _Budget at Completion_.
    - *CPI*: _Cost Performance Index_.

- *MPC-SV*: <MPC-SV>
  - *Nome*: _Schedule Variance_
  - *Descrizione*: Esprime se il progetto è in anticipo (valore positivo), allineato (valore zero) o in ritardo (valore negativo) rispetto alla pianificazione.
  - *Formula*:
  $ "SV" = "EV" - "PV" $
  - *Parametri*:
    - *EV*: _Earned Value_.
    - *PV*: _Planned Value_.

- *MPC-BV*: <MPC-BV>
  - *Nome*: _Budget Variance_
  - *Descrizione*: Esprime se i costi sostenuti finora per il progetto sono inferiori (valore positivo) o superiori (valore negativo) rispetto a quanto previsto.
  - *Formula*:
  $ "BV" = "PV" - "AC" $
  - *Parametri*:
    - *PV*: _Planned Value_.
    - *AC*: _Actual Cost_.

- *MPC-ETC*: <MPC-ETC>
  - *Nome*: _Estimate to Complete_
  - *Descrizione*: Costo previsto per completare il progetto nella situazione attuale.
  - *Formula*:
  $ "ETC" = "EAC" - "AC" $
  - *Parametri*:
    - *EAC*: _Estimated at Completion_.
    - *AC*: _Actual Cost_.

==== Sviluppo

- *MPC-RSI*: <MPC-RSI>
  - *Nome*: Indice di Stabilità dei Requisiti
  - *Descrizione*: Indice che quantifica le modifiche dei requisiti durante lo sviluppo. #h(1fr)
  - *Formula*:
  $ "ISR" = 100 - (("RM" + "RC" + "RA") / "RT") * 100 $
  - *Parametri*:
    - *RM*: Numero di Requisiti Modificati.
    - *RC*: Numero di Requisiti Cancellati.
    - *RA*: Numero di Requisiti Aggiunti.
    - *RT*: Numero Totale di Requisiti definiti inizialmente.

=== Processi di supporto
==== Documentazione
- *MPC-GP*: <MPC-GP>
  - *Nome*: Indice "Gulpease"
  - *Descrizione*: Esprime il grado di leggibilità di un testo:
    - Inferiore a 80: difficile da leggere per chi possiede la licenza#apice("G") elementare.
    - Inferiore a 60: difficile da leggere per chi possiede la licenza#apice("G") media.
    - Inferiore a 40: difficile da leggere per chi possiede la licenza#apice("G") superiore. #h(1fr)
  - *Formula*:
  $ "IG" = 89 + (300 * "NDF" - 10 * "NDL") / "NDP" $
  - *Parametri*:
    - *NDF*: Numero di Frasi contenute nel testo.
    - *NDL*: Numero di Lettere contenute nel testo.
    - *NDP*: Numero di Parole contenute nel testo.

- *MPC-CO*: <MPC-CO>
  - *Nome*: Correttezza Ortografica
  - *Descrizione*: Esprime il numero di errori ortografici rilevati nel testo.

==== Gestione della qualità

- *MPC-PMS*: <MPC-PMS>
  - *Nome*: Percentuale di Metriche Soddisfatte
  - *Descrizione*: Esprime la percentuale di metriche che rispettano gli obiettivi minimi di qualità stabiliti dal Piano di Qualifica.
  - *Formula*:
  $ "PMS" = ("MS" / "MT") * 100 $
  - *Parametri*:
    - *MS*: Numero di Metriche Soddisfatte.
    - *MT*: Numero di Metriche Totali.

=== Processi organizzativi
==== Gestione dei processi

- *MPC-ET*: <MPC-ET>
  - *Nome*: Efficienza Temporale
  - *Descrizione*: Esprime la percentuale di tempo disponibile che il _team#apice("G")_ è riuscito a utilizzare per svolgere attività produttive, ovvero quelle che contribuiscono direttamente al raggiungimento degli obiettivi del progetto.
  - *Formula*:
  $ "ET" = ("OO" / "OP") * 100 $
  - *Parametri*:
    - *OO*: Ore di Orologio (tempo complessivo trascorso).
    - *OP*: Ore Produttive (tempo effettivamente impiegato in attività produttive).

== Metriche per la qualità del prodotto
=== Funzionalità
- *MDP-ROS*
  - *Nome*: Requisiti Obbligatori Soddisfatti
  - *Descrizione*: Calcola la percentuale di requisiti obbligatori soddisfatti dal prodotto.
  - *Formula*:
  #align(center)[$ "%ROS" = "NROS" / "NTRO" * 100 $]
  - *Parametri*:
    - *NROS*: Numero di Requisiti Obbligatori Soddisfatti.
    - *NTRO*: Numero Totale di Requisiti Obbligatori.

- *MDP-RDS*
  - *Nome*: Requisiti Desiderabili Soddisfatti
  - *Descrizione*: Calcola la percentuale di requisiti desiderabili soddisfatti dal prodotto.
  - *Formula*:
  #align(center)[$ "%RDS" = "NRDS" / "NTRD" * 100 $]
  - *Parametri*:
    - *NRDS*: Numero di Requisiti Desiderabili Soddisfatti.
    - *NTRD*: Numero Totale di Requisiti Desiderabili.

- *MDP-RFS*
  - *Nome*: Requisiti Facoltativi Soddisfatti
  - *Descrizione*: Calcola la percentuale di requisiti facoltativi soddisfatti dal prodotto.
  - *Formula*:
  #align(center)[$ "%RFS" = "NRFS" / "NTRF" * 100 $]
  - *Parametri*:
    - *NRFS*: Numero di Requisiti Facoltativi Soddisfatti.
    - *NTRF*: Numero Totale di Requisiti Facoltativi.

=== Affidabilità
- *MDP-CC*
  - *Nome*: Code Coverage
  - *Descrizione*: Calcola la percentuale di codice#apice("G") eseguita durante i _test#apice("G")_. Per questo progetto#apice("G") è necessaria una copertura pari o superiore all'80%.

- *MDP-BC*
  - *Nome*: Branch Coverage
  - *Descrizione*: Determina la percentuale di rami decisionali del codice#apice("G") eseguiti durante i _test#apice("G")_.

- *MDP-PTCP*
  - *Nome*: Passed Test Cases Percentage
  - *Descrizione*: Calcola la percentuale di _test#apice("G")_ superati rispetto ai test#apice("G") eseguiti.

=== Efficienza
- *MDP-UR*
  - *Nome*: Utilizzo di Risorse
  - *Descrizione*: Valuta l'efficienza del sistema#apice("G") relativamente all'utilizzo delle risorse _hardware#apice("G")_, come CPU#apice("G"), memoria e altre risorse di sistema#apice("G").

=== Usabilità
- *MDP-FU*
  - *Nome*: Facilità di Utilizzo
  - *Descrizione*: Calcola il numero di errori commessi dagli utenti durante l'utilizzo. Un valore basso indica un'interfaccia intuitiva.
- *MDP-TA*
  - *Nome*: Tempo di Apprendimento
  - *Descrizione*: Stima il tempo necessario a un utente per apprendere l'utilizzo del _software#apice("G")_.

=== Manutenibilità
- *MDP-CCM*
  - *Nome*: Complessità Ciclomatica Media
  - *Descrizione*: Stima la complessità media del codice#apice("G") sorgente mediante la misurazione del numero medio di cammini indipendenti attraverso i grafi di controllo del flusso di tutti i metodi del sistema#apice("G").
  - *Formula*:
  #align(center)[$ "CCM" = frac(sum_(i=1)^n "CC"_i, n) $]

- *MDP-CS*
  - *Nome*: Code Smell
  - *Descrizione*: Identifica potenziali problemi di progettazione#apice("G") o codice#apice("G") che potrebbero necessitare di manutenzione.
