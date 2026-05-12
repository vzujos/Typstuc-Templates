// Initial template config
#import "config/template.typ" as template
#show: doc => template.config(doc, darkmode: false)

#import "content/portada_biomecanica.typ" as portada

#import "@preview/physica:0.9.8": grad, div, curl, laplacian, vb, vu, dv, pdv
// Useful packages for presentations and diagrams
//#import "@preview/touying:0.7.3"
//#import "@preview/cetz:0.5.0"
//#import "@preview/circuiteria:0.2.0"
//#import "@preview/fletcher:0.5.8"

// Add here any custom configs


// Document

#portada


= Plantilla de informe en Typst

Ahora voy a agregar una figura con la función `#image()`:

#figure(
  image("assets/logo.pdf", width: 2cm),
  caption: [Logo UC de ejemplo.],
) <mi_label>

Ahora se referencia la @mi_label, notar que agrega también la palabra "Figure".

Se destaca que al usar `[...]`  dentro del `caption`, lo que se hace es comenzar un entorno markup, por lo que se pueden usar fórmulas y demás dentro.

Para citar de una bibliografía, se agrega la función `#bibliography()`, que acepta un `hayagriva` o un `.bib`, y se cita igual que referencias labels @Timoshenko_Goodier_2019.


== Entornos comunes

=== Matematicas

$ integral_(Omega) d omega = integral_(partial Omega) omega $

Esto es un vector: $vec(a, b)$

=== Enumeraciones y definiciones

+ hola

+ oasd
  + asdvar
    + asvsl
    + asdas
  + asddvasdñk

+ asdasñl


/ Teorema 2: #lorem(60)


= Algunas ecuaciones importantes
Esta ecuación @eq:Euler se conoce popularmente como una de las más bellas del mundo (estoy en desacuerdo) porque tiene varios de los números más importantes de las matemáticas; estamos hablando de la identidad de Euler:

// Esto es para mostrar la numeración de ecuaciones
#set math.equation(numbering: "(1)")

$ 1 + e^(i pi) &= 1 dot cos(pi) + i dot sin(pi) \
&= (-1) + i dot 0 \
&= 0
$ <eq:Euler>

En ingeniería, una de las ecuaciones más importantes es la ecuación de Navier-Stokes @eq:N-S:
$
rho ( pdv( vb(v), t) + vb(v) dot grad vb(v) ) = - grad p + div vb(T) + vb(f)
$ <eq:N-S>
Donde $vb(v)(vb(x),t)$ es la velocidad espacial del fluido, y el resto de términos ya los deberían conocer.

Otro conjunto de ecuaciones fundamentales son las ecuaciones de Maxwell en electromagnetismo @wikipedia:

$
div vb(E) &= rho / epsilon_0 \
div vb(B) &= 0 \
curl vb(E) &= - pdv( vb(B), t) \
curl vb(B) &= mu_0 vb(J) + mu_0 epsilon_0 pdv( vb(E), t)
$

// Esta notación en Typst se llama definición
/ Teorema 1: #lorem(50)

#pagebreak()
= Figuras y gráficos



#let D_nom = 20 // diametro nominal [mm]
#let D_x = 0.4 // diametro boquilla [mm]
#let dT = 220 - 30 // diff temperatura [°C]
#let b_coef = 69 / 1000000 // coef de expansion [mm/mm°C]
#let tol = 0.2 // holgura [mm]
#let tipo = "hole" // "hole" or "contour"

#let Diam_correction(D_nom, tol, tipo) = {  
  if tipo == "hole" {
    let D_p = (D_nom + tol) / (1-b_coef*dT) + D_x/2;
    return calc.round(D_p, digits: 2)
    } 
  else if tipo == "contour" {
    let D_p = (D_nom - tol) / (1+b_coef*dT) - D_x/2; 
    return calc.round(D_p, digits: 2)
    }
  else {
    return "ValueError"
    }
}

Ejemplo de ajuste de diámetro nominal *#D_nom mm* con tolerancia *#tol mm*, diámetro de boquilla *#D_x mm*, *$Delta T=$#dT °C*, y *$beta=$#b_coef*
- para un *#tipo* es: *$D_p=$#Diam_correction(D_nom, tol, tipo) mm*. 
- para un *contour* es: *$D_p=$#Diam_correction(D_nom, tol, "contour") mm*.

Para este último caso, el delta de diámetro $Delta D=D_N-D_p$ es $Delta D=$#calc.round(D_nom - Diam_correction(D_nom, tol, "contour"), digits:2 )


#pagebreak()
#set heading(numbering: none)

= Uso de IA Generativa
#lorem(100)

#bibliography("bibliography.bib", style: "ieee", title: "Referencias")

= Anexo
#lorem(100)
