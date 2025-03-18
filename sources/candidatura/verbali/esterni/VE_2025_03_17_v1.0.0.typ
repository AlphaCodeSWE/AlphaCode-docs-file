#import "../../../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Esterna",
  subtitle: "Verbale Prima Riunione Esterna",
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responabile", "Nicolò Bovo",
      "Redattore", "Alessandro Di Pasquale",
      "Verificatori", "Massimo Chioru",
      "", "Romeo Calearo",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-17",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-03-17", "Stesura del verbale", "Alessandro Di Pasquale",
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
- *Luogo*: Chiamta Google Meet, piattaforma usata dall'azienda Sync Lab;
- *Ora di inizio*: 17:00;
- *Ora di fine*: 17:30;
- *Partecipanti interni*: Alessandro Di Pasquale, Nicolò Bovo, Romeo Calearo, Elia Leonetti.
- *Partecipanti esterni*: Andrea Dorigo, Daniele Zorzi.

== Ordine del giorno
- Conoscere i referenti del progetto
- Individuare metodologie pratiche ed efficaci per la possibile collaborazione
- Definire con maggior precisione il tipo di prodotto richiesto in base anche alle esigenze dell'azienda.
- Affrontare aspetti tecnici specifici relativi al capitolato.

= Sintesi dell'incontro
L'incontro è stato caratterizzato principalmente da alcune domande che il gruppo ha posto all'azienda interlocutrice. Tali quesiti sono stati avanzati dal responsabile e dall'amministratore, sulla base dei loro ambiti di competenza.
La conversazione si è svolta come segue:

== Prima Domanda

*Nicolò Bovo - _Responsabile_:* _L'azienda è disponibile a fornire sessioni formative sulle tecnologie necessarie? Se sì, in quale modalità (ad esempio, incontri dedicati, assistenza via email per chiarire dubbi durante il progetto)?_

*Daniele - _Infrastructure Manager_:* L'azienda si rende pienamente disponibile a fornire al gruppo la formazione necessaria sulle tecnologie da utilizzare, insieme a tutta la documentazione utile. Inoltre, ci impegniamo a favorire un contatto diretto con i nostri specialisti qualificati per rispondere tempestivamente ad eventuali esigenze specifiche.

== Seconda Domanda

*Nicolò Bovo - _Responsabile_:* _In base all'esperienza acquisita negli anni precedenti, con quale frequenza l'azienda consiglia di svolgere incontri per garantire un efficace coordinamento del progetto (ad esempio, mensile, quindicinale, oppure con incontri flessibili senza cadenza obbligatoria)?_

*Andrea - _Data Platform Manager_:* Nel primo periodo, consigliamo di organizzare incontri con cadenza settimanale, in modo da garantire un avvio efficace del progetto ed evitare di trovarsi in difficoltà. Successivamente, una volta consolidato il coordinamento ed acquisita maggiore esperienza da parte del vostro gruppo, suggeriamo di ridurre la frequenza degli incontri a due volte al mese.

== Terza Domanda

*Romeo - _Analista_:* _È possibile per lo sviluppo della web app adoperare un server web python come Flask?_

*Daniele - _Infrastructure Manager_:* Sì, l'uso di Flask sarebbe adeguato, ma non strettamente necessario, in quanto potrebbe essere più conveniente adottare strumenti open-source già predisposti per questo scopo, come _Profana_, _Superset_ e _Metabase_.

== Quarta Domanda

*Romeo - _Analista_:* _Sulla base di quale criterio ritenete necessario stabilire le tecnologie da adoperare tra quelle da voi illustrate nel documento di specifiche? Avete preferenze in merito?_

*Andrea - _Data Platform Manager_:* La scelta delle tecnologie da adottare tra quelle indicate nel documento di specifiche sarà effettuata in funzione degli obiettivi specifici del prodotto da sviluppare. Riteniamo infatti che la tecnologia più adatta sia quella che meglio risponde alle esigenze del progetto e ai risultati che si intendono ottenere.

== Quinta Domanda

*Alessandro Di Pasquale - _Amministratore:_* _Di cosa si occupa principalmente la vostra azienda e perché tale background ha portato alla proposta di questo progetto?_

*Daniele - _Infrastructure Manager_:* Sync Lab lavora principalmente nello sviluppo di soluzioni digitali avanzate, occupandosi di realizzazione di applicazioni web e mobile, integrazione e gestione di sistemi ERP e applicazioni aziendali, nonché gestione infrastrutturale e servizi di networking. Offre inoltre consulenza e soluzioni specialistiche per diversi settori, tra cui il maritime, la sanità digitale, i trasporti e la logistica. L'azienda è oltretutto attiva nel campo del Data Management, nello sviluppo di soluzioni innovative come applicazioni basate su blockchain e in nuovi scenari tecnologici, come il Metaverso e le applicazioni olografiche. Tra i nostri clienti abbiamo anche: Intesa Sanpaolo, Autostrade per l'Italia, Enel e altre realtà importanti.
