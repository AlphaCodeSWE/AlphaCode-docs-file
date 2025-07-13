#import "../../template/template.typ": *


#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Lettera di Presentazione",
  hideOutline: true,  //true: nascondo; false: visualizzo
  roles: (
      "Responsabile", "Giovanni Battista Matteazzi",
      "Redattore", "Alessandro Di Pasquale",
      "","Massimo Chioru",
      "","Nicolò Bovo",
      "","Elia Leonetti",
      "","Manuel Cinnirella",
      "Verificatori", "Romeo Calearo"
      
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-07-09",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-07-09", "Stesura iniziale del documento", "Manuel Cinnirella, Nicolò Bovo",
  ),
  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

Egregio Prof. Tullio Vardanega, \
Egregio Prof. Riccardo Cardin, \

con la presente il gruppo _AlphaCode_ intende comunicarVi ufficialmente la propria candidatura a sostenere la revisione di *RTB* in data 2025-07-14 del progetto da voi commissionato, denominato 

#align(center, text(13pt)[
  *NearYou - Smart custom advertising platform*])

proposto dall'azienda _Sync Lab_.

Tutti i documenti sono disponibili alla pagina web:

#align(center, text(12.5pt)[
  #link("https://alphacodeswe.github.io/AlphaCode-sito/")
])

In alternativa è possibile accedere direttamente alla repository al seguete link:

#align(center, text(12.5pt)[
  #link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file")
])

all'interno della quale è possibile trovare:
- Verbali interni del: 
 - 2025-06-07
 - 2025-05-03
 - 2025-04-18
 - 2025-04-09
 - 2025-03-27
- Verbali esterni degli incontri con _Sync Lab_ del:
 - 2025-06-26
 - 2025-06-12
 - 2025-05-29
 - 2025-05-15
 - 2025-05-05
 - 2025-04-24
 - 2025-04-17
 - 2025-04-08
- Glossario
- Norme Di Progetto
- Analisi Dei Requisiti
- Piano Di Progetto
- Piano Di Qualifica

Il gruppo _AlphaCode_ rinnova la data di consegna del progetto al #emph([*2025-08-15*]) e mantiene il preventivo dei costi per un importo totale di #emph([*12.635,00€*])

Viene inoltre fornito il Proof of Concept, disponibile al seguente link:
#align(center, text(12.5pt)[
  #link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file")
])


Di seguito si riportano i nominativi dei membri del gruppo e i corrispondenti numeri di matricola:

#align(center,
  table(
    fill: (x, y) => if y == 0 {rgb("#d9d9d9")},
    columns: 2,
    inset: 10pt,
    table.header([*Nome Cognome*], [*Matricola*]),
    [Nicolò Bovo], [2042885],
    [Romeo Calearo], [2043678],
    [Massimo Chioru], [2013449],
    [Manuel Cinnirella], [2042891],
    [Alessandro Di Pasquale], [2075544],
    [Elia Leonetti], [2009998],
    [Giovanni Battista Matteazzi], [2082852]
  )
)

Per qualsiasi chiarimento rimaniamo a Vostra completa disposizione.

#align(right,"Cordiali Saluti,")
