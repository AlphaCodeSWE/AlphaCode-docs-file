#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Piano di Qualifica",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Nicolò Bovo",
      "", "Alessandro Di Pasquale",
      "", "Giovanni Battista Matteazzi",
      "Redattori", "Nicolò Bovo",
      "", "Giovanni Battista Matteazzi",
      "", "Manuel Cinnirella",
      "", "Alessandro Di Pasquale",
      "", "Massimo Chioru",
      "", "Elia Leonetti",
      "Verificatori", "Manuel Cinnirella",
      "", "Romeo Calearo",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-20",
  version: "1.1.0",
  version_history: (
    "1.1.0", "2025-07-24", "Correzioni migliorative", 
    "Giovanni Battista Matteazzi, Manuel Cinnirella", 
    "Elia Leonetti",

    "1.0.0", "2025-07-11", "Selezione termini glossario e correzioni finali", 
    "Alessandro Di Pasquale, Nicolò Bovo", 
    "Romeo Calearo",

    "0.3.0", "2025-07-09", "Aggiunta Cruscotto di Qualità e processi di auto miglioramento", 
    "Giovanni Battista Matteazzi, Elia Leonetti, Nicolò Bovo", 
    "Romeo Calearo",

    "0.2.0", "2025-03-29", "Aggiunta Qualità di Prodotto e Specifiche dei Test", 
    "Alessandro Di Pasquale, Massimo Chioru, Elia Leonetti", 
    "Manuel Cinnirella",

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
Lo scopo di NearYou#apice("G") è progettare, realizzare e validare una piattaforma di advertising personalizzato in tempo reale, capace di unire flussi GPS#apice("G"), profilazione utente e AI generativa#apice("G") per produrre annunci altamente contestuali. 

- *Implementazione tecnica:* Il team AlphaCode#apice("G") svilupperà simulatori di posizionamento, pipeline#apice("G") Kafka#apice("G")→ ClickHouse#apice("G")→PostGIS#apice("G") e modelli LLM#apice("G") per garantire un flusso dati integrato e performante.

- *Misurazione e validazione:* Verranno condotte misurazioni mirate per valutare throughput e latenza delle componenti di streaming (Kafka) e orchestrazione (Airflow#apice("G")), l'efficacia e i tempi di risposta delle query geospaziali in PostGIS, e la velocità di generazione e consegna degli annunci via FastAPI#apice("G"). Analizzeremo inoltre l'impatto delle operazioni AI su CPU e memoria.

- *Test di resilienza e performance:* Il team testerà la resilienza dei microservizi (producer#apice("G"), consumer#apice("G"), webapp) in caso di picchi di traffico o failure di rete. Per confermare scalabilità, robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode eseguirà stress test ad alto carico su tutte le pipeline, verificando la correttezza funzionale e le performance sotto condizioni estreme.



== Riferimenti
=== Riferimenti informativi
- Norme di Progetto v1.0.0
- Capitolato d'appalto C4: NearYou: sistema di advertising
- Standard ISO/IEC 12207:1995#apice("G")

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

+ *Indice Gulpease#apice("G") (MPC-GP)*:
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
+ *Code Coverage#apice("G") (MPC-CC)*:
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

#pagebreak()
= Qualità di prodotto
La qualità del prodotto rappresenta un aspetto fondamentale nello sviluppo software, poiché misura quanto il sistema realizzato sia in grado di soddisfare i requisiti stabiliti, le esigenze esplicite e implicite degli stakeholder e gli standard di riferimento. Essa è strettamente correlata alla qualità dei processi impiegati, poiché un prodotto di valore nasce da pratiche progettuali e tecniche adeguate e controllate lungo tutto il ciclo di vita.
Un prodotto software si considera di elevata qualità quando dimostra le seguenti caratteristiche:

+ *Funzionalità*: risponde pienamente ai requisiti obbligatori, desiderabili e opzionali delineati nell'Analisi dei Requisiti, offrendo le funzionalità attese senza deviazioni.

+ *Affidabilità*: è stabile nel tempo e resistente a guasti, garantendo un comportamento prevedibile anche in condizioni anomale.

+ *Usabilità*: consente all'utente finale un'interazione chiara, semplice ed efficace, riducendo il tempo di apprendimento e minimizzando gli errori d'uso.

+ *Efficienza*: utilizza in modo ottimale le risorse disponibili, rispondendo rapidamente alle operazioni richieste, anche sotto carico.

+ *Manutenibilità*: è progettato con una struttura che facilita interventi futuri, come aggiornamenti, correzioni o estensioni, mantenendo la coerenza e la stabilità del sistema.

== Funzionalità
La funzionalità esprime quanto il software sia in grado di rispondere alle esigenze espresse nei requisiti, distinguendo tra quelli essenziali, preferibili e accessori.

+ *Requisiti obbligatori soddisfatti (MDP-01)*:
  Indica la percentuale dei requisiti fondamentali che sono stati effettivamente realizzati nel software. Deve essere sempre pari al 100% per garantire l'aderenza completa alle specifiche minime previste.

+ *Requisiti desiderabili soddisfatti (MDP-02)*:
  Misura quanto il software integra i requisiti considerati apprezzabili. Un valore elevato di questo indicatore contribuisce ad aumentare il livello di soddisfazione degli utenti.

+ *Requisiti opzionali soddisfatti (MDP-03)*:
  Esprime la percentuale di requisiti opzionali effettivamente implementati. Una maggiore presenza di tali funzionalità può arricchire il prodotto e aumentarne il valore complessivo.
 
#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MDP-01*],[ Requisiti obbligatori soddisfatti],[100%], [100%],
    [*MDP-02*], [ Requisiti desiderabili soddisfatti], [0%],[100%],
    [*MDP-03*], [ Requisiti opzionali soddisfatti], [0%],[100%],
    )
  )

== Affidabilità
L'affidabilità valuta la capacità del software di funzionare correttamente sotto condizioni specifiche.

+ *Code Coverage (MDP-04)*: 
  Misura la percentuale di codice eseguita durante i test. Valori più alti indicano una migliore copertura del codice. Per questo progetto è richiesta una copertura pari o superiore all'80%.
  
+ *Branch coverage#apice("G") (MDP-05)*:
  Calcola la percentuale di rami decisionali del codice eseguiti durante test. Aiuta a identificare scenari non testati.
  
+ *Statement coverage#apice("G") (MDP-06)*:
  Rappresenta la percentuale di istruzioni eseguite durante i test. Un valore alto garantisce un'analisi più
  approfondita del codice.

+ *Passed test cases percentage (MDP-07)*:
 Misura la percentuale di casi di test superati rispetto al totale dei test eseguiti. Un alto valore indica che il software soddisfa i requisiti funzionali e non funzionali previsti.
 
+ *Failure density#apice("G") (MDP-08)*
  Indica il numero di fallimenti correttamente riscontrati per unità di dimensione del software, spesso
  misurata in linee di codice (LOC) o punti funzione. Valori più bassi denotano un software di qualità
  superiore, con meno difetti rispetto alla sua complessità o dimensione

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MDP-04*], [ Code Coverage],[>= 80%], [100%],
    [*MDP-05*], [ Branch Coverage], [>= 80%],[100%],
    [*MDP-06*], [ Statement Coverage ], [>= 60%],[100%],
    [*MDP-07*], [ Passed test cases percentage ], [>= 80%],[100%],
    [*MDP-08*], [ Failure Density], [<= 5%],[0%]
    )
  )

== Usabilità

+ *Facilità di utilizzo (MDP-09)*:
 Misura il numero di errori commessi dagli utenti durante l'interazione. Un valore minimo indica un'interfaccia intuitiva.
 
+ *Tempo di apprendimento (MDP-10)*:
 Valuta il tempo necessario a un utente per imparare a utilizzare il software. Tempi più brevi migliorano l'esperienza utente.

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MDP-09*], [ Facilità di utilizzo],[<= 2 errori], [0 errori],
    [*MDP-10*], [ Tempo di apprendimento], [<= 5 minuti],[<= 1 minuto],
    )
  )

== Efficienza
+ *Utilizzo delle risorse (MDP-11)*: 
  Valuta quanto efficacemente il sistema sfrutta le risorse hardware, come la CPU, la memoria e altri componenti. Un impiego ottimale di queste risorse assicura il corretto funzionamento del sistema, evitando un utilizzo eccessivo o inefficiente delle capacità disponibili.

#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MDP-11*],[Utilizzo delle risorse],[>= 80%], [100%],
    )
  )

  
== Manutenibilità

+ *Code smell#apice("G") (MDP-12)*:
  Rileva potenziali problemi di progettazione o codice che potrebbero richiedere manutenzione. Segnala parti del codice che potrebbero non essere ottimali e che potrebbero causare difficoltà nel futuro, come un'architettura poco chiara o sezioni di codice ripetitive.
  
+ *Coefficient of coupling (MDP-13)*:
  Il Coefficient of Coupling misura il grado di dipendenza tra i moduli o le componenti di un sistema. Un alto COC implica che i moduli siano strettamente interconnessi, il che può rendere difficile apportare modifiche a un modulo senza influenzare altri.
  
+ *Cyclomatic complexity#apice("G") (MDP-14)*
  La complessità ciclomatica valuta la complessità del codice sorgente attraverso la misurazione del numero di cammini indipendenti attraverso il grafo di controllo del flusso. Una complessità ciclomatica più alta indica che il codice è più difficile da comprendere e manutenere.


#align(center,
  table(
    columns: 4,
    // stroke: none,
    inset: 10pt,
    
    [*Metrica*],[*Nome*],[*Valore Accettabile*],[*Valore ottimo*],
    [*MDP-12*],[ Code smells],[0], [0],
    [*MDP-13*], [ Coefficient of coupling], [<= 30%],[<= 10%],
    [*MDP-14*], [ Cyclomatic complexity], [<= 5],[<= 3],
    )
  )

#pagebreak()
= Specifiche dei test
- Questa parte illustra le procedure di test realizzate per assicurare che i vincoli stabiliti nei requisiti vengano completamente rispettati. Conformemente a quanto indicato nel documento Norme di Progetto, il piano di test adotta una metodologia sistematica e si suddivide nelle seguenti tipologie.
== Test di unità 
- Hanno l'obiettivo di controllare il corretto comportamento dei componenti software più piccoli e indipendenti, realizzati prevalentemente durante la fase progettuale.
== Test di integrazione 
- Seguono i test di unità e mirano a controllare la comunicazione tra differenti moduli software per assicurare che operino congiuntamente per funzionalità specifiche.
== Test di sistema 
- Riguardano l'intero sistema, garantendo che tutti i requisiti operativi, di performance e qualitativi stabiliti vengano soddisfatti.
== Test di accettazione 
- Condotti insieme al committente, servono a garantire che il prodotto finale sia conforme alle aspettative e ai requisiti contrattuali, permettendone il rilascio definitivo.


#pagebreak()

= Cruscotto valutazione della qualità
Di seguito sono riportate le misurazioni effettuate nel periodo compreso tra l'assegnazione del capitolato e il raggiungimento della Requirements and Technology Baseline (RTB#apice("G")). Le misure mancanti saranno rilevate nel corso delle attività previste per la Product Baseline (PB#apice("G")).

== Estimated At Completion (MPC-EAC)

#image("../assets/PQ/EAC.png")
Il grafico sull'EAC evidenzia un andamento complessivamente sotto controllo, con una prima fase in cui le stime di completamento si mantengono vicine o addirittura inferiori al budget previsto. Nei periodi centrali si registra un aumento dell'EAC, con un picco massimo al quinto periodo che supera temporaneamente la soglia superiore, dovuto a un momentaneo calo di efficienza. Questo scostamento, però, è stato prontamente contenuto grazie a un'attenta gestione delle risorse e a un costante monitoraggio#apice("G"). A partire dal sesto periodo, infatti, si osserva un progressivo miglioramento che porta i valori stimati a rientrare entro limiti accettabili. Negli ultimi periodi l'EAC si stabilizza, segno di una gestione efficace e coerente. Pur restando leggermente al di sopra del valore ideale, il trend complessivo dimostra una buona capacità del team di intervenire in modo tempestivo, mantenendo il progetto su un percorso sostenibile e ben governato.

== Earned Value (MPC-EV) e Planned Value (MPC-PV)

#image("../assets/PQ/EV-PV.png")
Il grafico mostra un andamento molto solido della fase RTB, con un Earned Value (EV) costantemente superiore al Planned Value (PV) fino al dodicesimo periodo. Questo indica che il progetto ha mantenuto un buon ritmo di avanzamento, completando attività in anticipo rispetto al piano. Il margine tra EV e PV è particolarmente ampio nei primi periodi, segnalando un avvio molto efficace. A partire dal nono periodo si osserva un avvicinamento tra EV e PV, che si mantengono comunque vicini fino alla fine del periodo RTB. Questo trend evidenzia un allineamento progressivo tra quanto realizzato e quanto pianificato, segno di una pianificazione realistica e di una buona capacità di adattamento. Anche l'EAC si stabilizza nella parte alta del grafico, coerente con il buon avanzamento delle attività. Nel complesso, il team ha dimostrato un controllo efficace, riuscendo a mantenere performance superiori alle attese per la maggior parte del progetto.

== Actual Cost (MPC-AC) e Estimate To Completion (MPC-ETC)

#image("../assets/PQ/AC-ETC.png")
Il grafico evidenzia una gestione efficace dei costi lungo tutto la fase RTB. L'Actual Cost (AC) cresce in modo regolare e controllato, mantenendosi sempre ben al di sotto del valore dell'EAC, a conferma di una spesa coerente con le previsioni. L'EAC, pur presentando una fase centrale leggermente più elevata, si stabilizza verso la fine, mostrando che i costi complessivi previsti sono rimasti entro una soglia sostenibile. Il valore dell'ETC, ovvero la stima dei costi rimanenti, decresce in modo progressivo e costante: questo trend riflette una corretta distribuzione dell'impegno economico e una chiara visione sul lavoro residuo. Nel complesso, il progetto è stato condotto con attenzione e precisione, contenendo i costi e dimostrando una buona capacità di previsione e adattamento.

== Budget Variance (MPC-BV) e Schedule Variance (MPC-SV)

#image("../assets/PQ/BV-SV.png")
Il grafico mostra un andamento molto positivo dello Schedule Variance (SV) per la maggior parte della fase RTB: i valori restano ampiamente sopra lo zero fino al nono periodo, indicando che le attività sono state completate in anticipo rispetto alla pianificazione. Questo evidenzia una buona organizzazione del lavoro e una produttività costante. La leggera discesa di SV negli ultimi periodi rappresenta un progressivo riallineamento al piano, senza però segnalare ritardi critici. Per quanto riguarda la Budget Variance (BV), il progetto ha registrato oscillazioni contenute attorno allo zero, con alcuni periodi in lieve disavanzo. Tuttavia, la BV non ha mai superato soglie di allarme, dimostrando una gestione oculata delle risorse economiche. Nel complesso, le due curve evidenziano una performance solida, con una forte partenza, una gestione attenta dei costi e una tendenza al riequilibrio nella fase finale della fase RTB.

#pagebreak()

== Indice di Stabilità dei Requisiti (MPC-RSI)
L'ISR misura la stabilità dei requisiti del progetto nel tempo, valutando quanto siano stati modificati
o aggiornati durante il ciclo di vita.

#image("../assets/PQ/isr.png")

Il grafico dell'ISR mostra una crescita costante da 0% a 82% nei primi sei periodi, superando stabilmente la soglia accettabile del 75%. Nel Periodo 7 si osserva un calo a 79% dovuto alle modifiche per l'integrazione di Grafana#apice("G") emerse dai feedback aziendali.
La fase finale (Periodi 8-13) presenta una stabilizzazione ottimale con valori tra 83-91%, raggiungendo il picco nel Periodo 12 con l'approvazione del P.o.C.#apice("G") Il valore finale dell'88% dimostra un controllo efficace dei requisiti, nonostante l'aggiunta tardiva dello stream processor#apice("G") nell'ultimo periodo.

#pagebreak()
== Indice Gulpease (MPC-GP)
- Indice che valuta la leggibilità dei documenti scritti in italiano.

#image("../assets/PQ/gulpease.png")

Il grafico mostra un andamento differenziato che riflette la timeline del modello incrementale#apice("G") adottato. I documenti pre-codice (Analisi dei Requisiti e Norme di Progetto) presentano crescita rapida nei primi periodi, mentre Piano di Progetto e Glossario mostrano progressione costante per tutto il ciclo di vita.
Il Piano di Qualifica inizia dal Periodo 6 crescendo fino a 51, coincidendo con l'accumulo di metriche durante lo sviluppo. Tutti i documenti superano la soglia accettabile del 40, con Analisi dei Requisiti e Glossario che raggiungono 58 punti finali, dimostrando elevata leggibilità.

#pagebreak()

 

== Correttezza Ortografica (MPC-CO)
Metriche che misurano la presenza di errori ortografici nei documenti, valutando la qualità formale
del contenuto.

#image("../assets/PQ/Ortografico.png")

Il grafico evidenzia un progressivo miglioramento della qualità ortografica durante tutto il progetto. I documenti pre-codice (Analisi dei Requisiti e Norme di Progetto) mostrano il picco di errori nei primi periodi, seguiti da una rapida diminuzione verso l'obiettivo zero grazie alle revisioni sistematiche.
Il Piano di Progetto presenta una decrescita costante riflettendo il continuo processo di correzione durante gli aggiornamenti, mentre il Piano di Qualifica mostra un miglioramento rapido dalla sua introduzione. Il Glossario mantiene sempre valori bassi data la semplicità dei contenuti, e il lieve aumento finale è dovuto alle intensive revisioni pre-consegna RTB.

#pagebreak()
== Percentuale di Metriche Soddisfatte (MPC-PMS)
Percentuale di metriche di qualità definite per il progetto che sono state soddisfatte rispetto agli
obiettivi prefissati.

#image("../assets/PQ/MS.png")

Il grafico evidenzia una crescita costante della qualità complessiva del progetto attraverso il modello incrementale adottato. Il superamento della soglia accettabile avviene a metà progetto, dimostrando l'efficacia dei cicli di sviluppo e verifica sistematici.
Il picco finale coincide con l'approvazione del P.o.C. da parte dell'azienda, testimoniando il raggiungimento degli standard qualitativi prefissati. Il lieve calo nell'ultimo periodo è dovuto all'introduzione dello stream processor, che ha aggiunto nuove metriche da soddisfare senza compromettere la qualità già raggiunta.

#pagebreak()

== Efficienza Temporale (MPC-ET)
Misura l'efficacia nell'utilizzo del tempo per completare le attività, confrontando il tempo effettivamente impiegato con quello previsto.

#image("../assets/PQ/ET.png")

Il grafico evidenzia un andamento variabile dell'efficienza temporale durante il progetto. I primi periodi mostrano buona efficienza, seguiti da superamenti delle ore previste dovuti alla sottostima della complessità delle attività tecniche.
La criticità maggiore si concentra nei Periodi 10-12 dovuto alla sessione estiva universitaria che ha drasticamente ridotto le ore dedicate al progetto. Il Periodo 13 conferma il ritorno a pieno regime del team con un intenso sforzo finale per completare la fase RTB, dimostrando capacità di recupero nonostante le criticità temporanee legate agli impegni accademici.


= Processi di automiglioramento
Il miglioramento continuo costituisce un elemento essenziale per assicurare la qualità complessiva del progetto software. Nella sezione seguente vengono illustrati i principali problemi emersi durante lo sviluppo e le strategie adottate per affrontarli, con l'obiettivo di eliminarne le cause o mitigarne gli effetti.

== Valutazione sull'organizzazione
#align(center,
  table(
    columns: 2,
    // stroke: none,
    inset: 10pt,
    
    [*Descrizione problema*],[*Misure adottate*],
    [La difficoltà maggiore è stata riuscire a trovare dei momenti dedicati agli incontri di gruppo a cui potessero partecipare tutti i membri contemporaneamente. La conseguenza erano tempi più lunghi di attesa per una riunione plenaria e una maggiore difficoltà a restare aggiornati sui progressi effettuati. ],[Sono state previste più strade per risolvere questa problematica. La più efficace è stata prediligere degli incontri in modalità online, seguita da sondaggi per la scelta della data migliore e un utilizzo intensivo delle applicazioni di messaggistica istantanea per mantenere tutti i membri aggiornati. ],
    )
  )
== Valutazione sui ruoli
#align(center,
  table(
    columns: 2,
    // stroke: none,
    inset: 10pt,
    
    [*Descrizione problema*],[*Misure adottate*],
    [Inizialmente non era stato definito con chiarezza il ruolo adibito al caricamento della documentazione online, causando discrepanza tra la documentazione caricata online e gli effettivi progressi effettuati. ],[Durante una delle riunioni è stato attribuito questo compito al responsabile#apice("G"), mantenendo una chiara divisione dei compiti tra redattore e verificatore#apice("G"). ],
    [Abbiamo riscontrato che alcuni ruoli avevano un carico di lavoro sbilanciato rispetto agli altri, in particolare nelle fasi avanzate del progetto dove il ruolo di analista#apice("G") e amministratore#apice("G") trovavano un'utilità ridotta. ],[Si è scelto di ridurre al minimo le ore dedicate a questi ruoli, ma lasciandoli comunque attivi per avere un punto di riferimento in caso di problemi o integrazioni da apportare.],
    )
  )
== Valutazione sugli strumenti
#align(center,
  table(
    columns: 2,
    // stroke: none,
    inset: 10pt,
    
    [*Descrizione problema*],[*Misure adottate*],
    [Inizialmente non era stato previsto uno stream processor all'interno del progetto. La sua utilità è risultata sempre più rilevante nel corso dello sviluppo.],[Vista la sua crescente necessità procedendo nelle fasi di sviluppo del P.o.C. si è scelto di aggiungere una fase di incremento#apice("G") a quelle inizialmente previste per integrarlo con la baseline#apice("G").],
    [Trovare uno strumento comune per redigere la documentazione è stato uno degli obiettivi iniziali del gruppo. Era necessario trovare uno strumento che coniugasse semplicità di utilizzo ad una sufficiente versatilità.],[La scelta è ricaduta su Typst#apice("G"). Vista la sua relativa semplicità di apprendimento e di utilizzo si è ritenuto che tutti i membri del gruppo sarebbero riusciti ad apprenderne l'utilizzo in tempistiche brevi. LateX è stato scartato vista la maggiore complessità di utilizzo e di apprendimento. Si è ritenuto che le sue funzionalità aggiuntive non fossero necessarie, rendendo Typst un compromesso decisamente migliore. ],
    [Inizialmente non tutti i membri avevano una sufficiente esperienza nell'utilizzo di Git e GitHub#apice("G") da consentire a tutti di caricare la documentazione e risolvere eventuali problemi di caricamento dei documenti nel sito.],[Per evitare disallineamenti eccessivi, ogni membro ha deciso di approfondire autonomamente le tecnologie necessarie per lavorare in modo efficace. Questo veniva spesso facilitato dalla disponibilità dei componenti più esperti, che hanno preparato dei tutorial scritti su specifici argomenti, mettendoli a disposizione di tutti, in modo da avere procedure chiare e uguali per tutti.],
    )
  )
