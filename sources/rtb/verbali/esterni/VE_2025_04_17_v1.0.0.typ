#import "../../../../template/template.typ": *
#set outline(title: "Table of contents")
#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Terza Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattori", "Massimo Chioru",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi",
      "Verificatori", "Manuel Cinnirella",
      "", "Romeo Calearo",
      "", "Nicolò Bovo"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-04-17",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-04-18", "Stesura del verbale", "Giovanni Battista Matteazzi","Elia Leonetti, Manuel Cinnirella"
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
- *Luogo*: Chiamata Google Meet;
- *Ora di inizio*: 17:00;
- *Ora di fine*: 17:30;
- *Partecipanti interni*: Giovanni Battista Matteazzi, Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Massimo Chioru, Manuel Cinnirella.
- *Partecipanti esterni*: Andrea Dorigo, Fabio Pallaro.
== Ordine del giorno
- Verifica e valutazione del lavoro svolto fino a questo momento.
- Definizione delle prossime fasi di progetto.
== Aggiornamento lavoro pregresso
- Durante l'incontro, il gruppo ha presentato i progressi fatti sul simulatore GPS#apice("G"). Attualmente lo strumento è in grado di generare coordinate in maniera pseudocasuale, permettendo così di testare l'invio di dati verso il sistema e l'interazione iniziale con il message broker#apice("G"). Pur trattandosi di una versione base, il simulatore rappresenta un primo passo concreto nella realizzazione dell'architettura prevista.
- Validazione Incremento#apice("G") 1 completata: Simulatore GPS#apice("G") operativo con baseline#apice("G") stabile, architettura base con message broker#apice("G") funzionante e testata.
== Consigli ricevuti
Nel corso della riunione è stato suggerito di migliorare la qualità e la coerenza dei dati generati, adottando strumenti online in grado di produrre percorsi realistici in formato GPX#apice("G"). Questi file permetteranno di simulare movimenti più verosimili, associati a tragitti effettivi e arricchiti da "Point of Interest#apice("G")" significativi.
== Prossimi passi
In vista delle prossime fasi progettuali, è stato deciso di procedere con l'integrazione di un sistema di data enrichment#apice("G"), per elaborare meglio i dati. Parallelamente, inizierà lo sviluppo della componente di intelligenza artificiale dedicata alla generazione di messaggi personalizzati per gli utenti, basati su posizione, interessi e profili predefiniti. La scelta del modello linguistico da impiegare è stata lasciata al gruppo, con libertà di valutare sia soluzioni commerciali (come OpenAI) sia alternative gratuite disponibili online.
= Attività individuate
#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    align(center)[ORG], [AlphaCode#apice("G") Full Team], align(left)[Prossimo incontro con Sync Lab#apice("G") S.r.l. fissato per il 2025-04-24 alle 17:00],
    [Incremento 2], [AlphaCode#apice("G") Full Team], align(left)[Aggiornare il generatore di coordinate GPS#apice("G")],
    [Incremento 2],[Da definirsi con nuova rotazione], align(left)[Sviluppare AI#apice("G") che generi messaggi personalizzati basati su profili utente.]
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
