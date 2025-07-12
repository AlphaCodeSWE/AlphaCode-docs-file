#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Piano di Progetto",

  hideOutline: true,  //true: nascondo; false: visualizzo
   roles: (
      "Responsabile", "Alessandro Di Pasquale",
      "Redattori", "Giovanni Battista Matteazzi",
      "", "Alessandro Di Pasquale",
      "", "Nicolò Bovo",
      "", "Romeo Calearo",
      "Verificatori", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Elia Leonetti"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-17",
  version: "0.1.0",
  version_history: (
    
    "0.1.0", "2025-03-17", "Bozza del documento", 
"Massimo Chioru, Nicolò Bovo, Romeo Calearo", 
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
Il presente documento descrive le attività pianificate e i processi di gestione necessari alla realizzazione del progetto. Include un'analisi dettagliata dei rischi, la metodologia di sviluppo adottata, la pianificazione temporale, l'assegnazione dei ruoli e una stima preliminare di costi e risorse.

== Scopo del prodotto
Lo scopo di NearYou è progettare, realizzare e validare una piattaforma di advertising personalizzato in tempo reale, capace di unire flussi GPS, profilazione utente e generative AI per produrre annunci altamente contestuali. Oltre a implementare simulatori di posizionamento, pipeline Kafka→ClickHouse→PostGIS e modelli LLM, il team AlphaCode condurrà misurazioni mirate per valutare throughput e latenza delle componenti di streaming (Kafka) e orchestrazione (Airflow), l'efficacia e i tempi di risposta delle query geospaziali in PostGIS, e la velocità di generazione e consegna degli annunci via FastAPI. Analizzeremo inoltre l'impatto delle operazioni AI su CPU e memoria e testeremo la resilienza dei microservizi (producer, consumer, webapp) in caso di picchi di traffico o failure di rete. Per confermare scalabilità, robustezza delle logiche di prossimità e manutenibilità del codice, AlphaCode eseguirà stress test ad alto carico su tutte le pipeline, verificando la correttezza funzionale e le performance sotto condizioni estreme.

== Glossario
Per evitare ambiguità terminologiche, è stato redatto un glossario contenente i termini specifici del dominio applicativo, con le relative definizioni. I termini inclusi nel glossario sono evidenziati nel testo tramite uno stile dedicato.

== Riferimenti
=== Riferimenti informativi
- Norme di Progetto v1.0.0
- Capitolato d'appalto C4: NearYou: sistema di advertising
- Standard ISO/IEC 12207:1995

=== Riferimenti normativi
- I processi di ciclo di vita del software
- Glossario

== Preventivo iniziale
Secondo il documento presentato in fase di candidatura, il costo stimato del progetto è di 12.635€, con una data di consegna prevista entro il 15 agosto 2025.

= Analisi dei rischi
Una gestione efficace del progetto richiede la previsione e il contenimento delle criticità attraverso un'accurata analisi dei rischi. Per questo motivo, questa sezione è dedicata alla loro identificazione e alla definizione delle contromisure da adottare.
Conformemente allo standard ISO/IEC 31000:2009, la gestione del rischio si articola in cinque fasi fondamentali:

1. Identificazione dei rischi
  Individuazione di fonti di rischio, aree di impatto, eventi e relative cause. Questa fase include un'attività di brainstorming per elaborare un elenco esaustivo dei potenziali ostacoli.

2. Analisi dei rischi
  Comprende la valutazione qualitativa e quantitativa dei rischi individuati per agevolare le scelte strategiche e operative.

3. Valutazione dei rischi
  Definisce le priorità e stabilisce quali rischi affrontare, basandosi sui risultati dell'analisi.

4. Trattamento dei rischi
  Stabilisce le azioni correttive, come misure preventive, trasferimento del rischio o mitigazione degli effetti.

5. Monitoraggio e revisione
  Include il controllo periodico dei rischi e delle misure adottate, garantendo un processo adattivo e continuo.

  I rischi identificati si suddividono in due principali macro categorie:
  1. I *Rischi Tecnologici (RT)* derivanti dall'uso e dall'implementazione delle tecnologie necessarie
  2. I *Rischi Organizzativi (RO)* derivanti da tutte le difficoltà relative all'organizzazione di un progetto complesso e alla gestione del gruppo.
  Ad ogni rischio viene inoltre attribuito un numero d'ordine come descritto nei prossimi paragrafi.

#pagebreak()
== Rischi Tecnologici  
=== *RT 1*: Complessità tecnologie implementate 

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Il progetto prevede l'utilizzo di tecnologie complesse come Kafka, ClickHouse, PostGIS e modelli di intelligenza artificiale generativa. Il loro utilizzo e la necessità di integrazione reciproca possono risultare complessi e rallentare lo sviluppo.],
    [*Misure preventive*],[I membri del gruppo con delle conoscenze più approfondite di questi strumenti si prenderanno carico di alcune riunioni di formazione per permettere a tutti di familiarizzare con le tecnologie.],
    [*Misure correttive*],[In caso di difficoltà non previste, si valuta la possibilità di semplificare la tecnologia utilizzata o sostituirla con soluzioni equivalenti più semplici. In alternativa, il gruppo può chiedere supporto a un docente o tutor tecnico.])
)
=== *RT 2*: Inesperienza
 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Alcuni membri potrebbero non possedere le conoscenze tecniche o non essere abituati alle procedure necessarie per affrontare un progetto complesso.],
    [*Misure preventive*],[Il Responsabile di ogni determinato periodo valuta le competenze individuali durante l'assegnazione dei compiti. Ogni membro inoltre si assume la responsabilità di colmare eventuali lacune tramite lo studio delle tecnologie, delle procedure e la consultazione dei documenti redatti per restare aggiornato sui progressi e sugli step successivi.],
    [*Misure correttive*],[I membri meno esperti vengono affiancati da colleghi più competenti per favorire un apprendimento guidato. In caso di difficoltà persistenti, si può prevedere la riassegnazione dei compiti o l'introduzione di scadenze intermedie più dettagliate.])
)
#pagebreak()
== Rischi Organizzativi
=== *RO 1*: Difficoltà nella previsione dei carichi di lavoro

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Una programmazione poco precisa può essere causata da una conoscenza incompleta dei requisiti, da una valutazione errata del tempo o delle risorse necessarie e in generale da un'esperienza limitata da parte dei componenti del team nella gestione di un progetto complesso.],
    [*Misure preventive*],[Il monitoraggio dell'avanzamento è effettuato confrontando periodicamente quanto pianificato nel Piano di Progetto con lo stato reale delle attività riportato nella board su GitHub.],
    [*Misure correttive*],[In presenza di criticità, il Piano di Progetto  e il Piano di Qualifica vengono aggiornati per riflettere i progressi reali. Se un membro comunica di non riuscire a rispettare una scadenza, il Responsabile potrà decidere di allocare ulteriori risorse o posticipare il termine dell'attività.])
  )

    
=== *RO 2*: Conflitto tra impegni accademici e personali

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Obblighi legati alla vita personale o agli altri impegni universitari potrebbero ridurre il tempo che i membri del team possono dedicare al progetto, provocando slittamenti nelle attività.],
    [*Misure preventive*],[Ogni membro del gruppo si impegna a comunicare tempestivamente la propria disponibilità oraria e a rispettarla nel periodo corrente. I compiti verranno distribuiti sulla base della disponibilità comunicata.],
    [*Misure correttive*],[In caso di impegni imprevisti il Responsabile interviene riorganizzando l'assegnazione delle attività e delle risorse. Nei casi più complessi, può essere necessario ricalibrare le scadenze per tenere conto delle limitazioni segnalate.])
)

=== *RO 3*: Rischio di conflitti interni

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Opinioni divergenti riguardo alla direzione del progetto, alle soluzioni tecniche adottate o alla distribuzione delle risorse possono generare tensioni tra i membri del gruppo.],
    [*Misure preventive*],[Si prevede di sottoporre ogni decisione a tutti i membri del gruppo, raccogliendo le opinioni di tutti tramite discussioni o semplici sondaggi a seconda dell'importanza della decisione sottostante],
    [*Misure correttive*],[Il Responsabile si occupa della gestione del conflitto incentivando il dialogo tra i membri coinvolti e riorganizzando incarichi se necessario. In caso di mancato accordo, verrà richiesto l'intervento dei docenti come mediatori.])
)
=== *RO 4*: Problemi di comunicazione

 #align(center,
  table(
    columns: 2,
    stroke: none,
    inset: 10pt,
    
    [*Descrizione*],[Comunicazioni poco chiare o insufficienti possono generare ritardi, incomprensioni e aumentare lo stress. L'assenza di interazioni in presenza può rendere più difficile creare un senso di appartenenza al gruppo e favorire incomprensioni.],
    [*Misure preventive*],[I membri si impegnano a partecipare attivamente a tutte le discussioni, sia tramite le applicazioni di messaggistica istantanea che di persona.],
    [*Misure correttive*],[I membri si impegnano a sollevare i dubbi qualora presenti. Qualunque membro del gruppo si impegna inoltre a  intervenire per rispondere alle eventuali domande poste])
)