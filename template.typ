#let css-stylesheet = "
@import url('https://fonts.googleapis.com/css2?family=Libertinus+Serif:ital,wght@0,400;0,600;0,700;1,400;1,600;1,700&display=swap');

body {
  font-family: 'Libertinus Serif', serif;
  font-size: 12pt;
  line-height: 1.4;
  padding: 1rem;
  max-width: 48em;
  margin-left: auto;
  margin-right: auto;
}

code {
  font-family: monospace;
  font-size: 9pt;
}

pre {
  overflow-x: auto;
  border: 1pt #ccc solid;
  border-radius: 4pt;
  padding: 1em;
}

li ul, li ol {
  padding-left: 1em;
}

a {
  text-decoration: none;
}

ul, ol {
  padding-left: 1em;
}

figure {
  overflow-x: auto;
  margin: 0;
  text-align: center;
}

nav[role='doc-toc'] ol {
  padding-left: 0;
}

nav[role='doc-toc'] li ol {
  padding-left: 1em;
}

.thm-box {
  padding-left: 1em;
  padding-right: 1em;
  margin-top: 1em;
  margin-bottom: 1em;
  border: black 1pt solid;
  border-radius: 4pt;
}

.definition {
  border-color: #2ecc40;
}

.theorem {
  border-color: #ff4136;
}

.property {
  border-color: #0074d9;
}

.definition-title {
  color: #2ecc40;
}

.theorem-title {
  color: #ff4136;
}

.property-title {
  color: #0074d9;
}

details {
  border: 1pt #ccc solid;
  border-radius: 4pt;
  padding: 1em;
}

details summary {
  cursor: pointer;
}

span[role='math'] {
  display: inline-block;
}

figure[role='math'] {
  display: block;
  margin: 0;
  overflow-x: auto;
  text-align: center;
}
"

#let thm-box(color, name, title, body, html-class) = context [
  #if target() == "html" {
    html.elem("div", attrs: (class: "thm-box " + html-class))[
      #par[
        #html.elem("span", attrs: (class: html-class + "-title"))[
          #if title == none [
            #text[*#name. *]
          ] else [
            #text[*#name (#title). *]
          ]
        ] #body
      ]
    ]
  } else {
    block(stroke: 0.5pt + color, width: 100%, inset: 1em, radius: 4pt)[
      #par[
        #if title == none [
          #text(fill: color)[*#name. *]
        ] else [
          #text(fill: color)[*#name (#title). *]
        ]
      ] #body
    ]
  }
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
  #thm-box(green.darken(25%), "Определение", title, body, "definition")
]

#let theorem(title: none, body) = [
  #thm-box(red.darken(25%), "Теорема", title, body, "theorem")
]

#let property(title: none, body) = [
  #thm-box(blue.darken(25%), "Свойство", title, body, "property")
]

#let proof(body) = context [
  #if target() == "html" [
    #html.details[
      #html.summary[Доказательство.]
      #body

      $square$
    ]
  ] else [
    _Доказательство._ #body #h(1fr) $square$
  ]
]

#let example(body) = context [
  #if target() == "html" [
    #html.details[
      #html.summary[Пример.]
      #body
    ]
  ] else [
    _Пример._ #body #h(1fr) $square$
  ]
]

#let render(body) = context {
  if target() == "html" {
    html.frame(body)
  } else {
    body
  }
}

#let template(doc-title, body) = context {
  set document(title: doc-title)
  set page(margin: 2cm)
  set text(size: 12pt, lang: "ru")
  set heading(numbering: "1.1.")

  show link: set text(fill: blue)

  show math.equation.where(block: false): it => {
    if target() == "html" {
      html.elem("span", attrs: (role: "math"), html.frame(it))
    } else {
      it
    }
  }

  show math.equation.where(block: true): it => {
    if target() == "html" {
      html.elem("figure", attrs: (role: "math"), html.frame(it))
    } else {
      block(width: 100%, inset: 0pt, align(center, it))
    }
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

  if target() == "html" {
    html.head([
      #html.style(css-stylesheet)
    ])
  }

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
