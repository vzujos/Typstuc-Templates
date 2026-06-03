#import "../config/variables.typ": *

#show title: set text(size: 24pt, weight: "semibold")

#place(
  top + center,
  float: true,
  scope: "parent",
)[
  #v(3cm) // Espacio para separar del logo superior
  #text(size: 20pt, weight: "bold", titulo) \
  #v(0pt)
  #text(size: 14pt, weight: "bold")[Integrantes: #authors] \
  #v(0.2cm)
  #line(length: 100%, stroke: 0.2mm)
]