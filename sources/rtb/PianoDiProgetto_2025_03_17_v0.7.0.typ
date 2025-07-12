#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Piano di Progetto",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattori", "Giovanni Battista Matteazzi",
      "", "Alessandro Di Pasquale",
      "", "Nicolò Bovo",
      "", "Romeo Calearo",
      "Verificatori", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-17",
  version: "0.7.0",
  version_history: (
    "0.7.0", "2025-05-18", "Aggiunto periodo 5 di RTB",
    "Nicolò Bovo, Giovanni Battista Matteazzi, Massimo Chioru",
    "Romeo Calearo",

    "0.6.0", "2025-05-11", "Aggiunto periodo 4 di RTB", 
    "Alessandro Di Pasquale, Giovanni Battista Matteazzi, Elia Leonetti",
    "Nicolò Bovo",

    "0.5.0", "2025-05-03", "Aggiunto periodo 3 di RTB", 
    "Alessandro Di Pasquale, Romeo Calearo, Elia Leonetti",
    "Massimo Chioru",

    "0.4.0", "2025-04-18", "Aggiunto periodo 2 di RTB", 
    "Manuel Cinnirella, Massimo Chioru, Nicolò Bovo",
    "Giovanni Battista Matteazzi",

    "0.3.0", "2025-03-27", "Aggiunto periodo 1 di RTB", 
    "Alessandro Di Pasquale, Giovanni Battista Matteazzi, Romeo Calearo",
    "Manuel Cinnirella",

    "0.2.0", "2025-03-21", "Aggiunti modello di sviluppo e pianificazione", 
    "Massimo Chioru, Nicolò Bovo, Romeo Calearo",
    "Elia Leonetti",

    "0.1.0", "2025-03-17", "Bozza del documento", 
    "Massimo Chioru, Nicolò Bovo, Romeo Calearo", 
    "Elia Leonetti",
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
Il presente documento descrive le attività pianificate e i processi di gestione necessari alla realizzazione del progetto. Include un'analisi dettagliata dei rischi, la metodologia di sviluppo adottata, la pianificazione temporale, l'assegnazione dei ruoli e una stima preliminare di costi e risorse.

== Scopo del prodotto
Lo scopo di NearYou è progettare, realizzare e validare una piattaforma di advertising personalizzato in tempo reale, capace di unire flussi GPS, profilazione utente e generative AI per produrre annunci altamente contestuali. Oltre a implementare simulatori di posizionamento, pipeline Kafka→ClickHouse→PostGIS e modelli LLM, il team AlphaCode condurrà misurazioni mirate per valutare throughput e latenza delle componenti di streaming (Kafka) e orchestrazione (Airflow), l'efficacia e i tempi di risposta delle query geospaziali in PostGIS, e la velocità di generazione e consegna degli annunci via FastAPI. Analizzeremo inoltre l'impatto delle operazioni AI su CPU e memoria e testeremo la resilienza dei microservizi (producer, consumer, webapp) in caso di picchi di traffico o failure di rete. Per confermare scalabilità, robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode eseguirà stress test ad alto carico su tutte le pipeline, verificando la correttezza funzionale e le performance sotto condizioni estreme.

== Glossario
Per evitare ambiguità terminologiche, è stato redatto un glossario contenente i termini specifici del dominio applicativo, con le relative definizioni. I termini inclusi nel glossario sono evidenziati nel testo tramite uno stile dedicato.

== Riferimenti
=== Riferimenti informativi
- Norme di Progetto v1.0.0
- Capitolato d'appalto C4: NearYou: sistema di advertising
- Standard ISO/IEC 12207:1995

=== Riferimenti normativi
- I processi di ciclo di vita del software
- Glossario

== Preventivo iniziale
Secondo il documento presentato in fase di candidatura, il costo stimato del progetto è di 12.635€, con una data di consegna prevista entro il 15 agosto 2025.

= Analisi dei rischi
Una gestione efficace del progetto richiede la previsione e il contenimento delle criticità attraverso un'accurata analisi dei rischi. Per questo motivo, questa sezione è dedicata alla loro identificazione e alla definizione delle contromisure da adottare.
Conformemente allo standard ISO/IEC 31000:2009, la gestione del rischio si articola in cinque fasi fondamentali:

1. Identificazione dei rischi
  Individuazione di fonti di rischio, aree di impatto, eventi e relative cause. Questa fase include un'attività di brainstorming per elaborare un elenco esaustivo dei potenziali ostacoli.

2. Analisi dei rischi
  Comprende la valutazione qualitativa e quantitativa dei rischi individuati per agevolare le scelte strategiche e operative.

3. Valutazione dei rischi
  Definisce le priorità e stabilisce quali rischi affrontare, basandosi sui risultati dell'analisi.

4. Trattamento dei rischi
  Stabilisce le azioni correttive, come misure preventive, trasferimento del rischio o mitigazione degli effetti.

5. Monitoraggio e revisione
  Include il controllo periodico dei rischi e delle misure adottate, garantendo un processo adattivo e continuo.

  I rischi identificati si suddividono in due principali macro categorie:
  1. I *Rischi Tecnologici (RT)* derivanti dall'uso e dall'implementazione delle tecnologie necessarie
  2. I *Rischi Organizzativi (RO)* derivanti da tutte le difficoltà relative all'organizzazione di un progetto complesso e alla gestione del gruppo.
  Ad ogni rischio viene inoltre attribuito un numero d'ordine come descritto nei prossimi paragrafi.

#pagebreak()
== Rischi Tecnologici  
=== *RT 1*: Complessità tecnologie implementate 

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Il progetto prevede l'utilizzo di tecnologie complesse come Kafka, ClickHouse, PostGIS e modelli di intelligenza artificiale generativa. Il loro utilizzo e la necessità di integrazione reciproca possono risultare complessi e rallentare lo sviluppo.],
    [*Misure preventive*],[I membri del gruppo con delle conoscenze più approfondite di questi strumenti si prenderanno carico di alcune riunioni di formazione per permettere a tutti di familiarizzare con le tecnologie.],
    [*Misure correttive*],[In caso di difficoltà non previste, si valuta la possibilità di semplificare la tecnologia utilizzata o sostituirla con soluzioni equivalenti più semplici. In alternativa, il gruppo può chiedere supporto a un docente o tutor tecnico.])
)
=== *RT 2*: Inesperienza
 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Alcuni membri potrebbero non possedere le conoscenze tecniche o non essere abituati alle procedure necessarie per affrontare un progetto complesso.],
    [*Misure preventive*],[Il Responsabile di ogni determinato periodo valuta le competenze individuali durante l'assegnazione dei compiti. Ogni membro inoltre si assume la responsabilità di colmare eventuali lacune tramite lo studio delle tecnologie, delle procedure e la consultazione dei documenti redatti per restare aggiornato sui progressi e sugli step successivi.],
    [*Misure correttive*],[I membri meno esperti vengono affiancati da colleghi più competenti per favorire un apprendimento guidato. In caso di difficoltà persistenti, si può prevedere la riassegnazione dei compiti o l'introduzione di scadenze intermedie più dettagliate.])
)
#pagebreak()
== Rischi Organizzativi
=== *RO 1*: Difficoltà nella previsione dei carichi di lavoro

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Una programmazione poco precisa può essere causata da una conoscenza incompleta dei requisiti, da una valutazione errata del tempo o delle risorse necessarie e in generale da un'esperienza limitata da parte dei componenti del team nella gestione di un progetto complesso.],
    [*Misure preventive*],[Il monitoraggio dell'avanzamento è effettuato confrontando periodicamente quanto pianificato nel Piano di Progetto con lo stato reale delle attività riportato nella board su GitHub.],
    [*Misure correttive*],[In presenza di criticità, il Piano di Progetto  e il Piano di Qualifica vengono aggiornati per riflettere i progressi reali. Se un membro comunica di non riuscire a rispettare una scadenza, il Responsabile potrà decidere di allocare ulteriori risorse o posticipare il termine dell'attività.])
  )

    
=== *RO 2*: Conflitto tra impegni accademici e personali

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Obblighi legati alla vita personale o agli altri impegni universitari potrebbero ridurre il tempo che i membri del team possono dedicare al progetto, provocando slittamenti nelle attività.],
    [*Misure preventive*],[Ogni membro del gruppo si impegna a comunicare tempestivamente la propria disponibilità oraria e a rispettarla nel periodo corrente. I compiti verranno distribuiti sulla base della disponibilità comunicata.],
    [*Misure correttive*],[In caso di impegni imprevisti il Responsabile interviene riorganizzando l'assegnazione delle attività e delle risorse. Nei casi più complessi, può essere necessario ricalibrare le scadenze per tenere conto delle limitazioni segnalate.])
)

=== *RO 3*: Rischio di conflitti interni

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Opinioni divergenti riguardo alla direzione del progetto, alle soluzioni tecniche adottate o alla distribuzione delle risorse possono generare tensioni tra i membri del gruppo.],
    [*Misure preventive*],[Si prevede di sottoporre ogni decisione a tutti i membri del gruppo, raccogliendo le opinioni di tutti tramite discussioni o semplici sondaggi a seconda dell'importanza della decisione sottostante],
    [*Misure correttive*],[Il Responsabile si occupa della gestione del conflitto incentivando il dialogo tra i membri coinvolti e riorganizzando incarichi se necessario. In caso di mancato accordo, verrà richiesto l'intervento dei docenti come mediatori.])
)
=== *RO 4*: Problemi di comunicazione

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Comunicazioni poco chiare o insufficienti possono generare ritardi, incomprensioni e aumentare lo stress. L'assenza di interazioni in presenza può rendere più difficile creare un senso di appartenenza al gruppo e favorire incomprensioni.],
    [*Misure preventive*],[I membri si impegnano a partecipare attivamente a tutte le discussioni, sia tramite le applicazioni di messaggistica istantanea che di persona.],
    [*Misure correttive*],[I membri si impegnano a sollevare i dubbi qualora presenti. Qualunque membro del gruppo si impegna inoltre a  intervenire per rispondere alle eventuali domande poste])
)

#pagebreak()
= Modello di sviluppo 
== Motivazioni a favore del modello incrementale
Per lo sviluppo del progetto è stato scelto un modello incrementale, che permette di suddividere il lavoro in fasi successive, ciascuna con una porzione funzionale del prodotto. Questo approccio consente di:

Rilasciare versioni parziali ma funzionanti, utili per verifiche intermedie;

Incorporare feedback in corso d'opera, migliorando iterativamente la qualità;

Gestire meglio i rischi, affrontandoli in cicli più brevi e controllati.

Il ciclo tipico di sviluppo prevede le seguenti fasi per ciascun incremento:

1. Pianificazione delle attività;

2. Analisi dei requisiti dell'incremento;

3. Progettazione tecnica;

4. Implementazione;

5. Verifica e validazione.

La consegna finale del prodotto avverrà al termine dell'ultimo incremento, ma già dalle prime fasi sarà possibile eseguire test su versioni parziali per valutare stabilità e funzionalità anche insieme all'azienda.

== Esclusione di altri tipi di modelli
=== Contro il modello AGILE
Pur riconoscendo i vantaggi del modello agile, abbiamo optato per una soluzione incrementale perché più adatta al nostro contesto. Il modello agile prevede una gestione molto dinamica, adatto a una frequente riorganizzazione degli obiettivi e una comunicazione continua con il committente e tra il team. Abbiamo ritenuto di non avere ancora un'esperienza tale da gestire sprint continui, retrospettive e daily meeting in modo realmente efficace. Il modello incrementale, invece, ci permette di pianificare gli obiettivi con maggiore chiarezza e stabilità, distribuendo gli sforzi fin dall'inizio in modo che ogni membro conosca in anticipo il lavoro da svolgere e abbia la possibilità di gestirsi in autonomia entro la scadenza richiesta. Inoltre questo modello ci ha permesso di concentrarci su una buona architettura iniziale, robusta e capace di accogliere i futuri incrementi, evitando debiti tecnici e semplificando la verifica della qualità. Questa scelta ha permesso in pratica di lavorare in modo ordinato, con un miglior controllo dei tempi e dei costi.

=== Contro il modello a cascata
Abbiamo deciso di adottare un approccio incrementale al posto del classico modello a cascata perché riteniamo che ci offra una maggiore adattabilità senza rinunciare alla struttura necessaria per gestire al meglio il nostro primo progetto. Essendo studenti universitari, nonostante conosciamo già le funzionalità principali da implementare, il modello a cascata ci sarebbe risultato troppo rigido: avrebbe richiesto di definire tutto in anticipo senza possibilità di adattamento, il che sarebbe stato rischioso in un contesto didattico dove si impara facendo. Il modello incrementale, invece, ci permette di costruire il sistema a più passi successivi, ciascuno con funzionalità concrete e utilizzabili, consentendoci di verificare in itinere che le parti realizzate funzionino come previsto. Questo ci aiuta anche a raccogliere alcuni feedback da parte dell'azienda proponente su elementi chiave del progetto, senza dover stravolgere l'intero piano. Procedere per incrementi ci consente infine di concentrarci prima sulle funzionalità più critiche, consolidando così una base solida prima di sviluppare il resto.

= Pianificazione

== Pianificazione generale

Come anticipato nella Dichiarazione degli Impegni, il gruppo AlphaCode si impegna a completare il progetto entro e non oltre il *15 agosto 2025* con un costo non superiore ai *12.635 Euro*. 

L'intero progetto è scandito da due macro-fasi fondamentali,  corrispondenti alle principali revisioni del progetto:
  + *RTB (Requirements and Technology Baseline)*
   - Attività previste:
    + Stesura Analisi di requisiti
    + Stesura Norme di Progetto
    + Stesura Piano di Progetto
    + Stesura Piano di Qualifica
    + Stesura di un Glossario
    + Realizzazione di un Proof Of Concept
  + *PB (Product Baseline)*
   - Le attività previste per questa fase verranno incluse dopo il completamento della fase di RTB.

== Suddivisione in periodi
E' stata definita una pianificazione dettagliata in *quattro incrementi*: 

1. *Incremento 1: Sistema di Simulazione GPS Funzionante: * 
     - *Analisi:* Definizione requisiti per simulazione dati GPS e architettura streaming
    - *Progettazione:* Design architettura con Docker, Kafka producer/consumer
    - *Implementazioni: *   
      - Simulazione dati GPS con coordinate pseudocasuali
      - Architettura streaming con message broker
      - Infrastruttura containerizzata con Docker
      - Sistema producer/consumer per flusso dati
      - Comunicazione sicura con certificati SSL
      - Documentazione architetturale del sistema

2. *Incremento 2: Dashboard di Visualizzazione e Monitoring: *
   - *Analisi:* Requisiti per interfacce utente/amministratore e sistema di monitoring
   - *Progettazione:* Datbase, API dashboard, frontend e infrastruttura monitoring
   - *Implementazioni: *
    - Interfacce utente e amministratore separate
    - Sistema di monitoring per visualizzazione real-time
    - Generazione percorsi GPX realistici
    - Integrazione modelli linguistici per messaggi personalizzati
    - Frontend per visualizzazione dati
    - API backend per gestione dati
    - Sistema di cache per ottimizzazione
    - Pipeline ETL per elaborazione dati

3. *Incremento 3: Sistema di Analytics e Database Integration: *
    - *Analisi:* Requisiti per filtering avanzato, analytics e persistenza dati
    - *Progettazione:* Integrazione database e servizi per analytics personalizzate
    - *Implementazioni: *
      - Filtering avanzato per età, interessi, professione
      - Analytics personalizzate per segmentazione utenti
      - Persistenza dati con database multipli
      - Visualizzazione filtri applicati su mappa
      - Integrazione Grafana per analytics
      - Configurazione database ClickHouse e PostgreSQL
      - Suite di test per validazione sistema

4. *Incremento 4: Sistema Production-Ready per P.o.C. :*
   - *Analisi:* Verifica requisiti e ottimizzazioni
   - *Progettazione:* Configurazioni e monitoring avanzato
   - *Implementazioni: *
      - Ambiente di produzione ottimizzato
      - Monitoring avanzato con metriche complete
      - Sistema logging centralizzato
      - Dashboards complete per amministrazione
      - Monitoraggio risorse di sistema
      - Visualizzazione real-time in Grafana
      - Integrazione metriche per servizi API
      - Configurazione production-ready validata

#pagebreak()
== RTB  
#align(center, [=== PERIODO 1 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-03-05],
    [Fine prevista],[2025-03-26],
    [Fine effettiva],[2025-03-26]
  )
)

==== Pianificazione
Il primo periodo del progetto si è svolto nelle tre settimane successive alla creazione del gruppo. La necessità di affrontare le difficoltà iniziali ha spinto a posticipare la rotazione dei ruoli nel periodo iniziale preferendo dei periodi di lunghezza maggiore. Durante queste settimane, il team ha definito l'identità del gruppo scegliendo un nome rappresentativo e realizzando un logo, che verranno utilizzati per tutte le comunicazioni ufficiali. Parallelamente, è stata creata una repository online su GitHub, organizzata in modo da supportare una collaborazione efficace e trasparente fra i membri.

Il team ha inoltre sviluppato una prima versione del sito web del progetto, utile a presentare il contesto e le finalità del lavoro sia ai docenti che all'azienda partner. Un momento centrale di questo periodo è stato il processo decisionale per scegliere il capitolato, culminato con un colloquio con l'azienda scelta per chiarire gli ultimi dubbi.

Il gruppo ha inoltre selezionato il capitolato per cui candidarsi e ha proceduto con un incontro esplorativo e stilato la lettera di candidatura.

==== Preventivo

- totale ore previste: 75 
- costo max previsto: 1.785€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Nicolò Bovo], [18], [], [], [], [], [], 
    [Romeo Calearo], [], [], [18], [], [], [], 
    [Alessandro Di Pasquale], [], [18], [], [], [], [], 
    [Massimo Chioru], [], [], [], [12], [], [], 
    [Giovanni Battista Matteazzi], [], [], [], [], [3], [],
    [Manuel Cinnirella], [], [], [], [], [3], [],
    [Elia Leonetti], [], [], [], [], [], [3], 
  )
)

==== Orari effettivi

- totale ore previste: 75 
- totale ore effettive: 70

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Nicolò Bovo], [16 (-2)], [], [], [], [], [],
    [Romeo Calearo], [], [], [14 (-4)], [], [], [],
    [Alessandro Di Pasquale], [], [14 (-4)], [], [], [], [],
    [Massimo Chioru], [], [], [], [10], [],[],
    [Giovanni Battista Matteazzi], [], [], [], [], [5 (+2)],[],
    [Manuel Cinnirella], [], [], [], [], [5 (+2)], [],
    [Elia Leonetti], [], [], [], [], [], [6 (+3)],
  )
)

==== Costi effettivi

- costo previsto: 1.785
- costo effettivo: 1.600

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[16],[480],[-60],
    [Analista],[14],[350],[-100],
    [Progettista],[10],[250],[-50],
    [Amministratore],[14],[280],[-80],
    [Programmatore],[10],[150],[+60],
    [Verificatore],[6],[90],[+45],
  )
)

==== Retrospettiva
Il primo periodo è stato caratterizzato da un grande impegno a strutturare la repository e il sito richiedendo un maggiore impegno del ruolo dell'amministratore. Essendo ancora in una fase esplorativa l'analista e il progettista hanno richiesto meno ore di quelle preventivate.
In generale i membri del gruppo si sono integrati velocemente dimostrando grande disponibilità e apertura al dialogo e alla condivisione di idee.
Il gruppo inoltre ha riconosciuto la necessità di una migliore sistematicità nella produzione documentale ed di una pianificazione più precisa della distribuzione dei compiti tra i vari ruoli.

#pagebreak()
#align(center, [=== PERIODO 2 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-03-27],
    [Fine prevista],[2025-04-17],
    [Fine effettiva],[2025-04-17]
  )
)

==== Pianificazione

Durante il secondo periodo, che ha coperto le prime tre settimane dopo l'aggiudicazione dell'appalto, il gruppo si è preposto di gettare le basi dell'intero progetto avviando il *primo incremento del modello incrementale*. È stata pianificata l'inizializzazione dell'ambiente Docker, la definizione dell'architettura tramite diagrammi C4 e documentazione, nonché la strutturazione tecnica del repository, con README, certificati SSL e suddivisione tra ambienti dev/prod.

L'obiettivo dell'*Incremento 1* è realizzare un sistema di simulazione GPS funzionante con Kafka producer/consumer, creando una baseline stabile su cui costruire gli incrementi successivi.

==== Preventivo

- totale ore previste: 78 
- costo max previsto: 1.635

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale], [12], [], [], [], [], [], 
    [Giovanni Battista Matteazzi], [], [], [9], [], [], [], 
    [Nicolò Bovo], [], [15], [], [], [], [], 
    [Romeo Calearo], [], [], [], [12], [], [], 
    [Massimo Chioru], [], [], [], [], [10], [], 
    [Elia Leonetti], [], [], [], [], [11], [],
    [Manuel Cinnirella], [], [], [], [], [], [9],
  )
)
#pagebreak()
==== Ore effettive

- totale ore previste: 78 
- totale ore effettive: 75

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale], [14 (+2)], [], [], [], [], [], 
    [Giovanni Battista Matteazzi], [], [], [12 (+3)], [], [], [], 
    [Nicolò Bovo], [], [15], [], [], [], [], 
    [Romeo Calearo], [], [], [], [12], [], [], 
    [Massimo Chioru], [], [], [], [], [8 (-2)], [], 
    [Elia Leonetti], [], [], [], [], [8 (-3)], [], 
    [Manuel Cinnirella], [], [], [], [], [], [6 (-3)],
  )
)

==== Costi effettivi

- costo previsto: 1.635€
- costo effettivo: 1.650€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[14],[420],[+60],
    [Analista],[12],[300],[+75],
    [Progettista],[12],[300],[],
    [Amministratore],[15],[300],[],
    [Programmatore],[16],[240],[-75],
    [Verificatore],[6],[90],[-45],
  )
)
==== Retrospettiva


Nel secondo periodo il gruppo ha *completato con successo l'Incremento 1*. 

Oltre agli obiettivi iniziali, sono state integrate componenti importanti come l'integrazione dei moduli di producer e consumer Kafka, realizzando così il sistema di simulazione GPS funzionante previsto dall'incremento. L'inizializzazione dell'infrastruttura e la documentazione tecnica sono state curate nei dettagli, grazie alla disponibilità di tempo. Le scelte strutturali fatte (Docker, SSL, ambienti separati) hanno creato una *baseline stabile* che ha facilitato il lavoro futuro e soddisfatto pienamente gli obiettivi dell'incremento.

La durata maggiore del periodo e la posticipazione della rotazione dei ruoli ha permesso di lavorare con meno fretta, ottenendo risultati concreti e ben organizzati per il primo incremento. La *validazione dell'azienda durante la Terza Riunione Esterna del 17/04* ha confermato l'efficacia dell'approccio incrementale adottato. Il gruppo ha comunque deciso di accorciare la durata dei periodi successivi per consentire un maggiore controllo sugli obiettivi da conseguire in ogni incremento e un migliore controllo dei risultati, delle ore e dei costi.

#pagebreak()
#align(center, [=== PERIODO 3 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-04-18],
    [Fine prevista],[2025-05-02],
    [Fine effettiva],[2025-05-02]
  )
)

==== Pianificazione

Durante il terzo periodo il gruppo ha iniziato a prepararsi per il primo Diario di Bordo, uno strumento utile per tenere traccia di ciò che veniva fatto e per riflettere meglio sull'andamento del lavoro. Inoltre, è stato deciso di accorciare la durata dei periodi di lavoro da tre a due settimane, per poter fare controlli più frequenti e organizzare meglio il tempo. Questo ha richiesto una partecipazione più attiva da parte del responsabile e una divisione dei compiti più attenta.

Durante queste due settimane, il gruppo ha proseguito con gli incrementi, passando all'*Incremento 2*: Dashboard di Visualizzazione e Monitoring. Tra queste, la configurazione di Airflow per i flussi ETL, generazione di profili test, script per avviare i servizi, utility per connessioni a ClickHouse, e l'implementazione dell'API per il generatore messaggi. Il backend della dashboard (modelli e API) e il frontend (layout CSS e logica JavaScript) sono stati inclusi in questa fase. L'obiettivo è sviluppare le interfacce utente/amministratore e il sistema di monitoring, mantenendo *operativo l'Incremento 1* senza modifiche distruttive.

//Durante il terzo periodo il gruppo ha iniziato a prepararsi per il primo Diario di Bordo, uno strumento utile per tenere traccia di ciò che veniva fatto e per riflettere meglio sull'andamento del lavoro. Inoltre, è stato deciso di accorciare la durata dei periodi di lavoro da tre a due settimane, per poter fare controlli più frequenti e organizzare meglio il tempo. Questo ha richiesto una partecipazione più attiva da parte del responsabile e una divisione dei compiti più attenta.

//Durante queste due settimane, il gruppo ha pianificato diverse attività tecniche da portare avanti. Tra queste, la configurazione di Airflow per i flussi ETL, generazione di profili test, script per avviare i servizi, utility per connessioni a ClickHouse, e l'implementazione dell'API per il generatore messaggi.
//Il backend della dashboard (modelli e API) e il frontend (layout CSS e logica JavaScript) sono stati inclusi in questa fase. 

==== Preventivo

- totale ore previste: 55 
- costo max previsto: 1.120€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Manuel Cinnirella], [9], [], [], [], [], [], 
    [Massimo Chioru], [], [], [4], [], [], [], 
    [Elia Leonetti], [], [8], [], [], [], [], 
    [Nicolò Bovo], [], [], [], [8], [], [], 
    [Alessandro Di Pasquale], [], [], [], [], [10], [], 
    [Romeo Calearo], [], [], [], [], [10], [], 
    [Giovanni Battista Matteazzi], [], [], [], [], [], [6],
  )
)

#pagebreak()
==== Ore effettive
- totale ore previste: 55 
- totale ore effettive: 63

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Manuel Cinnirella], [14 (+5)], [], [], [], [], [], 
    [Massimo Chioru], [], [], [10 (+6)], [], [], [], 
    [Elia Leonetti], [], [8], [], [], [], [], 
    [Nicolò Bovo], [], [], [], [10 (+2)], [], [], 
    [Alessandro Di Pasquale], [], [], [], [], [8 (-2)], [], 
    [Romeo Calearo], [], [], [], [], [8 (-2)], [], 
    [Giovanni Battista Matteazzi], [], [], [], [], [], [5 (-1)],
  )
)


==== Costi effettivi

- costo max: 1.120€
- costo effettivo: 1.395€ 

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[14],[420],[+150],
    [Analista],[10],[250],[+150],
    [Progettista],[10],[250],[+50],
    [Amministratore],[8],[160],[],
    [Programmatore],[16],[240],[-60],
    [Verificatore],[5],[75],[-15],
  )
)
#pagebreak()
==== Retrospettiva

Il terzo periodo ha mostrato la necessità di rafforzare il ruolo dell'analista, che era stato sottovalutato nel periodo precedente. Il responsabile ha avuto un compito più attivo per guidare il gruppo verso il diario di bordo. Anche i verificatori sono stati coinvolti più intensamente per supportare l'attività documentale. L'avvio del diario ha aiutato a non perdere di vista gli obiettivi. È emersa inoltre l'efficacia della durata ridotta del periodo, che ha favorito un maggior controllo e il gruppo ha deciso di accorciarli ancora a una settimana per migliorare ancora il controllo sulle ore e i costi spesi e da spendere.

L'*Incremento 2 è stato completato con successo*, implementando dashboard utente e amministratore, API per il generatore messaggi e sistema di cache. La *baseline dell'Incremento 1 è rimasta completamente stabile*, con il simulatore GPS che continua a funzionare senza regressioni. La *validazione dell'azienda durante la Quarta Riunione Esterna del 24/04* ha confermato ancora una volta l'efficacia del modello incrementale nell'aggiungere nuove funzionalità senza compromettere quelle esistenti.

#pagebreak()
#align(center, [=== PERIODO 4 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-05-03],
    [Fine prevista],[2025-05-10],
    [Fine effettiva],[2025-05-10]
  )
)

==== Pianificazione


Il team ha proseguito con l'*Incremento 3*: Sistema di Analytics e Database Integration. Le attività previste includevano: route API per la dashboard, configurazione di Prometheus, Loki, e Grafana, oltre alla definizione dell'infrastruttura di monitoring con Docker Compose. Oltre alla parte di programmazione il gruppo ha ritenuto necessario dedicare maggiore tempo alla stesura della documentazione.

L'obiettivo dell'incremento è implementare filtering avanzato, analytics e persistenza dati, integrando database e servizi per analytics personalizzate, mantenendo *completamente operativi gli Incrementi 1 e 2* senza modifiche distruttive.

//Il gruppo si è preposto di concentrarsi su funzionalità di monitoraggio e API avanzate. Le attività previste includevano: route API per la dashboard, configurazione di Prometheus, Loki, e Grafana, oltre alla definizione dell'infrastruttura di monitoring con Docker Compose. Oltre alla parte di programmazione il gruppo ha ritenuto necessario dedicare maggiore tempo alla stesura della documentazione.

==== Preventivo

- totale ore previste: 27 
- costo max previsto: 535€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Romeo Calearo], [4], [], [], [], [], [], 
    [Elia Leonetti], [], [], [2], [], [], [], 
    [Giovanni Battista Matteazzi], [], [2], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [], [4], [], [], 
    [Nicolò Bovo], [], [], [], [], [5], [], 
    [Manuel Cinnirella], [], [], [], [], [5], [],
    [Massimo Chioru], [], [], [], [], [], [5],
  )
)


#pagebreak()
==== Prospetto orario

- totale ore previste: 27 ore
- ore effettive: 42
#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Romeo Calearo], [7 (+3)], [], [], [], [], [], 
    [Elia Leonetti], [], [], [6 (+4)], [], [], [],
    [Giovanni Battista Matteazzi], [], [6 (+4)], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [], [6 (+2)], [], [], 
    [Nicolò Bovo], [], [], [], [], [6 (+1)], [], 
    [Manuel Cinnirella], [], [], [], [], [6 (+1)], [],
    [Massimo Chioru], [], [], [], [], [], [5],
  )
)

==== Prospetto economico

- costo max:  535€
- costo effettivo: 885€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[7],[210],[+90],
    [Amministratore],[6],[120],[+80],
    [Analista],[6],[150],[+100],
    [Progettista],[6],[150],[+50],
    [Programmatore],[12],[180],[+30],
    [Verificatore],[5],[75],[],
  )
)
#pagebreak()
==== Retrospettiva

Nel quarto periodo è stato redatto il secondo Diario di Bordo, sfruttando l'esperienza del ciclo precedente. Il responsabile ha avuto un ruolo più attivo nel coordinare la scrittura, mentre il verificatore ha impiegato meno tempo rispetto a quanto previsto. I membri del gruppo hanno collaborato in modo più autonomo, rendendo il documento più chiaro e uniforme.

Le attività di programmazione sono diminuite rispetto ai periodi iniziali, lasciando spazio alla documentazione e alla revisione del lavoro svolto. L'*Incremento 3 è stato completato* con successo, implementando script di inizializzazione ClickHouse, configurazione OSRM/PostgreSQL e servizi per analytics personalizzate. Gli *Incrementi 1 e 2 sono rimasti completamente operativi* durante tutto il periodo. La *validazione dell'azienda durante la Quinta Riunione Esterna del 05/05* ha confermato l'integrazione efficace delle nuove funzionalità di analytics. Anche grazie alla durata più breve del periodo, il gruppo è riuscito a rispettare il numero di ore previsto, lavorando in modo più efficiente rispetto alle fasi precedenti.

#pagebreak()
#align(center, [=== PERIODO 5 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-05-11],
    [Fine prevista],[2025-05-17],
    [Fine effettiva],[2025-05-17]
  )
)


==== Pianificazione

In questo periodo, il gruppo si è preposto di completare la dashboard utente e rendere il sistema production-ready per l'*Incremento 4*: Sistema Production-Ready per P.o.C. Le attività hanno incluso l'integrazione dell'autenticazione JWT, l'implementazione dei servizi della dashboard e l'aggiunta del modulo cache con supporto Redis e fallback in-memory. È stata pianificata anche la scrittura di documentazione tecnica aggiuntiva.

L'obiettivo dell'incremento è verificare requisiti e ottimizzazioni, configurando monitoring avanzato per ambiente di produzione, mantenendo *completamente operativi gli Incrementi 1, 2 e 3* senza modifiche distruttive.


//In questo periodo, il gruppo si è preposto di completare la dashboard utente. Le attività hanno incluso l'integrazione dell'autenticazione JWT, l'implementazione dei servizi della dashboard e l'aggiunta del modulo cache con supporto Redis e fallback in-memory. È stata pianificata anche la scrittura di documentazione tecnica aggiuntiva.

==== Preventivo

- totale ore previste: 27 ore
- costo max previsto: 535€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [4], [], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [2], [], [], [], 
    [Massimo Chioru], [], [2], [], [], [], [], 
    [Elia Leonetti], [], [], [], [4], [], [], 
    [Romeo Calearo], [], [], [], [], [5], [], 
    [Manuel Cinnirella], [], [], [], [], [5], [],
    [Nicolò Bovo], [], [], [], [], [], [5],
  )
)


#pagebreak()
==== Prospetto orario

- totale ore previste: 27 
- ore effettive: 34

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [5 (+1)], [], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [4 (+2)], [], [], [], 
    [Massimo Chioru], [], [6 (+4)], [], [], [], [], 
    [Elia Leonetti], [], [], [], [4], [], [], 
    [Romeo Calearo], [], [], [], [], [5], [], 
    [Manuel Cinnirella], [], [], [], [], [5], [], 
    [Nicolò Bovo], [], [], [], [], [], [5],
  )
)


==== Prospetto economico

- costo max:  535€
-  costo effettivo: 695€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[5],[150],[+30],
    [Amministratore],[6],[120],[+80],
    [Analista],[4],[100],[+50],
    [Progettista],[4],[100],[],
    [Programmatore],[10],[150],[],
    [Verificatore],[5],[75],[],
  )
)

#pagebreak()
==== Retrospettiva

Durante il quinto periodo è stato realizzato il terzo Diario di Bordo, confermando le buone abitudini sviluppate nei cicli precedenti. Questo ha favorito una collaborazione più solida e ha permesso di valutare con maggiore precisione le ore effettivamente dedicate al progetto. La pianificazione su base settimanale ha continuato a essere un valido supporto per mantenere il lavoro organizzato e sotto controllo.

L'*Incremento 4 è stato completato* con successo, implementando Grafana dashboards completi, configurazione Prometheus, Loki per logging centralizzato e Docker Compose ottimizzato per produzione. Tutti gli *Incrementi precedenti (1, 2 e 3) sono rimasti completamente operativi* durante l'implementazione delle nuove funzionalità di monitoring. La *validazione dell'azienda durante la Sesta Riunione Esterna del 15/05* ha confermato che il P.o.C. è production-ready e particolarmente adeguato. Le ore impiegate sono risultate coerenti con quelle stimate, a dimostrazione di una crescente capacità organizzativa. L'intero ciclo si è concluso senza criticità rilevanti.