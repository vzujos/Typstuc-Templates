// Templates
#import "config/template.typ" as template
#import "config/portada_informe.typ" as portada

// Useful packages for presentations and diagrams
//#import "@preview/touying:0.7.3"
//#import "@preview/cetz:0.5.0"
//#import "@preview/circuiteria:0.2.0"
//#import "@preview/fletcher:0.5.8"

// Initial template config
#show: doc => template.config(doc, darkmode: false)

// Add here any custom configs


// Document

#portada

= Titulo del documento

En este documento se está escribiendo un ejemplo de como escribir un en _Typst_.

Quizás, lo mejor será juntar la portada con la template, y hacer una template de portada simple y una template de portada full.

== Cosas importantes

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

/ Teorema 1: #lorem(50)

/ Teorema 2: #lorem(60)


= Formula fenomenológica para corregir la expansión térmica en impresión 3D

$ D_p = (D_N minus.plus "tol") / (1 plus.minus beta Delta T) minus.plus D_x/2 $

$ because D_N = (D_p plus.minus D_x/2) (1 plus.minus beta Delta T) plus.minus "tol" $

Con $p_T=beta Delta T$ el porcentaje de expansión o contracción térmica, $D_N$ el diámetro nominal y "tol" la tolerancia de fabricación. 
Además, se tiene que $beta approx 69 times 10^(-6) ("mm")/("mm°C")$, y $Delta T approx (220-30)=190°C$.


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

= Análisis numérico de sistemas dinámicos no lineales

Se analiza la forma de un sistema de Hopf subcrítico de la forma:

$ z = P(t) + i V(t) $
$ dot(z) = (mu + i omega)z + a|z|^2 z + b |z|^4 z $

Se puede reescribir como:

$ cases( 
  dot(P) = (mu P - omega V) + P(a |z|^2 + b |z|^4),
  dot(V) = (mu V + omega P) + V(a |z|^2 + b |z|^4)
) $

$ dot(P) = - omega V + P(mu + a |z|^2 + b |z|^4) $
$ dot(V) = omega P + V(mu + a |z|^2 + b |z|^4) $

con $P,V in Re$, $omega != 0$, $a>0$, $b<0$, y $mu$ un parámetro de control.

Si se expresa solo en P y V:
$ dot(P) = (mu P - omega V) + a (P^3 + P V^2) + b (P^5 + P V^4 + 2P^3V^2) $
$ dot(V) = (mu V + omega P) + a (P^2V + V^3) + b (P^4V + V^5 + 2P^2V^3) $

En coordenadas polares, se tiene:
$ r = sqrt(P^2 + V^2) $
$ dot(r) = mu r + a r^3 + b r^5 $

== Ajuste no simétrico

Si se ajusta el radio para que no sea simétrica con una función de norma deformada $psi$, con:
$ r^2 = psi(P, V) = P^2 + lambda V^2 $

y se usa una función de activación suave $sigma(P)$ (como una sigmoide o tanh), se obtiene:

$ dot(P) = (-gamma P +alpha V) + P(mu + a psi + b psi^2) $
$ dot(V) = (beta sigma(P-P_(min)) - delta V) + V(mu + a psi + b psi^2) $

con $alpha, beta, gamma, delta >0$.

además, $sigma$ es como 1 o 0 dependiendo si $P$ es mayor o menor que un umbral $P_(min)$.



#pagebreak()
#bibliography("bibliography.bib", style: "ieee")

