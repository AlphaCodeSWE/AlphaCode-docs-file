 #import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Piano di Progetto",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile, Redattori, Verificatori", "Alessandro Di Pasquale",
      "", "Giovanni Battista Matteazzi",
      "", "Nicolò Bovo",
      "", "Romeo Calearo",
      "", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-17",
  version: "1.3.0",
  version_history: (
    "1.3.0", "2025-08-14", "Aggiunto sprint 3", 
    "Elia Leonetti, Giovanni Battista Matteazzi, Romeo Calearo", 
    "Alessandro Di Pasquale, Nicolò Bovo, Manuel Cinnirella",

    "1.2.0", "2025-08-09", "Aggiunti sprint 1 e 2", 
    "Alessandro Di Pasquale, Nicolò Bovo, Manuel Cinnirella", 
    "Romeo Calearo, Massimo Chioru",

    "1.1.0", "2025-08-02", "Correzioni migliorative", 
    "Giovanni Battista Matteazzi, Alessandro Di Pasquale, Nicolò Bovo", 
    "Massimo Chioru",
    
    "1.0.0", "2025-07-12", "Selezione termini glossario e correzioni finali",
    "Alessandro Di Pasquale, Nicolò Bovo, Giovanni Battista Matteazzi",
    "Romeo Calearo",

    "0.15.0", "2025-07-12", "Aggiunto periodo 13 di RTB",
    "Alessandro Di Pasquale, Nicolò Bovo, Giovanni Battista Matteazzi",
    "Romeo Calearo",

    "0.14.0", "2025-07-06", "Aggiunto periodo 12 di RTB",
    "Alessandro Di Pasquale, Nicolò Bovo, Giovanni Battista Matteazzi",
    "Romeo Calearo",

    "0.13.0", "2025-06-29", "Aggiunto periodo 11 di RTB",
    "Alessandro Di Pasquale, Nicolò Bovo, Elia Leonetti",
    "Manuel Cinnirella",

    "0.12.0", "2025-06-22", "Aggiunto periodo 10 di RTB",
    "Giovanni Battista Matteazzi, Massimo Chioru, Manuel Cinnirella",
    "Elia Leonetti",

    "0.11.0", "2025-06-15", "Aggiunto periodo 9 di RTB",
    "Nicolò Bovo, Romeo Calearo, Manuel Cinnirella",
    "Giovanni Battista Matteazzi",

    "0.10.0", "2025-06-08", "Aggiunto periodo 8 di RTB",
    "Alessandro Di Pasquale, Massimo Chioru, Manuel Cinnirella",
    "Romeo Calearo",

    "0.9.0", "2025-06-01", "Aggiunto periodo 7 di RTB",
    "Alessandro Di Pasquale, Nicolò Bovo, Manuel Cinnirella",
    "Giovanni Battista Matteazzi",

    "0.8.0", "2025-05-25", "Aggiunto periodo 6 di RTB",
    "Nicolò Bovo, Elia Leonetti, Manuel Cinnirella",
    "Alessandro Di Pasquale",

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
Lo scopo di NearYou è progettare, realizzare e validare una piattaforma di advertising personalizzato in tempo reale, capace di unire flussi GPS#apice("G"), profilazione utente e generative AI per produrre annunci altamente contestuali. Oltre a implementare simulatori di posizionamento, pipeline#apice("G") Kafka#apice("G")→ClickHouse#apice("G")→PostGIS#apice("G") e modelli LLM#apice("G"), il team AlphaCode condurrà misurazioni mirate per valutare la capacità di elaborazione e latenza#apice("G") delle componenti di streaming#apice("G") (Kafka) e orchestrazione (Airflow)#apice("G"), l'efficacia e i tempi di risposta delle query#apice("G") geospaziali in PostGIS#apice("G"), e la velocità di generazione e consegna degli annunci via FastAPI#apice("G"). Analizzeremo inoltre l'impatto delle operazioni AI#apice("G") su CPU#apice("G") e memoria#apice("G") e testeremo la resilienza dei microservizi#apice("G") (producer#apice("G"), consumer#apice("G"), webapp#apice("G")) in caso di picchi di traffico o guasti della rete. Per confermare scalabilità#apice("G"), robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode#apice("G") eseguirà stress test#apice("G") ad alto carico su tutte le pipeline#apice("G"), verificando la correttezza funzionale e le prestazioni sotto condizioni estreme.

== Glossario
Per evitare ambiguità terminologiche, è stato redatto un glossario contenente i termini specifici del dominio applicativo, con le relative definizioni. I termini inclusi nel glossario sono evidenziati nel testo tramite uno stile dedicato.

== Riferimenti
=== Riferimenti informativi
- Norme di Progetto v1.0.0
- Capitolato d'appalto C4: NearYou#apice("G"): sistema di advertising
- Standard ISO/IEC 12207:1995#apice("G")

=== Riferimenti normativi
- I processi di ciclo di vita del software
- Glossario

== Preventivo iniziale
Secondo il documento presentato in fase di candidatura, il costo stimato del progetto è di 12.635€, con una data di consegna prevista il 15 agosto 2025.

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
    
    [*Descrizione*],[Il progetto prevede l'utilizzo di tecnologie complesse come Kafka#apice("G"), ClickHouse#apice("G"), PostGIS#apice("G") e modelli di intelligenza artificiale generativa. Il loro utilizzo e la necessità di integrazione reciproca possono risultare complessi e rallentare lo sviluppo.],
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

5. Verifica e validazione#apice("G").

La consegna finale del prodotto avverrà al termine dell'ultimo incremento, ma già dalle prime fasi sarà possibile eseguire test su versioni parziali per valutare stabilità e funzionalità anche insieme all'azienda.

== Esclusione di altri tipi di modelli
=== Contro il modello AGILE
Pur riconoscendo i vantaggi del modello agile, abbiamo optato per una soluzione incrementale perché più adatta al nostro contesto. Il modello agile prevede una gestione molto dinamica, adatto a una frequente riorganizzazione degli obiettivi e una comunicazione continua con il committente e tra il team. Abbiamo ritenuto di non avere ancora un'esperienza tale da gestire sprint#apice("G") continui, retrospettive#apice("G") e daily meeting#apice("G") in modo realmente efficace. Il modello incrementale, invece, ci permette di pianificare gli obiettivi con maggiore chiarezza e stabilità, distribuendo gli sforzi fin dall'inizio in modo che ogni membro conosca in anticipo il lavoro da svolgere e abbia la possibilità di gestirsi in autonomia entro la scadenza richiesta. Inoltre questo modello ci ha permesso di concentrarci su una buona architettura iniziale, robusta e capace di accogliere i futuri incrementi, evitando debiti tecnici#apice("G") e semplificando la verifica della qualità. Questa scelta ha permesso in pratica di lavorare in modo ordinato, con un miglior controllo dei tempi e dei costi.

=== Contro il modello a cascata
Abbiamo deciso di adottare un approccio incrementale al posto del classico modello a cascata perché riteniamo che ci offra una maggiore adattabilità senza rinunciare alla struttura necessaria per gestire al meglio il nostro primo progetto. Essendo studenti universitari, nonostante conosciamo già le funzionalità principali da implementare, il modello a cascata ci sarebbe risultato troppo rigido: avrebbe richiesto di definire tutto in anticipo senza possibilità di adattamento, il che sarebbe stato rischioso in un contesto didattico dove si impara facendo. Il modello incrementale, invece, ci permette di costruire il sistema a più passi successivi, ciascuno con funzionalità concrete e utilizzabili, consentendoci di verificare in itinere che le parti realizzate funzionino come previsto. Questo ci aiuta anche a raccogliere alcuni feedback da parte dell'azienda proponente su elementi chiave del progetto, senza dover stravolgere l'intero piano. Procedere per incrementi ci consente infine di concentrarci prima sulle funzionalità più critiche, consolidando così una base solida prima di sviluppare il resto.

//#text(" NUOVA PARTE", fill: rgb(0, 130, 0))

== Transizione verso un modello agile nella fase PB

Nonostante la scelta iniziale a favore del modello incrementale, in fase di Progettazione di Base (PB) è emersa l'esigenza di adottare un approccio più flessibile. //, per poter rispondere in modo efficace alle correzioni richieste dai docenti.

Il modello incrementale, pur offrendo struttura e ordine, si basa su una pianificazione relativamente rigida delle funzionalità in ciascun incremento. Tuttavia, quando è emersa la necessità di rivedere la documentazione è risultato evidente che l'approccio iniziale non era più sufficiente per gestire l'evoluzione del progetto in modo coerente. In questo nuovo scenario, si è reso opportuno ricorrere ad alcune pratiche tipiche del modello agile, che consente di affrontare il cambiamento in modo più dinamico.

La transizione non rappresenta un ripensamento della scelta iniziale, ma un adattamento consapevole e puntuale del modello di sviluppo, motivato dalla volontà di migliorare la qualità del progetto /*e di affrontare in modo efficace le modifiche richieste*/. L'esperienza ha rafforzato la comprensione del valore della flessibilità metodologica, dimostrando che la scelta del modello deve sempre tener conto del contesto operativo e dei vincoli esterni.

//#text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

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
    + Realizzazione di un Proof Of Concept#apice("G")
  + *PB (Product Baseline)*
   + Sistemazione documenti in base alle indicazioni dei Prof. Cardin e Vardanega
   + Espanione Glossario
   + Aggiornamento Piano di Qualifica
   + Aggiornamento Piano di Progetto
   + Stesura Manuale Utente
   + Stesura del documento Specifica Tecnica
   + Realizzazione di un MVP#apice("G")
   

== Suddivisione in periodi
È stata definita una pianificazione dettagliata in *quattro incrementi*: 

1. *Incremento 1: Sistema di Simulazione GPS Funzionante: * 
     - *Analisi:* Definizione requisiti per simulazione dati GPS e architettura streaming
    - *Progettazione:* Design architettura con Docker#apice("G"), Kafka#apice("G") producer#apice("G")/consumer#apice("G")
    - *Implementazioni: *   
      - Simulazione dati GPS#apice("G") con coordinate pseudocasuali
      - Architettura streaming#apice("G") con message broker#apice("G")
      - Infrastruttura containerizzata#apice("G") con Docker#apice("G")
      - Sistema producer/consumer per flusso dati
      - Comunicazione sicura con certificati SSL#apice("G")
      - Documentazione architetturale del sistema

2. *Incremento 2: Dashboard di Visualizzazione e Monitoring: *
   - *Analisi:* Requisiti per interfacce utente/amministratore e sistema di monitoring
   - *Progettazione:* Database#apice("G"), API#apice("G") dashboard, frontend#apice("G") e infrastruttura monitoring
   - *Implementazioni: *
    - Interfacce utente e amministratore separate
    - Sistema di monitoring per visualizzazione in tempo reale
    - Generazione percorsi GPX#apice("G") realistici
    - Integrazione modelli linguistici per messaggi personalizzati
    - Frontend#apice("G") per visualizzazione dati
    - API#apice("G") backend#apice("G") per gestione dati
    - Sistema di cache#apice("G") per ottimizzazione
    - Pipeline#apice("G") ETL#apice("G") per elaborazione dati

3. *Incremento 3: Sistema di Analytics e Database Integration: *
    - *Analisi:* Requisiti per filtering avanzato, analytics#apice("G") e persistenza dati
    - *Progettazione:* Integrazione database#apice("G") e servizi per analytics personalizzate
    - *Implementazioni: *
      - Filtering#apice("G") avanzato per età, interessi, professione
      - Analytics#apice("G") personalizzate per segmentazione utenti
      - Persistenza dati con database#apice("G") multipli
      - Visualizzazione filtri applicati su mappa
      - Integrazione Grafana#apice("G") per analytics#apice("G")
      - Configurazione database#apice("G") ClickHouse#apice("G") e PostgreSQL#apice("G")
      - Suite di test per validazione sistema

4. *Incremento 4: Sistema Production-Ready per P.o.C. :*
   - *Analisi:* Verifica requisiti e ottimizzazioni
   - *Progettazione:* Configurazioni e monitoring avanzato
   - *Implementazioni: *
      - Ambiente di produzione ottimizzato
      - Monitoring#apice("G") avanzato con metriche#apice("G") complete
      - Sistema logging#apice("G") centralizzato
      - Dashboard#apice("G") complete per amministrazione
      - Monitoraggio risorse di sistema
      - Visualizzazione in tempo reale#apice("G") in Grafana#apice("G")
      - Integrazione metriche#apice("G") per servizi API#apice("G")
      - Configurazione production-ready#apice("G") validata

5. *Incremento 5: Stream Processing Real-Time:*
   - *Analisi:* Ottimizzazione architettura per eliminazione consumer tradizionale e introduzione stream processing#apice("G") in tempo reale
   - *Progettazione:* Pipeline#apice("G") event-driven#apice("G") con elaborazione dati in tempo reale
   - *Implementazioni: *
      - Stream processing#apice("G") per elaborazione tempo reale
      - Eliminazione consumer tradizionale
      - Elaborazione dati senza interruzioni
      - Flusso diretto producer#apice("G")-processor#apice("G")-dashboard#apice("G")

6. *In fase di PB si procederà per sprint#apice("G")*
/*INIZIO */
/*
6. *Incremento 6: Finalizzazione MVP e Studio Pattern Architetturali*
 - *Analisi*: Analisi: Studio pattern architetturali per ottimizzazione sistema esistente, analisi sistema offerte. personalizzate e simulazione comportamento utenti nei negozi
 - *Progettazione*: Refactoring architetturale con pattern consolidati, design sistema di targeting offerte e pipeline simulazione visite realistiche.
 - *Implementazioni: *
    - Studio e implementazione Design Patterns 
    - Sistema di generazione offerte automatizzate per negozi con targeting personalizzato
    - Simulazione fermate utenti nei negozi con decisioni probabilistiche
    - Integrazione offerte nel Message Generator Service per messaggi personalizzati
    - Pipeline ETL per generazione/cleanup offerte e tracking conversioni
    - Analytics comportamento utenti con metriche soddisfazione e spending
    - Test 
    - Documentazione tecnica finale e configurazione production-ready validata
    */
/*FINE*/
      
#pagebreak()
Basandosi sulle precedenti informazioni il gruppo ha deciso di suddividere il tempo e i costi in base alla tabella seguente:

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    
    [],[*RTB*],[*PB*],[*TOT*],
    [Durata (settimane)],[18],[5],[23],
    [Durata (ore)],[470],[160],[630],
    [Costo (Euro)],[9.660€],[2.975€],[12.635€]
    )
)

Da cui deriva la seguente suddivione a seconda dei diversi ruoli:

 #align(center,
  table(
    columns: 4,           
    inset: 10pt,
    
    [*Ruolo*],[*Costo Orario*],[*Ore*],[*Costo*],
    [Responsabile],[ 30€/h],[106],[3.180 €],
    [Amministratore],[ 20€/h],[73],[1.460 €],
    [Analista],[25€/h],[49],[1.225 €],
    [Progettista],[ 25€/h],[74],[1.850 €], 
    [Programmatore],[ 15€/h],[217],[3.255 €],
    [Verificatore],[15€/h],[111],[1.665 €],
    [Totale],[-],[630 h],[12.635 €]
    
  )
)


   
== Pianificazione specifica per singolo periodo
Per ciascun periodo vengono riportate le seguenti informazioni:
- Le date di inizio, di fine prevista e di fine effettiva, insieme al calcolo di eventuali giorni di ritardo.
- L'elenco delle attività pianificate per quel periodo, con l'indicazione dell'avanzamento atteso e dei rischi potenziali.
- Il tempo stimato necessario per completare le attività previste (stime preventive).
- Il confronto tra quanto effettivamente svolto e quanto previsto, accompagnato da un'analisi dei costi sostenuti.
- I rischi che si sono concretizzati, con una valutazione del loro impatto e delle misure adottate per contenerli.
- Una retrospettiva che consente di riflettere su cosa è andato bene, cosa migliorare e cosa mantenere nei prossimi periodi.


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
// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
In fase di pianificazione del primo periodo, sono stati presi in considerazione alcuni rischi principalmente di natura organizzativa. In particolare, il rischio RO1 (difficoltà nella previsione dei carichi di lavoro) era atteso data la scarsa conoscenza iniziale tra i membri del gruppo e la mancanza di esperienze pregresse in progetti di media complessità. Sul piano tecnico, era stato inoltre previsto il rischio RT2 (inesperienza), considerando che alcuni strumenti e processi — come la gestione di repository condivise o la strutturazione dei documenti — non erano ancora patrimonio comune del team.

==== Rischi incontrati
Durante lo svolgimento effettivo delle attività, si è verificato un parziale concretizzarsi del rischio RO1: la distribuzione iniziale delle ore ha mostrato alcune inefficienze, con carichi di lavoro non perfettamente bilanciati tra i ruoli. Contestualmente, anche il rischio RT2 si è manifestato, in particolare nella fase di creazione e organizzazione dei materiali progettuali.

È inoltre emerso il rischio RO4 (difficoltà di comunicazione), che ha causato rallentamenti nella stesura dei documenti e alcune incoerenze tra versioni differenti. 

==== Misure correttive adottate
Per contenere l'impatto del rischio RO1, il gruppo ha scelto di mantenere stabile la distribuzione dei ruoli in questo primo periodo, evitando rotazioni premature e permettendo a ciascun membro di acquisire familiarità con il proprio ambito. Contestualmente, sono stati introdotti dei momenti informali di allineamento settimanale per monitorare l'equilibrio del carico e intervenire tempestivamente in caso di criticità.

Sul fronte tecnologico, per mitigare RT2, si è fatto affidamento sulla condivisione delle competenze all'interno del gruppo e su un supporto reciproco continuo, in particolare nella gestione della repository GitHub e nella strutturazione del sito di progetto.

Infine, per affrontare il rischio RO4, si è adottato un modello documentale uniforme e condiviso, con il coinvolgimento diretto del verificatore nella definizione delle convenzioni base da applicare in tutti i documenti ufficiali.

==== Retrospettiva e riflessione
Il confronto tra pianificazione e attività svolte ha permesso di avviare un processo di riflessione collettiva utile a migliorare l'approccio ai periodi successivi. Nonostante le difficoltà iniziali, il gruppo ha dimostrato una buona capacità di adattamento e un atteggiamento proattivo nella risoluzione dei problemi. La fase di avvio ha favorito l'emergere di uno spirito collaborativo e una chiara volontà di lavorare secondo criteri di trasparenza e responsabilità condivisa.

==== Raffinamento della pianificazione futura
In vista del secondo periodo, la pianificazione è stata raffinata tenendo conto delle lezioni apprese. In particolare, si è deciso di:
- Proseguire con una rotazione trisettimanale dei ruoli per consolidare le competenze individuali.
- Introdurre momenti cadenzati di verifica e riallineamento delle attività.
- Applicare in modo sistematico le convenzioni documentali definite, riducendo il rischio di incoerenze future.
// #text(" FINE NUOVA PARTE", fill: rgb(0, 130, 0))


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

// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Con l'avvio effettivo dei lavori progettuali, il gruppo ha pianificato una serie di attività tecniche complesse, tra cui l'inizializzazione dell'ambiente Docker, la strutturazione dell'architettura software e la configurazione della pipeline di simulazione GPS. In questo contesto, sono stati considerati rischi tecnologici rilevanti, in particolare RT1 (complessità delle tecnologie implementate) e RT2 (inesperienza), entrambi strettamente legati alla necessità di integrare strumenti eterogenei come Kafka, certificati SSL e ambienti containerizzati.

Dal punto di vista organizzativo, è stato mantenuto il monitoraggio del rischio RO2 (conflitto tra impegni accademici e personali), vista la concomitanza del lavoro con altre attività universitarie. Inoltre, la progressiva crescita della complessità progettuale ha posto attenzione anche su RO4 (problemi di comunicazione), soprattutto in relazione alla necessità di coordinare efficacemente i membri che stavano affrontando aree tecnologiche diverse.

==== Rischi incontrati
Nel corso del periodo si sono concretizzati in parte i rischi legati alla complessità tecnica (RT1), in particolare durante l'integrazione tra Kafka, Docker e la configurazione degli ambienti, che ha richiesto più tempo del previsto. Anche l'inesperienza su alcuni strumenti, come Docker e l'architettura C4, ha causato rallentamenti e richiesto supporto interno (RT2).

Sul piano organizzativo, alcuni membri hanno avuto difficoltà a rispettare le ore previste, generando lievi scostamenti nella distribuzione del carico (RO2). 

==== Misure correttive adottate
Per far fronte a RT1 e RT2, sono stati organizzati momenti di confronto interni, in cui i membri più esperti hanno affiancato quelli meno familiari con le tecnologie.

Per contenere RO2, è stata introdotta una distinzione più netta tra giorni destinati alla scrittura documentale e giorni destinati allo sviluppo, rendendo più semplice la concentrazione dei membri su obiettivi omogenei.

==== Retrospettiva e riflessione
Il periodo si è concluso con il completamento dell'intero Incremento 1. Nonostante alcune difficoltà tecniche e una leggera pressione sugli orari, l'architettura è risultata solida e la simulazione GPS ha superato le aspettative iniziali, anche grazie a un buon bilanciamento tra attività di sviluppo e documentazione. È emersa però l'importanza di gestire con maggiore anticipo l'assegnazione simultanea di attività tecniche e documentali, così da evitare sovrapposizioni e congestioni nella distribuzione dei carichi.

==== Raffinamento della pianificazione futura
In prospettiva dei prossimi periodi, la pianificazione è stata migliorata in tre direzioni principali:

- Rafforzamento della documentazione tecnica interna per facilitare il riuso delle configurazioni e accelerare la curva di apprendimento (RT2).
- Monitoraggio anticipato degli impegni accademici e maggiore flessibilità nella ripianificazione individuale (RO2).


// #text(" FINE NUOVA PARTE", fill: rgb(0, 130, 0))

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
// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Il terzo periodo è stato pianificato in un'ottica di maggiore frequenza di verifica, con un accorciamento intenzionale della durata dei cicli da tre a due settimane. Questa scelta, pur volta a garantire un miglior controllo, ha reso più denso il carico di lavoro settimanale, esponendo il gruppo a un rischio organizzativo già noto: RO1 (difficoltà nella previsione dei carichi di lavoro). Allo stesso tempo, l'avvio dell'Incremento 2, con attività di sviluppo di dashboard e sistemi di monitoring, ha riportato l'attenzione sul rischio RT1 (complessità delle tecnologie implementate), data la necessità di configurare strumenti come Airflow, ClickHouse e i moduli API.

È stato inoltre considerato il rischio RO3 (conflitti interni), in quanto l'introduzione di logiche complesse nel backend e frontend avrebbe potuto generare divergenze su scelte progettuali o implementative. La riduzione della durata dei cicli ha anche accentuato il rischio RO4 (problemi di comunicazione), rendendo necessario un coordinamento ancora più efficace.

==== Rischi incontrati
Durante lo svolgimento del periodo, RT1 si è concretizzato nella fase di configurazione di Airflow e nella gestione delle pipeline dati in quanto la messa a punto ha richiesto tempo. RO1 si è manifestato in misura contenuta: la nuova struttura in periodi brevi ha comportato una maggiore pressione nella gestione delle consegne, in particolare per i ruoli tecnici. Il rischio RO3 non si è manifestato.



==== Misure correttive adottate
RT1 è stato affrontato tramite affiancamento tecnico mirato e suddivisione dei task più critici in sottoattività autonome. Per mitigare RO1, ogni membro si è autogestito con micro-deadline, utile a distribuire il carico e anticipare le difficoltà.


==== Retrospettiva e riflessione
Questo periodo ha rappresentato un primo banco di prova per la gestione di cicli più brevi. Sebbene il gruppo sia riuscito a completare le attività previste, la retrospettiva ha evidenziato un certo margine di stress operativo causato dalla compresenza di sviluppo avanzato e nuove configurazioni. È emersa l'esigenza di rafforzare il coordinamento tra componenti tecniche e di migliorare la tracciabilità delle decisioni tecniche per evitare disallineamenti futuri.

==== Raffinamento della pianificazione futura
Sulla base dell'esperienza maturata, la pianificazione del periodo successivo è stata rivista nei seguenti termini:
- Rafforzati i momenti di sincronizzazione tecnica a metà periodo (RO4).
- Stabilita una soglia minima di ore da dedicare alo studio delle tecnologie meno conosciute (RT1).

// #text(" FINE NUOVA PARTE", fill: rgb(0, 130, 0))

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
// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Con l'avanzamento del progetto e la prosecuzione dell'Incremento 2, il gruppo si è trovato ad affrontare un periodo che prevedeva sia attività di consolidamento, sia ulteriori sviluppi tecnici legati alla visualizzazione e alla gestione dei dati. La pianificazione ha quindi posto attenzione su due rischi tecnologici già noti: RT1 (complessità delle tecnologie implementate), in relazione alla necessità di integrare componenti di monitoring e strutture dati complesse, e RT2 (inesperienza), dato il graduale coinvolgimento di membri su parti del codice e strumenti non ancora affrontati nei periodi precedenti.

A livello organizzativo, è rimasto centrale il rischio RO4 (problemi di comunicazione), considerata la crescente articolazione del lavoro e la necessità di mantenere un elevato grado di coordinamento. In secondo piano, ma comunque rilevante, anche RO2 (conflitto tra impegni accademici e personali), con il rischio che scadenze universitarie riducessero la disponibilità effettiva di alcuni membri.

==== Rischi incontrati
Durante il periodo, RT1 ha avuto un impatto contenuto ma rilevante: alcune funzionalità legate alla visualizzazione in tempo reale hanno richiesto più tempo del previsto per essere integrate con il backend. È stato inoltre necessario rivedere parte delle strutture dati per garantire l'interoperabilità dei moduli di monitoraggio.

RT2 si è manifestato con incertezze legate all'uso di tecnologie meno conosciute. Il gruppo ha comunque risposto rapidamente, condividendo documentazione e fornendo supporto interno mirato.

RO4 ha causato piccoli malintesi nella definizione delle interfacce e nella distribuzione dei compiti, che hanno generato lievi ritardi nell'integrazione finale. Il problema è stato ridotto grazie a un miglior coordinamento nelle fasi conclusive.

==== Misure correttive adottate
Per mitigare RT1 e RT2 è stato rafforzato l'affiancamento tra membri più esperti e meno esperti, già attivo nei periodi precedenti. Sono stati condivisi script di riferimento e brevi guide pratiche per favorire un apprendimento più rapido degli strumenti utilizzati.


==== Retrospettiva e riflessione
Il quarto periodo ha segnato una fase di maturazione del lavoro di gruppo. Il consolidamento della dashboard e delle logiche di monitoraggio ha evidenziato una progressiva maggiore autonomia tecnica da parte del team, anche se restano alcune fragilità nella gestione delle interdipendenze. La retrospettiva ha confermato che, sebbene le attività siano state completate nei tempi previsti, è fondamentale mantenere un'attenzione costante sul flusso di comunicazione e sul tracciamento delle modifiche condivise.

==== Raffinamento della pianificazione futura
Alla luce delle osservazioni raccolte, la pianificazione del periodo successivo è stata rifinita introducendo:
- Sessioni brevi di condivisione settimanale per allineare gli avanzamenti tecnici (RO4).

 // #text(" FINE NUOVA PARTE", fill: rgb(0, 130, 0))

#pagebreak()
==== Retrospettiva

Nel quarto periodo è stato redatto il secondo Diario di Bordo, sfruttando l'esperienza del ciclo precedente. Il responsabile ha avuto un ruolo più attivo nel coordinare la scrittura, mentre il verificatore ha impiegato meno tempo rispetto a quanto previsto. I membri del gruppo hanno collaborato in modo più autonomo, rendendo il documento più chiaro e uniforme.

Le attività di programmazione sono diminuite rispetto ai periodi iniziali, lasciando spazio alla documentazione e alla revisione del lavoro svolto. L'*Incremento 3 è stato completato* con successo, implementando script di inizializzazione ClickHouse, configurazione OSRM/PostgreSQL e servizi per analytics personalizzate. Gli *Incrementi 1 e 2 sono rimasti completamente operativi* durante tutto il periodo. La *validazione dell'azienda durante la Quinta Riunione Esterna del 2025-05-05* ha confermato l'integrazione efficace delle nuove funzionalità di analytics. Anche grazie alla durata più breve del periodo, il gruppo è riuscito a rispettare il numero di ore previsto, lavorando in modo più efficiente rispetto alle fasi precedenti.


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
// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Durante il quinto periodo, il gruppo ha avviato l'Incremento 3, con l'obiettivo di completare il backend del progetto e consolidare la parte di visualizzazione. Considerata la maggiore estensione funzionale rispetto ai periodi precedenti, sono stati considerati nuovamente centrali i rischi RT1 (complessità delle tecnologie implementate) e RT2 (inesperienza), legati alla necessità di mantenere la coerenza tra moduli già sviluppati e nuove funzionalità introdotte.


==== Rischi incontrati
Le attività si sono svolte in modo complessivamente ordinato, ma alcuni rischi si sono manifestati in forma latente. RT1 è emerso durante l'integrazione delle componenti sviluppate separatamente, dove si sono riscontrate leggere discrepanze nei formati dati e nella gestione delle chiamate API. Tuttavia, il gruppo è riuscito a intervenire tempestivamente, evitando ritardi significativi.

RO1 si è riflesso nella necessità di ricalibrare le assegnazioni in corso d'opera: alcune attività di test e revisione si sono rivelate più onerose del previsto, mentre altre sono state completate in anticipo. Questa dinamica ha richiesto una certa flessibilità interna per mantenere l'equilibrio complessivo.

==== Misure correttive adottate
Per affrontare RT1, il gruppo ha adottato una strategia di test progressivi: invece di concentrare i test alla fine del periodo, si è scelto di introdurli in parallelo allo sviluppo, riducendo il rischio di incongruenze tra moduli. Questa misura si è dimostrata efficace anche per migliorare la qualità del codice prodotto.

In risposta a RO1, il responsabile ha tenuto sotto controllo l'avanzamento delle attività e ha riassegnato in corso d'opera alcune task minori, in modo da distribuire meglio i carichi di lavoro effettivi. Questo ha permesso di chiudere il periodo in linea con le aspettative, senza accumuli o sovraccarichi rilevanti.

==== Retrospettiva e riflessione
Il gruppo ha mostrato una crescente autonomia nella gestione delle componenti software e un buon livello di organizzazione interna. Dalla retrospettiva è emersa la consapevolezza che la complessità del sistema stia aumentando in modo graduale, e che questo richiede maggiore attenzione nella documentazione tecnica, che altrimenti rischia di non tenere il passo con l'evoluzione del progetto.

==== Raffinamento della pianificazione futura
In preparazione al prossimo periodo, la pianificazione è stata rivista per:
- Anticipare la stesura della documentazione tecnica in parallelo allo sviluppo, così da ridurre disallineamenti tra codice e specifiche (RT1).
- Introdurre un controllo intermedio dei carichi di lavoro effettivi per ribilanciare le assegnazioni se necessario (RO1).
- Schedulare in anticipo le consegne intermedie per prevenire eventuali interferenze con impegni universitari (RO2).
//  #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

#pagebreak()
==== Retrospettiva

Durante il quinto periodo è stato realizzato il terzo Diario di Bordo, confermando le buone abitudini sviluppate nei cicli precedenti. Questo ha favorito una collaborazione più solida e ha permesso di valutare con maggiore precisione le ore effettivamente dedicate al progetto. La pianificazione su base settimanale ha continuato a essere un valido supporto per mantenere il lavoro organizzato e sotto controllo.

L'*Incremento 4 è stato completato* con successo, implementando Grafana dashboards completi, configurazione Prometheus, Loki per logging centralizzato e Docker Compose ottimizzato per produzione. Tutti gli *Incrementi precedenti (1, 2 e 3) sono rimasti completamente operativi* durante l'implementazione delle nuove funzionalità di monitoring. La *validazione dell'azienda durante la Sesta Riunione Esterna del 15/05* ha confermato che il P.o.C. è production-ready e particolarmente adeguato. Le ore impiegate sono risultate coerenti con quelle stimate, a dimostrazione di una crescente capacità organizzativa. L'intero ciclo si è concluso senza criticità rilevanti.

#pagebreak()
#align(center, [=== PERIODO 6 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-05-18],
    [Fine prevista],[2025-05-24],
    [Fine effettiva],[2025-05-24]
  )
)


==== Pianificazione
In mancanza del diario di bordo, durante questo periodo il gruppo si è preposto di occuparsi degli ultimi obiettivi necessari: inizializzazione ClickHouse, configurazione OSRM/PostgreSQL, sviluppo di un generatore di messaggi personalizzati e script di test per la configurazione.

Con il completamento dell'*Incremento 4* e la validazione positiva dell'azienda del P.o.C., il gruppo si concentra sulla finalizzazione delle attività residue e sulla preparazione per la fase conclusiva di RTB, mantenendo *completamente operativi tutti gli Incrementi precedenti (1, 2, 3 e 4)*.

==== Preventivo

- totale ore previste: 27 ore
- costo max previsto: 540€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[],[],[],[],[5],[],
    [Nicolò Bovo],[],[],[1],[],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[4],[],[],
    [Romeo Calearo],[],[],[],[],[],[5],
    [Massimo Chioru],[5],[],[],[],[],[],
    [Elia Leonetti],[],[],[],[],[5],[],
    [Manuel Cinnirella],[],[2],[],[],[],[],
  )
)

#pagebreak()
==== Prospetto orario

- totale ore previste: 27 
- ore effettive: 26

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[],[],[],[],[5],[],
    [Nicolò Bovo],[],[],[1],[],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[4],[],[],
    [Romeo Calearo],[],[],[],[],[],[3 (-2)],
    [Massimo Chioru],[4 (-1)],[],[],[],[],[],
    [Elia Leonetti],[],[],[],[],[5],[],
    [Manuel Cinnirella],[],[4 (+2)],[],[],[],[],
  )
)

==== Prospetto economico

- costo max:  540€
- costo effettivo: 520€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[4],[120],[-30],
    [Amministratore],[4],[80],[+40],
    [Analista],[1],[25],[],
    [Progettista],[4],[100],[],
    [Programmatore],[10],[150],[],
    [Verificatore],[3],[45],[-30],
  )
)
// #text("NUOVA PARTE", fill: rgb(0, 130, 0))


==== Rischi attesi
Nel sesto periodo il gruppo ha portato a termine l'Incremento 3, con il completamento delle funzionalità core del backend. La fase richiedeva particolare attenzione all'integrazione e alla coerenza tra le componenti esistenti, mantenendo centrale il rischio RT1 (complessità delle tecnologie implementate). Sul piano organizzativo, si è continuato a monitorare RO1 (difficoltà nella previsione dei carichi di lavoro), viste le numerose attività parallele, e RO4 (problemi di comunicazione), considerando l'elevato livello di interdipendenza tra sottogruppi.

==== Rischi incontrati
RT1 ha avuto un impatto moderato nella gestione dei dati provenienti dal simulatore e nella configurazione delle API di accesso. RO4 si è manifestato in piccole inefficienze nella comunicazione tra chi gestiva frontend e backend.

==== Misure correttive adottate
Per contenere RT1, sono stati svolti test incrementali di compatibilità e si è consolidata una struttura comune per i payload scambiati. RO4 è stato mitigato migliorando la sincronizzazione delle attività tramite una board aggiornata e un confronto tecnico diretto tra i referenti dei moduli.

==== Retrospettiva e riflessione
Il periodo si è concluso positivamente, con l'implementazione completa delle funzionalità previste e un buon coordinamento generale. La retrospettiva ha evidenziato la necessità di documentare meglio le modifiche comuni e anticipare i momenti di allineamento tecnico.

==== Raffinamento della pianificazione futura
Il gruppo ha deciso di introdurre una fase preliminare di confronto all'inizio di ogni settimana per prevenire disallineamenti (RO4) e di fissare momenti di verifica congiunti tra moduli prima delle scadenze finali (RT1). È stato inoltre rafforzato il monitoraggio del carico effettivo delle attività (RO1).
// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva

Il sesto periodo ha confermato la validità di una pianificazione su base settimanale, che ha permesso un controllo più preciso delle attività. L'assenza del diario ha lasciato maggiore libertà ai programmatori, che hanno potuto concentrarsi su sviluppo e test. La breve durata ha impedito grandi scostamenti da quanto pianificato. Il gruppo ha gestito bene il carico di lavoro, beneficiando del margine guadagnato nei periodi precedenti.

Sono stati completati i task finali consolidando ulteriormente il P.o.C. production-ready validato dall'azienda. Tutti gli *Incrementi precedenti (1, 2, 3 e 4) sono rimasti completamente stabili* senza alcuna regressione. Con quattro incrementi completati e validati, il sistema mantiene piena operatività in tutte le sue componenti principali. Le attività si sono svolte con regolarità preparando il terreno per la conclusione della fase RTB.

#pagebreak()
#align(center, [=== PERIODO 7 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-05-25],
    [Fine prevista],[2025-05-31],
    [Fine effettiva],[2025-05-31]
  )
)


==== Pianificazione

Il gruppo si è preposto di chiudere il ciclo di sviluppo con task conclusivi: test unitari per il modulo cache, aggiornamento del file .gitignore e recupero di file mancanti dalla fase iniziale. È stato previsto anche il quarto diario di bordo.

Con il P.o.C. completato e validato attraverso i quattro incrementi, il gruppo si concentra sulla finalizzazione della documentazione e sulla preparazione per la conclusione della fase RTB, mantenendo *completamente operativi tutti gli Incrementi precedenti (1, 2, 3 e 4)*.

==== Preventivo

- totale ore previste: 27 ore
- costo max previsto: 540€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[],[],[],[],[],[5],
    [Nicolò Bovo],[],[],[],[4],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[],[5],[],
    [Romeo Calearo],[],[2],[],[],[],[],
    [Massimo Chioru],[],[],[],[],[5],[],
    [Elia Leonetti],[5],[],[],[],[],[],
    [Manuel Cinnirella],[],[],[1],[],[],[],
  )
)

#pagebreak()
==== Prospetto orario

- totale ore previste: 27 
- ore effettive: 25

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[],[],[],[],[],[5],
    [Nicolò Bovo],[],[],[],[4],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[],[4 (-1)],[],
    [Romeo Calearo],[],[3 (+1)],[],[],[],[],
    [Massimo Chioru],[],[],[],[],[4 (-1)],[],
    [Elia Leonetti],[4 (-1)],[],[],[],[],[],
    [Manuel Cinnirella],[],[],[1],[],[],[],
  )
)

==== Prospetto economico

- costo max:  540€
- costo effettivo: 500€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[4],[120],[-30],
    [Amministratore],[3],[60],[+20],
    [Analista],[1],[25],[],
    [Progettista],[4],[100],[],
    [Programmatore],[8],[120],[-30],
    [Verificatore],[5],[75],[],
  )
)

// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Il settimo periodo è stato dedicato all'Incremento 4, che ha introdotto la componente amministrativa e nuovi dettagli nelle visualizzazioni. Il gruppo ha mantenuto alta l'attenzione su RT1 (complessità delle tecnologie implementate), per via dell'aggiunta di nuove funzionalità su un sistema ormai articolato. Sul fronte organizzativo, sono stati considerati i rischi RO2 (conflitto con impegni personali) e RO4 (problemi di comunicazione), rilevanti data la necessità di riorganizzare alcune assegnazioni interne.

==== Rischi incontrati
Durante il periodo si è manifestato parzialmente il rischio RO2: alcuni membri hanno avuto disponibilità ridotta per motivi accademici, con effetti minimi ma percepibili sulla distribuzione del carico. RT1 si è confermato nelle fasi finali di test e rifinitura, in cui si sono evidenziate alcune criticità di compatibilità tra i moduli utente e amministratore.

==== Misure correttive adottate
RO2 è stato affrontato adattando le assegnazioni in modo dinamico, privilegiando attività indipendenti per i membri con meno disponibilità. RT1 è stato mitigato con l'introduzione di test mirati per le nuove funzionalità, integrati nei flussi di verifica già esistenti.

==== Retrospettiva e riflessione
Il gruppo ha completato tutte le funzionalità previste per l'incremento, dimostrando una crescente capacità di gestire integrazioni complesse. 

==== Raffinamento della pianificazione futura
È stato deciso di calendarizzare in anticipo eventuali indisponibilità (RO2) e di effettuare una verifica tecnica intermedia ogni 5 giorni per anticipare l'insorgere di problemi di compatibilità (RT1).

// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva

Anche nel settimo periodo il gruppo ha rispettato la pianificazione, mantenendo un buon equilibrio tra preventivo e consuntivo. Il diario è stato prodotto regolarmente, confermando l'efficacia del metodo ormai consolidato. Le lievi riduzioni di ore in alcuni ruoli non hanno compromesso il risultato finale. Il gruppo ha mantenuto una buona organizzazione interna e ha saputo reagire con flessibilità alle piccole variazioni.

Sono stati completati i task conclusivi consolidando la qualità del P.o.C. attraverso test aggiuntivi e pulizia del repository. Tutti gli *Incrementi precedenti (1, 2, 3 e 4) sono rimasti completamente stabili* e operativi. La documentazione è stata affinata in vista della conclusione della fase RTB. Complessivamente, il periodo è stato produttivo e senza intoppi, dimostrando la maturità raggiunta dal gruppo nella gestione del modello incrementale.

#pagebreak()
#align(center, [=== PERIODO 8 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-06-01],
    [Fine prevista],[2025-06-07],
    [Fine effettiva],[2025-06-07]
  )
)


==== Pianificazione

Dopo aver avuto un confronto con l'azienda proponente e considerando un lieve anticipo sulla tabella di marcia, il gruppo ha ritenuto opportuno valutare possibili ottimizzazioni al P.o.C. A tal proposito si è ritenuto opportuno considerare un incontro con il Professor Cardin per chiedere dei consigli per avere un riscontro. In questo periodo il gruppo si è inoltre preposto di completare la stesura dei documenti mancanti, di inviare i verbali esterni all'azienda per la firma di validazione e di effettuare una revisione generale in vista di una prossima fine del periodo di RTB.

Con quattro incrementi completati e validati, il gruppo mantiene *completamente operativi tutti gli Incrementi precedenti (1, 2, 3 e 4)* mentre esplora possibili miglioramenti finali.

==== Preventivo

- totale ore previste: 27 ore
- costo max previsto: 540€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[5],[],[],[],[],[],
    [Nicolò Bovo],[],[],[1],[],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[],[],[5],
    [Romeo Calearo],[],[2],[],[],[],[],
    [Massimo Chioru],[],[],[],[],[5],[],
    [Elia Leonetti],[],[],[],[],[5],[],
    [Manuel Cinnirella],[],[],[],[4],[],[],
  )
)
#pagebreak()
==== Prospetto orario

- totale ore previste: 27 
- ore effettive: 25

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[4 (-1)],[],[],[],[],[],
    [Nicolò Bovo],[],[],[1],[],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[],[],[5],
    [Romeo Calearo],[],[3],[],[],[],[],
    [Massimo Chioru],[],[],[],[],[4 (-1)],[],
    [Elia Leonetti],[],[],[],[],[4 (-1)],[],
    [Manuel Cinnirella],[],[],[],[4],[],[],
  )
)
==== Prospetto economico

- costo max:  540€
- costo effettivo: 500€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[4],[120],[-30],
    [Amministratore],[3],[60],[+20],
    [Analista],[1],[25],[],
    [Progettista],[4],[100],[],
    [Programmatore],[8],[120],[-30],
    [Verificatore],[5],[75],[],
  )
)

// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Nel periodo 8 il rischio RT1 (complessità delle tecnologie implementate) è rimasto centrale, in quanto il sistema ha raggiunto un alto grado di articolazione. Anche RO1 (difficoltà nella previsione dei carichi) è stato monitorato, considerato l'accumulo di attività da chiudere prima della fase finale.

==== Rischi incontrati
Il rischio RO1 si è concretizzato in misura moderata, mentre RT1 ha avuto impatto nella gestione delle interfacce tra moduli, che hanno mostrato una crescente complessità man mano che si aggiungevano livelli di logica e autorizzazione.

==== Misure correttive adottate
Per gestire RO1, il gruppo ha introdotto un sistema di priorità tra task, concentrandosi prima su quelli critici. 

==== Retrospettiva e riflessione
Il gruppo ha riscontrato una certa pressione nella gestione delle attività, ma è riuscito a mantenere il controllo attraverso una buona cooperazione e adattabilità. La retrospettiva ha evidenziato l'importanza di affrontare in modo preventivo i nodi tecnici complessi, prima che si accumulino nelle fasi finali.

==== Raffinamento della pianificazione futura
È stato deciso di limitare l'aggiunta di nuove funzionalità nei periodi successivi, concentrandosi su stabilità e qualità (RT1). Inoltre, si è previsto un calendario di revisione scaglionata per evitare picchi di carico (RO1), distribuendo le verifiche finali su più giornate.

// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva

L'incontro online con il Professor Cardin ha confermato l'idea del team di inserire uno stream processor nel P.o.C. che si stima possa richiedere un paio di settimane. Durante la *riunione interna del 6 giugno*, il gruppo ha preso la decisione di implementare un *quinto incremento* focalizzato su stream processing in tempo reale, con l'obiettivo di introdurre un stream processor ed eliminare il consumer tradizionale per l'elaborazione dati in tempo reale.

La revisione generale dei documenti e del P.o.C. porta il team a ipotizzare una possibile fine del periodo di RTB nelle prossime due settimane, in linea con quanto pianificato, a dimostrazione che nonostante un lieve anticipo guadagnato delle settimane iniziali è stato corretto lasciare un margine temporale di sicurezza. L'*Incremento 5 è stato avviato* con pianificazione dettagliata, mantenendo *completamente operativi tutti gli Incrementi precedenti (1, 2, 3 e 4)* senza modifiche distruttive. 

#pagebreak()
#align(center, [=== PERIODO 9 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-06-08],
    [Fine prevista],[2025-06-14],
    [Fine effettiva],[2025-06-14]
  )
)


==== Pianificazione
Il gruppo prevede di iniziare l'integrazione dello Stream Processor nel P.o.C. nel corso del nono periodo di RTB dedicando ai test nel periodo successivo. Si prevede un leggero aumento dei costi relativi ai ruoli di programmazione vista la nuova feature aggiunta, mentre un ruolo maggiore del verificatore era già stato messo in preventivo considerando la necessità di maggiori revisioni in vista della fine del periodo di RTB. Tali decisioni verranno presentate durante il Diario di Bordo.

L'*Incremento 5* è in fase di sviluppo attivo con l'obiettivo di introdurre stream processing, eliminare il consumer tradizionale e implementare elaborazione dati in tempo reale, mantenendo *completamente operativi tutti gli Incrementi precedenti (1, 2, 3 e 4)* senza modifiche distruttive.

==== Preventivo

- totale ore previste: 32 ore
- costo max previsto: 610€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[],[],[1],[],[],[],
    [Nicolò Bovo],[],[3],[],[],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[],[7],[],
    [Romeo Calearo],[],[],[],[],[],[6],
    [Massimo Chioru],[5],[],[],[],[],[],
    [Elia Leonetti],[],[],[],[],[7],[],
    [Manuel Cinnirella],[],[],[],[3],[],[],
  )
)
#pagebreak()
==== Prospetto orario

- totale ore previste: 32
- ore effettive: 23

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Alessandro Di Pasquale],[],[],[1],[],[],[],
    [Nicolò Bovo],[],[3],[],[],[],[],
    [Giovanni Battista Matteazzi],[],[],[],[],[4 (-3)],[],
    [Romeo Calearo],[],[],[],[],[],[3 (-3)],
    [Massimo Chioru],[4 (-1)],[],[],[],[],[],
    [Elia Leonetti],[],[],[],[],[4 (-3)],[],
    [Manuel Cinnirella],[],[],[],[4 (+1)],[],[],
  )
)
==== Prospetto economico

- costo max:  610€
- costo effettivo: 470€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[4],[120],[-30],
    [Amministratore],[3],[60],[],
    [Analista],[1],[25],[],
    [Progettista],[4],[100],[+25],
    [Programmatore],[8],[120],[-90],
    [Verificatore],[3],[45],[-45],
  )
)
// #text("NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi incontrati
RT1 si è manifestato durante la fase di test, in cui sono emerse alcune difficoltà nell'esecuzione di scenari complessi che coinvolgevano moduli interdipendenti. RO4 è emerso in modo lieve: alcune informazioni non aggiornate sulla documentazione condivisa hanno portato a piccoli disallineamenti nelle verifiche.

==== Misure correttive adottate
Per contenere RT1, il gruppo ha creato una lista strutturata di casi d'uso per facilitare la copertura completa nei test. RO4 è stato gestito aggiornando più frequentemente la documentazione centralizzata e definendo un responsabile per il monitoraggio della coerenza tra documentazione e stato del software.

==== Retrospettiva e riflessione
La validazione ha mostrato che il sistema è robusto, ma ha anche messo in evidenza quanto sia fondamentale la precisione nella trasmissione delle informazioni in fase finale. Il gruppo ha rafforzato la consapevolezza dell'importanza del controllo incrociato e della standardizzazione delle procedure.

==== Raffinamento della pianificazione futura
È stato introdotto un processo di review incrociata dei documenti e dei test (RO4), e si è deciso di integrare i casi d'uso più rappresentativi direttamente nei test automatici ove possibile (RT1), per rafforzare la copertura e ridurre il rischio di regressioni nelle ultime fasi.
// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva

Nonostante i ruoli del Progettista e dell'Analista abbiano richiesto un leggero aumento orario in vista delle nuove integrazioni tecniche, i ruoli del Programmatore del Verificatore e dell'Amministratore hanno richiesto un impegno lievemente minore di quanto preventivato. Questo ha consentito di rientrare comunque nel monte orario, ma soprattutto nei costi previsti per il penultimo periodo di RTB.

L'*Incremento 5 è stato completato con successo* (2025-06-12), implementando il stream processor per elaborazione in tempo reale ed eliminando il consumer tradizionale come pianificato. Tutti gli *Incrementi precedenti (1, 2, 3 e 4) sono rimasti completamente stabili e operativi* durante l'integrazione delle nuove funzionalità. La *validazione dell'azienda durante la Settima Riunione Esterna* ha confermato l'efficacia del quinto incremento. Il modello incrementale ha dimostrato la sua completa efficacia, permettendo di aggiungere funzionalità avanzate di stream processing senza compromettere la stabilità del sistema esistente, completando così tutti e cinque gli incrementi pianificati per la fase RTB.

#pagebreak()
#align(center, [=== PERIODO 10 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-06-15],
    [Fine prevista],[2025-06-21],
    [Fine effettiva],[2025-06-21]
  )
)

==== Pianificazione
Il decimo periodo, così come i due successivi, è caratterizzato dalla sovrapposizione con il periodo della sessione estiva. Di conseguenza è stato preventivato un ridotto numero di ore da dedicare al progetto rivolte prevalentemente al completamento della documentazione e della presentazione del Diario di Bordo.

==== Preventivo

- totale ore previste:  23
- costo max previsto: 460€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Manuel Cinnirella], [4], [], [], [], [], [], 
    [Nicolò Bovo], [], [], [1], [], [], [], 
    [Alessandro Di Pasquale], [], [3], [], [], [], [], 
    [Romeo Calearo], [], [], [], [3], [], [], 
    [Massimo Chioru], [], [], [], [], [4], [], 
    [Elia Leonetti], [], [], [], [], [4], [], 
    [Giovanni Battista Matteazzi], [], [], [], [], [], [4]
  )
)
#pagebreak()
==== Prospetto orario

- totale ore previste: 23
- ore effettive: 14

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Manuel Cinnirella], [3 (-1)], [], [], [], [], [],
    [Nicolò Bovo], [], [], [1], [], [], [],
    [Alessandro Di Pasquale], [], [1 (-2)], [], [], [], [],
    [Romeo Calearo], [], [], [], [2 (-1)], [], [],
    [Massimo Chioru], [], [], [], [], [2 (-2)], [],
    [Elia Leonetti], [], [], [], [], [2 (-2)], [],
    [Giovanni Battista Matteazzi], [], [], [], [], [], [3 (-1)],
  )
)

==== Prospetto economico

- costo max:  460€
- costo effettivo: 290€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[3],[90],[-30],
    [Amministratore],[1],[20],[-40],
    [Analista],[1],[25],[],
    [Progettista],[2],[50],[-25],
    [Programmatore],[4],[60],[-60],
    [Verificatore],[3],[45],[-15],
  )
)
// #text(" NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Nel decimo periodo il focus si è spostato sulla rifinitura del sistema, la validazione interna completa e l'allineamento finale tra documentazione e implementazione. I rischi principali considerati sono stati RT1 (complessità delle tecnologie implementate), in quanto eventuali incongruenze residue tra moduli potevano emergere solo in test avanzati, e RO1 (difficoltà nella previsione dei carichi), legato all'accavallarsi delle ultime attività.

==== Rischi incontrati
RT1 si è evidenziato nella gestione di casi limite non considerati inizialmente, che hanno richiesto piccole modifiche a codice e logica. RO1 si è manifestato con una leggera compressione dei tempi verso la fine del periodo, a causa della coesistenza di testing, revisione dei documenti e gestione delle consegne.

==== Misure correttive adottate
Per gestire RT1, il gruppo ha mantenuto una lista dinamica di bug minori e fix rapidi, evitando la dispersione degli interventi. RO1 è stato affrontato pianificando momenti di lavoro focalizzati, assegnando priorità alta alle attività più critiche per il rilascio.

==== Retrospettiva e riflessione
Il gruppo ha dimostrato una buona capacità di adattamento anche in fase di chiusura. La retrospettiva ha confermato che la gestione dei dettagli tecnici e l'allineamento finale tra le parti richiedono attenzione costante, ma che il processo adottato è ormai consolidato.

==== Raffinamento della pianificazione futura
In vista delle ultimissime fasi, è stato deciso di mantenere un canale diretto tra responsabile e sviluppatori per gestire gli ultimi ritocchi (RO1), e di completare in anticipo la validazione interna dei documenti prima della revisione conclusiva (RT1).
// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva

Il decimo periodo è stato caratterizzato da una leggera riduzione del monte orario da  parte del team, impegnato nello studio per la sessione estiva. E' proseguita la stesura dei verbali esterni e interni mancanti in vista della riunione con l'azienda della settimana successiva.

#pagebreak()
#align(center, [=== PERIODO 11 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-06-22],
    [Fine prevista],[2025-06-28],
    [Fine effettiva],[2025-06-28]
  )
)
==== Pianificazione
In questo periodo è stato nuovamente preventivato un ridotto quantitativo di ore da dedicare al progetto. L'obiettivo rimane coerente col periodo precedente ossia di completare la documentazione necessaria da presentare all'azienda per la firma. 

==== Preventivo

- totale ore previste: 20
- costo max previsto: 385€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [3], [], [], [], [], [],
    [Massimo Chioru], [], [], [1], [], [], [], 
    [Romeo Calearo], [], [2], [], [], [], [], 
    [Manuel Cinnirella], [], [], [], [2], [], [], 
    [Alessandro Di Pasquale], [], [], [], [], [4], [], 
    [Nicolò Bovo], [], [], [], [], [4], [], 
    [Elia Leonetti], [], [], [], [], [], [4],
  )
)

==== Prospetto orario

- totale ore previste: 20
- ore effettive: 9

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [2 (-1)], [], [], [], [], [], 
    [Massimo Chioru], [], [], [1], [], [], [], 
    [Romeo Calearo], [], [1 (-1)], [], [], [], [], 
    [Manuel Cinnirella], [], [], [], [1 (-1)], [], [], 
    [Alessandro Di Pasquale], [], [], [], [], [1 (-3)], [], 
    [Nicolò Bovo], [], [], [], [], [2 (-2)], [],
    [Elia Leonetti], [], [], [], [], [], [1 (-1)],
  )
)

==== Prospetto economico

- costo max:  385€
- costo effettivo: 190€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[2],[60],[-30],
    [Amministratore],[1],[20],[-20],
    [Analista],[1],[25],[],
    [Progettista],[1],[25],[-25],
    [Programmatore],[3],[45],[-75],
    [Verificatore],[1],[15],[-45],
  )
)

//#text(" NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Durante l'undicesimo periodo il gruppo ha affrontato la fase conclusiva di rifinitura, dedicandosi alla revisione della documentazione, alla sistemazione di piccoli dettagli nel codice e alla preparazione della revisione finale. In questa fase, il rischio RO1 (difficoltà nella previsione dei carichi di lavoro) è stato considerato rilevante, poiché la compresenza di molte attività diverse, alcune tecniche e altre documentali, rendeva difficile stimare con precisione il tempo necessario per ciascuna. Allo stesso tempo, è stato tenuto presente anche RT2 (inesperienza), in quanto il gruppo si trovava per la prima volta a dover affrontare una revisione strutturata, secondo criteri di qualità stringenti e standard ufficiali.

==== Rischi incontrati
RO1 si è concretizzato principalmente nella gestione simultanea delle ultime attività: il completamento di documenti, la preparazione della revisione, la rifinitura del codice e le correzioni minori hanno richiesto una continua riorganizzazione delle priorità. Alcune attività, inizialmente considerate marginali, si sono rivelate più complesse, generando piccoli scostamenti rispetto alla pianificazione.

RT2 ha avuto un impatto lieve, ma percepibile: nella redazione finale dei documenti più articolati, come il Piano di Qualifica sono emerse alcune imprecisioni che hanno richiesto revisioni multiple. Queste difficoltà sono derivate in parte dalla mancanza di esperienza nel seguire schemi rigorosi di conformità e qualità.

==== Misure correttive adottate

RT2 è stato affrontato tramite un rafforzamento della revisione incrociata: ogni documento è stato esaminato da almeno due membri diversi, in modo da migliorare la qualità finale e correggere tempestivamente eventuali errori. Questo approccio ha contribuito a rendere più omogenea la produzione e a rispettare i requisiti formali imposti.

==== Retrospettiva e riflessione
La riflessione di fine periodo ha evidenziato una buona tenuta del gruppo anche sotto pressione. L'autonomia raggiunta dai membri, unita alla flessibilità organizzativa, ha permesso di affrontare con efficacia le difficoltà legate alla molteplicità di attività. La retrospettiva ha anche messo in luce l'importanza di mantenere una pianificazione più dettagliata proprio nelle fasi finali, in cui la varietà e la densità del lavoro possono facilmente generare disallineamenti se non gestite con attenzione.

==== Raffinamento della pianificazione futura
In vista del periodo conclusivo, è stato deciso di anticipare le revisioni interne dei documenti più critici, in modo da evitare sovrapposizioni con le attività residue di rifinitura tecnica (RT2). Inoltre, si è introdotta una pianificazione giornaliera dettagliata, con aggiornamenti condivisi tra tutti i membri, per distribuire in modo equilibrato le ultime attività e prevenire situazioni di sovraccarico (RO1). L'obiettivo è chiudere il progetto mantenendo ordine, coerenza e continuità con la qualità raggiunta.
// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva
Anche questo periodo le ore dedicate al progetto sono state inferiori a quelle preventivate, indicando che il periodo della sessione ha richiesto più tempo di quello previsto. Il team si è proposto di aggiornare il Piano di Qualifica, in particolare di incrementare le ore lavoro dei periodi successivi, in particolare quelli relativi alla fase PB per compensare questi ultimi leggeri ritardi. Il P.o.C. è comunque ad uno stato sufficientemente avanzato da non destare troppe preoccupazioni circa la scadenza imminente della fase RTB. 



#pagebreak()
#align(center, [=== PERIODO 12 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-06-29],
    [Fine prevista],[2025-07-05],
    [Fine effettiva],[2025-07-05]
  )
)
==== Pianificazione
Questo periodo corrisponde all'ultima settimana di sessione da parte del team. Coerentemente con gli ultimi due periodi precedenti non sono stati previsti obiettivi importanti per consentire ad ogni membro di concentrarsi sullo studio. In seguito alle riflessioni del periodo precedente il team si è proposto di modificare il Piano di Qualifica per garantire il raggiungimento degli obiettivi nonostante i rallentamenti leggermente superiori alle aspettative.

==== Preventivo

- totale ore previste:  21
- costo max previsto: 410€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Elia Leonetti], [3], [], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [2], [], [], [], 
    [Romeo Calearo], [], [2], [], [], [], [], 
    [Nicolò Bovo], [], [], [], [2], [], [], 
    [Giovanni Battista Matteazzi], [], [], [], [], [4], [], 
    [Massimo Chioru], [], [], [], [], [4], [],
    [Manuel Cinnirella], [], [], [], [], [], [4],
  )
)
==== Prospetto orario

- totale ore previste: 21
- ore effettive: 9

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Elia Leonetti], [2 (-1)], [], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [1 (-1)], [], [], [], 
    [Romeo Calearo], [], [1 (-1)], [], [], [], [], 
    [Nicolò Bovo], [], [], [], [1 (-1)], [], [], 
    [Giovanni Battista Matteazzi], [], [], [], [], [2 (-2)], [], 
    [Massimo Chioru], [], [], [], [], [1 (-3)], [],
    [Manuel Cinnirella], [], [], [], [], [], [1 (-3)],
  )
)

==== Prospetto economico

- costo max:  410€
- costo effettivo: 190€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[2],[60],[-30],
    [Amministratore],[1], [20],[-20],
    [Analista],[1],[25],[-25],
    [Progettista],[1],[25],[-25],
    [Programmatore],[3],[45],[-75],
    [Verificatore],[1],[15],[-45],
  )
)

// #text(" NUOVA PARTE", fill: rgb(0, 130, 0))


==== Rischi attesi
Il dodicesimo periodo ha rappresentato il momento di finalizzazione effettiva del progetto: tutte le attività residue, sia tecniche che documentali, sono state consolidate in vista della chiusura definitiva. I rischi principali previsti sono stati RO1 (difficoltà nella previsione dei carichi di lavoro), vista l'elevata concentrazione di attività da completare in tempi ristretti, e RT2 (inesperienza), per via della necessità di gestire la transizione verso la consegna finale secondo criteri di qualità e coerenza complessiva.

==== Rischi incontrati
Il rischio RO1 si è manifestato nella gestione della compressione temporale tra le attività ancora aperte e le scadenze finali. Alcune verifiche e rifiniture hanno richiesto più tempo del previsto, generando una lieve pressione sul gruppo. RT2 ha avuto impatto nella gestione dell'omogeneità tra i diversi documenti, dove si sono presentate piccole differenze terminologiche o di struttura che hanno richiesto armonizzazione.

==== Misure correttive adottate

RT2 è stato affrontato con una rilettura trasversale dei documenti principali, condotta da membri esterni alla loro prima stesura. Questo ha favorito l'uniformità del tono e del contenuto e ha consentito di intervenire rapidamente in caso di disallineamenti.

==== Retrospettiva e riflessione
La retrospettiva di questo periodo ha confermato che il gruppo è ormai in grado di gestire in modo maturo anche le fasi più delicate del progetto. La coesione raggiunta, unita a una gestione flessibile ma ordinata del lavoro, ha permesso di superare le difficoltà legate alla densità di attività. È emersa però la consapevolezza che, nella fase finale, anche i dettagli apparentemente secondari richiedono attenzione per evitare difetti di forma o contenuto.

==== Raffinamento della pianificazione futura
Pur essendo ormai al termine, il gruppo ha deciso di mantenere l'approccio adottato anche per l'ultima fase: pianificazione quotidiana, revisione incrociata dei contenuti (RT2) e aggiornamenti condivisi sullo stato delle attività (RO1). L'obiettivo resta quello di garantire una chiusura ordinata, completa e coerente con gli standard raggiunti nel progetto.

// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva
Anche quest'ultimo periodo ha risentito della leggera sottovalutazione del tempo da dedicare allo studio inizialmente preventivato. Il team tuttavia si è accordato per incrementare il monte orario previsto nei  periodi successivi visto il termine della fase di studio. Con questo periodo si chiude la fase di RTB.




#pagebreak()
#align(center, [=== PERIODO 13 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-07-06],
    [Fine prevista],[2025-07-12],
    [Fine effettiva],[2025-07-12]
  )
)

==== Pianificazione
Il tredicesimo periodo rappresenta la fine ufficiale degli obiettivi del periodo RTB. Il gruppo ha stabilito di effettuare un controllo finale della documentazione e del P.o.C. in vista della revisione RTB.

==== Preventivo

- totale ore previste: 31
- costo max previsto: 565€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [4], [], [], [], [], [], 
    [Nicolò Bovo], [], [], [1], [], [], [], 
    [Massimo Chioru], [], [2], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [], [2], [], [], 
    [Elia Leonetti], [], [], [], [], [7], [], 
    [Manuel Cinnirella], [], [], [], [], [7], [],
    [Romeo Calearo], [], [], [], [], [], [8],
  )
)

==== Orari effettivi

- totale ore previste: 31
- totale ore effettive: 41

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Program.*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [6 (+2)], [], [], [], [], [], 
    [Nicolò Bovo], [], [], [3 (+2)], [], [], [], 
    [Massimo Chioru], [], [6 (+4)], [], [], [], [], 
    [Alessandro Di Pasquale], [], [], [], [7 (+5)], [], [], 
    [Elia Leonetti], [], [], [], [], [6 (-1)], [], 
    [Manuel Cinnirella], [], [], [], [], [6 (-1)], [], 
    [Romeo Calearo], [], [], [], [], [], [7 (-1)],
  )
)

==== Costi effettivi

- costo previsto: 565€
- costo effettivo: 835€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[6],[180],[+60],
    [Analista],[3],[75],[+50],
    [Progettista],[7],[175],[+125],
    [Amministratore],[6],[120],[+80],
    [Programmatore],[12],[180],[-30],
    [Verificatore],[7],[105],[-15],
  )
)

// #text(" NUOVA PARTE", fill: rgb(0, 130, 0))

==== Rischi attesi
Il tredicesimo e ultimo periodo è stato interamente dedicato alla chiusura del progetto: revisione finale di tutta la documentazione, preparazione della consegna ufficiale e sistemazione di eventuali dettagli rimasti aperti. I rischi principali considerati sono stati RO1 (difficoltà nella previsione dei carichi), per via dell'accavallarsi di scadenze definitive e attività residue.

==== Rischi incontrati
RO1 si è presentato nella forma di una forte concentrazione delle attività negli ultimi giorni, che ha richiesto attenzione nel bilanciare sforzo e qualità. Nonostante la pianificazione giornaliera, alcune verifiche e impaginazioni hanno richiesto tempi superiori a quelli previsti.

==== Misure correttive adottate
Il gruppo ha mantenuto attiva l'agenda giornaliera introdotta nei periodi precedenti garantendo così una doppia verifica prima della consegna finale. Inoltre, è stato definito un responsabile per ciascun documento chiave, al fine di centralizzare le decisioni e ridurre il rischio di modifiche scoordinate.

==== Retrospettiva e riflessione
La retrospettiva finale ha evidenziato la piena maturazione del gruppo: il progetto si è concluso nel rispetto delle tempistiche e con un livello qualitativo elevato, frutto di un processo incrementale ben gestito. La gestione delle criticità residue è stata affrontata in modo proattivo, con un'organizzazione ormai rodata e un'attenzione particolare ai dettagli. Il percorso ha confermato l'efficacia del ciclo iterativo basato su osservazione, riflessione e adattamento continuo.

==== Raffinamento della pianificazione futura
Essendo l'ultima fase, non sono state previste ulteriori iterazioni. Tuttavia, il gruppo ha tratto indicazioni utili per futuri progetti: anticipare la rifinitura dei documenti nelle fasi intermedie (RT2) e monitorare con maggiore precisione le attività di chiusura per evitare sovraccarichi negli ultimi giorni (RO1). Questi apprendimenti potranno essere riutilizzati in contesti simili o nella futura attività professionale.

// #text("FINE NUOVA PARTE", fill: rgb(0, 130, 0))

==== Retrospettiva
Il tredicesimo periodo ha visto il gruppo impegnato al controllo finale della documentazione, il suo relativo aggiornamento sul sito web e l'invio della mail di candidatura per la revisione RTB.


#pagebreak()
// #text("INIZIO FASE PB", fill: rgb(0, 130, 0))
#align(center, [=== PERIODO 14 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-07-13],
    [Fine prevista],[2025-07-19],
    [Fine effettiva],[2025-07-19]
  )
)

==== Pianificazione
Nel quattordicesimo periodo, in vista della prima verifica della fase RTB con il Prof. Cardin, il gruppo ha pianificato un monte ore bilanciato tra attività di revisione documentale, preparazione delle slide e simulazioni orali. È stata prevista un'incidenza maggiore per i ruoli di verificatore, data la necessità di controllare la completezza e la coerenza dei documenti, e per il ruolo di programmatore, per eventuali test funzionali sul P.o.C. Le ore per analista e progettista sono state mantenute più contenute, in quanto l'attività di progettazione in questa fase si è concentrata soprattutto sulla validazione dei contenuti esistenti.

==== Preventivo

- totale ore previste: 28
- costo max previsto: 560€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [], [], [], [0], 
    [Nicolò Bovo], [], [], [], [], [8], [], 
    [Massimo Chioru], [], [2], [], [], [], [], 
    [Alessandro Di Pasquale], [4], [], [], [], [], [], 
    [Elia Leonetti], [], [], [], [4], [], [], 
    [Manuel Cinnirella], [], [], [3], [], [], [],
    [Romeo Calearo], [], [], [], [], [7], [],
  )
)

==== Orari effettivi

- totale ore previste: 28
- totale ore effettive: 18

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [], [], [], [10 (+10)], 
    [Nicolò Bovo], [], [], [], [], [6 (+2)], [], 
    [Massimo Chioru], [], [0 (-2)], [], [], [], [], 
    [Alessandro Di Pasquale], [2 (-2)], [], [], [], [], [], 
    [Elia Leonetti], [], [], [], [0 (-4)], [], [], 
    [Manuel Cinnirella], [], [], [0 (-3)], [], [], [],
    [Romeo Calearo], [], [], [], [], [0 (-7)], [],
  )
)


==== Costi effettivi

- costo previsto: 560€
- costo effettivo: 300€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[2],[60],[-60],
    [Analista],[0],[0],[-50],
    [Progettista],[0],[0],[-100],
    [Amministratore],[0],[0],[-40],
    [Programmatore],[6],[90],[-75],
    [Verificatore],[10],[150],[+150],
  )
)
==== Rischi attesi
In previsione della prima revisione RTB con il Prof. Cardin, sono stati considerati i seguenti rischi:
- RO1 (difficoltà nella previsione dei carichi di lavoro): dovuta alla necessità di gestire parallelamente prove orali, preparazione delle slide e revisione documentale.
- RO4 (problemi di comunicazione): rischio di disallineamenti interni durante l'organizzazione delle simulazioni e delle attività di revisione.
- RT2 (inesperienza): possibile incertezza nella gestione della presentazione orale e nella selezione dei contenuti più rilevanti per la revisione.

==== Rischi incontrati
Durante il periodo si è manifestato RO1: la gestione delle prove orali ha richiesto più tempo del previsto, riducendo il margine per alcune revisioni secondarie. RO4 è emerso in forma lieve, con piccoli ritardi nella condivisione delle slide aggiornate tra i membri. RT2 si è concretizzato nella necessità di riorganizzare l'ordine degli argomenti dopo le prime simulazioni, per rendere più fluida l'esposizione.

==== Misure correttive adottate
- Pianificazione giornaliera delle attività, con sessioni dedicate alla revisione collettiva delle slide.
- Condivisione immediata dei materiali su repository comune per ridurre ritardi (RO4).
- Simulazioni multiple dell'interrogazione per migliorare la sicurezza espositiva e l'efficacia comunicativa (RT2).

==== Retrospettiva e riflessione
La preparazione per la revisione RTB si è rivelata intensa ma produttiva. Il gruppo ha dimostrato buona capacità di adattamento, riorganizzando le attività in base ai feedback delle prove interne. È emersa la necessità di anticipare alcune sessioni di revisione per ridurre la pressione nei giorni immediatamente precedenti alla verifica.

==== Raffinamento della pianificazione futura
In vista del quindicesimo periodo, è stato deciso di:
- Anticipare la raccolta e l'aggiornamento dei materiali di presentazione.
- Incrementare le sessioni di prova orale con tutto il gruppo presente.
- Migliorare la suddivisione delle responsabilità per evitare sovrapposizioni nelle revisioni.






#pagebreak()
#align(center, [=== PERIODO 15 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-07-20],
    [Fine prevista],[2025-07-26],
    [Fine effettiva],[2025-07-26]
  )
)

==== Pianificazione
Durante il quindicesimo periodo il gruppo si è preparato per il secondo incontro di revisione con il professor Vardanega e per l'ultimo Diario di Bordo in modalità sincrona. Sono seguite una verifica generale della documentazione, la stesura della presentazione e la preparazione per il colloquio con la relativa suddivisione degli argomenti tra ogni membro.

==== Preventivo

- totale ore previste: 39
- costo max previsto: 750 €

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [1], [], [], [6], 
    [Nicolò Bovo], [4], [], [], [], [], [], 
    [Massimo Chioru], [5], [], [], [], [10], [], 
    [Alessandro Di Pasquale], [], [], [], [], [9], [], 
    [Elia Leonetti], [], [2], [], [], [], [0], 
    [Manuel Cinnirella], [], [], [], [0], [], [],
    [Romeo Calearo], [], [2], [], [], [], [],
  )
)

==== Orari effettivi

- totale ore previste: 39
- totale ore effettive: 20

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [0 (-1)], [], [], [0 (-6)], 
    [Nicolò Bovo], [2 (-2)], [], [], [], [], [], 
    [Massimo Chioru], [0(-5) ], [], [], [], [0 (-10)], [], 
    [Alessandro Di Pasquale], [], [], [], [], [6 (-3)], [], 
    [Elia Leonetti], [], [], [], [], [], [12 (+12)], 
    [Manuel Cinnirella], [], [], [], [0], [], [], 
    [Romeo Calearo], [], [0 (-2)], [], [], [], [],
  )
)

==== Costi effettivi

- costo previsto: 750 €
- costo effettivo: 330€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[2],[60],[-210],
    [Analista],[0],[0],[-25],
    [Progettista],[0],[0],[0],
    [Amministratore],[0],[0],[-40],
    [Programmatore],[6],[90],[-195],
    [Verificatore],[12],[180],[+90],
  )
)
==== Rischi attesi
- RO1 (difficoltà nella previsione dei carichi di lavoro): rischio di concentrazione eccessiva di attività di revisione e prove orali negli ultimi giorni prima della verifica.
- RT2 (inesperienza): incertezza nella gestione della seconda revisione, con possibili esitazioni su contenuti tecnici approfonditi.

==== Rischi incontrati
- RO1 si è presentato in maniera moderata: la gestione di presentazioni, documenti e prove orali in parallelo ha aumentato la pressione sul team.
- RT2 si è manifestato nella necessità di ristrutturare alcune parti della presentazione dopo i primi feedback simulati, per chiarire passaggi tecnici.

==== Misure correttive adottate
- Organizzazione di un calendario di revisioni interne giornaliere per sincronizzare il lavoro.
- Simulazioni mirate su quesiti tecnici più complessi per aumentare la sicurezza in sede di revisione (RT2).

==== Retrospettiva e riflessione
La seconda verifica con il Prof. Vardanega è stata superata con esito positivo, seppur accompagnata da indicazioni precise sull'aumento delle ore di progettazione e verifica nella fase PB.
I professori hanno suggerito inoltre di rivalutare il modello di sviluppo adottato, proponendo un passaggio dall'approccio incrementale a un modello agile.
Questa raccomandazione è stata motivata dalla necessità di migliorare la reattività del team alle correzioni richieste e di gestire in modo più flessibile le priorità, soprattutto nella fase PB caratterizzata da continue revisioni e affinamenti.
Il gruppo ha riconosciuto l'importanza di distribuire in modo più equilibrato i carichi nei periodi successivi e di dedicare più spazio a ruoli tecnici e di controllo qualità.

==== Raffinamento della pianificazione futura
Alla luce dei primi feedback ricevuti dai professori, è stata valutata la necessità di aumentare nelle fasi successive (PB) le ore dedicate a progettazione e verifica, aspetto che ha già influenzato la pianificazione di breve termine. In questo periodo il maggior carico è stato assegnato ai verificatori per il controllo qualità dei documenti e ai programmatori per eventuali correzioni al P.o.C., mantenendo ore contenute per gli altri ruoli.
- Adottare gradualmente pratiche tipiche del modello agile, come riunioni di allineamento più frequenti e una maggiore suddivisione del lavoro in task brevi e ben definiti.
- Prevedere un aumento graduale delle ore di progettisti e verificatori a partire dal periodo 16.












#pagebreak()
#align(center, [=== SPRINT 1 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[ 2025-07-27],
    [Fine prevista],[2025-08-02],
    [Fine effettiva],[2025-08-02]
  )
)

==== Pianificazione
Il sedicesimo periodo segna l'inizio ufficiale della fase PB e la prima applicazione concreta delle modifiche organizzative suggerite dai docenti.
In particolare, sono state incrementate le ore di progettazione e verifica per affrontare con maggiore profondità le correzioni e migliorare la qualità della documentazione e del P.o.C. È stata inoltre rafforzata la componente di programmazione per implementare le modifiche concordate.
La pianificazione è stata impostata secondo logiche più agili: task di durata breve, feedback frequenti e riunioni di allineamento intermedio.


==== Preventivo

- totale ore previste: 34
- costo max previsto: 680€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [5], [], [], [], [], [], 
    [Nicolò Bovo], [], [1], [], [], [], [], 
    [Massimo Chioru], [], [], [], [], [], [9], 
    [Alessandro Di Pasquale], [], [], [], [7], [], [], 
    [Elia Leonetti], [], [], [2], [], [], [], 
    [Manuel Cinnirella], [], [], [], [], [10], [],
    [Romeo Calearo], [], [0], [], [], [], [],
  )
)

==== Orari effettivi

- totale ore previste: 34
- totale ore effettive: 39

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [1 (-4)], [], [], [], [], [], 
    [Nicolò Bovo], [], [0 (-1)], [], [], [], [], 
    [Massimo Chioru], [], [], [], [], [], [10 (+1)], 
    [Alessandro Di Pasquale], [], [], [], [16  (+9)], [], [], 
    [Elia Leonetti], [], [], [2], [], [], [], 
    [Manuel Cinnirella], [], [], [], [], [10], [], 
    [Romeo Calearo], [], [0], [], [], [], [],
  )
)

==== Costi effettivi

- costo previsto: 680€
- costo effettivo: 780€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[1],[30],[-120],
    [Analista],[2],[50],[],
    [Progettista],[16],[400],[+225],
    [Amministratore],[0],[0],[-20],
    [Programmatore],[10],[150],[],
    [Verificatore],[10],[150],[+15],
  )
)
==== Rischi attesi
- RO1 (difficoltà nella previsione dei carichi di lavoro): rischio di sovraccarico dovuto all'aumento delle ore e alla maggiore intensità delle attività.
- RO4 (problemi di comunicazione): necessità di coordinamento stretto in un contesto di consegne rapide e cicli brevi.
- RT1 (complessità delle tecnologie implementate): modifiche e rifattorizzazioni rapide possono introdurre errori non previsti.

==== Rischi incontrati
- RO1 si è concretizzato parzialmente, con alcuni momenti di concentrazione di attività critiche negli stessi giorni.
- RO4 è emerso in forma lieve nella gestione parallela di modifiche al P.o.C. e alla documentazione.
- RT1 ha avuto impatto contenuto, grazie all'aumento del tempo dedicato alla verifica.

==== Misure correttive adottate
- Introdotti daily meeting di 10–15 minuti per garantire allineamento costante (RO4).
- Applicata revisione incrociata obbligatoria dopo ogni modifica rilevante a documenti e codice (RT1).
- Utilizzato un task board condiviso ramite piattaforma Notion per monitorare lo stato delle attività ed evitare imprevisti (RO1).

==== Retrospettiva e riflessione
Il passaggio al metodo agile ha rappresentato un cambiamento organizzativo significativo per il gruppo.
Pur non avendo consegne intermedie da effettuare, l'adozione di cicli di lavoro brevi e di riunioni di allineamento frequenti ha permesso di monitorare costantemente l'avanzamento e di reagire in modo rapido alle esigenze emerse in fase revisione.
La maggiore attenzione dedicata a progettazione e verifica ha garantito una qualità più alta del prodotto, mentre l'incremento delle ore di programmazione ha consentito di integrare le modifiche in tempi ridotti.


==== Raffinamento della pianificazione futura
- Mantenere e consolidare le pratiche agili introdotte, con iterazioni brevi e feedback continui.
- Conservare il monte ore elevato per progettisti e verificatori fino al completamento della fase PB.
- Pianificare sprint review interne a fine periodo per discutere miglioramenti e criticità.
- Ottimizzare la distribuzione delle attività per ridurre i picchi di lavoro e garantire uno sviluppo continuo.










#pagebreak()
#align(center, [=== SPRINT 2 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[2025-08-02],
    [Fine prevista],[2025-08-09],
    [Fine effettiva],[2025-08-09]
  )
)

==== Pianificazione
Nel diciassettesimo periodo si è proseguito con l'approccio agile, ormai integrato nelle dinamiche di lavoro del gruppo.
L'aumento delle ore di progettazione, introdotto nel periodo precedente, ha dimostrato la sua utilità nel facilitare la definizione chiara delle soluzioni tecniche prima della loro implementazione, riducendo il rischio di modifiche strutturali in corso d'opera.
La quota di ore per verificatori è rimasta alta, garantendo un controllo costante sulla documentazione e sul P.o.C., mentre i programmatori hanno potuto lavorare su implementazioni più solide grazie alla progettazione più accurata a monte.

==== Preventivo

- totale ore previste: 31
- costo max previsto: 585€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [], [], [10], [], 
    [Nicolò Bovo], [], [], [], [2], [], [], 
    [Massimo Chioru], [], [], [2], [], [], [], 
    [Alessandro Di Pasquale], [], [1], [], [], [], [], 
    [Elia Leonetti], [], [], [], [], [2], [], 
    [Manuel Cinnirella], [5], [], [], [], [], [],
    [Romeo Calearo], [], [], [], [], [], [9],
  )
)

==== Orari effettivi

- totale ore previste: 31
- totale ore effettive: 41

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [], [], [10], [], 
    [Nicolò Bovo], [], [], [], [12 (+10)], [], [], 
    [Massimo Chioru], [], [], [1 (-1)], [], [], [], 
    [Alessandro Di Pasquale], [], [0 (-1)], [], [], [], [], 
    [Elia Leonetti], [], [], [], [], [10 (+8)], [], 
    [Manuel Cinnirella], [1 (-4)], [], [], [], [], [], 
    [Romeo Calearo], [], [], [], [], [], [7 (+2)],
  )
)

==== Costi effettivi

- costo previsto: 585€
- costo effettivo: 760€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[1],[30],[-120],
    [Analista],[1],[25],[-25],
    [Progettista],[12],[300],[+250],
    [Amministratore],[0],[0],[-20],
    [Programmatore],[20],[300],[+120],
    [Verificatore],[7],[105],[+30],
  )
)

==== Rischi attesi
- RO1 (difficoltà nella previsione dei carichi di lavoro): possibile concentrazione di attività di progettazione e programmazione negli stessi giorni.
- RO4 (problemi di comunicazione): rischio di incomprensioni nelle fasi di passaggio tra progettazione e implementazione.
- RT1 (complessità tecnica): la realizzazione di modifiche strutturali richiede attenzione per non introdurre regressioni, che nonostante la metodologia agile potrebbero portare rallentamenti.

==== Rischi incontrati
- RO1 si è manifestato in maniera moderata, con picchi di lavoro su progettisti e programmatori in alcune giornate.
- RO4 è stato limitato grazie ai meeting frequenti, ma non del tutto assente.
- RT1 ha avuto impatto minimo, grazie alla pianificazione accurata.

==== Misure correttive adottate
- Coordinamento stretto tra progettisti e programmatori con revisioni tecniche condivise (RO4).
- Distribuzione più uniforme delle attività settimanali per bilanciare il carico (RO1).

==== Retrospettiva e riflessione
L'aumento delle ore di progettazione ha portato un miglioramento tangibile: le soluzioni sono state definite con maggior precisione e completezza prima di passare alla fase di sviluppo, riducendo la necessità di correzioni successive e rendendo il lavoro dei programmatori più lineare ed efficiente.
L'approccio agile ha permesso di mantenere un allineamento costante tra i ruoli e di integrare i feedback interni in tempi rapidi, senza attendere scadenze intermedie.


==== Raffinamento della pianificazione futura
- Aumentare la quota oraria per la verifica, necessaria per sottoporre ill'MVP a tutti i test necessari.
- Continuare con i meeting frequenti per rafforzare il coordinamento tra progettisti, programmatori e verificatori.
- Proseguire con cicli brevi e iterativi, mantenendo alta la reattività alle esigenze emerse.












#pagebreak()
#align(center, [=== SPRINT 3 ])

#align(center,
  table(
    columns: 2,   
    stroke: none,
    inset: 10pt,
    [Inizio],[2025-08-09],
    [Fine prevista],[2025-08-15],
    [Fine effettiva],[2025-08-15]
  )
)

==== Pianificazione
Nel diciottesimo periodo il gruppo ha raggiunto la fase conclusiva della PB, consolidando il metodo agile adottato nei periodi precedenti.
L'attenzione si è concentrata sulla verifica intensiva del prodotto e sull'esecuzione di test mirati per garantire stabilità e correttezza prima della chiusura della fase.
Si prevede di aumentare il monte ore per i verificatori così come quello dei programmatori, per correggere tempestivamente eventuali problemi rilevati.
La progettazione ha avuto un ruolo di supporto, per definire soluzioni tecniche ai bug individuati e ottimizzare le funzionalità già presenti.

==== Preventivo

- totale ore previste: 30
- costo max previsto: 560€

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [], [3], [], [0], 
    [Nicolò Bovo], [], [], [], [], [], [5], 
    [Massimo Chioru], [], [], [], [], [2], [1], 
    [Alessandro Di Pasquale], [], [0], [], [], [], [], 
    [Elia Leonetti], [5], [], [], [], [], [2], 
    [Manuel Cinnirella], [], [1], [], [], [], [2],
    [Romeo Calearo], [], [], [], [], [5], [4],
  )
)

==== Orari effettivi

- totale ore previste: 30
- totale ore effettive: 55

#align(center,
  table(
    columns: 7,
    inset: 10pt,
    table.header([], [*Resp*],[*Amm*],[*Analista*],[*Progettista*],[*Programmatore*],[*Verificatore*]),
    [Giovanni Battista Matteazzi], [], [], [], [8 (+5)], [], [1 (+1)], 
    [Nicolò Bovo], [], [], [], [], [], [7 (+2)], 
    [Massimo Chioru], [], [], [], [], [7 (+5)], [2 (+1)], 
    [Alessandro Di Pasquale], [], [0], [], [], [], [], 
    [Elia Leonetti], [1 (-4)], [], [], [], [], [1 (+1)], 
    [Manuel Cinnirella], [], [], [], [], [], [19 (+17)],
    [Romeo Calearo], [], [], [], [], [7 (+2)], [2 (-2)],
  )
)

==== Costi effettivi

- costo previsto: 545 €
- costo effettivo: 920€

 #align(center,
  table(
    columns: 4,
    inset: 10pt,
    table.header([*Ruolo*], [*Ore*],[*Costo*],[*Differenza*]),
    [Responsabile],[1],[30],[-120],
    [Analista],[0],[0],[],
    [Progettista],[8],[200],[+125],
    [Amministratore],[0],[0],[],
    [Programmatore],[14],[210],[+105],
    [Verificatore],[32],[480],[+285],
  )
)

==== Rischi attesi
- RO1 (difficoltà nella previsione dei carichi di lavoro): rischio di concentrazione di attività critiche negli ultimi giorni.
- RO4 (problemi di comunicazione): possibilità di disallineamento tra chi esegue i test e chi implementa le correzioni.
- RT1 (complessità tecnica): bug complessi da risolvere in tempi ridotti.

==== Rischi incontrati
- RO1 si è verificato in parte, con un'intensa concentrazione di attività di test e correzione nelle giornate finali.
- RO4 è stato ridotto al minimo grazie ai meeting giornalieri, ma sono emersi piccoli ritardi nel trasferimento delle segnalazioni di bug.
- RT1 non ha contribuito in modo rilevante


==== Retrospettiva e riflessione
La verifica e i test sono stati l'elemento centrale di questo periodo, permettendo di individuare e correggere criticità prima della consegna finale della fase PB.
L'elevata disponibilità oraria dei verificatori ha garantito una copertura completa delle funzionalità, mentre i programmatori hanno potuto intervenire tempestivamente grazie alla stretta collaborazione con i verificatori.