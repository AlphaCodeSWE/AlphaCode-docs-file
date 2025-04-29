#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Quarta Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattore", "Nicolò Bovo",
      "Validatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Elia Leonetti",
      "", "Manuel Cinnirella",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/03/27",
  version: "1.1.1",
  version_history: (
    "1.1.1", "2025/04/29", "Correzione typo","Alessandro Di Pasquale","Giovanni Battista Matteazzi",
    "1.1.0", "2025/03/31", "Aggiunta ruoli e tabella con link alle Issues","Nicolò Bovo","Manuel Cinnirella",
    "1.0.0", "2025/03/27", "Stesura del verbale", "Nicolò Bovo","Manuel Cinnirella",
    
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

- Lettura dell’avvenuta aggiudicazione del capitolato.
- Definizione del “way of working”.
- Organizzazione repository e inizio stesura delle Norme di Progetto.
- Verbali e registro decisionale

= Sintesi dell’incontro
La riunione si è aperta con la lettura e la presa d'atto dell'aggiudicazione del capitolato C4; è stato pertanto deciso di fissare un secondo incontro con l'azienda per iniziare a entrare nel merito del lavoro da svolgere. La consegna del progetto è fissata prudenzialmente al 15 agosto 2025, con un costo conforme pari a 12.635 euro. Successivamente, il gruppo ha discusso e introdotto per la metodologia operativa il framework Scrum come modalità principale di gestione e sviluppo del progetto. È emersa, tuttavia, la necessità di definire un criterio chiaro per la rotazione dei ruoli tra i membri del team: si procede ad un cambio ogni due settimane. In merito alla gestione della repository, il team ha riscontrato un buon metodo nel versionamento e un'organizzazione complessiva discreta. Si è deciso di procedere alla stesura delle _Norme di progetto_, con l'obiettivo di fornire una guida operativa per il team. Infine, particolare attenzione è stata rivolta alla gestione dei verbali e alla registrazione delle decisioni. Pur riconoscendo una buona capacità di sintesi e organizzazione dei verbali, si è evidenziata una criticità: l'assenza di un metodo per la tracciabilità delle decisioni prese. È stato così concordato di introdurre un sistema di gestione decisionale per documentare in modo efficace e tracciabile ogni decisione presa, sfruttando così la sezione _Projects_ e le _Issues_ presenti su GitHub. 



= Decisioni prese

- Contattare l'azienda per fissare un incontro online.

- La rotazione dei ruoli avverrà con una cadenza bisettimanale, così da garantire a ciascun membro il tempo adeguato per familiarizzare con il nuovo ruolo e, al contempo, evitare una permanenza prolungata nello stesso incarico.

- Si è deciso di strutturare il documento delle Norme di Progetto organizzandolo per processi, seguendo lo standard ISO/IEC/IEEE 12207:2017  in quanto rappresenta l'edizione più aggiornata e riconosciuta a livello internazionale .

- A breve, una volta sistemata la repository, non sarà più possibile apportare modifiche direttamente sul ramo principale dei repository, ogni aggiornamento dovrà passare tramite una richiesta di pull (pull-request) o Issue e sarà validato da un membro differente (verificatore) o dal responsabile.

- È stata introdotta la pratica di collegare tramite link ciascuna decisione presa durante le riunioni con le rispettive attività da svolgere, gestite tramite issue dedicate.

= Rotazione ruoli

I ruoli aggiornati per ciascun membro sono:

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 2,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*Nome e Cognome*]), text(fill: rgb("#f5f5eb"), align(center)[*Ruolo*])),
    [Alessandro Di Pasquale], [Responsabile],
    [Nicolò Bovo], [Amministratore],
    [Giovanni Battista Matteazzi], [Analista],
    [Romeo Calearo], [Progettista],
    [Massimo Chioru], [Programmatore],
    [Elia Leonetti], [Programmatore],
    [Manuel Cinnirella], [Verificatore]
  )
)

= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/2")[docs \#2]], [AlphaCode Full Team], [Definizione Norme di Progetto],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/1")[docs \#1]], [AlphaCode Full Team], [Stesura del Quarto Verbale Interno],
  )
)






