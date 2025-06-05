#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Quinta Riunione Interna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattore", "Giovanni Battista Matteazzi",
      "", "Elia Leonetti",
      "", "Alessandro Di Pasquale",
      "Validatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Nicolò Bovo",
      "", "Manuel Cinnirella"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/04/09",
  version: "1.2.0",
  version_history: (
        "1.0.0", "2025/04/09", "Stesura del verbale", "Giovanni Battista Matteazzi", "Manuel Cinnirella"
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
- *Ora di inizio*: 17:00;
- *Ora di fine*: 18:00;
- *Partecipanti*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Manuel Cinnirella, Massimo Chioru, Giovanni Battista Matteazzi, Elia Leonetti.

== Ordine del giorno

 1. Ricapitolazione dei punti principali emersi durante il meeting con l'azienda Sync Lab.
 2. Aggiornamento dei membri che non hanno partecipato all'incontro con l'azienda.
 3. Definizione degli step operativi da intraprendere a breve termine, tra cui:
  - Studio e utilizzo di Docker per il deployment delle componenti;
  - Progettazione e sviluppo di uno script per la generazione di dati (simulazione GPS e status);
  - Redazione dei documenti di progetto: secondo verbale esterno, quinto verbale interno, glossario, norme di progetto.

= Sintesi dell'incontro
 La riunione è iniziata con un riepilogo dei contenuti emersi nel precedente incontro con l'azienda Sync Lab, in cui si è approfondito il contesto operativo e l'architettura tecnica che sarà alla base del progetto. Nonostante ci fossero più tecnologie disponibili tra cui scegliere per la fase implementativa, onde favorire il corretto flusso dei dati è stato deciso di attenersi a quelle consigliate e già utilizzate dall'azienda; questo ci assicura di operare in un contesto noto ai proponenti. 
 I membri che non avevano preso parte al meeting sono stati inoltre messi al corrente degli spunti operativi offerti da Sync Lab, sia a livello tecnico che organizzativo. 
 Il gruppo ha quindi valutato le competenze necessarie per affrontare le prossime fasi del lavoro, individuando come priorità l'apprendimento del framework Docker, e la stesura di uno script Python che consenta di simulare la generazione di dati GPS e di stato. 
 Parallelamente sono stati individuati i documenti da redigere nel breve termine: verbali (interno ed esterno), glossario tecnico e norme di progetto. La discussione si è chiusa con l'individuazione delle scadenze per ciascuna attività e con l'assegnazione dei compiti sulla base della rotazione dei ruoli. 


= Decisioni prese

 1. Formazione individuale: ogni membro dovrà approfondire l'utilizzo di Docker e preparare degli script in Python per la simulazione dei dati in vista dello sviluppo dei primi prototipi.
 2. Redazione documenti: è stato stabilito che nel corso della settimana verranno redatti:
  - Il secondo verbale esterno, per documentare l'incontro con Sync Lab;
  - Il quinto verbale interno;
  - Il glossario tecnico, che accompagnerà tutta la documentazione futura;
  - Le Norme di Progetto, redatte secondo lo standard ISO/IEC/IEEE 12207:2017.
 3. Organizzazione del lavoro: la ripartizione delle attività avverrà secondo i ruoli attuali del team.
 4. Scadenze: ogni attività dovrà essere completata in tempo utile per poter presentare i risultati alla prossima riunione con l'azienda.



= Attività individuate

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#404040")},
    columns: 3,
    inset: 10pt,
    table.header(text(fill: rgb("#f5f5eb"), align(center)[*ID*]), text(fill: rgb("#f5f5eb"), align(center)[*Assegnatari*]), text(fill: rgb("#f5f5eb"), align(center)[*Descrizione*])),
    [#link("https://github.com/AlphaCodeSWE/NearYou-Project")[Project]], [Nicolò Bovo, Massimo Chioru ,Elia Leonetti], [Script Python per generazione di dati GPS e di status],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/4")[docs \#4]], [Romeo Calearo, Alessandro Di Pasquale], [Stesura del Secondo Verbale Esterno],
    [#link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file/issues/5")[docs \#5]],[Giovanni Battista Matteazzi, Manuel Cinnirella ],[Stesura del Quinto Verbale Interno]
  )
)  
