#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Quarta Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattore", "Nicolò Bovo",
      "Verificatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Elia Leonetti",
      "", "Manuel Cinnirella",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-27",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-03-27", "Aggiunta ruoli e tabella con link alle Issues", "Nicolò Bovo, Manuel Cinnirella",
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Contenuti del verbale
== Informazioni sulla riunione

- *Luogo*: Chiamata Discord;
- *Ora di inizio*: 15:00;
- *Ora di fine*: 17:30;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno

- Lettura dell'avvenuta aggiudicazione del capitolato.
- Definizione del "way of working#apice("G")".
- Organizzazione repository e inizio stesura delle Norme di Progetto.
- Verbali e registro decisionale

= Sintesi dell'incontro
La riunione si è aperta con la lettura e la presa d'atto dell'aggiudicazione del capitolato C4; è stato pertanto deciso di fissare un secondo incontro con l'azienda per iniziare a entrare nel merito del lavoro da svolgere. La consegna del progetto è fissata prudenzialmente al 15 agosto 2025, con un costo conforme pari a 12.635 euro. Successivamente, il gruppo ha discusso e definito la metodologia operativa più adatta al progetto. È emersa, tuttavia, la necessità di definire un criterio chiaro per la rotazione dei ruoli tra i membri del team: si procede ad un cambio ogni due settimane. Il team ha inoltre approfondito l'approccio di sviluppo più adatto al progetto, concludendo per l'adozione del modello incrementale#apice("G"). Questa scelta è motivata dalla necessità di ridurre i rischi implementativi, avendo modo di avere feedback continui dall'azienda e garantire consegne progressive di funzionalità. È stata definita una pianificazione dettagliata in quattro incrementi#apice("G"): partendo dall'infrastruttura base con Docker#apice("G") e Kafka#apice("G"), proseguendo con la dashboard#apice("G") completa e API#apice("G"), quindi l'integrazione di database, seguito da ottimizzazioni e P.o.C.#apice("G")

In merito alla gestione della repository, il team ha riscontrato un buon metodo nel versionamento e un'organizzazione complessiva discreta. Si è deciso di procedere alla stesura delle _Norme di progetto_, _Piano di Qualifica_ e _l'analisi dei requisiti_, con l'obiettivo di fornire una guida operativa per il team. Infine, particolare attenzione è stata rivolta alla gestione dei verbali e alla registrazione delle decisioni. Pur riconoscendo una buona capacità di sintesi e organizzazione dei verbali, si è evidenziata una criticità: l'assenza di un metodo per la tracciabilità delle decisioni prese. È stato così concordato di introdurre un sistema di gestione decisionale per documentare in modo efficace e tracciabile ogni decisione presa, sfruttando così la sezione _Projects_ e le _Issues_ presenti su GitHub. 

= Decisioni prese

- Contattare l'azienda per fissare un incontro online.

- La rotazione dei ruoli avverrà con una cadenza bisettimanale, così da garantire a ciascun membro il tempo adeguato per familiarizzare con il nuovo ruolo e, al contempo, evitare una permanenza prolungata nello stesso incarico.

- Si è deciso di strutturare il documento delle Norme di Progetto organizzandolo per processi, seguendo lo standard ISO/IEC 12207:1995#apice("G").

- A breve, una volta sistemata la repository, non sarà più possibile apportare modifiche direttamente sul ramo principale dei repository, ogni aggiornamento dovrà passare tramite una richiesta di pull (pull-request) o Issue.

- È stata introdotta la pratica di collegare tramite link ciascuna decisione presa durante le riunioni con le rispettive attività da svolgere, gestite tramite issue dedicate.

- Adozione del modello incrementale#apice("G") per lo sviluppo (approfondito nel _Piano di Progetto_):
   1. *Incremento#apice("G") 1: Sistema di Simulazione GPS#apice("G") Funzionante*
   2. *Incremento#apice("G") 2: Dashboard#apice("G") di Visualizzazione e Monitoring#apice("G") e database set*
   3. *Incremento#apice("G") 3: Sistema di Analytics#apice("G") e Database Integration*
   4. *Incremento#apice("G") 4: Sistema Production-Ready per P.o.C.#apice("G")*
       
  - *Prioritizzazione funzionalità:* Le funzionalità più importanti vengono trattate per prime nel primo incremento#apice("G") e verificate più volte nei cicli successivi per ridurre il rischio di fallimento.
  
  - *Baseline#apice("G") stabile:* Ogni incremento#apice("G") mantiene operativa la baseline#apice("G") precedente, evitando modifiche distruttive e garantendo sempre un sistema funzionante.

  - *Approccio adattativo:* Il modello consente di adattarsi ai feedback dell'azienda e ai cambiamenti emersi durante lo sviluppo.
    

= Rotazione ruoli

I ruoli aggiornati per ciascun membro sono:

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 2,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*Nome e Cognome*]), text(fill: rgb("#f5f5eb"), align(center)[*Ruolo*])),
    [Alessandro Di Pasquale], [Responsabile#apice("G")],
    [Nicolò Bovo], [Amministratore#apice("G")],
    [Giovanni Battista Matteazzi], [Analista#apice("G")],
    [Romeo Calearo], [Progettista#apice("G")],
    [Massimo Chioru], [Programmatore#apice("G")],
    [Elia Leonetti], [Programmatore#apice("G")],
    [Manuel Cinnirella], [Verificatore#apice("G")]
  )
)

= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/2")[docs \#2]], [AlphaCode#apice("G") Full Team], [Definizione Norme di Progetto],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/1")[docs \#1]], [AlphaCode#apice("G") Full Team], [Stesura del Quarto Verbale Interno],
  )
)
