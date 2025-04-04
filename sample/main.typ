#import "../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Prima Riunione Interna",
  roles: (
      "Responabile", "Nicolò Bovo",
      "Redattore", "Romeo Calearo",
      "Validatori", "Massimo Chioru",
      "", "Manuel Cinnirella",
      "", "Alessandro Di Pasquale",
      "", "Elia Leonetti",
      "", "Giovanni Battista Matteazzi"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: datetime.today().display("[day]/[month]/[year]"),
  version: "1.0.0",
  version_history: (
    "1.0.0", "11/03/2025", "Stesura iniziale del documento", "Alessandro Di Pasquale, Massimo Chioru",  "Elia Leonetti",
    "1.0.1", "11/03/2025", "Correzione punteggiatura", "Alessandro Di Pasquale, Massimo Chioru",  "Elia Leonetti",
  ),
  main-color: "A72229FF", //set the main color
  group-logo: image("../template/assets/AlphaCodeLogo.png"),
  logo: image("../template/assets/UnipdLogo.png"), //set the logo
) 

// Edit this content to your liking

= Introduction

This is a simple template that can be used for a report.

= Features
== Colorful items

The main color can be set with the `main-color` property, which affects inline code, lists, links and important items. For example, the words highlight and important are highlighted !

- These bullet
- points
- are colored

+ It also
+ works with
+ numbered lists!

== Customized items


Figures are customized but this is settable in the template file. You can of course reference them  : @ref.

#figure(caption: [Code example],
```rust
fn main() {
  println!("Hello Typst!");
}
```
)<ref>

#pagebreak()

= Enjoy !

#lorem(100)