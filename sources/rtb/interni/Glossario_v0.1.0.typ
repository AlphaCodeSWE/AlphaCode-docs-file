#import "../../../template/template.typ": *

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
  date: "2025-04-13",
  version: "0.1.0",
  version_history: (
    "0.1.0", "2025-04-13", "Stesura iniziale del glossario", "Alessandro Di Pasquale", "Manuel Cinnirella"
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Introduzione
Con il presente documento si intende fornire un punto di riferimento per tutti i termini tecnici o specifici che, adoperati nei documenti svolti dal gruppo, potrebbero far sorgere incomprensioni o perplessità a chi dovrà poi usufruirne.

#pagebreak()
= A
== Amministratore
L'amministratore sarà adibito alla corretta configurazione delle infrastrutture e degli ambienti di sviluppo in cui i membri del gruppo avranno modo di lavorare. Vi sarà bisogno di questa figura sin dal principio ed in misura considerevole ma, seppur saltuariamente, dovrà poi fungere da manutentore degli strumenti già messi a disposizione così come dell'aggiunta di nuovi sistemi qualora necessari.

== Analista
Il ruolo dell'analista si impegna significativamente ad inizio progetto, occupandosi di definire le funzionalità ed i requisiti specifici per soddisfare al meglio le necessità del cliente. Successivamente questa figura coprirà un ruolo sempre più marginale dato che sarà meno necessario definire nuovi requisiti.

= B
== Best Practice
Insieme di pratiche e procedure ritenute corrette, e più efficienti, al fine di conseguire il risultato previsto.
= C
== ClickHouse 
Servizio open-source per la gestione di database.
== Commit
L’operazione che registra in modo permanente le modifiche nel repository.
= D
== Deliverable
Con deliverable s'intende qualsiasi oggetto (ad esempio software o documentazione), tangibile o intangibile, che sia prodotto con lo scopo di essere fornito ad una figura terza.
== Docker
Piattaforma che consente lo sviluppo, la distribuzione e la manutenzione di applicativi. Opera sulla base di astrazioni note come "container": ciascun container consta di codice eseguibile e delle dipendenze ad esso associate. Questo approccio consente di implementare una separazione completa tra infrastruttura e applicativo.
= E
= F
== Flink
Framework per l'elaborazione distribuita di dati in tempo reale, ottimizzato per  analisi a bassa latenza e gestione di stati complessi, ideale per applicazioni di streaming continuo e decisioni in tempo reale.
== Framework
Insieme di servizi e utilità, volte a fornire una baseline per lo sviluppo di prodotti software.
= G
== Generative AI
Fa riferimento a tutti i modelli di AI sviluppati ed addestrati al fine di generare contenuti di tipo testuale, audio, o immagine, a partire da un contestuale insieme di training.
= H
= I
= J
= K
== Kafka
Piattaforma per la gestione di flussi di dati in tempo reale, nota per l'elevato throughput e la bassa latenza, e capace di importare o esportare dati verso sistemi esterni.
= L
= M
== Milestone
Nel ciclo di vita del progetto, le milestone rappresentano gli step previsti per giungere a completamento; definire delle milestone consente di quantificare il lavoro svolto e dare una misura del progresso.
= N
= O
== Organizational project enabling
Insieme di processi volti ad allocare a ciascun task le risorse, umane o materiali, necessarie per ultimarlo.
= P
== Piattaforma di advertising
Infrastruttura software finalizzata a fornire servizi di distribuzione e/o creazione di contenuti pubblicitari.
== Pipeline
Insieme di moduli che collaborano alla realizzazione di uno stesso prodotto finale, organizzati in modo tale che l'output di ciascun modulo diventi l'input del modulo successivo in catena.
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

= Q
= R
== Responsabile
Il responsabile sarà colui che si dedicherà a determinare la direzione in cui il gruppo dovrà operare, tramite un'efficiente gestione delle risorse, una virtù fondamentale nelle prime fasi operative a cui il gruppo sarà dedito, ma che si rivelerà gradualmente meno cruciale grazie al crescente sviluppo dell'autonomia del gruppo nel tempo. Tale ruolo richiederà inoltre competenze comunicative tali da permettere una soddisfacente interazione sia con i membri del gruppo che con terzi.
= S
= T
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
== Way of working
Modello su cui si fonda l'attività cooperativa del gruppo, che delinea in particolare come si struttura l'interazione tra i vari elementi che lo compongono, al fine di ottimizzare i prodotti e i processi di cui consta l'attività svolta.
= X
= Y
= Z
== Zip
Formato di compressione che permette di raggruppare più file in un unico archivio.