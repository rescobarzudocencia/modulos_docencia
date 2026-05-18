# UT2 HTML <!-- omit in toc -->
---

- [1. Introducción](#1-introducción)
- [2. Estructura y sintaxis del lenguaje HTML](#2-estructura-y-sintaxis-del-lenguaje-html)
  - [2.1 Estructura básica de una página HTML](#21-estructura-básica-de-una-página-html)
  - [2.2. Comentarios](#22-comentarios)
- [3. Elementos de HTML](#3-elementos-de-html)
  - [3.1 Elemento html](#31-elemento-html)
  - [3.2 Elemento head](#32-elemento-head)
    - [3.2.1 Elemento title](#321-elemento-title)
    - [3.2.2 Metadatos](#322-metadatos)
  - [3.3 Elementos body](#33-elementos-body)






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
# 3. Elementos de HTML

Un documento HTML está compuesto de elementos organizados de manera jerárquica. En los ejemplos anteriores lo hemos visto, dichos elementos son \<html>, \<head> y \<body>.

Cada elemento se identifica por una etiqueta y puede tener un conjunto de atributos, los cuales pueden ser específicos de un elemento en concreto.

Como ejemplo podemos ver en la etiqueta `\<html>` el atributo `lang`, para indicar el idioma de nuestra página web, con `es` estamos indicando el idioma Español.

## 3.1 Elemento html

Es el elemento principal del documento HTML. Todo el contenido debe estar dentro de dicha etiqueta, como vemos tiene una etiqueta de inicio y otra de cierre.

## 3.2 Elemento head

En este elemento  incluye el titulo de la página y los metadatos que podemos configurar para nuestra página web.

Este contenido no es visible.

### 3.2.1 Elemento title

Con esta etiqueta indicamos el titulo de nuestra página, dicho título se mostrará en la pestaña del navegador donde hemos abierto nuestra página web.

```html
<title> Titulo de la página Web </title>
```
Es lo que aparece en:

+ pestaña del navegador.
+ favoritos.
+ resultados de buscadores.


### 3.2.2 Metadatos

Los metadatos definen características generales del documento HTML e información que se desea proporcionar al navegador, se utiliza la etiqueta `\<meta>`.

En el siguiente enlace podemos obtener mas información sobre las etiquetas meta.

[Mas informacion sobre etiquetas Meta](https://lenguajehtml.com/html/metadatos/etiqueta-html-meta/)

A continuación vamos a ver algunos:

>  Codificación caracteres 

```html
<meta charset="UTF-8">
```
Codificación Unicode e ISO-8859-1.

Evita problemas con:

+ tildes.
+ ñ.
+ caracteres especiales.

> Diseño responsive

Hace que se adapte a móviles.
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
> Ayuda a SEO


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

> Enlaces CSS

Enlazar con hojas de estilo CSS
```html
<link rel="stylesheet" href="estilos.css">
```
> Enlaces JavaScript Externo
> 
Aunque normalmente hoy se pone antes de `</body>` para mejorar carga.
```html
<script src="script.js"></script>
```
> Icono de la página (favicon)

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

## 3.3 Elementos body
