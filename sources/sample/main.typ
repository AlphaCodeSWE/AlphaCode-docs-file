#import "../template/template.typ": *

#set outline(title: "Table of contents")

#show: bubble.with(
  title: "Riunione Interna",
  subtitle: "Verbale Prima Riunione Interna",
  roles: (
      "Nicolò Bovo","Responsabile",
      "Romeo Calearo","Redattore",
      "Massimo Chioru","Validatore",
      "Manuel Cinnirella","Validatore",
      "Alessandro Di Pasquale","Validatore",
      "Elia Leonetti", "Validatore",
      "Giovanni Battista Matteazzi", "Validatore"
  ),
  author: "AlphaCode",
  affiliation: "Università Degli Studi di Padova",
  date: datetime.today().display("[day]/[month]/[year]"),
  version: "Versione 1.0.0",
  // year: "2025",
  // other: ("Made with Typst", "https://typst.com"),
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