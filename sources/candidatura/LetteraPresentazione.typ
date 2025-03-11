#import "../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Lettera di Presentazione",
  roles: (
      "Nicolò Bovo","Responsabile",
      "Manuel Cinnirella","Redattore",
      "Massimo Chioru","Verificatore",
      "Romeo Calearo","Verificatore",
      "Alessandro Di Pasquale","Verificatore",
      "Elia Leonetti", "Verificatore",
      "Giovanni Battista Matteazzi", "Verificatore"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: "2025-03-10",
  version: "Versione 1.0.0",
  main-color: "A72229FF", //set the main color
  group-logo: image("../template/assets/AlphaCodeLogo.png"),
  logo: image("../template/assets/UnipdLogo.png"), //set the logo
) 

Egregio Prof. Tullio Vardanega, \
Egregio Prof. Riccardo Cardin, \

con la presente il gruppo #emph("AlphaCode") intende comunicarVi ufficialmente la propria candidatura per la realizzazione del progetto C4, denominato: 

#align(center, text(13pt)[
  *NearYou - Smart custom advertising platform*])

proposto dall'azienda #emph("Sync Lab").

Tutti i collegamenti ai documenti sono disponibili alla pagina web:

#align(center, text(12.5pt)[
  #link("https://alphacodeswe.github.io/AlphaCode-sito/")
])

In alternativa è possibile accedere direttamente alla repository al seguete link:

#align(center, text(12.5pt)[
  #link("https://github.com/AlphaCodeSWE/AlphaCode-docs-file")
])

all'interno del quale è possibile trovare:
- Verbale interno del 2025-03-06;
- Verbale interno del ............; // YYYY-MM-DD
- Verbale esterno dell'incontro con #emph("Sync Lab") del ............ ;
- Dicharazione degli impegni e preventivo dei costi;
- Valutazione dei capitolati e motivazione della scelta;

Come specificato nel documento di dichiarazione degli impegni, il gruppo #emph("AlphaCode") ha preventivato un costo totale per la realizzazione del progetto di #emph([*............€*]) e prevede di consegnare il prodotto richiesto entro la data #emph([*............*]).

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
#align(right, "il gruppo "+emph("AlphaCode"))