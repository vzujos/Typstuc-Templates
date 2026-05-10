#import "../config/variables.typ": *

#show title: set text(size: 24pt, weight: "semibold")
#set page(numbering: none)

#place(
  top + center,
  float: true,
  scope: "parent",
  )[
  #v(75mm)
  #title()
  #line(length: 80mm)
  #text(tema, size: 18pt, style: "italic")\
  #v(30mm)
  #text([*Grupo* #grupo], size: 14pt)
  #v(6mm)
  #text([*Integrantes*], size: 14pt)\
  #authors
  #v(6mm)
  #text([*Profesor*], size: 14pt)\
  #profesor
  #v(6mm)
  *Fecha:* #date
  ]

#pagebreak()


#place(
  top + left,
  float: true,
  scope: "parent",
)[ #outline() ]


#pagebreak()
#counter(page).update(1)
