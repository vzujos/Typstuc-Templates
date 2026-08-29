#import "../config/variables.typ": *

//Nota: Este template no usa encabezado, cambiar variable de encabezado

#show title: set text(size: 0.83em, weight: "regular")

#place(
  top + center,
  float: true,
  scope: "parent",
  )[
  #v(15pt)
  *IBM2101 - Imágenes Biomédicas* \
  #text(size: 0.85em)[Instituto de Ingeniería Biológica y Médica] \
  #text(size: 0.85em)[Pontificia Universidad Católica de Chile] \
  #v(-0.3cm)
  #title()
  #v(1pt)
  *Fecha de entrega:* #date \
  #v(-0.35cm)
  #author --- #n_alum 
  #line(length: 100%)
  ]
