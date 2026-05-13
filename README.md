# Typstuc Templates

Plantillas en Typst para informes, tareas y ayudantías con formato genérico UC.

El proyecto contiene un conjunto de portadas típicamente usadas para tareas e informes en ingeniería.

## Uso

1. Edita [config/variables.typ](config/variables.typ) con los datos de tu documento.
2. Selecciona una de las portadas de [content/portada_{name}.typ](content/) y edita el nombre del import al comienzo de [main.typ](main.typ).
3. Edita tu documento dentro de [main.typ](main.typ).
4. Compila el documento con Typst.

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

## Requisitos

- Typst instalado localmente o acceso a [Typst web](https://typst.app/play/).
- Un editor compatible con Typst, como VS Code.
