# UT8 MARKDOWN <!-- omit in toc -->
---
- [1. Introducción.](#1-introducción)
- [2. Sintaxis básica de Markdown.](#2-sintaxis-básica-de-markdown)
- [3. Sintaxis extendida de Markdown.](#3-sintaxis-extendida-de-markdown)



# 1. Introducción.

Markdown es un lenguaje de marcado ligero con el que puedes agregar formato a documentos de texto plano. Fue creado por John Gruber y Aaron Swartz en el año 2004, siendo a día de hoy uno de los lenguajes de marcado más populares del mundo. Su popularidad se debe a que es sencillo, ligero y fácil de aprender por parte de aquellas personas que no tienen un perfil técnico.

El uso de Markdown difiere bastante del uso de editores de texto WYSIWYG como LibreOffice Writer o Microsoft Word. Los editores de texto WYSIWYG disponen de una interfaz gráfica, por lo que para dar formato al texto basta con hacer clic en los botones correspondientes, pudiendo percibir en el texto los cambios que vas haciendo de inmediato.

Por el contrario, cuando creas documentos Markdown, agregas el formato escribiendo los símbolos que conforman la sintaxis de Markdown, sin que exista una interfaz gráfica. Más adelante, cuando el documento se procese mediante una herramienta compatible, el texto junto con la sintaxis Markdown se exportará a otro tipo de archivo, que podrá ser de algún formato como por ejemplo HTML o PDF.

Por ejemplo, en Markdown puedes agregar un encabezado al texto usando el carácter # al inicio de la línea. Para agregar texto en negrita debes rodear el texto de dos asteriscos de apertura y de cierre, tal y **como ves en este ejemplo**.

Al principio puede que te cueste un tiempo acostumbrarte a escribir con esta sintaxis, especialmente si estás acostumbrado a usar editores visuales, pero con el tiempo puede que no quieras otras opciones. El hecho de poder almacenar texto con su formato en documentos de texto plano y de poder visualizarlo con cualquier aplicación es una gran ventaja.

A continuación puedes ver un ejemplo de cómo se redacta un texto con Markdown:

```markdown
## Esto es un encabezado
Esto es un **texto en negrita** y esto un *texto en cursiva*

A continuación vamos a [crear un enlace](https://tutorialmarkdown.com)

Tal y como ves, no es tan complicado. No te preocupes si no comprendes esta sintaxis.
Al final de este tutorial tendrás todo más claro que el agua.
```

Todo documento Markdown debe tener la extensión `.md`.

Para mas información [Tutorial Markdown](https://tutorialmarkdown.com/markdown)

Esto es una introducción a Markdown, basao en el enlace anterior.

# 2. Sintaxis básica de Markdown.

> **Párrafos**

Para crear un nuevo párrafo en Markdown basta con que dejes una **línea en blanco** entre una o más líneas de texto, tal y como ves en este ejemplo:

```markdown
Este es un párrafo.

Y esto es otro párrafo.
```

Cuando se procese el documento Markdown y exista una línea en blanco entre dos bloque de texto, se agregarán las etiquetas `<p>` y `</p>` al principio y al final de cada uno de los bloques de texto.

> **Encabezados**

Los encabezados se crean usando el carácter `#` delante de la oración que quieras que se formatee como un encabezado.

Markdown y equivalente HTML:

|Markdown|Html|
|-------|----|
|#      |`<h1>`|
|##     |`<h2>`|
|###    |`<h3>`|
|####   |`<h4>`|
|#####  |`<h5>`|
|###### |`<h6>`|

> **Líneas horizontales**

Podemos crear líneas horizontales de tres formas:

```markdown
***
```

***
```markdown
---
```
---
```markdown
___
```
___

> **Formato de texto**

+ **Negrita**.

Para agregar texto resaltado en negrita tendrás que usar dos asteriscos `**` o dos guiones bajos `__` al principio y al final de lo oración que quieres resaltar. En caso de que quieras resaltar un texto que está en medio de una palabra, tedrás que agregar dos asteriscos `**` o dos guiones bajos `__`, sin espacios, antes y después de las letras deseadas:

```markdow
Esto es un **texto en negrita**.
Esto es un texto parcialmente en ne**gri**ta.

Esto es un __texto en negrita__.
```

Esto es un **texto en negrita**.
Esto es un texto parcialmente en ne**gri**ta.

Esto es un __texto en negrita__.

+ **Cursiva**.

Para agregar texto en cursiva debes usar un solo asterisco `*` o un solo guión bajo `_` tanto al inicio como al final de lo oración que quieres marcar como cursiva.

```markdown
Esto es un *texto en cursiva*.
Esto es un texto parcialmente en cu*rsi*va.

Esto es un _texto en cursiva_.
```
Esto es un *texto en cursiva*.
Esto es un texto parcialmente en cu*rsi*va.

Esto es un _texto en cursiva_.

+ **Negrita cursiva**.

Para que en texto esté resaltado tanto en negrita como en cursiva al mismo tiempo debes agregar tres asteriscos `***` o tres guiones bajos `___` antes y después de una palabra o de una frase. 

```markdown
Esto es un ***texto en negrita y cursiva***.
Esto es un ___texto en negrita y cursiva___.
Esto es un texto parcialmente en ne***grita y cursi***va.
```

Esto es un ***texto en negrita y cursiva***.

Esto es un ___texto en negrita y cursiva___.

Esto es un texto parcialmente en ne***grita y cursi***va.


+ **Texto tachado**.

Para agregar un texto tachado en Markdown tendrás que usar dos guiones ondulados `~~` tanto antes como después del texto que quires tachar.

```markdown
El siguiente texto ~~estará tachado~~ 
```

El siguiente texto ~~estará tachado~~ 

+ **Texto subrayado**.

En markdown no hay una marca para subrayar texto, pero podemo simularlo utilizando los enlaces que veremos a continuación.

```markdown
El siguiente texto [está subrayado](#)
```
El siguiente texto [está subrayado](#)

> **Enlaces**

Para crear un enlace en Markdown debes situar **entre corchetes** el texto que quieres enlazar, también conocido como anchor. Seguidamente, debes usar parénte**sis para definir la URL a la que debe enlazar en texto del enlace:

```markdown
Me gusta el editor [Editor Markdown](https://editormarkdown.com)
```

Me gusta el editor [Editor Markdown](https://editormarkdown.com)

> [!important]
> Es importante que no existan espacios entre el corchete de cierre `]` del texto del enlace y el paréntesis de apertura `(` del enlace.

> **Imágenes**

Para agregar imágenes con Markdown debes agregar un **signo de exclamación** `!` seguido del **texto alternativo** o alt de la imagen entre **corchetes** y de la URL de la imagen entre paréntesis:

```markdow
![Imagen de unas nubes](/img/tutorial/imagen-markdown.webp)
```

> **Citas**

Para agregar citas en Markdown debes agregar el signo mayor `>` justo delante de una línea o de un párrafo:

```markdown
> Siento dejar este mundo sin probar pipas Facundo
```

> Siento dejar este mundo sin probar pipas Facundo

> **Listas** 

+ **Listas ordenadas**.

Para agregar listas ordenadas en Markdown debes agregar un **número** seguido de un **punto**, un **espacio** y el **elemento de la lista**. La lista no debe estar ordenada numéricamente, pero debe comenzar por el número 1:

```markdown
1. Primer elemento
2. Segundo elemento
3. Tercer elemento
```
1. Primer elemento
2. Segundo elemento
3. Tercer elemento

+ **Listas no ordenadas**.

Para agregar listas no ordenadas en Markdown debes agregar un guion `-`, un signo más `+` o un asterisco `*` delante de los elementos de la lista:

```markdown
* Primer elemento
* Segundo elemento
* Tercer elemento
```
* Primer elemento
* Segundo elemento
* Tercer elemento

# 3. Sintaxis extendida de Markdown.

> **Tablas**.

Para agregar tablas Markdown debes definir las cabeceras de columna mediante al menos **tres guiones** `---` que se situarán por debajo del texto de la cabecera. Para separar las diferentes cabeceras tendrás que usar un **símbolo de tubería** `|`:

```markdown
| Cabecera 1 | Cabecera 2 |
| ---------- | ---------- |
| Elem 1, 1  | Elem 1, 2  |
| Elem 1, 2  | Elem 2, 2  |
```

| Cabecera 1 | Cabecera 2 |
| ---------- | ---------- |
| Elem 1, 1  | Elem 1, 2  |
| Elem 1, 2  | Elem 2, 2  |


**Alineación de las tablas**.

Puedes alinear los elementos de una tabla en el centro, a la derecha o a la izquierda usando **dos puntos** `:` en uno de los lados que definen la cabecera de la tabla para alinear su contenido a la izquierda o a la derecha respectivamente. Para alinear el contenido de la tabla en el centro, debes usar un símbolo `:` a cada lado de los guiones.

```markdown
| Nombre  | Tipo    | Color |
| :---    |  :----: |  ---: |
| Manzana | Fruta   | Rojo  |
| Pera    | Fruta   | Verde |
```

| Nombre  | Tipo    | Color |
| :---    |  :----: |  ---: |
| Manzana | Fruta   | Rojo  |
| Pera    | Fruta   | Verde |

> **Bloques de código**.

Hay que iniciar y cerrar el bloque de código con tres tildes invertidas ```.

 + **Bloques estándard**.

Los bloques de código que se inician y se cierran con tres comillas invertidas son aceptados por la mayor parte de los procesadores de texto y herramientas Markdown. Su funcionalidad se limita a crear un bloque de código sin formato ni resaltado de sintaxis.

```
const value = 3;
let result = value * 4;
```



+ **Resaltado de sintaxis**.

Para ello tendremos que **indicar el lenguaje** de programación **tras las tres comillas de apertura** del bloque de código. Comillas de inicio ```js codigo y termina con otras tres 

Ejemplo JavaScript:


```js
const value = 3;
let result = value * 4;
```

Si queremos resaltar el código de otro lenguaje debemos escribir el lenguaje, html, css, etc..

