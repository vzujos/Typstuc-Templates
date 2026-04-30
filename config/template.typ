#import "variables.typ": *
#import "@preview/numbly:0.1.0": numbly


// Generic UC header
#let _header() = {
  context {
    if counter(page).get().first() == 1 [
      #table(
        columns: (1in, auto),
        align: (auto, horizon),
        stroke: none,
        image("../assets/logo.pdf", width: 100%),
        [#set par(leading: 0.65em)
        #smallcaps([
          Pontificia Universidad Catolica de Chile\
          #escuela\
          #departamento\ ])
          *#sigla* -- *#nombre-curso*
        ]
      )
    ]
  }
}

// General configuration
#let config(doc, darkmode: false) = {


  let text-color = if darkmode {rgb("#ffffff")} else {rgb("#000000")}
  let background-color = if darkmode {rgb("#000000")} else {rgb("#ffffff")}
  set page(fill: background-color)
  set text(fill: text-color)


  set document(
    title: titulo,
    author: author,
    date: none
  )

  set page(
    paper: "us-letter", // "a4" o "us-letter"
    margin: (top: 2cm,
            bottom: 3cm,
            left: 2.5cm, 
            right: 2.5cm),
    columns: 1,
    numbering: "1",
    number-align: center + bottom,
    footer: auto,
    header: _header(),
    header-ascent: -150%,
  )

  set par(
    justify: true,   // Justificado
    leading: 0.65em, // Espacio interlineado
    spacing: 1.5em,  // Espacio entre parrafos
  )

  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "es",
  )


  set heading(numbering: "1.")
  set terms(separator: ": ")
  set enum(
      full:true, 
      numbering: numbly("{1:1}.", "{2:a})", "{3:i})","({4})" )
  )

  show raw: set text(font: "New Computer Modern Mono", size: 11pt)
  show heading: set block(above: 1.4em, below: 1em)
  show heading.where(level:1): set text(size: 14pt)
  show heading.where(level:2): set text(size: 12pt)


  doc

}
