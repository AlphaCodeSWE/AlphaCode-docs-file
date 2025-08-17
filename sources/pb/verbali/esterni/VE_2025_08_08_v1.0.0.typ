#import "template/template.typ": *
#set outline(title: "Table of contents")
#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Decima Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Manuel Cinnirella",
      "Redattori", "Massimo Chioru", "", "Alessandro Di Pasquale",
      "Verificatori", "Nicolò Bovo",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-08-08",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-08-08", "Stesura del verbale", "Alessandro Di Pasquale, Romeo Calearo, Manuel Cinnirella, Nicolò Bovo, Elia Leonetti, Massimo Chioru, Giovanni Battista Matteazzi"
  ),
  main-color: "A72229FF", //set the main color
  group-logo: image("template/assets/AlphaCodeLogo.png"),
  logo: image("template/assets/UnipdLogo.png"), //set the logo
) 
// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()
= Contenuti del verbale
== Informazioni sulla riunione
- *Luogo*: Chiamata Google Meet;
- *Ora di inizio*: 15:00;
- *Ora di fine*: 15:45;
- *Partecipanti interni*: Alessandro Di Pasquale, Giovanni Battista Matteazzi, Massimo Chioru, Nicolò Bovo;
- *Partecipanti esterni*: Andrea Dorigo, Fabio Pallaro;
== Ordine del giorno
- Aggiornamento sullo stato di avanzamento del progetto;
- Verifica e validazione del progetto con l'azienda proponente;
- Definizione delle prossime fasi relative allo svilluppo dell'MVP#apice("G") ;
== Aggiornamento lavoro pregresso
- Definizione dell’architettura e individuazione della soluzione più idonea agli obiettivi del progetto.
- Avvio delle attività preparatorie per lo sviluppo dell’MVP#apice("G").
- Stesura e aggiornamento della documentazione di progetto.
- Pianificazione delle attività della settimana successiva, con priorità allo sviluppo dell’MVP#apice("G") e ai primi test documentati.
== Consigli ricevuti
Durante l’incontro con l’azienda proponente, è stata analizzata e confermata l’architettura definita dal gruppo.
L’azienda ha confermato la validità della soluzione individuata, ritenendola coerente con gli obiettivi di progetto e idonea allo sviluppo dell’MVP#apice("G").

Nel corso della riunione sono state ribadite le priorità operative, ponendo come obiettivo principale il completamento dell’MVP#apice("G") e l’avvio della fase di test nei tempi stabiliti.

L’azienda ha inoltre suggerito di predisporre, nelle settimane successive al periodo di ferie, una presentazione complessiva del progetto, da condividere ed esporre anche ad altri colleghi di _Sync Lab_#apice("G"), al fine di illustrare in maniera completa l'MVP#apice("G") svolto, le soluzioni tecniche adottate e i risultati raggiunti.
#pagebreak()
= Attività individuate
#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode#apice("G") Full Team], align(left)[Finalizzare lo sviluppo del MVP#apice("G")],
    align(center)[ORG], [AlphaCode#apice("G") Full Team], align(left)[Finalizzare test],
    align(center)[docs], [AlphaCode#apice("G") Full Team], align(left)[Proseguire con la stesura della documentazione],
  )
)

#place(
  bottom + left,
  dx: 10pt,
  dy: -10pt,
)[
  #line(length: 5.3cm, stroke: 0.7pt)
  Firma dell'azienda proponente
]