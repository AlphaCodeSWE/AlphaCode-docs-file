#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Settima Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Romeo Calearo",
      "Redattori", "Manuel Cinnirella",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi",
      "Verificatori", "Massimo Chioru",
      "", "Alessandro Di Pasquale",
      "", "Nicolò Bovo",
      
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-05-03",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-05-08", "Stesura del verbale", "Manuel Cinnirella, Elia Leonetti"
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
- *Ora di inizio*: 16:30;
- *Ora di fine*: 17:30;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno
 1. Recap sullo stato del progetto.
 2. Preparazione per l'incontro con l'azienda Sync Lab#apice("G") del 05/05.
 3. Revisione automatismo firme e compilazione documenti.

= Sintesi dell'incontro
L'incontro è iniziato con una breve fase di ricapitolazione sulle feature implementate o migliorate durante la rotazione appena terminata, in particolare:

1. L'applicativo si dota di una dashboard#apice("G") utente e di una dashboard#apice("G") amministratore#apice("G").
2. Si è rivelato necessario implementare tecniche di multithreading, per gestire il flusso di dati fra servizi producer#apice("G") e servizi consumer#apice("G") in maniera adeguatamente efficiente (in riferimento al sistema di simulazione GPS#apice("G")).
Successivamente, si è valutato cosa esporre al meeting con l'azienda Sync Lab#apice("G"), concludendo di aggiornare l'azienda su tutti gli sviluppi riguardanti le dashboard#apice("G") e la risoluzione delle problematiche incontrate; verrà inoltre richiesto consiglio riguardo all'utilizzo di Grafana#apice("G") come servizio di dashboarding. \
Nel corso della chiamata è stata risolta la mancanza di alcuni documenti, attribuita ad errori nell'automazione di compilazione Typst#apice("G").
Si è infine disposta la rotazione dei ruoli, coerentemente con il termine di quelli attuali.

= Decisioni prese
1. Il team si impegna ad accertare costantemente il corretto caricamento dei documenti.
2. L'incontro esterno del 2025-05-05 sarà sfruttato per chiedere chiarimenti riguardo l'utilizzo di Grafana#apice("G"), e per ottenere feedback generali sullo stato del progetto.
3. I ruoli sono stati aggiornati, come descritto nel paragrafo successivo.

#pagebreak()

= Rotazione ruoli

I ruoli aggiornati per ciascun membro sono:

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 2,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*Nome e Cognome*]), text(fill: rgb("#f5f5eb"), align(center)[*Ruolo*])),
    [Alessandro Di Pasquale], [Progettista#apice("G")],
    [Nicolò Bovo], [Programmatore#apice("G")],
    [Giovanni Battista Matteazzi], [Amministratore#apice("G")],
    [Romeo Calearo], [Responsabile#apice("G")],
    [Massimo Chioru], [Verificatore#apice("G")],
    [Elia Leonetti], [Analista#apice("G")],
    [Manuel Cinnirella], [Programmatore#apice("G")]
  )
)

= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    [docs ], [Alessandro Di Pasquale, Romeo Calearo, Massimo Chioru, Nicolò Bovo], [Aggiornamento dettagli dei documenti pregressi],
    [docs ],[Giovanni Battista Matteazzi, Elia Leonetti, Manuel Cinnirella],[Stesura del Settimo Verbale Interno] 
  )
)
