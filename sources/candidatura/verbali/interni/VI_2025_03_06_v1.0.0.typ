#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Prima Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responabile", "Nicolò Bovo",
      "Redattore", "Manuel Cinnirella",
      "Verificatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Alessandro Di Pasquale",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-06",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-03-06", "Stesura del verbale", "Manuel Cinnirella, Nicolò Bovo","Romeo Calearo",
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
- *Luogo*: Torre Archimede e chiamata Discord;
- *Ora di inizio*: 9:30;
- *Ora di fine*: 11:15;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno
- Nome e Logo del gruppo;
- Scelta del linguaggio per i documenti;
- Scelta dei canali di comunicazione;
- Prima discussione sui capitolati.
- Assegnazione dei ruoli

= Sintesi dell’incontro
Durante la riunione, dopo aver valutato varie proposte, il gruppo ha definito il nome e creato contestualmente il logo rappresentativo. Inoltre, si è scelto di usare il linguaggio Typst per la stesura dei documenti per la sua semplicità e versatilià.

Successivamente è stata discussa la scelta dei canali di comunicazione:
- *Telegram*: per aggiornamenti rapidi e comunicazioni interne;
- *Discord*: per riunioni a distanza;
- *GitHub*: per la gestione dei documenti, il versionamento e la condivisione dei vari file;
- *Notion*: per organizzare contenuti e pianificare attività di progetto.

Fatto ciò si è passati ad esaminare i 4 capitolati disponibili, analizzandoli uno ad uno e ragionando sui vari aspetti positivi e negativi e sulle caratteristiche di quest’ultime, esprimendo per ogni membro la propria preferenza. Infine, il gruppoha deciso di procedere con l'assegnazione dei ruoli, in modo da definire le responsalibilità per ciascuna membro all'interno del progetto.

= Decisioni prese
- È stato scelto il nome #emph("AlphaCode") e definito il logo rappresentativo del gruppo;

- Dopo un'attenta analisi dei capitolati, il gruppo ha identificato, in ordine di interesse, le seguenti proposte:
  + C4 - NearYou - Smart custom advertising platform - #emph("Sync Lab");
  + C3 - Automatizzare le routine digitali tramite l’intelligenza generativa - #emph("Var Group S.p.A.");
  + C6 - Sistema di gestione di un magazzino distribuito - #emph("M31");
  + I ruoli per ciascun membro sono:

  #align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#d9d9d9")},
    columns: 2,
    inset: 10pt,
    table.header([*Nome Cognome*], [*Ruolo*]),
    [Nicolò Bovo], [Responsabile],
    [Alessandro Di Pasquale], [Amministratore],
    [Romeo Calearo], [Analista],
    [Massimo Chioru], [Progettista],
    [Manuel Cinnirella], [Programmatore],
    [Giovanni Battista Matteazzi], [Programmatore],
    [Elia Leonetti], [Verificatore]
  )
)

- È stata fissata la data della prossima riunione per il giorno 2025-03-10 e si è deciso, per il futuro, di impegnarsi ad effettuare almeno una riunione interna a settimana.
