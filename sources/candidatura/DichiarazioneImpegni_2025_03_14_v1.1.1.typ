#import "../../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Dichiarazione impegni",
  subtitle: "& preventivo costi",
  roles: (
      "Responabile", "Nicolò Bovo",
      "Redattori", "Alessandro Di Pasquale",
      "", "Massimo Chioru",
      "Validatori", "Manuel Cinnirella",
      "", "Romeo Calearo",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025/03/14",
  // date: datetime.today().display("[year]/[month]/[day]"),
  version_history: (
    "1.1.1", "2025/03/14", "Aggiunto grafico a torta costo per ruolo", "Alessandro Di Pasquale, Massimo Chioru",  "Manuel Cinnirella, Romeo Calearo, Elia Leonetti, Giovanni Battista Matteazzi",
    "1.1.0", "2025/03/12", "Aggiunta tabella ore e descrizione ruoli", "Alessandro Di Pasquale, Massimo Chioru",  "Manuel Cinnirella, Romeo Calearo, Elia Leonetti, Giovanni Battista Matteazzi",
    "1.0.0", "2025/03/11", "Stesura iniziale del documento", "Alessandro Di Pasquale, Massimo Chioru",  "Manuel Cinnirella, Romeo Calearo, Elia Leonetti, Giovanni Battista Matteazzi",
  ),
  version: "1.1.1",
  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking

= Scopo del documento
Con il presente, il gruppo N.19 "_AlphaCode_" s'impegna nello svolgimento del capitolato "*C4 - NearYou*", fornito dall'azienda _SynLab_, secondo le modalità e le stime riportate di seguito.

= Impegni orari
Ogni componente del gruppo di _AlphaCode_ dedicherà un totale di 90 ore produttive al progetto, ripartite equamente tra i ruoli indicati di seguito.
== Tabella
#show table.cell.where(y: 0): set text(fill: white)

#table(
    columns: (3fr, 2.3fr, 2.5fr, 2.9fr,2.7fr),
    fill: (x,y) => if (y== 0 ) or (y==7 and x==0) { rgb("#a72229") } else {white },
    align: (x,y) =>
    if y == 0 { center } else { if x != 0 {center } else { left + horizon}}, 
    table.header([*Ruoli*],[*Costo Orario*], [*Ore per ruolo*],[*Ore per membro*],[*Costo per ruolo*]),
    [Responsabile],[30],[63],[9],[1890],
    [Amministratore],[20],[56],[8],[1120],
    [Analista],[25],[70],[10],[1050],
    [Progettista],[25],[126],[18],[3150],
    [Programmatore],[15],[175],[25],[2625],
    [Verificatore],[15],[140],[20],[3500],
    text(fill: white, align(center)[*Totale :*]),[*130*],[*630*],[*90*],[*12635*],
  )
== Grafico
#v(0.1fr)
#image("../../../../template/assets/GraficoCostoxRuolo.png", alt: "Costo per ruolo", )
#v(1fr)
#pagebreak()

= Descrizione ruoli
Di seguito vengono approfonditi i ruoli che tutti i membri del gruppo dovranno ricoprire nello svolgimento del progetto.

== Responsabile
Il responsabile sarà colui che si dedicherà a determinare la direzione in cui il gruppo dovrà operare, tramite un'efficiente gestione delle risorse, una virtù fondamentale nelle prime fasi operative a cui il gruppo sarà dedito, ma che si rivelerà gradualmente meno cruciale grazie al crescente sviluppo dell'autonomia del gruppo nel tempo.

Tale ruolo richiederà inoltre competenze comunicative tali da permettere una soddisfacente interazione sia con i membri del gruppo che con terzi.

== Amministratore
L'amministratore sarà adibito alla corretta configurazione delle infrastrutture e degli ambienti di sviluppo in cui i membri del gruppo avranno modo di lavorare.

Vi sarà bisogno di questa figura sin dal principio ed in misura considerevole ma, seppur saltuariamente, dovrà poi fungere da manutentore degli strumenti già messi a disposizione così come dell'aggiunta di nuovi sistemi qualora necessari.

== Analista
Il ruolo dell'analista si impegna significativamente ad inizio progetto, occupandosi di definire le funzionalità ed i requisiti specifici per soddisfare al meglio le necessità del cliente.

Successivamente questa figura coprirà un ruolo sempre più marginale dato che sarà meno necessario definire nuovi requisiti.

== Progettista
Opererà a partire dai requisiti identificati dall'analista per realizzare un design del software che si tradurrà in possibili metodologie per realizzare una soluzione alle esigenze da far implementare a chi funge da programmatore.

Il progettista fornirà un contributo costante nello sviluppo del progetto a partire dalla sua definizione iniziale.

== Programmatore
Come anticipato, dovrà garantire una robusta transizione dall'architettura del progetto al software funzionante, mansione che richiede la dedizione temporale più elevata.

Perché ciò sia possibile, chi ricopre questo ruolo deve essere provvisto delle competenze tecniche essenziali per lo sviluppo.

== Verificatore
Il verificatore agirà nella totalità del progetto, garantendo che ogni suo aspetto venga realizzato in maniera qualitativamente valida, completa e robusta.

= Preventivo costi e data di consegna
_AlphaCode_ ha stimato un costo finale di *€12.635,00* per l'implementazione del progetto, con una data di consegna fissata tassativamente al *2025/08/15*. 
