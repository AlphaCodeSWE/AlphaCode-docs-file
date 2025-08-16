#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Analisi dei requisiti",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Nicolò Bovo",
      "", "Alessandro Di Pasquale",
      "", "Massimo Chioru",
      "", "Giovanni Battista Matteazzi",
      "", "Elia Leonetti",
      "Redattori", "Romeo Calearo, Giovanni Battista Matteazzi",
      "", "Alessandro Di Pasquale, Nicolò Bovo",
      "", "Manuel Cinnirella, Massimo Chioru",
      "Verificatori", "Elia Leonetti",
      "", "Manuel Cinnirella, Romeo Calearo",
      "", "Alessandro Di Pasquale, Massimo Chioru",
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-10",
  version: "2.0.0",
  version_history: (
    "2.0.0", "2025-08-12", "Selezione termini glossario e correzioni finali", 
    "Romeo Calearo", 
    "Alessandro Di Pasquale, Nicolò Bovo",

    "1.3.0", "2025-08-03", "Aggiornamento requisiti e tabella tracciamento", 
    "Massimo Chioru", 
    "Romeo Calearo",

    "1.2.0", "2025-07-29", "Aggiunta casi d'uso per MVP", 
    "Alessandro Di Pasquale", 
    "Massimo Chioru",

    "1.1.0", "2025-07-24", "Correzioni migliorative da valutazione RTB", 
    "Manuel Cinnirella", 
    "Alessandro Di Pasquale",

    "1.0.0", "2025-06-13", "Selezione termini glossario e correzioni finali", 
    "Alessandro Di Pasquale", 
    "Romeo Calearo",

    "0.6.0", "2025-06-08", "Aggiornamento requisiti per stream processor", 
    "Alessandro Di Pasquale, Nicolò Bovo", 
    "Romeo Calearo",

    "0.5.0", "2025-04-09", "Stesura requisiti funzionali, non funzionali e di vincolo", 
    "Giovanni Battista Matteazzi", 
    "Manuel Cinnirella",

    "0.4.0", "2025-04-02", "Proseguito sviluppo e aggiunta casi d'uso", 
    "Giovanni Battista Matteazzi", 
    "Manuel Cinnirella",

    "0.3.0", "2025-03-28", "Proseguito sviluppo e aggiunta casi d'uso", 
    "Giovanni Battista Matteazzi", 
    "Manuel Cinnirella",

    "0.2.0", "2025-03-17", "Aggiunta sezione casi d'uso e architettura", 
    "Romeo Calearo", 
    "Elia Leonetti",

    "0.1.0", "2025-03-10", "Bozza del documento", 
    "Romeo Calearo", 
    "Elia Leonetti",
  ),

  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

#set text(lang: "it")
#show image: it => figure(
  it,
  caption: it.alt
)

#show table: it => figure(
  it,
  caption: []
)

// Edit this content to your liking
#outline(title: "Indice")
#pagebreak()

#outline(
  title: [Lista delle figure],
  target: figure.where(kind: image),   // tutte le figure con immagini
)

#outline(
  title: [Lista delle tabelle],
  target: figure.where(kind: table),   // figure che contengono table()
)

#pagebreak()

= Introduzione

== Scopo del documento

Il presente documento di Analisi dei Requisiti fornisce una descrizione dettagliata e completa del sistema *NearYou#apice("G")*, una piattaforma di notifiche personalizzate basate sulla posizione che utilizza intelligenza artificiale generativa (AI generativa#apice("G")) per creare messaggi contestuali e rilevanti per gli utenti.

Il documento costituisce la base per lo sviluppo del sistema, definendo chiaramente funzionalità, vincoli, casi d'uso e requisiti tecnici derivanti dall'analisi del codice sorgente e dell'architettura implementata.

== Scopo del prodotto

*NearYou* è una piattaforma tecnologica che combina *tracking#apice("G") della posizione in tempo reale*, *database#apice("G") geospaziali#apice("G")*, *intelligenza artificiale generativa* e *analytics#apice("G") avanzate* per fornire notifiche personalizzate agli utenti quando si trovano in prossimità di negozi o punti di interesse.

Il sistema è progettato per:
- *Tracciare la posizione* degli utenti in real-time#apice("G") attraverso simulazione GPS#apice("G")
- *Generare messaggi personalizzati* utilizzando LLM#apice("G") (Large Language Models) quando l'utente è vicino a un negozio
- *Fornire una dashboard#apice("G") interattiva* con visualizzazione su mappa delle posizioni, percorsi e notifiche
- *Memorizzare e analizzare* tutti i dati per fornire insights#apice("G") attraverso dashboard#apice("G") analytics#apice("G")
- *Aggiornare automaticamente* il database#apice("G") dei negozi tramite ETL#apice("G") da OpenStreetMap#apice("G")


== Riferimenti

=== Riferimenti normativi
- Norme di Progetto (v2.0.0)

  https://alphacodeswe.github.io/AlphaCode-docs-file/rtb/NormeDiProgetto_2025_04_05_v2.0.0_signed.pdf

=== Riferimenti informativi
- Glossario (v2.0.0)

  https://alphacodeswe.github.io/AlphaCode-docs-file/rtb/Glossario_2025_07_07_v2.0.0_signed.pdf


= Descrizione del prodotto

== Obiettivi del prodotto

Il sistema NearYou ha come obiettivo principale la *creazione di un'esperienza utente personalizzata e contestuale* attraverso l'integrazione di diverse tecnologie avanzate:

=== Obiettivi primari:
1. *Personalizzazione intelligente*: Utilizzare profili utente (età, professione, interessi) per generare messaggi rilevanti tramite LLM#apice("G")
2. *Geolocalizzazione precisa*: Implementare tracking#apice("G") in real-time#apice("G") con calcolo di distanze attraverso PostGIS#apice("G")
3. *Scalabilità e performance*: Gestire flussi di dati in real-time#apice("G") attraverso Apache Kafka#apice("G") e Bytewax#apice("G")
4. *Analytics#apice("G") avanzate*: Fornire insights#apice("G") attraverso dashboard#apice("G") Grafana#apice("G") con metriche di business e sistema
5. *Automazione*: Mantenere aggiornato il database#apice("G") negozi attraverso ETL#apice("G") automatici da OpenStreetMap#apice("G")

=== Obiettivi secondari:
- *Caching#apice("G") intelligente*: Ridurre latenza e costi LLM#apice("G") attraverso cache#apice("G") Redis#apice("G")
- *Monitoraggio#apice("G") completo*: Garantire osservabilità del sistema con Prometheus#apice("G"), Loki#apice("G") e metriche custom
- *Facilità di deployment#apice("G")*: Fornire ambiente containerizzato#apice("G") completo con Docker Compose#apice("G")

== Funzionalità e vincoli del prodotto

=== Funzionalità implementate:

*Data Pipeline#apice("G") e Streaming#apice("G"):*
- Producer#apice("G") Kafka#apice("G") che simula movimenti utenti su percorsi reali di Milano usando OSRM#apice("G")
- Consumer#apice("G") Bytewax#apice("G") per elaborazione stream#apice("G") dati con arricchimento in real-time#apice("G")
- Integrazione con PostGIS#apice("G") per calcolo distanze e identificazione negozi vicini

*Generazione Messaggi Intelligente:*
- Servizio microservice#apice("G") FastAPI#apice("G") per generazione messaggi personalizzati
- Integrazione con LLM#apice("G") (supporto Groq#apice("G"), OpenAI#apice("G"), provider multipli)
- Sistema di cache#apice("G") Redis#apice("G") per ottimizzazione performance e riduzione costi
- Template personalizzabili basati su profilo utente e tipologia negozio

*Dashboard#apice("G") Utente:*
- Interfaccia web responsive#apice("G") con mappa Leaflet#apice("G") interattiva
- Visualizzazione real-time#apice("G") di posizione utente, percorsi e negozi
- Sistema di notifiche in-app per messaggi personalizzati
- Autenticazione JWT#apice("G") con gestione sessioni sicura
- WebSocket#apice("G") per aggiornamenti posizione in real-time#apice("G")

*Storage e Persistenza:*
- ClickHouse#apice("G") per analytics#apice("G") e storage eventi temporali ad alta performance
- PostgreSQL#apice("G")/PostGIS#apice("G") per gestione dati geospaziali#apice("G") dei negozi
- Schema ottimizzato per query geospaziali#apice("G") e analytics#apice("G")

*ETL#apice("G") e Data Management:*
- Apache Airflow#apice("G") per orchestrazione ETL#apice("G") automatici
- ETL#apice("G") adattivo che si auto-configura in base ai cambiamenti nei dati
- Integrazione con OpenStreetMap#apice("G") per aggiornamento negozi Milano
- Sistema di tracking#apice("G") cambiamenti con logging#apice("G") completo

*Monitoring#apice("G") e Observability:*
- Dashboard#apice("G") Grafana#apice("G") con pannelli personalizzati per metriche business e sistema
- Prometheus#apice("G") per raccolta metriche con esportatori per tutti i componenti
- Loki#apice("G") per gestione log centralizzata
- Metriche custom per tracking#apice("G") performance LLM#apice("G"), cache#apice("G") hit rate#apice("G"), eventi utente

=== Vincoli tecnici:
- *Geografici*: Sistema focalizzato su Milano (coordinate definite in configurazione)
- *Performance*: Target \<200ms per generazione messaggi (con cache#apice("G"))
- *Scalabilità*: Supporto multi-worker Bytewax#apice("G") per elaborazione parallela
- *Sicurezza*: Kafka#apice("G") con SSL#apice("G")/TLS#apice("G"), JWT#apice("G") per autenticazione, password protette
- *Disponibilità*: Health checks e restart automatici per tutti i servizi

== Utenti e loro caratteristiche

=== Tipologie di utenti:

*Utente finale:*
- *Descrizione*: Persona che utilizza l'applicazione per ricevere notifiche personalizzate
- *Caratteristiche*: Ha un profilo definito (età, professione, interessi) memorizzato nel sistema
- *Interazioni*: Accede alla dashboard#apice("G"), visualizza la mappa, riceve notifiche, naviga lo storico
- *Competenze richieste*: Utilizzo base di applicazioni web e mobile

*Amministratore#apice("G") di sistema:*
- *Descrizione*: Operatore responsabile del monitoraggio#apice("G") e manutenzione del sistema
- *Caratteristiche*: Competenze tecniche per interpretare metriche e log
- *Interazioni*: Accesso a Grafana#apice("G"), Prometheus#apice("G"), log Loki#apice("G"), configurazione Airflow#apice("G")
- *Competenze richieste*: Conoscenza sistemi distribuiti, database#apice("G"), monitoring#apice("G")

*Sviluppatore/DevOps#apice("G"):*
- *Descrizione*: Persona che sviluppa, deploy#apice("G") e mantiene il sistema
- *Caratteristiche*: Competenze tecniche avanzate su architetture microservizi#apice("G")
- *Interazioni*: Deploy#apice("G") con Docker Compose#apice("G"), configurazione environment#apice("G"), debug#apice("G")
- *Competenze richieste*: Docker#apice("G"), Kafka#apice("G"), database#apice("G"), cloud native technologies

= Casi d'uso

== Introduzione

I casi d'uso del sistema NearYou sono strutturati attorno alle funzionalità core implementate nel codice sorgente. Ogni caso d'uso è identificato da un codice univoco UC[numero] e descrive le interazioni tra attori e sistema.

== Attori

*Utente Autenticato*: Persona che utilizza la dashboard per visualizzare la propria posizione e ricevere notifiche personalizzate, avendo eseguito l'accesso. 

*Utente non Autenticato*: Utente che non ha ancora eseguito l'accesso.

*Amministratore*: Persona che usa la dashboard per visualizzare le analisi di marketing e di monitoraggio del sistema.

*Sistema di Tracciamento*: Sistema che gestisce automaticamente il monitoraggio#apice("G") e la registrazione dei percorsi degli utenti attraverso l'acquisizione continua di dati GPS#apice("G") e la loro elaborazione per la visualizzazione cartografica.

== Elenco dei casi d'uso

=== UC1 - Autenticazione utente alla dashboard
*Attore principale*: 
 - Utente non autenticato  

*Precondizioni*: 
- L'utente ha credenziali valide nel sistema  

*Postcondizioni*: 
- L'utente è autenticato e ha accesso alla dashboard  

*Scenario principale*:
1. L'utente accede alla pagina di login
2. Inserisce username e password
3. Il sistema valida le credenziali e autentica l'utente consentendogli l'accesso alla dashboard#apice("G")

*Inclusioni:*
- UC2: Inserimento Username
- UC3: Inserimento Password

*Estensioni*:
- UC4: Visualizzazione Errore Credenziali


=== UC2 - Inserimento Username
*Attore principale*: 
 - Utente non autenticato  

*Precondizioni*: 
- L'utente ha uno username#apice("G") valido nel sistema
- L'utente sta effettuando l'autenticazione per la pagina di dashboard#apice("G")

*Postcondizioni*: 
- Il sistema accetta lo username#apice("G") inserito

*Scenario principale*:
1. L'utente accede alla pagina di login#apice("G")
2. L'utente inserisce lo username#apice("G")

=== UC3 - Inserimento Password
*Attore principale*: 
 - Utente non autenticato  

*Precondizioni*: 
- L'utente ha una password#apice("G") valida nel sistema
- L'utente sta effettuando l'autenticazione per la pagina di dashboard#apice("G")

*Postcondizioni*: 
- Il sistema accetta la password#apice("G") inserita

*Scenario principale*:
1. L'utente accede alla pagina di login#apice("G")
2. L'utente inserisce la password#apice("G")

=== UC4 - Visualizzazione Errore Credenziali
*Attore principale*: 
 - Utente non autenticato  

*Precondizioni*: 
- L'utente sta effettuando l'autenticazione per la pagina di dashboard#apice("G")

*Postcondizioni*: 
- Il sistema rifiuta le credenziali d'accesso inserite dall'utente poiché discrepanti con quelle memorizzate

*Scenario principale*:
1. L'utente accede alla pagina di login#apice("G")
2. L'utente inserisce lo username#apice("G")
3. L'utente inserisce la password#apice("G")
4. L'utente riceve un messaggio di errore che lo notifica delle credenziali errate

#image("../assets/UC/UC_1_2_3_4.png", alt: "UC1, UC2, UC3, UC4")

=== UC5 - Visualizzazione Dashboard
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*: 
- L'utente ha effettuato il login#apice("G") con successo

*Postcondizioni*: 
- La dashboard#apice("G") principale è completamente caricata e funzionale 
- Tutte le informazioni dell'utente sono visualizzate

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G")
2. Il sistema carica la dashboard#apice("G") principale
3. Il sistema carica la mappa con i punti di interesse
4. Il sistema inizializza tutti i componenti della dashboard#apice("G")

*Inclusioni*:
- Visualizzazione profilo utente nella dashboard#apice("G") (UC6)
- Visualizzazione statistiche utente nella dashboard#apice("G") (UC7)
- Visualizzazione promozioni recenti nella dashboard#apice("G") (UC8)


=== UC6 - Visualizzazione profilo utente nella dashboard
*Attore principale*: 
 - Utente Autenticato  

*Precondizioni*: 
- L'utente è autenticato nel sistema e quindi visualizza la dashboard#apice("G")
- Il sistema mantiene le informazioni del profilo utente
*Postcondizioni*: 
- Le informazioni del profilo utente sono visualizzate nella sidebar#apice("G") sinistra

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. Il sistema carica e visualizza le informazioni del profilo nella sidebar#apice("G") (ID, Età, Professione, Interessi)


=== UC7 - Visualizzazione statistiche utente nella dashboard
*Attore principale*: 
 - Utente Autenticato  

*Precondizioni*: 
- L'utente è autenticato nel sistema e quindi visualizza la dashboard#apice("G")
- Il sistema traccia e memorizza le attività dell'utente
*Postcondizioni*: 
- Le statistiche dell'utente sono visualizzate nella sezione dedicata della sidebar#apice("G")

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. Il sistema calcola e mostra le statistiche aggiornate (km percorsi, negozi vicini, notifiche, minuti attivi)

=== UC8 - Visualizzazione promozioni recenti nella dashboard
*Attore principale*: 
 - Utente Autenticato  

*Precondizioni*: 
- L'utente è autenticato nel sistema e quindi visualizza la dashboard#apice("G")
- Sono disponibili promozioni nel sistema
*Postcondizioni*: 
- Le promozioni recenti vengono visualizzate nella sezione dedicata della sidebar#apice("G")

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. Il sistema recupera le promozioni più recenti disponibili
3. Il sistema mostra le promozioni nella sezione "Promozioni Recenti" della sidebar#apice("G"), rappresentanti lo storico di ogni promozione generata da LLM#apice("G") che è apparsa all'utente dal principio del suo percorso, dotata della relativa ora di apparizione.

#image("../assets/UC/UC5_6_7_8.png", alt: "UC5, UC6, UC7, UC8")

=== UC9 - Filtra punti di interesse per categoria
*Attore principale*: 
 - Utente Autenticato  

*Precondizioni*: 
- L'utente è autenticato e si trova nella dashboard#apice("G") principale
- Il sistema contiene punti di interesse di diverse categorie
- La barra di filtri è visibile in basso alla mappa
*Postcondizioni*: 
- Vengono visualizzati sulla mappa solo i punti di interesse della categoria selezionata

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. L'utente seleziona una categoria specifica (Ristoranti, Abbigliamento, Supermercati, Elettronica, Bar & Caffè)

// *Inclusioni*:
// - Visualizzazione nome del punto di interesse dal marker#apice("G") (UC12)
// -  Visualizzazione categoria dal punto di interesse dal marker#apice("G") (UC13)

*Estensioni*:
- UC10: Visualizzazione messaggio "Nessun risultato trovato" 

=== UC10 - Messaggio di errore "Nessun risultato trovato"
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*:
- L'utente è autenticato e si trova nella dashboard#apice("G") principale
- L'utente ha applicato un filtro per categoria
- Il sistema non dispone di punti di interesse inerenti alla categoria selezionata

*Postcondizioni*:
- Il sistema non carica alcun punto di interesse
- Il sistema mostra il messaggio di errore

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. L'utente seleziona una categoria specifica
3. L'utente visualizza il messaggio di errore

#image("../assets/UC/UC9_10.png", alt: "UC9, UC10")

=== UC11 - Visualizzazione dettaglio marker#apice("G")
*Attore principale*: 
 - Utente Autenticato  

*Precondizioni*: 
- L'utente è autenticato e si trova nella dashboard#apice("G") con la mappa visualizzata
- Il sistema tiene traccia dei marker#apice("G")
- Sono presenti marker#apice("G") dei punti di interesse sulla mappa

*Postcondizioni*: 
- Il sistema mostra i dettagli del punto di interesse nel popup#apice("G") del marker#apice("G").

*Scenario principale*:
1. L'utente visualizza la mappa con i marker#apice("G") dei punti di interesse
2. L'utente clicca su un marker#apice("G") specifico

*Inclusioni*:
- Visualizzazione nome del punto di interesse dal marker#apice("G") (UC12)
- Visualizzazione categoria del punto di interesse dal marker#apice("G") (UC13)

=== UC12 - Visualizzazione nome del punto di interesse dal marker#apice("G")
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*:
- L'utente è autenticato e si trova nella dashboard#apice("G") principale
- Sono presenti marker#apice("G") dei punti di interesse sulla mappa
- L'utente ha selezionato o sta visualizzando un marker#apice("G") specifico

*Postcondizioni*:
- Il sistema visualizza il nome del punto di interesse del marker#apice("G") selezionato

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. L'utente seleziona una categoria specifica
3. L'utente visualizza il nome del punto di interesse dal marker#apice("G")

=== UC13 - Visualizzazione categoria dal punto di interesse dal marker#apice("G")
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*:
- L'utente è autenticato e si trova nella dashboard#apice("G") principale 
- Sono presenti marker#apice("G") dei punti di interesse sulla mappa
- L'utente ha selezionato o sta visualizzando un marker#apice("G") specifico

*Postcondizioni*:
- Il sistema visualizza la categoria del punto di interesse del marker#apice("G") selezionato

*Scenario principale*:
1. L'utente accede alla dashboard#apice("G") principale
2. L'utente seleziona una categoria specifica
3. L'utente visualizza la categoria del punto di interesse dal marker#apice("G")

#image("../assets/UC/UC11_12_13.png", alt: "UC11, UC12, UC13")

=== UC14a - Avvio di un nuovo percorso

*Attore principale*:
- Utente Autenticato

*Precondizioni*:
- L'utente è autenticato e si trova nella dashboard#apice("G")
- Il GPS#apice("G") è attivo e funzionante
- Nessun percorso attivo è in corso

*Postcondizioni*:
- Il tracciamento del percorso viene avviato

*Scenario principale*:
1. Il sistema avvia il tracciamento del percorso e registra la posizione iniziale


=== UC14b - Visualizzazione della bici sulla mappa

*Attore principale*:
- Utente Autenticato

*Precondizioni*:
- Un percorso attivo è stato avviato
- La dashboard#apice("G") è visibile
- Il GPS#apice("G") è attivo e funzionante

*Postcondizioni*:
- L'icona della bici è visibile sulla mappa, nella posizione attuale dell'utente

*Scenario principale*:
1. Il sistema riceve la posizione corrente dell'utente dal GPS#apice("G")
2. Il sistema aggiorna la mappa con l'icona della bici nella posizione rilevata

*Inclusioni*:
- Tracciamento percorso con polyline#apice("G") (UC15)


=== UC15 - Tracciamento percorso con polyline#apice("G")
*Attore principale*: 
 - Sistema di Tracciamento

*Precondizioni*: 
- L'utente ha iniziato un percorso attivo
- Il GPS#apice("G") dell'utente è attivo e fornisce posizioni valide
- L'icona della bici è visualizzata sulla mappa

*Postcondizioni*: 
- Una polyline#apice("G") blu traccia il percorso dell'utente sulla mappa

*Scenario principale*:
1. Il sistema rileva continuamente la posizione GPS#apice("G") dell'utente in movimento
2. Il sistema aggiorna la posizione dell'icona della bici
3. Il sistema disegna progressivamente una polyline#apice("G") blu collegando le posizioni precedenti

=== UC16 - Riaccentramento mappa sulla posizione bici
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*: 
- L'utente ha un percorso attivo
- L'icona della bici è visualizzata sulla mappa
- L'utente ha spostato manualmente la vista della mappa

*Postcondizioni*: 
- La mappa viene centrata automaticamente sulla posizione corrente della bici

*Scenario principale*:
1. L'utente clicca sull'icona del mirino presente sui controlli della mappa
2. Il sistema identifica la posizione corrente della bici
3. Il sistema centra la vista della mappa sulla posizione della bici

=== UC17 - Cancellazione dalla mappa del percorso attraversato
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*: 
- L'utente è autenticato e si trova nella dashboard#apice("G") con la mappa visualizzata
- È presente una polyline#apice("G") blu del percorso attraversato sulla mappa

*Postcondizioni*: 
- La polyline#apice("G") blu del percorso attraversato viene rimossa completamente dalla mappa

*Scenario principale*:
1. L'utente clicca sull'icona del pennello presente sui controlli della mappa in alto a destra
2. Il sistema rimuove la polyline#apice("G") blu del percorso attraversato
3. La mappa mostra solo la posizione corrente della bici senza traccia storica

=== UC18 - Cambio modalità tema dell'interfaccia
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*: 
- L'utente è autenticato e si trova nella dashboard#apice("G") con la mappa visualizzata
- L'interfaccia è attualmente in modalità chiara o scura

*Postcondizioni*: 
- L'interfaccia cambia da tema chiaro a scuro o viceversa
- La preferenza del tema viene salvata e mantenuta per l'utente

*Scenario principale*:
1. L'utente clicca sull'icona del sole/luna presente in alto a destra
2. Il sistema alterna la modalità tema corrente
3. L'interfaccia viene aggiornata immediatamente con il nuovo tema

=== UC19 - Logout#apice("G") dell'utente dal sistema
*Attore principale*: 
 - Utente Autenticato

*Precondizioni*: 
- L'utente è autenticato e si trova nella dashboard#apice("G") con la mappa visualizzata

*Postcondizioni*: 
- L'utente viene disconnesso dal sistema
- L'utente viene reindirizzato alla pagina di login#apice("G")
*Scenario principale*:
1. L'utente clicca sul pulsante "Esci" presente in alto a destra nella dashboard#apice("G")
2. Il sistema termina la sessione dell'utente
3. Il sistema reindirizza l'utente alla pagina di autenticazione

#image("../assets/UC/UC14_15_16_17_18_19.png", alt: "UC14a, UC14b, UC15, UC16, UC17, UC18, UC19")

=== UC20 - Accesso al sistema di monitoraggio#apice("G") per l'amministratore#apice("G"): Grafana#apice("G") 
*Attore principale*: 
- Amministratore#apice("G") 

*Precondizioni*: 
- L'amministratore#apice("G") ha accesso al link diretto del sistema Grafana#apice("G")
- Il sistema Grafana#apice("G") è configurato e disponibile

*Postcondizioni*: 
- Il sistema Grafana#apice("G") è completamente caricato
- L'amministratore#apice("G") può navigare tra le dashboard#apice("G") disponibili
*Scenario principale*:
1. L'amministratore#apice("G") accede al link diretto del sistema Grafana#apice("G")
2. Il sistema carica l'interfaccia principale di Grafana#apice("G")
3. Il sistema Grafana#apice("G") carica automaticamente tutti i pannelli di analisi business
4. Il sistema mostra le dashboard#apice("G") disponibili (Dashboard#apice("G") Utente e Dashboard#apice("G") Sistema)

*Inclusioni*:
- Navigazione alla dashboard#apice("G") di analisi marketing (UC21)
- Navigazione alla dashboard#apice("G") di monitoraggio#apice("G") sistema (UC22)
- Navigazione alla dashboard#apice("G") di business (UC33)

=== UC21 - Navigazione alla dashboard di analisi marketing
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore ha accesso al sistema Grafana 
- La dashboard di analisi marketing è configurata

*Postcondizioni*: 
- La dashboard di analisi marketing è caricata con tutti i suoi relativi pannelli 

*Scenario principale*:
1. L'amministratore seleziona la dashboard di analisi marketing
2. Il sistema carica tutti i pannelli di business
3. Il sistema visualizza le metriche e dati di marketing

*Inclusioni*:
- Visualizzazione metriche eventi giornalieri (UC23)
- Visualizzazione conteggio negozi totali (UC24)
- Visualizzazione lista utenti registrati (UC25)
- Visualizzazione mappa visite per negozio ultime 24h (UC26)
- Visualizzazione mappa negozi selezionati (UC27)
- Visualizzazione top 10 negozi più visitati (UC32)
- Visualizzazione mappa percorsi utenti (UC43)

=== UC22 - Navigazione alla dashboard di monitoraggio del sistema
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore ha accesso al sistema Grafana 
- La dashboard di monitoraggio del sistema è configurata

*Postcondizioni*: 
- La dashboard  di monitoraggio del sistema è caricata con tutti i suoi relativi pannelli 

*Scenario principale*:
1. L'amministratore seleziona la dashboard di monitoraggio del sistema
2. Il sistema carica tutti i pannelli di monitoraggio delle risorse
3. Il sistema inizializza i grafici e le metriche di sistema

*Inclusioni*:
- Visualizzazione grafico utilizzo CPU (UC28)
- Visualizzazione grafico utilizzo memoria (UC29)
- Visualizzazione grafico utilizzo disco (UC30)
- Visualizzazione grafico cache hit ratio (UC31)

#image("../assets/UC/UC_20_21_22_33.png", alt: "UC20, UC21, UC22, UC33")

=== UC23 - Visualizzazione metriche eventi giornalieri
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Il sistema traccia gli eventi utente

*Postcondizioni*: 
- Il conteggio degli eventi del giorno corrente è visualizzato (numero)

*Scenario principale*:
1. L'amministratore visualizza il pannello "Eventi Oggi"
2. Il sistema calcola il numero di eventi del giorno corrente
3. Il sistema mostra il valore numerico nel pannello


=== UC24 - Visualizzazione conteggio negozi totali
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Il sistema conteggia il numero dei negozi registrati

*Postcondizioni*: 
-  Il numero totale di negozi nel sistema è visualizzato (numero)

*Scenario principale*:
1. L'amministratore visualizza il pannello "Negozi Totali"
2. Il sistema conta tutti i negozi registrati nel database
3. Il sistema mostra il conteggio totale


=== UC25 - Visualizzazione lista utenti registrati
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Esistono utenti registrati nel sistema

*Postcondizioni*: 
-  La tabella completa degli utenti con tutti i dettagli è visualizzata


*Scenario principale*:
1. L'amministratore visualizza la sezione "Lista Utenti"
2. Il sistema recupera tutti i dati degli utenti dal database
3. Il sistema mostra la tabella con tutte le colonne utente
4. Il sistema implementa la paginazione per navigare tra gli utenti


=== UC26 - Visualizzazione mappa visite per negozio ultime 24h
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Il sistema traccia le visite degli utenti ai negozi

*Postcondizioni*: 
-  Il grafico delle visite per negozio è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Visite per Negozio ultime 24h"
2. Il sistema analizza i dati delle visite alle varie attività commerciali
3. Il sistema mostra le visite per negozio

=== UC27 - Visualizzazione mappa negozi selezionati
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Esistono negozi con coordinate geografiche nel sistema

*Postcondizioni*: 
-  La mappa con i marker#apice("G") rossi dei negozi selezionati è visualizzata

*Scenario principale*:
1. L'amministratore visualizza il pannello "Mappa dei Negozi Selezionati"
2. Il sistema carica la mappa geografica della regione
3. Il sistema posiziona i marker#apice("G") rossi per ogni negozio selezionato

#image("../assets/UC/UC_23_24_25_26_27_32_43.png", alt: "UC23, UC24, UC25, UC26, UC27, UC32, UC43")


=== UC28 - Visualizzazione grafico utilizzo CPU
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di monitoraggio sistema
- Il sistema di monitoraggio raccoglie metriche CPU

*Postcondizioni*: 
- Il grafico temporale dell'utilizzo CPU è visualizzato con dati aggiornati

*Scenario principale*:
1. L'amministratore visualizza il pannello "CPU Utilizzo"
2. Il sistema recupera le metriche CPU dal node-exporter
3. Il sistema genera il grafico a linee temporali con percentuali di utilizzo


=== UC29 - Visualizzazione grafico utilizzo memoria
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di monitoraggio sistema
- Il sistema di monitoraggio raccoglie metriche di memoria

*Postcondizioni*: 
- Il grafico temporale dell'utilizzo memoria è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Memoria Utilizzo"
2. Il sistema recupera le metriche di memoria dal node-exporter
3. Il sistema genera il grafico a linee temporali con percentuali di utilizzo memoria


=== UC30 - Visualizzazione grafico utilizzo disco
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di monitoraggio sistema
- Il sistema di monitoraggio raccoglie metriche disco

*Postcondizioni*: 
- Il grafico temporale dell'utilizzo disco è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Disco Utilizzo"
2. Il sistema recupera le metriche di spazio disco dal node-exporter
3. Il sistema genera il grafico a linee temporali con percentuali di spazio utilizzato


=== UC31 - Visualizzazione grafico cache hit ratio
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di monitoraggio sistema
- Il sistema di cache è attivo e tracciato

*Postcondizioni*: 
- Il grafico circolare del cache hit ratio è visualizzato con colori indicativi

*Scenario principale*:
1. L'amministratore visualizza il pannello "Cache Hit Ratio"
2. Il sistema calcola il rapporto tra hit e miss della cache
3. Il sistema genera il grafico circolare colorato (verde/rosso in base alle performance)

#image("../assets/UC/UC_28_29_30_31.png", alt: "UC28, UC29, UC30, UC31")

=== UC32 - Visualizzazione top 10 negozi più visitati
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Il sistema traccia le visite ai negozi

*Postcondizioni*: 
- La classifica dei 10 negozi più visitati è visualizzata

*Scenario principale*:
1. L'amministratore visualizza il pannello "Top 10 Negozi Più Visitati"
2. Il sistema analizza i dati delle visite degli ultimi 24 ore
3. Il sistema genera la classifica ordinata per numero di visite

=== UC33 - Navigazione alla dashboard di business
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore ha accesso al sistema Grafana 
- La dashboard di business è configurata e disponibile

*Postcondizioni*: 
- La dashboard di business è caricata con tutti i pannelli di analytics
- L'amministratore può visualizzare tutte le metriche di business

*Scenario principale*:
1. L'amministratore seleziona la dashboard di business dal menu Grafana
2. Il sistema carica tutti i pannelli di analytics avanzate
3. Il sistema inizializza le visualizzazioni e i grafici di business

*Inclusioni*:
- Visualizzazione offerte attive (UC34)
- Visualizzazione tempo permanenza media (UC35)
- Visualizzazione revenue per categoria (UC36)
- Visualizzazione conversion rate (UC37)
- Visualizzazione revenue giornaliero (UC38)
- Visualizzazione heatmap geografica revenue (UC39)
- Visualizzazione conversione per livello di sconto (UC40)
- Visualizzazione negozi con maggior revenue (UC41)
- Visualizzazione trend orario (UC42)

=== UC34 - Visualizzazione offerte attive
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia le offerte attive nel database

*Postcondizioni*: 
- Il numero totale delle offerte attualmente attive è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Offerte Attive"
2. Il sistema conta tutte le offerte con stato attivo
3. Il sistema mostra il valore numerico delle offerte attive

=== UC35 - Visualizzazione tempo permanenza media
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia i tempi di permanenza degli utenti presso i negozi

*Postcondizioni*: 
- Il tempo medio di permanenza degli utenti è visualizzato (in minuti)

*Scenario principale*:
1. L'amministratore visualizza il pannello "Permanenza Media"
2. Il sistema calcola la media dei tempi di permanenza di tutti gli utenti
3. Il sistema mostra il valore medio in formato tempo (minuti/ore)

=== UC36 - Visualizzazione revenue per categoria
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia le transazioni e i revenue per categoria di negozio

*Postcondizioni*: 
- Il grafico del revenue suddiviso per categoria di negozio è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Revenue per Categoria"
2. Il sistema aggrega i dati di revenue per ogni categoria di negozio
3. Il sistema genera un grafico (a torta) con il breakdown per categoria

=== UC37 - Visualizzazione conversion rate
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia le visite ai negozi e le conversioni in acquisti

*Postcondizioni*: 
- Il tasso di conversione generale è visualizzato come percentuale

*Scenario principale*:
1. L'amministratore visualizza il pannello "Conversion Rate %"
2. Il sistema calcola il rapporto tra visite e conversioni effettive
3. Il sistema mostra la percentuale di conversion rate con indicatori colorati

=== UC38 - Visualizzazione revenue giornaliero
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia le transazioni e i revenue giornalieri

*Postcondizioni*: 
- L'ammontare in Euro del revenue giornaliero è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Revenue Giornaliero"
2. Il sistema aggrega i dati di revenue per ogni giorno del periodo selezionato
3. Il sistema genera il totale di revenue giornaliera in Euro

=== UC39 - Visualizzazione heatmap geografica revenue
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia la distribuzione geografica del revenue

*Postcondizioni*: 
- La mappa heatmap con la distribuzione geografica del revenue è visualizzata (assieme alla legenda)

*Scenario principale*:
1. L'amministratore visualizza il pannello "Heatmap Geografica Revenue"
2. Il sistema analizza la distribuzione del revenue per zone geografiche
3. Il sistema genera una mappa heatmap con intensità colorate basate sul revenue

=== UC40 - Visualizzazione conversione per livello di sconto
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia le conversioni correlate ai diversi livelli di sconto

*Postcondizioni*: 
- Il grafico delle conversioni suddivise per livello di sconto è visualizzato

  _Ascisse_: percentuale di sconto
  
  _Ordinate_: conversion rate in percentuale

*Scenario principale*:
1. L'amministratore visualizza il pannello "Conversione per Livello Sconto"
2. Il sistema analizza le conversioni raggruppate per fasce di sconto
3. Il sistema genera un grafico a barre che mostra l'efficacia degli sconti

=== UC41 - Visualizzazione negozi con maggior revenue
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia il revenue generato da ogni singolo negozio

*Postcondizioni*: 
- La classifica dei sette negozi con maggior revenue è visualizzata

*Scenario principale*:
1. L'amministratore visualizza il pannello "Top Negozi Revenue (7 giorni)"
2. Il sistema ordina i negozi per revenue generato nell'ultima settimana
3. Il sistema mostra una tabella con i top performer per revenue

=== UC42 - Visualizzazione trend orario
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di business
- Il sistema traccia visite e revenue per periodo temporale (7 giorni)

*Postcondizioni*: 
- Il grafico temporale multi-serie con trend di visite e revenue degli ultimi 7 giorni è visualizzato

*Scenario principale*:
1. L'amministratore visualizza il pannello "Trend Orario - Visite e Revenue (7 giorni)"
2. Il sistema analizza i dati di visite e revenue aggregati per intervalli temporali negli ultimi 7 giorni
3. Il sistema genera un grafico a linee multiple che mostra l'andamento temporale di visite (linea verde) e revenue (linea blu) con valori medi e totali nel periodo

=== UC43 - Visualizzazione mappa percorsi utenti
*Attore principale*: 
- Amministratore 

*Precondizioni*: 
- L'amministratore si trova nella dashboard di analisi marketing
- Esistono percorsi effettuati da degli utenti registrati

*Postcondizioni*: 
-  La mappa con i tracciati dei percorsi degli utenti è visualizzata

*Scenario principale*:
1. L'amministratore visualizza il pannello "Mappa dei Percorsi Utenti"
2. Il sistema carica la mappa geografica della regione
3. Il sistema disegna con una linea verde i percorsi effettuati dai vari utenti

#image("../assets/UC/UC_33_34_35_36_37_38_39_40_41_42.png", alt: "UC33, UC34, UC35, UC36, UC37, UC38, UC39, UC40, UC41, UC42")

= Requisiti

== Requisiti obbligatori

=== Requisiti funzionali

==== RF1 - Autenticazione e autorizzazione
- *RF1.1*: Il sistema deve supportare autenticazione JWT#apice("G") con username#apice("G")/password#apice("G") via endpoint#apice("G") `/api/token`
- *RF1.2*: I token#apice("G") devono avere scadenza configurabile tramite `JWT_EXPIRATION_S` (default 1 ora)
- *RF1.3*: Le credenziali devono essere validate contro database#apice("G") ClickHouse#apice("G") con hash#apice("G") sicuri
- *RF1.4*: Il sistema deve supportare logout#apice("G") con invalidazione sessione client-side
- *RF1.5*: WebSocket#apice("G") deve autenticare via token#apice("G") JWT#apice("G") per connessioni real-time#apice("G")

==== RF2 - Tracking#apice("G") posizione e generazione eventi
- *RF2.1*: Il sistema deve simulare movimenti utenti con `producer.py` su percorsi Milano OSRM#apice("G")
- *RF2.2*: Gli eventi GPS#apice("G") devono essere prodotti in Kafka#apice("G") topic#apice("G") `gps_stream` con SSL#apice("G")
- *RF2.3*: I percorsi devono essere calcolati usando OSRM#apice("G") self-hosted con profilo cycling
- *RF2.4*: Gli eventi devono contenere: user_id, latitude, longitude, timestamp, poi_info
- *RF2.5*: Il producer#apice("G") deve supportare readiness checks per Kafka#apice("G"), ClickHouse#apice("G") e OSRM#apice("G")

==== RF3 - Elaborazione stream#apice("G") e proximity detection
- *RF3.1*: Il sistema deve processare eventi GPS#apice("G") via Bytewax#apice("G") dataflow#apice("G") con Observer pattern#apice("G")
- *RF3.2*: Deve calcolare distanza usando query PostGIS#apice("G") `ST_DWithin` per soglia 200m
- *RF3.3*: Deve implementare ConnectionManager singleton#apice("G") per pooling#apice("G") database#apice("G")
- *RF3.4*: Deve prevenire messaggi duplicati con cache#apice("G") visit tracking#apice("G")
- *RF3.5*: Deve supportare metriche real-time#apice("G") con PerformanceObserver

==== RF4 - Generazione messaggi personalizzati e sistema offerte
- *RF4.1*: Il sistema deve generare messaggi via HTTP service `/generate-message` 
- *RF4.2*: Deve supportare provider LLM#apice("G") configurabili (Groq#apice("G")/OpenAI#apice("G")) via `LLM_PROVIDER`
- *RF4.3*: Deve implementare cache#apice("G") Redis#apice("G") per messaggi con TTL#apice("G") configurabile
- *RF4.4*: Deve gestire offerte con Strategy Pattern#apice("G") (Standard/Aggressive/Conservative)
- *RF4.5*: Deve supportare Builder Pattern#apice("G") per creazione offerte complesse
- *RF4.6*: Factory Pattern#apice("G") deve creare offerte tipizzate (Flash/Student/Senior/Category)
- *RF4.7*: Validation Strategy deve validare vincoli offerte (età, interessi, date)

==== RF5 - Dashboard#apice("G") utente base
- *RF5.1*: Deve servire interfaccia web tramite `/dashboard/user` con static files
- *RF5.2*: Deve implementare mappa Leaflet#apice("G") con marker#apice("G") categorizzati per shop types
- *RF5.3*: Deve visualizzare percorso utente come polyline#apice("G") con history
- *RF5.4*: Deve supportare filtri categoria con mapping predefinito
- *RF5.5*: Deve implementare fallback#apice("G") WebSocket#apice("G")→HTTP polling#apice("G") automatico

==== RF6 - Storage e persistenza dati
- *RF6.1*: Deve memorizzare eventi in ClickHouse#apice("G") tabelle `user_events` e `user_visits`
- *RF6.2*: Deve gestire shop data in PostgreSQL#apice("G")/PostGIS#apice("G") con indici spaziali
- *RF6.3*: Deve mantenere profili utenti in ClickHouse#apice("G") tabella `users`
- *RF6.4*: Deve tracciare storico visite con vista materializzata `mv_daily_shop_stats`
- *RF6.5*: Deve supportare offers storage in PostgreSQL#apice("G") con vincoli temporali

==== RF7 - Cache#apice("G") e ottimizzazione base
- *RF7.1*: Deve implementare Redis#apice("G") cache#apice("G") per messaggi LLM#apice("G") con serializzazione#apice("G") JSON#apice("G")
- *RF7.2*: Deve supportare Memory cache#apice("G") con LRU eviction#apice("G") come fallback#apice("G")
- *RF7.3*: Deve implementare TTL#apice("G") configurabile via `CACHE_TTL`
- *RF7.4*: Deve fornire cache#apice("G") statistics e hit rate#apice("G") monitoring#apice("G")

=== Requisiti non funzionali (di qualità)

==== RNF1 - Documentazione
- *RNF1.1*: Rispetto delle metriche definite nel Piano di Qualifica (v2.0.0)
- *RNF1.2*: Rispetto delle norme definite nelle Norme di Progetto (v2.0.0)
- *RNF1.3*: Stesura di un documento Manuale Utente per la corretta comprensione dell'utilizzo del sistema

==== RNF2 - Test
- *RNF2.1*: Superamento dei test d'unità atti a testimoniare il buon funzionamento del sistema e delle sue componenti (come approdondito all'interno del Piano di Qualifica [v2.0.0])
- *RNF2.2*: Superamento dei test d'integrazione che garantiscano una corretta collaborazione tra i vari componenti di sistema, nonché una maggiore affidabilità dello stesso.

=== Requisiti di vincolo

==== RV1 - Tecnologici
- *RV1.1*: Deployment#apice("G") tramite Docker Compose#apice("G")
- *RV1.2*: Architettura microservizi#apice("G") event-driven
- *RV1.3*: Presenza Stream Processor#apice("G") 
- *RV1.4*: Frontend web-based (no app mobile native)
- *RV1.5*: Supporto browser#apice("G") moderni con API#apice("G") JavaScript#apice("G") ES6#apice("G")+
- *RV1.6*: Dipendenze esterne: Leaflet#apice("G") .js, Font Awesome#apice("G") 6.4.0+

==== RV2 - Browser#apice("G") e Compatibilità
- *RV2.1*: Chrome/Chromium#apice("G") ≥ 51 (giugno 2016)
- *RV2.2*: Firefox#apice("G") ≥ 55 (agosto 2017)
- *RV2.3*: Safari#apice("G") ≥ 12.1 (marzo 2019)
- *RV2.4*: Microsoft Edge ≥ 79 (gennaio 2020, solo Chromium#apice("G"))
- *RV2.5*: Safari#apice("G") iOS ≥ 12.2 per dispositivi mobili
- *RV2.6*: Esclusione esplicita: Internet Explorer, Edge Legacy

==== RV3 - Tecnologie Frontend Richieste
- *RV3.1*: WebSocket#apice("G") API#apice("G") per comunicazione real-time#apice("G")
- *RV3.2*: Fetch API#apice("G") per richieste HTTP asincrone
- *RV3.3*: IntersectionObserver API#apice("G") per lazy loading#apice("G")
- *RV3.4*: Web Storage API#apice("G") (sessionStorage#apice("G")/localStorage#apice("G"))
- *RV3.5*: CSS#apice("G") Custom Properties e CSS#apice("G") Grid#apice("G")/Flexbox#apice("G")
- *RV3.6*: JavaScript#apice("G") abilitato obbligatorio

==== RV4 - Geografici
- *RV4.1*: Sistema focalizzato su Milano (bbox#apice("G") configurata)
- *RV4.2*: Coordinate sistema: WGS84#apice("G") (EPSG#apice("G"):4326)
- *RV4.3*: Percorsi limitati a rete stradale esistente (OSRM#apice("G"))

==== RV5 - Operativi
- *RV5.1*: Ambiente development single-machine
- *RV5.2*: Configurazione tramite variabili environment#apice("G")
- *RV5.3*: Logging#apice("G") su stdout per container orchestration#apice("G")
- *RV5.4*: Gestione segreti tramite Docker#apice("G") secrets o env vars#apice("G")
- *RV5.5*: Fallback#apice("G") automatico WebSocket#apice("G")→HTTP polling#apice("G")
- *RV5.6*: Design responsivo#apice("G") con breakpoint#apice("G") mobile (≥320px)

==== RV6 - Requisiti Hardware Minimi
- *RV6.1*: RAM minima: 8GB (raccomandati 16GB)
- *RV6.2*: Connessione Internet per WebSocket#apice("G") real-time#apice("G")
- *RV6.3*: Risoluzione display minima: 320px larghezza

== Requisiti funzionali desiderabili

=== RFD1 - Ottimizzazioni frontend avanzate
- *RFD1.1*: Il sistema dovrebbe implementare lazy loading#apice("G") notifiche con IntersectionObserver#apice("G")
- *RFD1.2*: Dovrebbe supportare tema scuro/chiaro configurabile dall'utente con localStorage#apice("G")
- *RFD1.3*: Dovrebbe fornire local cache#apice("G") frontend per shop areas e notifications
- *RFD1.4*: Dovrebbe limitare e ottimizzare rendering markers#apice("G") (max 100 shops)
- *RFD1.5*: Dovrebbe implementare design responsivo#apice("G") con breakpoint#apice("G") mobile

=== RFD2 - Monitoring#apice("G") e osservabilità avanzate
- *RFD2.1*: Il sistema dovrebbe esporre analisi Prometheus#apice("G") tramite FastAPI#apice("G") instrumentator#apice("G")
- *RFD2.2*: Dovrebbe implementare dashboard#apice("G") Grafana#apice("G") con pannelli assemblati dinamicamente
- *RFD2.3*: Dovrebbe supportare logging#apice("G") strutturato con livelli configurabili
- *RFD2.4*: Dovrebbe includere exporters#apice("G") per database#apice("G") e servizi (Postgres#apice("G"), Redis#apice("G"), ClickHouse#apice("G"))
- *RFD2.5*: Dovrebbe supportare Loki#apice("G")/Promtail#apice("G") per log aggregation#apice("G")
- *RFD2.6*: Dovrebbe implementare cAdvisor#apice("G") per container#apice("G") monitoring#apice("G")

=== RFD3 - Funzionalità utente avanzate
- *RFD3.1*: Il sistema dovrebbe supportare statistiche utente dettagliate per periodi configurabili
- *RFD3.2*: Dovrebbe implementare paginazione#apice("G") avanzata per notifiche e promozioni
- *RFD3.3*: Dovrebbe fornire filtri dinamici Grafana#apice("G") (età, professione, categoria, popolarità)
- *RFD3.4*: Dovrebbe supportare mappe interattive con route visualization
- *RFD3.5*: Dovrebbe implementare shop visit simulation con feedback realtime#apice("G")

=== RFD4 - Performance e scalabilità
- *RFD4.1*: Il sistema dovrebbe implementare connection pooling#apice("G") avanzato
- *RFD4.2*: Dovrebbe supportare cache#apice("G") distribuita con clustering#apice("G") Redis#apice("G")
- *RFD4.3*: Dovrebbe fornire push gateway#apice("G") per metriche batch
- *RFD4.4*: Dovrebbe implementare graceful degradation#apice("G") per service failures

== Requisiti (funzionali) facoltativi

=== RFF1 - Integrazioni esterne
- *RFF1.1*: Il sistema potrebbe integrare API#apice("G") meteo per context-aware messaging
- *RFF1.2*: Potrebbe supportare payment integration#apice("G") per offer redemption

=== RFF2 - AI#apice("G")/ML#apice("G") Enhancement
- *RFF2.1*: Potrebbe utilizzare reinforcement learning#apice("G") per offer optimization

=== RFF3 - Business Intelligence avanzato
- *RFF3.1*: Potrebbe supportare A/B testing#apice("G") per offer strategies

= Riepilogo requisiti

#text(
  size: 10pt,
  table(
    columns: (1.5fr, 0.7fr, 0.7fr, 0.7fr, 0.7fr),
    fill: (x,y) => if y == 0 { rgb("#A72229") } else { white },
    align: left + horizon,
    table.header(
      text(fill: white, align(center)[*Categoria*]),
      text(fill: white, align(center)[*Obbligatori*]),
      text(fill: white, align(center)[*Desiderabili*]),
      text(fill: white, align(center)[*Facoltativi*]),
      text(fill: white, align(center)[*Totale*])
    ),
    [Funzionali], [36], [20], [4], [60],
    [Non Funzionali], [5], [0], [0], [5],
    [Vincolo], [30], [0], [0], [30],
    [*Totale*], [*71*], [*20*], [*4*], [*95*]
  )
)

#set text(size: 10pt)

= Tracciamento Requisiti-Casi d'Uso

#set text(size: 10pt)

#let req-table = table.with(
  columns: (2.2fr, 2.8fr),
  stroke: 0.5pt,
  inset: 3pt,
  fill: (x, y) => if y == 0 { rgb("#A72229") } else { white },
  align: left + horizon,
)

#show table.cell.where(y: 0): set text(fill: white, weight: "bold")

#req-table(
  [*Requisito*], [*Casi d'Uso*],
  
  // Requisiti Funzionali
  [RF1.1 - Autenticazione JWT], [UC1, UC2, UC3],
  [RF1.2 - Token con scadenza], [UC1],
  [RF1.3 - Validazione credenziali], [UC3, UC4],
  [RF1.4 - Logout], [UC19],
  [RF1.5 - WebSocket autenticazione], [UC14b, UC15],
  
  [RF2.1 - Simulazione movimenti Milano], [UC14a, UC14b, UC15],
  [RF2.2 - Eventi GPS Kafka], [UC14b, UC15],
  [RF2.3 - Percorsi OSRM cycling], [UC15],
  [RF2.4 - Contenuto eventi GPS], [UC14b, UC15],
  [RF2.5 - Readiness checks], [UC14a],
  
  [RF3.1 - Stream processing Bytewax], [UC14b, UC15],
  [RF3.2 - Calcolo distanze PostGIS], [UC8],
  [RF3.3 - ConnectionManager singleton], [UC8],
  [RF3.4 - Prevenzione duplicati], [UC8],
  [RF3.5 - Metriche real-time], [UC23, UC28, UC29, UC30, UC31],
  
  [RF4.1 - Servizio generazione messaggi], [UC8],
  [RF4.2 - Provider LLM configurabili], [UC8],
  [RF4.3 - Cache Redis messaggi], [UC8],
  [RF4.4 - Gestione offerte Strategy], [UC8],
  [RF4.5 - Builder Pattern offerte], [UC8],
  [RF4.6 - Factory Pattern offerte], [UC8],
  [RF4.7 - Validation Strategy], [UC8],
  
  [RF5.1 - Interfaccia web dashboard], [UC5],
  [RF5.2 - Mappa Leaflet con marker], [UC5, UC9, UC11, UC12, UC13],
  [RF5.3 - Percorso polyline], [UC15, UC17],
  [RF5.4 - Filtri categoria], [UC9, UC10],
  [RF5.5 - Fallback WebSocket-HTTP], [UC14b, UC15],
  
  [RF6.1 - Eventi ClickHouse], [UC7, UC15, UC23],
  [RF6.2 - Shop data PostgreSQL/PostGIS], [UC9, UC11, UC12, UC13, UC24, UC27],
  [RF6.3 - Profili utenti ClickHouse], [UC6],
  [RF6.4 - Storico visite materializzata], [UC7, UC26, UC32],
  [RF6.5 - Offers storage PostgreSQL], [UC8],
  
  [RF7.1 - Redis cache LLM], [UC8, UC31],
  [RF7.2 - Memory cache LRU fallback], [UC8],
  [RF7.3 - TTL configurabile], [UC8],
  [RF7.4 - Cache statistics], [UC31],
)

#v(1em)

#req-table(
  [*Requisito*], [*Casi d'Uso*],
  // Requisiti Funzionali Desiderabili
  [RFD1.1 - Lazy loading notifiche], [UC5, UC8],
  [RFD1.2 - Tema scuro/chiaro], [UC18],
  [RFD1.3 - Local cache frontend], [UC5, UC9, UC11],
  [RFD1.4 - Ottimizzazione rendering markers], [UC9, UC11, UC12, UC13],
  [RFD1.5 - Design responsivo], [UC5-UC19],
  
  [RFD2.1 - Analisi Prometheus FastAPI], [UC20, UC23, UC28, UC29, UC30, UC31],
  [RFD2.2 - Dashboard Grafana dinamiche], [UC20, UC21, UC22, UC33],
  [RFD2.3 - Logging strutturato], [UC20-UC42],
  [RFD2.4 - Exporters database], [UC20, UC24, UC27, UC31],
  [RFD2.5 - Loki/Promtail aggregation], [UC20-UC42],
  [RFD2.6 - cAdvisor container monitoring], [UC22, UC28, UC29, UC30],
  
  [RFD3.1 - Statistiche utente dettagliate], [UC7, UC25],
  [RFD3.2 - Paginazione avanzata], [UC8, UC25],
  [RFD3.3 - Filtri dinamici Grafana], [UC21, UC25, UC33],
  [RFD3.4 - Mappe interattive route], [UC15, UC27, UC39, UC43],
  [RFD3.5 - Shop visit simulation], [UC14a, UC14b, UC15],
  
  [RFD4.1 - Connection pooling avanzato], [UC8, UC14b, UC15],
  [RFD4.2 - Cache distribuita Redis], [UC8, UC31],
  [RFD4.3 - Push gateway metriche], [UC20, UC23, UC28-UC31],
  [RFD4.4 - Graceful degradation], [UC1-UC42],

  // Requisiti Non Funzionali
  [RNF1.1 - Metriche Piano Qualifica], [UC20, UC21, UC22, UC33],
  [RNF1.2 - Norme di Progetto], [UC20, UC21, UC22, UC33],
  [RNF1.3 - Manuale Utente], [UC1-UC19],
  
  [RNF2.1 - Test unità], [UC1-UC42],
  [RNF2.2 - Test integrazione], [UC1-UC42],

  // Requisiti di Vincolo
  [RV1.1 - Docker Compose], [UC1-UC42],
  [RV1.2 - Architettura microservizi], [UC1-UC42],
  [RV1.3 - Stream Processor], [UC14b, UC15],
  [RV1.4 - Frontend web-based], [UC1-UC19],
  [RV1.5 - Browser ES6+], [UC1-UC19],
  [RV1.6 - Dipendenze Leaflet/FontAwesome], [UC5-UC19],
  
  [RV2.1-RV2.6 - Compatibilità browser], [UC1-UC19],
  
  [RV3.1 - WebSocket API], [UC14b, UC15],
  [RV3.2 - Fetch API], [UC1-UC19],
  [RV3.3 - IntersectionObserver], [UC5, UC8],
  [RV3.4 - Web Storage API], [UC1, UC18],
  [RV3.5 - CSS Custom Properties], [UC5-UC19],
  [RV3.6 - JavaScript obbligatorio], [UC1-UC19],
  
  [RV4.1 - Sistema Milano], [UC14a, UC14b, UC15],
  [RV4.2 - Coordinate WGS84], [UC14b, UC15],
  [RV4.3 - Percorsi OSRM], [UC15],
  
  [RV5.1 - Environment development], [UC1-UC42],
  [RV5.2 - Configurazione env vars], [UC1-UC42],
  [RV5.3 - Logging stdout], [UC20-UC42],
  [RV5.4 - Gestione segreti], [UC1, UC3],
  [RV5.5 - Fallback WebSocket-HTTP], [UC14b, UC15],
  [RV5.6 - Design responsivo], [UC5-UC19],
  
  [RV6.1 - RAM minima 8GB], [UC1-UC42],
  [RV6.2 - Connessione Internet], [UC14b, UC15],
  [RV6.3 - Risoluzione 320px], [UC5-UC19],
)

#pagebreak()

= Tracciamento Casi d'Uso-Requisiti

#let uc-table = table.with(
  columns: (2.2fr, 2.8fr),
  stroke: 0.5pt,
  inset: 3pt,
  fill: (x, y) => if y == 0 { rgb("#A72229") } else { white },
  align: left + horizon,
)

#show table.cell.where(y: 0): set text(fill: white, weight: "bold")

#uc-table(
  [*Caso d'Uso*], [*Requisiti*],
  
  [UC1 - Autenticazione utente], [RF1.1, RF1.2, RFD1.5, RFD4.4, RNF1.3, RV1.4, RV1.5, RV3.2, RV3.4, RV5.4],
  [UC2 - Inserimento Username], [RF1.1, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.2],
  [UC3 - Inserimento Password], [RF1.1, RF1.3, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.2, RV5.4],
  [UC4 - Errore Credenziali], [RF1.3, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.2],
  
  [UC5 - Visualizzazione Dashboard], [RF5.1, RF5.2, RFD1.1, RFD1.3, RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.2, RV3.3, RV3.5, RV3.6, RV5.6],
  [UC6 - Profilo utente dashboard], [RF6.3, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.5, RV3.6],
  [UC7 - Statistiche utente], [RF6.1, RF6.4, RFD3.1, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.5, RV3.6],
  [UC8 - Promozioni recenti], [RF3.2, RF3.3, RF3.4, RF4.1, RF4.2, RF4.3, RF4.4, RF4.5, RF4.6, RF4.7, RF6.5, RF7.1, RF7.2, RF7.3, RFD1.1, RFD3.2, RFD4.1, RFD4.2, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.3, RV3.5, RV3.6],
  
  [UC9 - Filtri categoria POI], [RF5.2, RF5.4, RF6.2, RFD1.3, RFD1.4, RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.5, RV3.6],
  [UC10 - Messaggio nessun risultato], [RF5.4, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.5, RV3.6],
  [UC11 - Dettaglio marker], [RF5.2, RF6.2, RFD1.3, RFD1.4, RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.5, RV3.6],
  [UC12 - Nome POI marker], [RF5.2, RF6.2, RFD1.4, RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.5, RV3.6],
  [UC13 - Categoria POI marker], [RF5.2, RF6.2, RFD1.4, RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.5, RV3.6],
  
  [UC14a - Avvio percorso], [RF2.1, RF2.5, RFD3.5, RFD4.4, RNF1.3, RV1.2, RV4.1],
  [UC14b - Visualizzazione bici], [RF1.5, RF2.1, RF2.2, RF2.4, RF3.1, RF5.5, RFD3.5, RFD4.1, RFD4.4, RFD1.5, RNF1.3, RV1.3, RV1.4, RV1.5, RV3.1, RV3.5, RV3.6, RV4.2, RV5.5, RV6.2],
  [UC15 - Tracciamento polyline], [RF1.5, RF2.1, RF2.2, RF2.3, RF2.4, RF3.1, RF5.3, RF5.5, RF6.1, RFD3.4, RFD3.5, RFD4.1, RFD4.4, RFD1.5, RNF1.3, RV1.3, RV1.4, RV1.5, RV3.1, RV3.5, RV3.6, RV4.1, RV4.2, RV4.3, RV5.5, RV6.2],
  [UC16 - Riaccentramento mappa], [RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.5, RV3.6],
  [UC17 - Cancellazione percorso], [RF5.3, RFD1.5, RNF1.3, RV1.4, RV1.5, RV1.6, RV3.5, RV3.6],
  [UC18 - Cambio tema], [RFD1.2, RFD1.5, RNF1.3, RV1.4, RV1.5, RV3.4, RV3.5, RV3.6],
  [UC19 - Logout utente], [RF1.4, RFD1.5, RFD4.4, RNF1.3, RV1.4, RV1.5, RV3.2],
)

#v(1em)

#uc-table(
  [*Caso d'Uso*], [*Requisiti*],
  
  [UC20 - Accesso Grafana], [RFD2.1, RFD2.2, RFD2.3, RFD2.4, RFD2.5, RFD4.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC21 - Dashboard marketing], [RFD2.2, RFD2.3, RFD3.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC22 - Dashboard monitoraggio], [RFD2.2, RFD2.3, RFD2.6, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC23 - Eventi giornalieri], [RF3.5, RF6.1, RFD2.1, RFD2.3, RFD4.3, RNF1.1, RNF1.2, RV5.3],
  [UC24 - Conteggio negozi], [RF6.2, RFD2.3, RFD2.4, RNF1.1, RNF1.2, RV5.3],
  [UC25 - Lista utenti], [RFD3.1, RFD3.2, RFD3.3, RFD2.3, RNF1.1, RNF1.2, RV5.3],
  [UC26 - Visite negozio 24h], [RF6.4, RFD2.3, RNF1.1, RNF1.2, RV5.3],
  [UC27 - Mappa negozi selezionati], [RF6.2, RFD2.3, RFD2.4, RFD3.4, RNF1.1, RNF1.2, RV5.3],
  [UC28 - Grafico CPU], [RF3.5, RFD2.1, RFD2.3, RFD2.6, RFD4.3, RNF1.1, RNF1.2, RV5.3],
  [UC29 - Grafico memoria], [RF3.5, RFD2.1, RFD2.3, RFD2.6, RFD4.3, RNF1.1, RNF1.2, RV5.3],
  [UC30 - Grafico disco], [RF3.5, RFD2.1, RFD2.3, RFD2.6, RFD4.3, RNF1.1, RNF1.2, RV5.3],
  [UC31 - Cache hit ratio], [RF7.1, RF7.4, RF3.5, RFD2.1, RFD2.3, RFD2.4, RFD4.2, RFD4.3, RNF1.1, RNF1.2, RV5.3],
  [UC32 - Top 10 negozi visitati], [RF6.4, RFD2.3, RNF1.1, RNF1.2, RV5.3],
  [UC33 - Dashboard business], [RFD2.2, RFD2.3, RFD3.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC34 - Offerte attive], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC35 - Tempo permanenza media], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC36 - Revenue per categoria], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC37 - Conversion rate], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC38 - Revenue giornaliero], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC39 - Heatmap geografica revenue], [RFD2.3, RFD3.4, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC40 - Conversione per sconto], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC41 - Negozi maggior revenue], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC42 - Trend orario], [RFD2.3, RFD4.4, RNF1.1, RNF1.2, RV5.3],
  [UC43 - Mappa percorsi utenti], [RFD3.4, RFD2.3, RNF1.1, RNF1.2, RV1.1, RV1.2, RV1.3, RV1.4, RV1.5, RV1.6, RV2.1-RV2.6, RV3.1, RV3.2, RV3.5, RV3.6, RV4.1, RV4.2, RV4.3, RV5.1, RV5.2, RV5.3, RV5.6, RV6.1, RV6.2, RV6.3]
)