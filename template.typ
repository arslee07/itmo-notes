#let thm-box(color, name, title, body) = [
  #block(stroke: 0.5pt + color, width: 100%, inset: 1em, radius: 4pt)[
    #if title == none [
      #text(fill: color)[*#name. *]
    ] else [
      #text(fill: color)[*#name (#title). *]
    ] #body
  ]
]

#let note-box(body) = [
  #block(stroke: (left: 2pt + blue), outset: (y: 2pt), inset: (left: 1em))[
    #text(fill: blue)[*Примечание*]

    #body
  ]
]

#let warning-box(body) = [
  #block(stroke: (left: 2pt + orange), outset: (y: 2pt), inset: (left: 1em))[
    #text(fill: orange)[*Предупреждение*]

    #body
  ]
]

#let definition(title: none, body) = [
  #thm-box(green.darken(25%), "Определение", title, body)
]

#let theorem(title: none, body) = [
  #thm-box(red.darken(25%), "Теорема", title, body)
]

#let property(title: none, body) = [
  #thm-box(blue.darken(25%), "Свойство", title, body)
]

#let proof(body) = [
  _Доказательство._ #body #h(1fr) $square$
]

#let example(body) = [
  _Пример._ #body
]

#let template(doc-title, body) = {
  set document(title: doc-title)
  set page(margin: 2cm)
  set text(size: 12pt, lang: "ru")

  show link: set text(fill: blue)
  show math.equation.where(block: true): eq => {
    block(width: 100%, inset: 0pt, align(center, eq))
  }

  show raw.where(block: true): (it) => {
    block(
      stroke: (0.5pt + gray),
      width: 100%,
      radius: 4pt,
      inset: 1em,
      it,
    )
  }

  show raw.where(block: false): (it) => box(
    fill: black.transparentize(95%),
    inset: (x: 2pt),
    outset: (y: 2pt),
    radius: 2pt,
    it
  )

  title()
  outline()
  place(bottom + center, float: true, dy: 2cm)[
    #link("https://itmo.arslee.me")[itmo.arslee.me]
    #image("assets/icon.png", height: 12%)
  ]
  pagebreak()

  set page(numbering: "1")
  counter(page).update(1)

  body
}
