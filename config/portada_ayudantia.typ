#import "variables.typ": *

#show title: set text(size: 24pt, weight: "semibold")

#place(
  top + center,
  float: true,
  scope: "parent",
  )[
  #v(8em)
  #title()

  #text(tema, size: 14pt, weight: "semibold")\
  Profesor: #profesor\
  Ayudante: #author -- #text(correo, style: "italic")\
  Fecha: #date
  #line(length: 100%)
]
