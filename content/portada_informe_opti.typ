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
  #line(length: 170mm)
  #text(tema, size: 19pt, weight: "bold", style: "normal")\
  #v(0mm)
  #text([*Grupo* #grupo], size: 18pt)
  ]
#place(
  bottom+right,
)[
  #text([*Integrantes*], size: 14pt)\
  #authors
  #v(6mm)
  #text([Fecha entrega:], size: 13pt) #date]
  
#pagebreak()

#show outline: set text(size: 14pt)

#place(
  top + left,
  float: true,
  scope: "parent",
)[ #outline() ]


#pagebreak()
#counter(page).update(1)

