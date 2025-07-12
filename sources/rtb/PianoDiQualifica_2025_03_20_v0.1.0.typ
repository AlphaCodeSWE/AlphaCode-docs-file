#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Piano di Qualifica",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Nicolò Bovo",
      "Redattori", "Nicolò Bovo",
      "", "Giovanni Battista Matteazzi",
      "", "Manuel Cinnirella",
      "Verificatori", "Manuel Cinnirella",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-20",
  version: "0.1.0",
  version_history: (
    "0.1.0", "2025-03-20", "Introduzione del documento e Qualità di Processo", 
    "Giovanni Battista Matteazzi, Nicolò Bovo, Manuel Cinnirella", 
    "Elia Leonetti",
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
Il Piano di Qualifica è un documento essenziale per garantire il controllo della qualità del prodotto software e dei processi impiegati nel suo sviluppo. Definisce le strategie di verifica e validazione adottate dal gruppo, con l'obiettivo di assicurare che il progetto rispetti i requisiti, raggiunga gli obiettivi stabiliti e mantenga elevati standard qualitativi.
Il documento si articola in tre componenti principali:
+ Pianificazione della qualità: stabilisce obiettivi, standard e strategie;
+ Controllo della qualità: applica metriche e verifiche per valutare la conformità;
+ Miglioramento continuo: analizza i risultati per ottimizzare metodi e processi.
Essendo un documento in continua evoluzione, verrà aggiornato nel tempo per riflettere miglioramenti o modifiche organizzative. Le sezioni di monitoraggio documenteranno l'andamento delle metriche, consentendo interventi tempestivi in caso di criticità.

== Scopo del prodotto
Lo scopo di NearYou è progettare, realizzare e validare una piattaforma di advertising personalizzato in tempo reale, capace di unire flussi GPS, profilazione utente e AI generativa per produrre annunci altamente contestuali. 

- *Implementazione tecnica:* Il team AlphaCode svilupperà simulatori di posizionamento, pipeline Kafka→ ClickHouse→PostGIS e modelli LLM per garantire un flusso dati integrato e performante.

- *Misurazione e validazione:* Verranno condotte misurazioni mirate per valutare throughput e latenza delle componenti di streaming (Kafka) e orchestrazione (Airflow), l'efficacia e i tempi di risposta delle query geospaziali in PostGIS, e la velocità di generazione e consegna degli annunci via FastAPI. Analizzeremo inoltre l'impatto delle operazioni AI su CPU e memoria.

- *Test di resilienza e performance:* Il team testerà la resilienza dei microservizi (producer, consumer, webapp) in caso di picchi di traffico o failure di rete. Per confermare scalabilità, robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode eseguirà stress test ad alto carico su tutte le pipeline, verificando la correttezza funzionale e le performance sotto condizioni estreme.



== Riferimenti
=== Riferimenti informativi
- Norme di Progetto v1.0.0
- Capitolato d'appalto C4: NearYou: sistema di advertising
- Standard ISO/IEC 12207:1995

=== Riferimenti normativi
- I processi di ciclo di vita del software
- Glossario


#pagebreak()
= Qualità di processo 
 La qualità di processo è nota essere un fattore di fondamentale importanza per qualsiasi produzione di software che punti all'eccellenza qualitativa. Essa, infatti, influenza con un evidente rapporto di causa effetto la qualità del prodotto finale.
 Di seguito elenchiamo gli obiettivi di qualità che il gruppo si prefigge di raggiungere nell'ambito della qualità di processo, suddivisi per le tre categorie di processi individuate dallo standard ISO/IEC
 12207:1995 (primari, di supporto e organizzativi).
 
== Fornitura
Insieme delle azioni e responsabilità del fornitore, con l'obiettivo di definire formalmente gli accordi con il committente in merito a vincoli e requisiti del progetto.

  
+ *Planned value (MPC-PV)*:
  Valore stimato del lavoro da eseguire entro una data prefissata, secondo la pianificazione.

+ *Earned value (MPC-EV)*:
  Quantifica il valore del lavoro realmente completato fino a un certo momento, in relazione al budget pianificato.

+ *Actual cost (MPC-AC)*:
  Spesa reale sostenuta per le attività concluse fino alla data considerata.

+ *Cost performance index (MPC-CPI)*:
  Indice che esprime l'efficienza della spesa, indicando quanto valore si è ottenuto per ogni unità di costo impiegata.

+ *Estimated at completion (MPC-EAC)*:
  Proiezione del costo finale totale del progetto basata sull'andamento attuale.

+ *Schedule variance (MPC-SV)*:
  Differenza tra il valore ottenuto (EV) e quello previsto (PV); un risultato negativo segnala un ritardo.
 
+ *Budget variance (MPC-BV)*:
  Scostamento tra il valore previsto (PV) e la spesa effettiva (AC); valori negativi indicano costi superiori al preventivo.
 
+ *Estimate to completion (MPC-ETC)*:
  Previsione della spesa necessaria per terminare le attività residue del progetto.

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MPC-EV*],[Earned Value],[>= 0], [<= EAC],
    [*MPC-PV*],[ Planned Value],[>= 0], [<= BAC],
    [*MPC-AC*],[Actual Cost],[>= 0], [<= EAC],
    [*MPC-EAC*], [ Estimate At Completion], [>= 0], [<= BAC],
    [*MPC-ETC*], [ Estimate To Complete], [>= 0], [<= BAC],
    )
  )
 
== Sviluppo
Insieme delle operazioni tecniche volte alla costruzione e manutenzione del sistema software, con l'obiettivo di rispettare i requisiti contrattuali.

+ *Indice di stabilità dei requisiti (MPC-RSI)*:
  Misura quanto i requisiti siano rimasti costanti nel tempo, segnalando modifiche o instabilità progettuali.

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MPC-RSI*],[Indice di stabilità dei requisiti],[>= 80%], [100%],
    )
  )


== Documentazione
Processo necessario per il tracciamento di tutte le attività relative al progetto.

+ *Indice Gulpease (MPC-GP)*:
  Misura la facilità di lettura di un testo italiano in base alla lunghezza media delle parole e delle frasi. Il punteggio va da 0 (poco leggibile) a 100 (molto leggibile).

+ *Correttezza Ortografica (MPC-CO)*:
  Valuta la presenza di errori ortografici e grammaticali nei testi prodotti.

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MPC-GP*],[  Indice di Gulpease],[>= 40], [>= 80],
    [*MPC-CO*], [ Correttezza ortografica], [0],[0]
    )
  )



== Verifica
+ *Code Coverage (MPC-CC)*:
  Percentuale di codice eseguita nei test; un valore più alto implica una copertura più ampia e quindi maggiore affidabilità.

+ *Test Success Rate (MPC-TSR)*:
  Proporzione di test superati rispetto al totale eseguito. Un alto tasso di successo indica che il software soddisfa i requisiti richiesti.

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MPC-CC*],[ Code coverage],[>= 80%], [100%],
    [*MPC-TSR*], [ Test success rate], [100%],[100%]
    )
  )



== Gestione della qualità
+ *Percentuale di metriche soddisfatte (MPC-PMS)*:
#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MPC-PMS*],[ Percentuale Metriche Soddisfatte],[>= 80%], [100%],
    )
  )

+ *Efficienza temporale (MPC-ET)*:
#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MPC-ET*],[Efficienza temporale],[ <=3], [ <=1],
    )
  )