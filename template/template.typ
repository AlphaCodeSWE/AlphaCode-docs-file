// main project
#let bubble(
  title: "",
  subtitle: none,
  author: "",
  roles: none,
  affiliation: none,
  version: none,
  version_history: none,
  other: none,
  date: datetime.today().display(),
  group-logo: none,
  logo: none,
  main-color: "E94845",
  alpha: 60%,
  color-words: (),
  hideOutline: false, 
  body,
) = {
  set text(lang:"IT")
  set document(author: author, title: title)

  // Save heading and body font families in variables.
  let body-font = "Source Sans Pro"
  let title-font = "Barlow"

  // Set colors
  let primary-color = rgb(main-color) // alpha = 100%
  // change alpha of primary color
  let secondary-color = color.mix(color.rgb(100%, 100%, 100%, alpha), primary-color, space:rgb)

  // highlight important words
  show regex(if color-words.len() == 0 { "$ " } else { color-words.join("|") }): text.with(fill: primary-color)

  //customize look of figure
  set figure.caption(separator: [ --- ], position: top)

  //customize inline raw code
  show raw.where(block: false) : it => h(0.5em) + box(fill: primary-color.lighten(90%), outset: 0.2em, it) + h(0.5em)

  // Set body font family.
  set text(font: body-font, 12pt)
  show heading: set text(font: title-font, fill: primary-color)

  //heading numbering
  set heading(numbering: (..nums) => {
    let level = nums.pos().len()

    let pattern = if level == 1 {
      "I."
    } else if level == 2 {
      "I - 1."
    } else if level == 3 {
      "I - 1.1."
    } else if level == 4 {
      "I - 1.1.1."
    }
    if pattern != none {
      numbering(pattern, ..nums)
    }
  })

  // add space for heading
  show heading.where(level:1): it => it + v(0.5em)
 
  // Set link style
  show link: it => underline(text(fill: primary-color, it))

  //numbered list colored
  set enum(indent: 1em, numbering: n => [#text(fill: primary-color, numbering("1.", n))])

  //unordered list colored
  set list(indent: 1em, marker: n => [#text(fill: primary-color, "•")])

  // Left Align Text
  // set table.cell(align: left)

  // display of outline entries
  show outline.entry: it => text(size: 12pt, weight: "regular",it)

  // Title page.
  // Group Logo at top left if given
  if group-logo != none {
    set image(width: 4cm)
    place(top + left, group-logo)
  }
  // Logo at top right if given
  if logo != none {
    set image(width: 3cm)
    place(top + right, logo)
  }

  
  v(2fr)

  align(center, text(font: title-font, 3em, weight: 700, title))
  v(2em, weak: true)
  if subtitle != none {
  align(center, text(font: title-font, 2em, weight: 700, subtitle))
  v(2em, weak: true)
  }
  align(center, text(1.1em, date))

  v(1fr)

  set table(align: (right, left))

  align(center)[
    #table(columns: (auto, auto), stroke: none, table.vline(start: 0, x: 1, stroke: 0.5pt), inset: 10pt, ..roles)
  ]

  v(2fr)

  // Author and other information.
  align(center)[
      #if author != "" {strong(author); linebreak();}
      #if affiliation != none {affiliation; linebreak();}
      #if version != none {emph()[Versione #version]; linebreak();}
    ]

  pagebreak()

  // Table of contents.
  set page(
    numbering: "1 / 1", 
    number-align: center, 
  )


  // Main body
  set page(
    header: [#emph()[#title - v#version #h(1fr) #author]]
  )

  // Versioning Table - Shows up only if there is more than one version
  if version_history.len()/5 > 1 {
    heading([Registro delle modifiche], numbering: none, outlined: false)
    text(
      size: 10pt,
      table(
        columns: (0.7fr, 1.2fr, 3fr, 2.5fr, 2.5fr),
        fill: (x,y) => if (y== 0) { rgb(primary-color) } else { white },
        align: left + horizon,
        table.header(text(fill: white, align(center)[*Vers.*]), text(fill: white, align(center)[*Data*]), text(fill: white, align(center)[*Descrizione*]), text(fill: white, align(center)[*Autore*]), text(fill: white, align(center)[*Verificatore*]), ),
        ..version_history,
      ),
    )
    pagebreak()
  }
  show outline.entry.where(level: 1): elem => {
    v(1em, weak: true)
    strong(elem)
  }
  
  // Mostra l'indice solo se hideOutline è false.
  if not hideOutline {
    outline(title: [Indice], indent: auto)
    pagebreak()
  }

  body
  
}

//useful functions
//set block-quote
#let blockquote = rect.with(stroke: (left: 2.5pt + luma(170)), inset: (left: 1em))

// use primary-color and secondary-color in main
#let primary-color = rgb("E94845")
#let secondary-color = rgb(255, 80, 69, 60%)
