# UT2 HTML 5 <!-- omit in toc -->
---

- [1. Introducción](#1-introducción)
- [2. Estructura y sintaxis del lenguaje HTML](#2-estructura-y-sintaxis-del-lenguaje-html)
  - [2.1 Estructura básica de una página HTML](#21-estructura-básica-de-una-página-html)
  - [2.2. Comentarios](#22-comentarios)
- [3. Etiquetas Semánticas](#3-etiquetas-semánticas)
- [4. Elementos de HTML](#4-elementos-de-html)
  - [4.1 Elemento html](#41-elemento-html)
  - [4.2 Elemento head](#42-elemento-head)
    - [4.2.1 Elemento title](#421-elemento-title)
    - [4.2.2 Metadatos](#422-metadatos)
  - [4.3 Elemento body](#43-elemento-body)
  - [4.4 Párrafos](#44-párrafos)
  - [4.5 Formatos de texto](#45-formatos-de-texto)
  - [4.6. Listas](#46-listas)
    - [4.6.1 Listas no ordenadas](#461-listas-no-ordenadas)
    - [4.6.2 Listas ordenadas](#462-listas-ordenadas)
    - [4.6.1 Listas de definiciones](#461-listas-de-definiciones)
  - [4.7. Enlaces html - Hipervínculos, links](#47-enlaces-html---hipervínculos-links)
  - [4.8. Imágenes](#48-imágenes)
  - [4.9. Tablas](#49-tablas)






# 1. Introducción

Cuando se usan los navegadores para consultar las distintas web, se aprecian una serie de páginas que contienen elementos como enlaces, texto, imágenes, vídeos, etc. Si se accede al código fuente de dicha página, se aprecia que el código escrito en lenguaje HTML (HyperText Markup Language) es el componente básico de la web, junto con otras tecnologías entre las que destacan CSS, JavaScript, AJAX, etc.

HTML es un lenguaje de marcado que se usa para la creación de páginas web y tuvo su origen en 1991. Para poder crear cualquier documento, es necesario disponer de un editor de texto plano.

Existen herramientas de escritorio gratuitas y comerciales que facilitan este trabajo. Si no desea instalarse ni usarse ninguna herramienta de escritorio, existen herramientas online que permiten crear y editar este tipo de documentos.

De HTML se estudiará su estructura y sintaxis, así como sus elementos principales (listas, tablas, formato de texto, párrafos, cabeceras, formularios, etc.). Elaborar una web sin un diseño atractivo es algo impensable. En este punto es cuando entran en juego las hojas de estilo en cascada (CSS), que describen la manera de visualizar una página web por pantalla. 


# 2. Estructura y sintaxis del lenguaje HTML

HTML es un lenguaje de marcado que va a ser la base de nuestro módulo Lenguajes de Marcas y Sistemas de Gestión de Información.
Los navegadores interpretan las marca contenidas en los documentos HTML y representan la información para que los usuarios la puedan consultar e interactuar con ella.

Los elementos que forman las páginas HTML están identificadas por marcas o etiquetas. Estas marcas envuelven el contenido de la página, ya sea texto, imágenes o cualquier otro tipo de elemento. Las marcas o etiquetas están compuestas por un nombre rodeado de los símbolos `<` y `>`.

```html
<etiqueta>
```

Esta etiqueta puede estar escrito en mayúsculas o minúsculas. Se recomienda que que sea uniforme que se escriba todo de una forma.

Toda etiqueta de apertura debe tener una de cierre, y se especifica con el simbolo / justo antes del nombre.

```html
</etiqueta>
```
Ambas etiquetas deben tener el mismo nobmre que rodearán el contenido.

```html
<etiqueta> Esto es el contenido </etiqueta>
```

Aunque existen algunas etiquetas que no necesitan apertura y cierre, como por ejemplo `<br>`.

A veces nos vamos a encontrar que algunas etiquetas pueden incluir `atributos`, que van a permitir caracterizar los elementos de las etiquetas. Estos se incluyen en las etiquetas de apertura y estan compuestos por nombre el simbolo = y el valor entre comillas, dobles o simples.

```html
<etiqueta atributo1="valor1" atributo2="valor2">
```

## 2.1 Estructura básica de una página HTML

A continuación vemos la estructura básica de una página web, para probarla copia este codigo en un editor como puede ser el Block de Notas, guardala con nombre `index.html` y abrelo con un navegador.

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Titulo del documento</title>
</head>
<body>
    Este es cuerpo de la pagina
</body>
</html>
```
## 2.2. Comentarios

Los comentarios son elementos que no tienen ningún efecto sobre la página, ya que único objetivo es proporcionar información para una mejor comprensión del código.
El contenido debe estar delimitado con los caracteres `<!--` y `  -->` y será ignorado por el navegador.

Vamos a ver un ejemplo del uso de los comentarios, crea un fichero llamado `comentarios.html` e introduce el siguiente código, guardalo y abrelo con un navegador.:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Uso de comentarios</title>
</head>
<body>
    <!-- Esto es un comentario -->
   Hola Mundo !!!!!
</body>
</html>
```

# 3. Etiquetas Semánticas

HTML 5 ha introducido las etiquetas semánticas las cuales describen en contenido que almacenan.

Antes se usaba la etiqueta `<div>`, que es una etiqueta de bloque el cual servía para agrupar contenido.

Las etiquetas semánticas:

+ describen el propósito de su contenido.
+ mejoran accesibilidad.
+ ayudan al SEO.
+ hacen el código mas entendible.

> **`<header>`**

Cabecera de una página o sección, puede contener el logo, título y el menú.

> **`<nav>`**

Menú de navegación

> **`<main>`**

Contenido de la página principal, solo debe existir uno por página.

> **`<section>`**

Agrupa contenido relacionado.

> **`<article>`**

Contenido independiente como puede ser na noticia un post o un comentario.

> **`<aside>`**

Contenido secundario o lateral.

> **`<footer>`**

Pie de página.

> Ejemplo:

```html
<body>

<header>
    <h1>Tienda Online</h1>
</header>

<nav>
    <a href="#">Inicio</a>
    <a href="#">Productos</a>
</nav>

<main>

    <section>
        <h2>Ofertas</h2>

        <article>
            <h3>Portátil</h3>
            <p>Descripción...</p>
        </article>

    </section>

    <aside>
        Publicidad
    </aside>

</main>

<footer>
    © 2026
</footer>

</body>
```

# 4. Elementos de HTML

Un documento HTML está compuesto de elementos organizados de manera jerárquica. En los ejemplos anteriores lo hemos visto, dichos elementos son \<html>, \<head> y \<body>.

Cada elemento se identifica por una etiqueta y puede tener un conjunto de atributos, los cuales pueden ser específicos de un elemento en concreto.

Como ejemplo podemos ver en la etiqueta `\<html>` el atributo `lang`, para indicar el idioma de nuestra página web, con `es` estamos indicando el idioma Español.

## 4.1 Elemento html

Es el elemento principal del documento HTML. Todo el contenido debe estar dentro de dicha etiqueta, como vemos tiene una etiqueta de inicio y otra de cierre.

## 4.2 Elemento head

En este elemento  incluye el titulo de la página y los metadatos que podemos configurar para nuestra página web.

Este contenido no es visible.

### 4.2.1 Elemento title

Con esta etiqueta indicamos el titulo de nuestra página, dicho título se mostrará en la pestaña del navegador donde hemos abierto nuestra página web.

```html
<title> Titulo de la página Web </title>
```
Es lo que aparece en:

+ pestaña del navegador.
+ favoritos.
+ resultados de buscadores.


### 4.2.2 Metadatos

Los metadatos definen características generales del documento HTML e información que se desea proporcionar al navegador, se utiliza la etiqueta `\<meta>`.

En el siguiente enlace podemos obtener mas información sobre las etiquetas meta.

[Mas informacion sobre etiquetas Meta](https://lenguajehtml.com/html/metadatos/etiqueta-html-meta/)

A continuación vamos a ver algunos:

>  **Codificación caracteres **

```html
<meta charset="UTF-8">
```
Codificación Unicode e ISO-8859-1.

Evita problemas con:

+ tildes.
+ ñ.
+ caracteres especiales.

> **Diseño responsive**

Hace que se adapte a móviles.
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

> **Ayuda a SEO**


+  Descripción del contenido de la página.
```html  
<meta name="description" content="Curso de JavaScript desde cero con ejemplos prácticos">
```

+  Autor de la página.

```html
<meta name="author" content="Autor">
```

+ Lista palabras que hacen referencia a la pagina web.  

```html
<meta name="keywords" content="html, lenguaje, lenguaje de marcado, código html, etiqueta">
```

> **Enlaces CSS**

Enlazar con hojas de estilo CSS
```html
<link rel="stylesheet" href="estilos.css">
```
>** Enlaces JavaScript Externo**

Aunque normalmente hoy se pone antes de `</body>` para mejorar carga.
```html
<script src="script.js"></script>
```
> **Icono de la página (favicon)**

Es el icono que aparece junto al título de la pagina web.
```html
<link rel="icon" href="favicon.ico">
```

A continuación vemos el ejemplo de un `<head>` típico:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Tienda Online</title>

    <meta name="description" content="Venta de productos tecnológicos">

    <link rel="stylesheet" href="css/estilos.css">

    <script src="js/app.js" defer></script>
</head>
```

## 4.3 Elemento body

El elemento `<body>` delimita el contenido de toda nuestra página Web. Es la sección mas importante ya que en ella se encuentran los contenidos a presentar por el navegador.

## 4.4 Párrafos

Los párrafos se generan con la etiqueta `<p>`, debe tener su etiqueta de cierre y entre ambas etiquetas lo que se escriba se tomará como un parrafo indempendiente.

```html
<p> Este es un párrafo sencillo </p>
```
## 4.5 Formatos de texto

> **Negrita**

Para escribir texto en negrita tenemos que incluirlo dentro de las etiquetas `<b>` (bold) y su cierre `</b>`. Esta misma tarea es desempeñado por **strong** y su cierre.

<b>Texto en negrita</b>
```html
<b>Texto en negrita</b>
```

> **Itálica**

Para escribir texto en negrita tenemos que incluirlo dentro de las etiquetas `<i>` (italic) y su cierre `</i>`. 


<i>Texto en italica</i>
```html
<i>Texto en italica</i>
```

> **Subrayado**

Para escribir texto en negrita tenemos que incluirlo dentro de las etiquetas `<u>` (underlined) y su cierre `</u>`. 


<u>Texto en subrallado</u>
```html
<i>Texto en subrallado</i>
```

> **Subíindices y superíndices**

Este tipo de formato resulta de extremada utilidad para textos científicos. Las etiquetas empleadas  son:

`<sup>` y `</sup>` para los superíndices
`<sub>` y `</sub>` para los subíndices

Aquí tenéis un ejemplo:
```html
La <sup>13</sup>CC<sub>3</sub>H<sub>4</sub>ClNOS es un heterociclo alergeno enriquecido
```

El resultado:

La <sup>13</sup>CC<sub>3</sub>H<sub>4</sub>ClNOS es un heterociclo alergeno enriquecido

> **Anidar etiquetas**

Todas estas etiquetas y por supuesto el resto de las vistas y que veremos más adelante pueden ser anidadas unas dentro de otras de manera a conseguir resultados diferentes. Así, podemos sin ningún problema crear texto en negrita e itálica embebiendo una etiqueta dentro de la otra:

```html
<b>Esto sólo está en negrita <i>y esto en negrita e itálica</i></b>
```

<b>Esto sólo está en negrita <i>y esto en negrita e itálica</i></b>

> **Encabezados**

Son etiquetas utilizadas para dar importancia al texto, variando su tamaño y van desde `<h1>` hasta `<h6>`.

```html
    <h1>Encabezado nivel 1</h1>
    <h2>Encabezado nivel 2</h2>
    <h3>Encabezado nivel 3</h3>
    <h4>Encabezado nivel 4</h4>
    <h5>Encabezado nivel 5</h5>
    <h6>Encabezado nivel 6</h6>
```

<h1>Encabezado nivel 1</h1>
<h2>Encabezado nivel 2</h2>
<h3>Encabezado nivel 3</h3>
<h4>Encabezado nivel 4</h4>
<h5>Encabezado nivel 5</h5>
<h6>Encabezado nivel 6</h6>

## 4.6. Listas

### 4.6.1 Listas no ordenadas

Las listas no ordenadas (unordened list) van dentro de la etiqueta `<ul>` y su cierre `</ul>`. Para cada item que queramos añadir a la lista, lo haremos dentro de la etiqueta `<li>` y su cierre.

Si no le indicamos nada a la etiqueta `<li>` HTML, ésta se generará de forma automática, si no, hay que tener en cuenta el atributo para el uso de viñetas, que será **type** con alguno de los siguientes valores: **disc**, **square** o **circle**.

```html
<ul>
    <li type="circle">Esto es un tipo de item.</li>
    <li type="square">Este es otro.</li>
    <li type="disc">Y este es otro diferente.</li>
</ul>
```

<ul>
    <li type="circle">Esto es un tipo de item.</li>
    <li type="square">Este es otro.</li>
    <li type="disc">Y este es otro diferente.</li>
</ul>

### 4.6.2 Listas ordenadas
### 4.6.1 Listas de definiciones

## 4.7. Enlaces html - Hipervínculos, links
## 4.8. Imágenes
## 4.9. Tablas