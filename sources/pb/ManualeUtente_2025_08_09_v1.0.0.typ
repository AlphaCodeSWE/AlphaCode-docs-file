#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Manuale Utente",
  
  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile","Manuel Cinnirella",
      "","Elia Leonetti",
      "Redattori", "Alessandro Di Pasquale",
      "Verificatori", "Massimo Chioru",
      "","Nicolò Bovo"
    
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-08-09",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-08-15", "Completamento stesura del documento con aggiunta di: collegamento ai servizi e Dashboard utente  ","Elia Leonetti","Nicolò Bovo            Manuel Cinnirella", 
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

#image("../assets/MU/github.png")

- Import nel proprio account GitHub#apice("G")
  - Consigliato: utilizzare lo strumento di importazione GitHub#apice("G") (https://github.com/new/import), indicando come sorgente l'URL#apice("G") https://github.com/AlphaCodeSWE/NearYou-Code.git, quindi selezionare owner, nome e visibilità del nuovo repository#apice("G").
  - In alternativa, eseguire un fork#apice("G") se disponibile e rinomina il repository#apice("G") secondo le tue convenzioni.

== Istruzioni per l'avvio del sistema
=== Avvio in Gitpod#apice("G") (nessuna configurazione locale richiesta)
1. Dalla copia nel proprio account, aprire Gitpod#apice("G") tramite il pulsante dedicato (se presente) oppure con l'URL#apice("G"): https://gitpod.io/#https://github.com/<tuo-account>/<nome-repo>.
2. Fare clic sul pulsante per avviare
3. Attendere la creazione dell'ambiente
4. Creazione e setup dei container#apice("G") automatica

#image("../assets/MU/gitpodA.png")
#image("../assets/MU/gitpodB.png")
#image("../assets/MU/gitpodC.png")

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

= Collegamento ai servizi

Prima di procedere, assicurarsi di aver copiato la repository#apice("G") (sez. 2.2) e di aver avviato correttamente il sistema in Gitpod#apice("G") (sez. 2.4).

=== Accesso ai servizi in Gitpod#apice("G")
#image("../assets/MU/linkA.png")

- All'apertura dello workspace#apice("G") i container#apice("G") si avviano automaticamente. Quando i servizi sono operativi, Gitpod#apice("G") rileva le porte esposte e le elenca nel pannello "Ports".
- Per aprire un servizio:
  1. Apri il pannello "Ports" in Gitpod#apice("G").
  2. Attendi che la porta risulti "Open/Forwarded".
  3. Fare clic su "Open in Browser" per accedere all'endpoint#apice("G").
  4. In alternativa, da terminale: `gp ports list` per vedere le porte, e `gp url <porta>` per ottenere l'URL#apice("G") pubblico.

Nota: Gli URL#apice("G") generati da Gitpod#apice("G") hanno il formato `https://<porta>-<workspace-id>.gitpod.io/`.

=== Riferimenti a porte e servizi

- L'elenco dei servizi e delle relative porte è definito in `docker-compose.yml` (sezione `services` → `ports`) e, se previsto, in `.gitpod.yml` (task/forwarded ports).
- Eventuali credenziali o configurazioni di accesso sono caricate da file `.env`/varianti (es. `environment:` nei servizi di `docker-compose.yml`). Consultare tali file per utente/password o token necessari.

=== Risoluzione dei problemi

- Porta non visibile nel pannello:
  - Verificare lo stato dei container#apice("G"): `docker compose ps` e `docker ps`.
  - Controllare i log del servizio: `docker compose logs -f <nome-servizio>`.
- Endpoint#apice("G") non raggiungibile/errore 502:
  - Attendere il completamento del bootstrap#apice("G") (healthcheck#apice("G")/migrazioni).
  - Se necessario, riavviare i servizi: `docker compose restart` oppure `docker compose up -d`.
- Condivisione esterna:
  - Assicurarsi che la porta sia impostata su "Public" nel pannello "Ports".

Suggerimento: consultare `docker-compose.yml` per la mappa aggiornata di porte/servizi ed utilizzare `gp url <porta>` per ottenere rapidamente l'URL#apice("G") corretto in Gitpod#apice("G").

== Entrare nella dashboard#apice("G") dell'amministratore
#image("../assets/MU/grafanaA.png")

- URL#apice("G"): apri la porta 3000 dal pannello "Ports" (Open in Browser) oppure usa `gp url 3000`.
- Autenticazione: accesso diretto senza credenziali
- Se la pagina non appare subito: attendi il bootstrap#apice("G") e verifica che la porta 3000 sia "Open/Forwarded".
#image("../assets/MU/grafanaB.png")
- Fare clic su "Dashboards" nel menu e compariranno le 3 dashboard#apice("G"),
== Dashboard#apice("G") Business

La dashboard#apice("G") Business fornisce una vista operativa e di sintesi sulle performance dei negozi e delle offerte. I dati sono aggiornati in base all'intervallo temporale selezionato (predefinito: ultimi 7 giorni, dove indicato), con valuta in EUR.
#image("../assets/MU/dA.png")


=== Metriche di sintesi (header)

- Eventi Oggi
  Conteggio degli eventi applicativi raccolti nella giornata corrente (es. visite, claim#apice("G")/redemption#apice("G"), acquisti). Indica il traffico complessivo generato oggi.

- Negozi Totali
  Numero totale di negozi presenti a sistema (onboarded e attivi nell'intervallo selezionato).

- Conversion Rate#apice("G") %
  Tasso di conversione medio nell'intervallo selezionato, calcolato come:
  conversioni / visite × 100.
  La "conversione" è l'azione di esito (es. acquisto o redemption#apice("G")) definita nel dominio dell'applicazione.

- Revenue#apice("G") Giornaliero
  Fatturato aggregato generato nella giornata corrente (somma degli importi transazionali).

- Offerte Attive
  Numero di offerte correntemente valide (finestra di validità e stato "attiva").

- Permanenza Media
  Durata media della visita per utente/negozio (in minuti), calcolata dalla differenza temporale tra primo e ultimo evento della sessione.

Note sul formato:
- Valori con suffisso "k" indicano migliaia (es. 12.8k = 12.800).
- Le percentuali sono espresse su base 100%.
- La permanenza è espressa in minuti.

=== Tabelle e grafici principali

- Top Negozi per Revenue#apice("G") (7 giorni)
  Tabella ordinata per fatturato degli ultimi 7 giorni. Colonne:
  - shop_name: nome del negozio.
  - visite: visite totali nel periodo.
  - revenue#apice("G"): fatturato del negozio nel periodo.
  - durata_media: durata media della visita (min).
  - conversion_rate#apice("G"): tasso di conversione del negozio nel periodo.
  La tabella supporta ordinamento e filtri per colonna, con paginazione.

- Revenue#apice("G") per Categoria (7 giorni)
  Ripartizione del fatturato per categoria merceologica nell'ultima settimana. Consente di individuare i segmenti che contribuiscono maggiormente al totale.

- Trend Orario – Visite e Revenue#apice("G") (7 giorni)
  Serie temporale con granularità oraria degli ultimi 7 giorni:
  - Visite (asse sinistro).
  - Revenue#apice("G") (asse destro).
  Utile per identificare le fasce orarie a maggiore traffico e monetizzazione.

- Conversione per Livello Sconto
  Confronto del tasso di conversione per classi di sconto (es. < 10%, 10–19%, ≥20%). Evidenzia la relazione tra entità dello sconto e propensione alla conversione.

- Heatmap Geografica Revenue#apice("G")
  Mappa con intensità/bolle per negozio in base al fatturato nel periodo. La dimensione/colore rappresenta fasce di revenue#apice("G") (es. <€100, €100+, €500+, €1k+). Consente di individuare cluster geografici performanti.

=== Interazione e filtri

- Intervallo temporale
  Modificabile dal selettore in alto a destra della dashboard#apice("G"). Alcuni riquadri sono esplicitamente fissati agli "ultimi 7 giorni", come indicato nel titolo.

- Filtri e ordinamenti
  Nelle tabelle è possibile filtrare/ordinare per colonna (icona filtro accanto all'intestazione) e navigare tra le pagine.

=== Interpretazione operativa

- Efficienza commerciale
  - Conversion Rate#apice("G") % alto con Permanenza Media stabile indica buona qualità del traffico e offerte pertinenti.
  - Scostamenti tra "visite" e "revenue#apice("G")" aiutano a individuare colli di bottiglia (es. tante visite ma bassa conversione).

- Mix di offerta
  - "Offerte Attive" e "Conversione per Livello Sconto" aiutano a calibrare scontistiche e promozioni efficaci.

- Geografia e orari
  - "Heatmap Geografica" e "Trend Orario" guidano decisioni su presidio territoriale e pianificazione delle campagne nelle fasce a maggior rendimento.

== Dashboard#apice("G") Analisi Marketing

La dashboard#apice("G") di Analisi Marketing supporta la segmentazione dell'audience, l'analisi del traffico nei negozi e la comprensione dei comportamenti di visita. Il periodo predefinito è Ultime 24 Ore, con aggiornamento automatico (es. ogni 5s), modificabili dalla barra superiore.

#image("../assets/MU/mA.png")
#image("../assets/MU/mB.png")
#image("../assets/MU/mC.png")
#image("../assets/MU/mD.png")
#image("../assets/MU/ME.png")

=== Filtri e contesto
- Filtro Negozi: selezione multipla (es. "All" oppure un sottoinsieme di punti vendita). Tutti i pannelli rispettano i filtri attivi.
- Intervallo temporale: modificabile dal selettore (default: ultime 24h).
- Refresh#apice("G"): frequenza di aggiornamento configurabile dalla UI#apice("G").

=== KPI#apice("G") di sintesi (header)
- Eventi Oggi
  Conteggio degli eventi raccolti nella giornata corrente (es. impression#apice("G"), visite, interazioni nell'app): misura il volume di attività generato oggi.
- Negozi Totali
  Numero complessivo di negozi presenti a sistema. Utile come riferimento per il perimetro di analisi.

=== Pannelli principali

- Visite per Negozio (Ultime 24 Ore)
  Serie temporale delle visite per i negozi selezionati nel periodo corrente.
  Cosa mostra:
  - Andamento orario del traffico (linee/serie per negozio o aggregato).
  - Totale visite nel periodo (riassunto in legenda).
  Come usarlo:
  - Identifica picchi e cali di affluenza per pianificare campagne e push mirati nelle fasce più performanti.

- Mappa dei Negozi Selezionati
  Distribuzione geografica dei negozi filtrati, con marker posizionati sulla mappa.
  Cosa mostra:
  - La localizzazione dei punti vendita in analisi.
  - Possibili cluster geografici di interesse.
  Come usarlo:
  - Valuta copertura territoriale e opportunità di attivazioni geo-targettizzate (OOH#apice("G"), volantinaggio, mobile geofencing#apice("G")).

- Profilo Utenti (Tabella)
  Elenco/segmenti degli utenti rilevanti per il periodo, con colonne tipiche:
  - user_type: piano dell'utente (es. free, premium).
  - gender: genere dichiarato.
  - age: età.
  - profession: professione.
  - interests: interessi dichiarati/inferiti.
  - country / city: provenienza geografica.
  - registration_time: timestamp di registrazione.
  Come usarlo:
  - Filtra per attributi (icona filtro in colonna) per estrarre micro-segmenti e valutare l'allineamento tra audience e offerta.
  Nota: i campi disponibili riflettono lo schema dati della piattaforma; eventuali mascheramenti/anomizzazioni dipendono dalla configurazione.

- Mappa dei Percorsi Utenti
  Visualizzazione delle traiettorie (polilinee) percorse dagli utenti nell'area analizzata durante l'intervallo selezionato.
  Cosa mostra:
  - Pattern di spostamento e punti di passaggio ricorrenti.
  - Potenziali corridoi di mobilità tra zone e negozi.
  Come usarlo:
  - Identifica itinerari ad alto flusso per campagne geolocalizzate, partnership locali o ottimizzazione dell'offerta per prossimità.

- Top 10 Negozi Più Visitati (Ultime 24 Ore)
  Classifica a barre dei negozi con il maggior numero di visite nel periodo.
  Cosa mostra:
  - total_visits per negozio, ordinato in modo decrescente.
  Come usarlo:
  - Evidenzia i "campioni" di traffico su cui concentrare iniziative di upselling#apice("G")/cross-selling#apice("G") o sperimentazione di nuove promo.

=== Interpretazione marketing

- Pianificazione campagne
  - Usa "Visite per Negozio" per raggiungere le fasce orarie con maggiore propensione all'engagement.
  - Incrocia "Top 10 Negozi" con il "Profilo Utenti" per messaggi e creatività coerenti con i segmenti prevalenti.

- Geo-marketing
  - "Mappa Negozi" + "Percorsi Utenti" per individuare hotspot reali e corridoi di affluenza; valuta campagne geo-fence#apice("G"), DOOH#apice("G") e retail media#apice("G") di prossimità.

- Segmentazione e personalizzazione
  - Il "Profilo Utenti" guida la definizione di cluster (età, interessi, città) per personalizzare offerte e contenuti.

=== Note operative

- Tutte le visualizzazioni rispettano i filtri (negozi selezionati, periodo).
- Le "visite" rappresentano il conteggio delle sessioni/ingressi registrati per negozio nel periodo; la definizione precisa dipende dagli eventi applicativi della piattaforma.
- In Gitpod#apice("G"), la dashboard#apice("G") è raggiungibile sulla porta 3000 (sez. 3.1). L'avvio è automatico; aprire la porta 3000 dal pannello "Ports" o usare `gp url 3000`.

== Dashboard#apice("G") Monitoraggio Sistema

La dashboard#apice("G") di monitoraggio fornisce visibilità in tempo reale sulle risorse dell'infrastruttura dello workspace#apice("G") (Gitpod#apice("G")) e dei servizi applicativi. Il periodo predefinito è "Last 3 hours" con refresh#apice("G") automatico (es. ogni 10s), modificabili dalla barra superiore. Le metriche sono raccolte dal node-exporter#apice("G") (host:porta es. node-exporter:9100) e dai componenti di cache#apice("G").

#image("../assets/MU/sistemaD.png")
=== Pannelli principali

- CPU#apice("G") Utilizzo
  Percentuale di utilizzo CPU#apice("G") dell'host/VM.
  - Mostra l'andamento nel tempo con statistiche Mean / Last / Max.
  - Interpretazione: valori sostenuti > 80% indicano saturazione; picchi brevi sono accettabili ma da correlare ai deploy#apice("G") o job di carico.

- Memoria Utilizzo
  Percentuale di memoria fisica in uso.
  - Mean / Last / Max evidenziano il profilo di consumo.
  - Interpretazione: utilizzo stabilmente > 85% aumenta il rischio di OOM#apice("G")/kill dei container#apice("G"); verificare memory limits, leak o dataset troppo grandi in RAM#apice("G").

- Disco Utilizzo (/)
  Percentuale di utilizzo disco sul mount root (/).
  - Utile per rilevare crescita anomala di log#apice("G"), volumi o cache#apice("G") su disco.
  - Interpretazione: picchi transitori durante operazioni I/O sono normali; trend crescente continuo richiede pulizia log#apice("G")/volumi o riallocazione.

- Cache#apice("G") Hit Ratio
  Indicatore di efficacia del livello di cache#apice("G") (es. cache#apice("G") applicativa/DB/HTTP).
  - Un valore alto indica che la maggior parte delle richieste viene servita dalla cache#apice("G").
  - Interpretazione: obiettivo tipico > 90%. Valori < 70% suggeriscono chiavi non coerenti, TTL#apice("G") troppo breve o dataset non "cache-friendly".

=== Filtri e interazione
- Intervallo temporale: selezionabile (es. ultimi 15m, 1h, 3h, 24h).
- Frequenza di refresh#apice("G"): configurabile dalla UI#apice("G").
- Serie/host: quando disponibili, le serie sono etichettate (es. node-exporter#apice("G"):9100) e possono essere incluse/escluse in legenda.

=== Linee guida operative

- CPU#apice("G")
  - > 80% persistente: ottimizzare query e job, scalare repliche, limitare thread concorrenti, verificare throttling.
- Memoria
  - > 85% costante: aumentare memoria disponibile, abilitare pooling/streaming, rivedere TTL#apice("G")/in-memory footprint, controllare memory limits dei container#apice("G").
- Disco
  - > 80%: ruotare log#apice("G"), comprimere/archiviare, ripulire volumi temporanei; verificare growth pattern (burst vs. trend).
- Cache#apice("G") Hit Ratio
  - Basso: rivedere chiavi e politica di invalidazione, aumentare TTL#apice("G") dove opportuno, pre-warm per endpoint#apice("G") critici, dimensionare correttamente la cache#apice("G").

=== Troubleshooting rapido

- Picchi improvvisi CPU#apice("G")/Memoria
  - Correlare con deploy#apice("G")/migrazioni o job schedulati; analizzare i log#apice("G") dei servizi coinvolti.
- Crescita disco anomala
  - Ispezionare directory di log#apice("G") e volumi dei container#apice("G"); applicare log rotation#apice("G") e cleanup.
- Cache#apice("G") inefficace
  - Verificare chiavi instabili, mancanza di normalizzazione dei parametri, TTL#apice("G") troppo corto o evictions frequenti.

=== Note su Gitpod#apice("G")
- Le metriche riflettono lo stato della VM dello workspace#apice("G") e dei container#apice("G") attivi.
- Alla chiusura dello workspace#apice("G"), dopo ~5 minuti Gitpod#apice("G") sospende i processi: i grafici mostreranno un calo/assenza di attività fino alla riapertura.

=  Dashboard#apice("G") Utente

La Dashboard#apice("G") Utente consente agli utenti finali di accedere all'area personale e alle funzionalità ad esse collegate.

#image("../assets/MU/uA.png")
=== Accesso

- *Gitpod#apice("G")*: Apri il pannello "Ports", trova la porta 8003 e fare clic su "Open in Browser", poi aggiungi `/dashboard/user` all'URL#apice("G")
- *Formato URL#apice("G")*: `https://8003-[WORKSPACE-ID].gitpod.io/dashboard/user`


*Nota*: L'URL#apice("G") varia per ogni workspace#apice("G") Gitpod#apice("G"). Usa sempre il pannello "Ports".

- In alternativa:
  - Apri il pannello "Ports" e, sulla porta 8003,fare clic su "Open in Browser".
  - Oppure da terminale: `gp url 8003` e aggiungi il path `/dashboard/user`.

=== Autenticazione

- Inserisci le credenziali del tuo account NearYou#apice("G") (username e password) nella pagina di login.
- Se non disponi di un account:
  - richiedi le credenziali demo al team di progetto.

=== Troubleshooting

- Errore 401/403 o credenziali rifiutate:
  - Verifica username/password 
- Pagina non raggiungibile:
  - Assicurati che lo workspace#apice("G") sia attivo e che la porta 8003 sia "Open/Forwarded" in Gitpod#apice("G").
  - Attendi il completamento dell'avvio servizi; quindi ricarica la pagina.

== 3.6. Dashboard#apice("G") Utente – Mappa e Promozioni

La dashboard#apice("G") principale dell'utente offre una vista personalizzata dei negozi e delle promozioni nelle vicinanze, con filtri per categoria e pannelli informativi sul profilo e l'attività recente.

#image("../assets/MU/userF.png")
#image("../assets/MU/mAi.png")
#image("../assets/MU/user3.png")




=== Struttura della pagina

- Barra superiore
  - Logo NearYou#apice("G"), selettore tema (chiaro/scuro) e menu utente con pulsante "Esci".

- Pannello sinistro
  - Profilo Utente: mostra attributi di account (ID, età, professione, interessi). I dati provengono dal profilo salvato a sistema.
  - Statistiche:
    - km percorsi: distanza stimata nelle ultime attività (in base ai dati di movimento/posizione consentiti dall'utente).
    - negozi vicini: numero di punti vendita entro un raggio predefinito rispetto alla posizione/centro mappa.
    - notifiche: conteggio delle notifiche ricevute nel periodo corrente.
    - minuti attivi: tempo di utilizzo dell'app nella sessione o nel periodo selezionato.
  - Promozioni Recenti: feed cronologico delle ultime offerte nelle vicinanze, con titolo, anteprima e timestamp. Facendo clic sulla card si apre il dettaglio offerta.

- Mappa centrale
  - Cartografia interattiva (OpenStreetMap#apice("G")/Leaflet#apice("G")) con controlli di zoom (+/−).
  - Pin dei negozi: ciascun punto rappresenta un negozio; il colore del pin identifica la categoria merceologica.
  - Interazioni:
    - Clic su un pin per aprire il popup con informazioni del negozio (nome, distanza, categoria, eventuali azioni come "Dettagli").
    - Trascina/zoom per esplorare l'area; i conteggi "negozi vicini" e le promozioni si aggiornano in base al contesto.

- Filtro per categorie (barra inferiore)
  - Chip selezionabili: Tutti, Abbigliamento, Parrucchiere, Supermercato, Cibo & Ristoro, Auto & Riparazioni, Bellezza & Cura, Casa & Mobili.
  - La selezione filtra:
    - i pin visualizzati sulla mappa,
    - l'elenco delle promozioni nel pannello sinistro.

=== Pop-up di prossimità in movimento

Quando l'utente si muove, la dashboard#apice("G") rileva gli spostamenti (geolocalizzazione#apice("G") attiva) e, al passaggio vicino a un negozio, visualizza automaticamente un pop-up di prossimità ancorato al pin del negozio.

- Cosa mostra
  - Titolo: nome del negozio (es. "Macelleria Faravelli").
  - Messaggio di prossimità: "Sei vicino a questo negozio!".
  - Suggerimento/promozione: breve testo con un'offerta o un suggerimento rilevante (es. "Scopri Libreria Egea a pochi passi da te!").

- Comportamento
  - Il pop-up compare al raggiungimento della soglia di distanza configurata (geofence#apice("G")) e rispetta i filtri di categoria attivi.
  - È chiudibile (X) e può auto-chiudersi dopo alcuni secondi per non intralciare la navigazione.
  - Rate limiting: per evitare spam, non vengono mostrati più pop-up contemporaneamente; lo stesso negozio non ripropone il pop-up entro una finestra di "cooldown".

- Requisiti e note
  - Richiede il consenso alla geolocalizzazione#apice("G") del browser; senza consenso i pop-up di prossimità non sono attivati.
  - La precisione dipende dal dispositivo/rete; piccoli movimenti sotto la soglia di accuratezza potrebbero non attivare il pop-up.

=== Flusso d'uso tipico

1) Verifica il profilo e le statistiche per un colpo d'occhio su attività e copertura dei negozi.
2) Filtra per categoria (es. "Cibo & Ristoro") per focalizzare i risultati.
3) Esplora la mappa: fare clic sui pin per aprire dettagli negozio e promozioni disponibili.
4) Muovendoti nell'area, osserva i pop-up di prossimità che ti segnalano negozi e offerte vicine.
5) Apri una promozione recente dal feed per visualizzare condizioni, durata e come riscattarla.

=== Note su dati e privacy

- La stima di distanza, "km percorsi", "negozi vicini" e i pop-up di prossimità richiedono il consenso alla geolocalizzazione#apice("G"); senza consenso non verrà permesso l'uso del servizio.
- Le promozioni e i negozi mostrati riflettono i filtri attivi e la posizione/area di mappa visualizzata.
- È possibile modificare le impostazioni di consenso in qualsiasi momento; per revocare o deselezionare il consenso, contattare gli amministratori del servizio.
=== Risoluzione problemi

- Mappa vuota o posizione non disponibile:
  - Consenti la geolocalizzazione#apice("G") al dominio Gitpod#apice("G"); ricarica la pagina dopo aver dato il consenso.
  - Disattiva eventuali ad-blocker o estensioni che bloccano script/cartografia.
- Nessun pin o nessun pop-up visibile:
  - Controlla di non avere filtri troppo restrittivi; prova "Tutti".
  - Aumenta lo zoom-out per ampliare l'area visibile; verifica di trovarti vicino a negozi.
- Promozioni non aggiornate:
  - Ricarica la pagina o cambia categoria; verifica la connettività di rete.

Riferimenti:
- Accesso all'area utente: vedi sez. precedente