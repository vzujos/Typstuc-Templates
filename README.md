# Typstuc Templates

Plantillas en Typst para informes, tareas y ayudantías con el formato genérico usado en ingeniería UC.

## Uso

1. Edita [config/variables.typ](config/variables.typ) con los datos de tu documento.
2. Selecciona una de las portadas de [content/portada_{name}.typ](content/) y edita el nombre del `include` al comienzo de [main.typ](main.typ) (`#include "content/portada_tarea.typ"`).
3. Edita la configuración general de acuerdo a tus necesidades en [config/template.typ](config/template.typ).
4. Edita tu documento dentro de [main.typ](main.typ).
5. Compila el documento con Typst.

## Estructura

- `assets/`: recursos gráicos
- `bibliography.bib`
- `config/`
  - `template.typ`: configuración general.
  - `variables.typ`: nombre, fecha, autores, etc.
- `content/`
  - `ayudantia.typ`
  - `biomecanica.typ`
  - `informe.typ`
  - `tarea.typ`
- `main.typ`: main file
- `main.pdf`: compiled file

## Requisitos

- Typst instalado localmente o acceso a [Typst web](https://typst.app/play/).
- Un editor compatible con Typst, como VS Code.
