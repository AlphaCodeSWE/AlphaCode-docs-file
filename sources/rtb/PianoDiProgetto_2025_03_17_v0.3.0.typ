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
  version: "0.3.0",
  version_history: (
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