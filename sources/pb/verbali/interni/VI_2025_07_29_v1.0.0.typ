#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Nona Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattori", "Massimo Chioru",
      "", "Elia Leonetti",
      "Verificatori", "Manuel Cinnirella",
      "", "Giovanni Battista Matteazzi",
      "", "Romeo Calearo",
      "", "Nicolò Bovo",
      
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-07-29",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-07-29", "Stesura del verbale", "Manuel Cinnirella, Elia Leonetti, Giovanni Battista Matteazzi, Massimo Chioru, Romeo Calearo, Nicolò Bovo"
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
- *Ora di inizio*: 14:30;
- *Ora di fine*: 15:30;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno
 1. Punto della situazione a seguito della pubblicazione dell'esito della fase RTB#apice("G").
 2. Revisione degli obiettivi a breve e lungo termine per la fase PB#apice("G").
 3. Suddivisione dei compiti.

= Sintesi dell'incontro
In prima istanza si è discusso l'esito della valutazione per la fase RTB#apice("G"), e le criticità emerse durante il contestuale incontro col Professor Vardanega. 
In particolare, si è preso atto delle seguenti necessità:
  - rendere l'Analisi dei Requisiti più descrittiva;
  - migliorare l'impostazione strutturale delle Norme di Progetto;
  - rivedere le metriche presentate nel Piano di Qualifica;
  - in futuro, adottare un sistema di riferimenti web (e riferimenti a documenti) più puntuale.
Si è valutata l'efficacia del modello di sviluppo correntemente in uso, ovvero il modello Incrementale, e la possibilità di transizionare verso il modello Agile; s'intende contattare il Professor Vardanega per avere una consultazione che aiuti a guidare questa scelta.
Il team ha dunque valutato come attivarsi, tramite una coerente suddivisione dei compiti, per apportare tempestivamente le migliorie richieste ai documenti pre-esistenti, prima di mettersi all'opera sulla fase di PB#apice("G").

= Decisioni prese
1. Il team si impegna a sanare a breve termine le criticità emerse rispetto all'impianto documentale.
2. Si è decisa la suddivisione dei compiti, come riportata al paragrafo IV.

#pagebreak()

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
    [docs], [Alessandro Di Pasquale, Giovanni Battista Matteazzi, Nicolò Bovo], [Correzione di Analisi dei Requisiti, Norme di Progetto, Piano di Qualifica],
    [docs],[Manuel Cinnirella, Romeo Calearo],[Revisione ortografica della documentazione],
    [docs],[Massimo Chioru, Elia Leonetti],[Stesura nono verbale interno] 
  )
)