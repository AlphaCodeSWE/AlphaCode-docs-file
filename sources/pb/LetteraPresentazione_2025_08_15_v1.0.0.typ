#import "../../template/template.typ": *


#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Lettera di Presentazione",
  hideOutline: true,  //true: nascondo; false: visualizzo
  roles: (
      "Responsabile", "Elia Leonetti",
      "Redattore", "Romeo Calearo",
      "","Massimo Chioru",
      "","Manuel Cinnirella",
      "Verificatori", "Nicolò Bovo",
      "","Alessandro Di Pasquale"
      
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-08-15",
  version: "1.0.0",
  version_history: (
    "1.0.0", "2025-08-15", "Stesura iniziale del documento", "Manuel Cinnirella, Nicolò Bovo",
  ),
  main-color: "A72229FF", //set the main color
  group-logo: image("../../template/assets/AlphaCodeLogo.png"),
  logo: image("../../template/assets/UnipdLogo.png"), //set the logo
) 

Egregio Prof. Tullio Vardanega, \
Egregio Prof. Riccardo Cardin, \

con la presente il gruppo _AlphaCode_ intende comunicarVi ufficialmente la propria candidatura a sostenere la revisione di *PB* del progetto da voi commissionato, denominato 

#align(center, text(13pt)[
  *NearYou - Smart custom advertising platform*])

proposto dall'azienda _Sync Lab_.

Tutti i documenti sono disponibili alla pagina web:

#align(center, text(12.5pt)[
  #link("https://alphacodeswe.github.io/AlphaCode-sito/")
])

In alternativa è possibile accedere direttamente alla repository al seguente link:

#align(center, text(12.5pt)[
  #link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file")
])

all'interno della quale è possibile trovare:
- Verbali interni del: 
  - 2025-08-08
 
- Verbali esterni degli incontri con _Sync Lab_ del:
  - 2025-07-29

- Glossario (v2.0.0)
- Norme Di Progetto (v2.0.0)
- Analisi Dei Requisiti (v2.0.0)
- Piano Di Progetto (v2.0.0)
- Piano Di Qualifica (v2.0.0)
- Specifica Tecnica (v1.0.0)
- Manuela Utente (v1.0.0)

Il gruppo _AlphaCode_ intende consegnare il prodotto in data #emph([*2025-08-15*]) e terminando l’impegno preso e non partecipando quindi alla revisione *CA*. La spesa totale ammonta a 12.940€, superiore rispetto alla cifra preventivata in fase di candidatura alla RTB (12.635€).

//mantiene il preventivo dei costi per un importo totale di #emph([*12.635,00€*])

Viene inoltre fornito il *Minimum Viable Product*, approvato dall’azienda proponente in data 2025-08-08 e disponibile al seguente link:
#align(center, text(12.5pt)[
  #link("https://github.com/AlphaCodeSWE/NearYou-Code")
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
