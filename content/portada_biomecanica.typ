#import "../config/variables.typ": *

#show title: set text(size: 24pt, weight: "semibold")
#set page(numbering: none)

#place(
  horizon + center,
  )[
  #title()
  ]
#place(
  bottom + right,
  float: true,
  scope: "parent",
)[#set text(size: 14pt)
  #author\
  #date\
  Tiempo dedicado: XX
  ]

#pagebreak()
#counter(page).update(1)