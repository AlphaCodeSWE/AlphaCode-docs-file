#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Manuale Utente",
  
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Manuel Cinnirella",
      "Redattori", "Alessandro Di Pasquale",
      "Verificatori", "Massimo Chioru",
    
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-08-09",
  version: "0.1.0",
  version_history: (
    "0.1.0", "2025-08-09", "Stesura iniziale del manuale utente: introduzione e istruzioni per l'avvio del sistema. ","Alessandro Di Pasquale","Manuel Cinnirella", 
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

= Introduzione
== Scopo del documento 

Questo Manuale Utente spiega in modo semplice come funziona il prodotto e come usarlo ogni giorno. Vediamo come avviare l'ambiente containerizzato#apice("G") con Docker#apice("G") anche su Gitpod#apice("G"), come far partire i servizi con Docker Compose#apice("G") e come accedere alle interfacce esposte per svolgere le attività previste.

== Scopo del prodotto

NearYou#apice("G") è una piattaforma di advertising#apice("G") che usa la GenAI#apice("G") per creare annunci su misura. Per ogni utente compone prompt#apice("G") dinamici con i dati disponibili (posizione in tempo reale, informazioni di profilo e preferenze) e genera contenuti più rilevanti. L'infrastruttura è pensata per girare in container#apice("G") (Docker#apice("G")) anche su Gitpod#apice("G"), così da facilitare sviluppo e utilizzo. L'obiettivo è aumentare il coinvolgimento e migliorare il ROI#apice("G") riducendo la distanza tra messaggio e destinatario.

== Riferimenti
=== Riferimenti normativi
- Norme di Progetto (v2.0.0)
- Capitolato C4 2 Sync Lab S.r.l. :https://alphacodeswe.github.io/AlphaCode-docs-file/candidatura/Capitolato_C4_signed.pdf
=== Riferimenti informativi
- Glossario (v2.0.0)
- Capitolato C4 2 Sync Lab S.r.l. : https://alphacodeswe.github.io/AlphaCode-docs-file/candidatura/Capitolato_C4_signed.pdf
// - Uso di gitpod
= Avvio del sistema
== Requisiti tecnici per avviare il sistema
L'esecuzione del sistema avviene integralmente in Gitpod#apice("G"). All'apertura dello workspace#apice("G"), l'orchestrazione dei container#apice("G") tramite Docker Compose#apice("G") è avviata automaticamente; non è richiesto alcun intervento manuale. Gli endpoint#apice("G") diventano disponibili non appena i servizi risultano operativi e le relative porte vengono esposte nell'interfaccia di Gitpod#apice("G").
== Download della repository#apice("G") 
Procedura professionale basata sul flusso consigliato (import su account personale e avvio in Gitpod#apice("G")):

- Acquisizione del codice
  - ZIP#apice("G"): aprire la pagina della repository#apice("G") https://github.com/AlphaCodeSWE/NearYou-Code, seleziona Code > Download ZIP e decomprimi l'archivio.
  - Git#apice("G"):
    - HTTPS#apice("G"): git clone https://github.com/AlphaCodeSWE/NearYou-Code.git

#image("../../github.png")

- Import nel proprio account GitHub#apice("G")
  - Consigliato: utilizzare lo strumento di importazione GitHub#apice("G") (https://github.com/new/import), indicando come sorgente l'URL#apice("G") https://github.com/AlphaCodeSWE/NearYou-Code.git, quindi selezionare owner, nome e visibilità del nuovo repository#apice("G").
  - In alternativa, eseguire un fork#apice("G") se disponibile e rinomina il repository#apice("G") secondo le tue convenzioni.

== Istruzioni per l'avvio del sistema
=== Avvio in Gitpod#apice("G") (nessuna configurazione locale richiesta)
1. Dalla copia nel proprio account, aprire Gitpod#apice("G") tramite il pulsante dedicato (se presente) oppure con l'URL#apice("G"): https://gitpod.io/#https://github.com/<tuo-account>/<nome-repo>.
2. Fare clic sul pulsante per avviare
3. Attendere la creazione dell'ambiente
4. Creazione e setup dei container#apice("G") automatica

#image("../../gitpodA.png")
#image("../../gitpodB.png")
#image("../../gitpodC.png")

=== Avvio in locale
1. Entrare nella directory principale della repository#apice("G") con `cd NearYou-Code`;
2. Modificare il file (nascosto) `.env` e compilare, a seconda dell'A.I. di cui si dispone, i campi `LLM_PROVIDER`, `OPENAI_API_KEY` e `OPENAI_API_BASE`.
3. Avviare il sistema con `docker compose up`;
4. Attendere qualche minuto che tutte le risorse vengano scaricate (i.e. mappe).

==  Istruzioni per l'arresto del sistema

Il sistema è eseguito in Gitpod#apice("G") con avvio dei container#apice("G") automatizzato. Di seguito vengono illustrate le modalità di arresto e riattivazione.

=== Arresto automatico (predefinito in Gitpod#apice("G"))

- Alla chiusura dello spazio di lavoro (workspace#apice("G")), dopo circa 5 minuti Gitpod#apice("G") arresta automaticamente tutti i container#apice("G") e sospende il workspace#apice("G").
- Per riattivare il sistema, riapri il link Gitpod#apice("G") del repository#apice("G"): lo spazio di lavoro viene ripristinato e i container#apice("G") ripartono automaticamente secondo la configurazione della repository#apice("G"). Non è richiesto alcun comando.

=== Arresto e riavvio manuali (opzionali)

Eseguire i comandi seguenti solo se necessario. In Gitpod#apice("G"), aprire un terminale nella root della repository#apice("G").

- Arresto completo e rimozione dei volumi:
    ```bash
    docker compose down -v
    ```
- Riavvio:
    ```bash
    docker compose up
    ```
