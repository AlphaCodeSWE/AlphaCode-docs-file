// main project
#let bubble(
  title: "",
  subtitle: none,
  author: "",
  roles: none,
  affiliation: none,
  version: none,
  // year: none,
  other: none,
  date: datetime.today().display(),
  group-logo: none,
  logo: none,
  main-color: "E94845",
  alpha: 60%,
  color-words: (),
  body,
) = {
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
  // only level 1 and 2 are numbered
  let pattern = if level == 1 {
    "I."
  } else if level == 2 {
    "I.1."
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
  set table.cell(align: left)



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
  // decorations at top left
  // place(top + left, dx: -35%, dy: -28%, circle(radius: 150pt, fill: primary-color))
  // place(top + left, dx: -10%, circle(radius: 75pt, fill: secondary-color))
  
  // decorations at bottom right
  // place(bottom +right, dx: 40%, dy: 30%, circle(radius: 150pt, fill: secondary-color))

  
  v(2fr)

  align(center, text(font: title-font, 3em, weight: 700, title))
  v(2em, weak: true)
  if subtitle != none {
  align(center, text(font: title-font, 2em, weight: 700, subtitle))
  v(2em, weak: true)
  }
  align(center, text(1.1em, date))

  v(1fr)

  // grid(align: left, gutter: 8pt, ..roles.map())

  align(center)[
    #table(columns: (auto, auto), stroke: none, table.vline(start: 0, x: 1, stroke: 0.5pt), inset: 10pt, ..roles)
  ]

  v(2fr)

  // Author and other information.
  align(center)[
      #if author != "" {strong(author); linebreak();}
      #if affiliation != none {affiliation; linebreak();}
      #if version != none {emph(version); linebreak();}
      // #if year != none {year; linebreak();}
      // #if other != none {emph(other.join(linebreak())); linebreak();}
    ]

  pagebreak()


  // Table of contents.
  set page(
    numbering: "1 / 1", 
    number-align: center, 
    )


  // Main body.
  set page(
    header: [#emph()[#title #h(1fr) #author]]
  )
  set par(justify: true)

  body
  
}

//useful functions
//set block-quote
#let blockquote = rect.with(stroke: (left: 2.5pt + luma(170)), inset: (left: 1em))

// use primary-color and secondary-color in main
#let primary-color = rgb("E94845")
#let secondary-color = rgb(255, 80, 69, 60%)