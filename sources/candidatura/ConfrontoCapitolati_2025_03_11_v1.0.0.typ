#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Valutazione capitolati",
  roles: (
      "Responabile", "Nicolò Bovo",
      "Redattori", "Romeo Calearo",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi",
      "Validatori", "Manuel Cinnirella",
      "", "Massimo Chioru",
      "", "Alessandro Di Pasquale"),

  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/03/11",
  version: "1.0.0",
  version_history: (    
    "1.0.0", "2025/03/11", "Stesura iniziale del documento", "Romeo Calearo, Elia Leonetti, Giovanni Battista Matteazzi",  "Manuel Cinnirella, Massimo Chioru, Alessandro Di Pasquale"
    
  ),
  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

= Scopo del documento
Si intende documentare il processo di analisi dei capitolati, e le valutazioni attribuite a ciascuno, da cui è conseguita la scelta del capitolato *C4: Near You*, oggetto della nostra candidatura. 


= Capitolato scelto
== C4 NearYou

=== Descrizione
Il progetto propone una piattaforma di advertising personalizzato basata su intelligenza artificiale e geolocalizzazione per noleggi di biciclette. Gli utenti riceveranno annunci pertinenti su un display integrato, simulato tramite una web-app, in base alla loro posizione e profilo. Il sistema utilizza data stream processing per raccogliere, arricchire e salvare dati GPS e profili utenti, elaborandoli con LLM. Una dashboard mostrerà in tempo reale la posizione dei mezzi e gli annunci, visibili solo agli utenti interessati e vicini all'attività commerciale. L'obiettivo è migliorare il coinvolgimento, l'efficacia pubblicitaria e il ritorno sugli investimenti per i brand.


=== Obiettivi

Il progetto affronta il problema della pubblicità generica e poco efficace, proponendo una soluzione che personalizza i messaggi pubblicitari in base al contesto e ai comportamenti degli utenti. La piattaforma prevede:
 - Utilizzo di dati geospaziali per offrire annunci contestuali basati sulla posizione dell'utente.
 - Integrazione di tecnologie di prossimità e LLM per l'elaborazione avanzata dei dati e la generazione dinamica di annunci.
 - Simulazione di scenari reali, con lo sviluppo di un simulatore GPS per testare il sistema in diverse condizioni.
 - Interfaccia utente con mappa interattiva, che mostra in tempo reale le posizioni degli utenti e gli annunci associati ai punti di interesse rilevanti.

L'idea è di implementare la piattaforma anche su veicoli con un piccolo schermo che visualizza gli annunci personalizzati per i passeggeri, migliorando la visibilità e il targeting degli inserzionisti.

=== Dominio Tecnologico

Il progetto richiede un'infrastruttura tecnologica avanzata per garantire un'elaborazione efficiente dei dati in tempo reale. Gli strumenti principali includono:
 - Simulazione di dati GPS: Generazione di dati geospaziali realistici tramite script in *Python*.
 - Message Broker: *Apache Kafka*, *RabbitMQ* o *HiveMQ* per disaccoppiare il flusso di dati in ingresso.
 - Data Stream Processing: *Apache Airflow*, *Apache NiFi*, *Apache Spark* o *Apache Flink* per l'elaborazione in tempo reale dei dati.
 - *LLM* per la generazione di annunci: *LangChain* o *Flow* per la creazione di messaggi pubblicitari personalizzati.
 - Database e Storage: *PostGIS*, *ClickHouse* o *Timescale* per la gestione di dati geospaziali e in serie temporale.
 - Data Visualization: *Superset*, *Grafana* o *Tableau* per il monitoraggio e la visualizzazione delle informazioni.

=== Aspetti Positivi

Di questo capitolato il gruppo ha particolarmente apprezzato: 
 - L'integrazione di diverse tecnologie all'interno dello stesso progetto, come la geolocalizzazione, la visualizzazione su mappa delle informaizoni, l'analisi dei dati utente e la generazione di testi personalizzati tramite LLM. Tutti questi elementi hanno contribuito a renderlo un progetto moderno e al passo coi tempi. 
 - La disponibilità dell'azienda a seguire il gruppo e a fornire supporto e confronti costanti.
 - La qualità e l'attenzione posta nel presentare il capitolato, rendendo esplicite le richieste e le finalità del progetto.
 - La buona libertà di scelta delle tecnologie da utilizzare e la conseguente flessibilità nel lavorare al progetto permettendo di scegliere gli strumenti meglio conosciuti dal gruppo. 

=== Aspetti negativi

Il gruppo aveva inizialmente manifestato delle perplessità nell'accettare questo capitolato a causa delle implicazioni etiche legate all'uso dell'Intelligenza Artificiale in campo pubblicitario. Tuttavia, dopo un'analisi approfondita del progetto, è emerso che il metodo proposto per presentare degli annunci pubblicitari risulta più etico rispetto ad altre soluzioni esistenti. Il sistema, infatti, si basa su criteri di pertinenza contestuale e preferenze dell'utente, evitando pratiche invasive e migliorando l'esperienza pubblicitaria per l'utente finale.

=== Conclusione

Nonostante anche altri capitolati presentassero delle soluzioni all'avanguardia e al passo con i tempi e pure altre aziende si fossero rivelate disponibili alla collaborazione, il gruppo ha trovato solo in questo capitolato tutti gli aspetti positivi desiderati raggruppati insieme, portandolo a diventare la prima scelta per la candidatura.


= Capitolati non scelti

== C3: Automatizzare le routine digitali tramite l'intelligenza generativa
=== Descrizione
Il capitolato propone lo sviluppo di un servizio ad agenti, attraverso il quale gli utenti possano disegnare localmente un workflow, o definirlo usando il linguaggio naturale. Sfruttando le API dei software locali e l'intelligenza artificiale in cloud, l'applicativo implementa autonomamente il workflow indicato, automatizzando attività quotidiane che l'utente svolgerebbe manualmente.

=== Obiettivi
Il progetto ha lo scopo di utilizzare un'IA generativa, che risieda in cloud, capace di comunicare con software locale e restituire le automazioni che soddisfano il workflow richiesto dall'utente. Le automazioni devono risultare eseguibili sia localmente che direttamente presso i servizi finali (in questo caso, attraverso le apposite API). In particolare, è necessario soddisfare le seguenti richieste:
- Creare un client, per Mac o PC, che permetta agli utenti di disegnare dei workflow tramite interfaccia “drag and drop”.
- Creare un repository di «blocchi» funzionali che accedono alle API applicative.

- Consentire all'utente di descrivere in linguaggio naturale l'attività di logica per ciascun passo del workflow, di cui il software costruirà la logica di automazione in autonomia.


=== Dominio tecnologico
L'azienda raccomanda l'uso delle seguenti tecnologie:
- *Python*, *C\#*, *Swift* e *React* per lo sviluppo del Client (rispettivamente in ambiente Windows, Apple e su interfaccia web).
- *MongoDB* o altro database locale, per la memorizzazione dei dati necessari.
- *NodeJS*, *Python*, *Typescript* per lo sviluppo della parte back-end.
- *AWS Bedrock* per sfruttare i sistemi d'intelligenza artificiale generativa.

=== Aspetti Positivi
 - Visione concreta del prodotto finale
=== Aspetti negativi
 - Stack tecnologico particolarmente estensivo
 - Lo sviluppo della funzionalità di interpretazione del linguaggio naturale può risultare molto dispendiosa in termini temporali e di complessità.

=== Conclusioni
L'impatto pratico e la visione molto chiara sulle finalità del prodotto sono stati valutati positivamente, a tal punto che il gruppo stava valutando questo capitolato come prima scelta. Durante una fase di analisi successiva sono emersi dubbi sulla fattibilità del progetto entro le scadenze indicate, e quindi è stato indicato come seconda scelta.

== C6: Sistema di gestione di un magazzino distribuito

=== Descrizione
Il capitolato C6 propone lo sviluppo di un'applicazione per gestire in modo ottimale l'inventario di diversi magazzini distribuiti sul territorio. L'obiettivo principale è quello di monitorare e ottimizzare in tempo reale le scorte di ogni sede, assicurando una corretta sincronizzazione dei dati e gestendo eventuali conflitti, come nel caso di ordini simultanei per lo stesso prodotto.

=== Obiettivi
Il sistema di gestione dovrà essere in grado di:
- Ottimizzare i livelli di scorte: il sistema dovrà monitorare costantemente l'inventario, suggerendo o automatizzando azioni di riassortimento o trasferimento tra magazzini al fine di mantenere scorte minime senza compromettere l'operatività. 
- Gestire la condivisione dei dati in tempo reale: attraverso una sincronizzazione continua, sarà possibile avere una visione chiara e centralizzata delle scorte presenti in ogni magazzino, con aggiornamenti in tempo reale riguardo alle operazioni di prelievo, ricezione e trasferimento.
- Implementare riassortimento predittivo: l'utilizzo di algoritmi di machine learning permetterà di prevedere la domanda futura in base a dati storici, stagionalità e pattern di consumo. Questo approccio ridurrà il rischio di esaurimento scorte e ottimizzerà l'allocazione dei materiali tra magazzini.
- Risolvere i conflitti di aggiornamento simultaneo: saranno implementati meccanismi che gestiranno le situazioni in cui aggiornamenti simultanei dell'inventario, provenienti da magazzini differenti, potrebbero creare discrepanze nei dati (ad esempio, utilizzando tecniche di versionamento o timestamp).

=== Dominio tecnologico
Vengono consigliate tecnologie in linea con lo stack abitualmente utilizzato da M31:
- *Node.js*, *Nest.js*, *TypeScript* per lo sviluppo server-side di servizi modulari.
- *Go* per le componenti ad alte prestazioni, utili per la sincronizzazione.
- *NATS* o *Kafka* per la comunicazione distribuita e asincrona.
- *Kubernetes* per orchestrare i servizi in un ambiente cloud scalabile.
- *MongoDB* e *PostgreSQL*, una combinazione di NoSQL e database relazionali per gestire dati eterogenei.
- *Redis*, sistema di caching per ridurre la latenza.

=== Aspetti Positivi
- La gestione ottimale delle scorte è fondamentale per molte aziende, quindi si tratta di un problema concreto e molto richiesto.
- Si sperimentano microservizi, comunicazione tramite message broker e sincronizzazione di dati in tempo reale.
- Aspetto predittivo: l'integrazione di algoritmi di machine learning permette di esplorare tecniche di data science e forecasting.

=== Aspetti negativi
- Complessità elevata: gestire transazioni distribuite, conflitti di aggiornamento e sincronizzazione in tempo reale può essere impegnativo.
- Necessità di un'infrastruttura di test robusta.
- Richiede buone competenze su microservizi, reti e gestione dei dati.

=== Conclusioni
Questo capitolato è risultato molto stimolante, in particolare per l'impatto molto concreto dell'IA sulla produttività. Il gruppo stava valutando il capitolato come possibile scelta, ma a causa della discrepanza tra le esigenze dello stack tecnologico e le nostre competenze, infine non è stato considerato.
