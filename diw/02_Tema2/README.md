> DISEÑO DE INTERFACES WEB

# Tema 2: Creación de interfaces web utilizando estilos <!-- omit in toc -->
> INSERTAR CSS, SELECTORES, CASCADA, ESPECIFICIDAD, HERENCIA, DISPLAY, POSITION

- [1. Introducción](#1-introducción)
- [2. Formas de insertar CSS](#2-formas-de-insertar-css)
- [3. Selectores](#3-selectores)
  - [3.1. Selectores simples](#31-selectores-simples)
  - [3.2. Selectores combinadores](#32-selectores-combinadores)
  - [3.3. Selectores de pseudoclase](#33-selectores-de-pseudoclase)
  - [3.4. Selectores de pseudoelementos](#34-selectores-de-pseudoelementos)
  - [3.5. Selectores de atributos](#35-selectores-de-atributos)
- [4. Cascada, especificidad y herencia](#4-cascada-especificidad-y-herencia)
  - [4.1. Cascada](#41-cascada)
  - [4.2. Especificidad](#42-especificidad)
  - [4.3. Herencia](#43-herencia)
- [5. Position](#5-position)
  - [5.1. z-index](#51-z-index)
- [6. Alineación horizontal y vertical](#6-alineación-horizontal-y-vertical)
- [7. Recursos](#7-recursos)
  - [7.1. Herramientas](#71-herramientas)
  - [7.2. Formación](#72-formación)





---


# 1. Introducción

Este documento es un resumen realizado a partir de la documentación disponible en **[W3Schools](https://www.w3schools.com/css/default.asp)**. 

Por favor, para un tratamiento en mayor profundidad y demos on-line, no dudes en consultar la documentación anterior.



# 2. Formas de insertar CSS

**CSS en línea**

```html
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<h1 style="color: blue; text-align: center;">Título</h1>

</body>
</html>
```

**CSS interno**
```html
<!DOCTYPE html>
<html>
<head>
  <style>
     h1 { color: blue; text-align: center; }
  </style>
</head>
<body>

<h1>Título</h1>

</body>
</html>
```


**CSS externo**

```html
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="estilo.css">
</head>
<body>

<h1>Título</h1>

</body>
</html>
```

```css
/* estilo.css */

h1 {
  color: blue;
  text-align: center;
}
```

# 3. Selectores

1. **Selectores simples** (selecciona elementos según la etiqueta html, identificación, clase)
2. **Selectores combinadores** (selecciona elementos en función de una relación específica entre ellos)
3. **Selectores de pseudoclase** (selecciona elementos según un determinado estado)
4. **Selectores de pseudoelementos** (selecciona y aplica estilo a una parte de un elemento)
5. **Selectores de atributos** (selecciona elementos según un atributo o valor de atributo)

A continuación se muestran ejemplos de cada uno de ellos.

## 3.1. Selectores simples

**Etiqueta HTML**

- `*`
- `body`
- `h1`, `h2`, `h3`, ...
- `div`, `p`
- `img`, `a`, `span`
- `form`, `input`, ...

> [!NOTE] 
> 
> `*` se conoce como `selector universal`. Hace referencia a todos los elementos HTML.


**IDs** **`#`**

- `#identificador`

Elemento cuyo atributo HTML es `id="identificador"`. Debe ser único dentro del documento.


**Clases** **`.`**

- `.nombre-clase`

Elementos cuyo atributo HTML es `class="nombre-clase"`. 


## 3.2. Selectores combinadores

**Varios elementos** **`,`**

- `div, p`

Cualquier elemento que sea `div` o `p`.

**Cualquier descendiente** **` espacio en blanco `**

- `div p`

Cualquier elemento `p` dentro de un elemento `div` sin importar el nivel de anidamiento.


**Cualquier hijo** **`>`**

- `div > p`

Cualquier elemento `p` dentro de un elemento `div` en el primer nivel de anidamiento.


**Hermano adjacente** **`+`**

- `div + p`

Primer elemento `p` adjacente de un `div`.

> [!NOTE] 
> 
> Sólo se tienen en cuenta los hermanos siguientes, no los anteriores.

**Todos los hermanos adjacentes** **`~`**

- `div ~ p`

Cualquier elemento `p` adjacente de un `div`.

> [!NOTE] 
> 
> Sólo se tienen en cuenta los hermanos siguientes, no los anteriores.


## 3.3. Selectores de pseudoclase 

Para seleccionar un elemento HTML según su estado. Se expresa con **`:`**. Ejemplos:

- `:root`
- `:not(p)`
- `a:link`
- `a:visited`
- `a:active`
- `a:hover`
- `div:hover`
- `input:focus`
- `input:checked`
- `input:valid`
- `input:invalid`
- `p:first-child`
- `tr:nth-child(even)`
- `p:last-child`
- ...

Más información en https://www.w3schools.com/css/css_pseudo_classes.asp



## 3.4. Selectores de pseudoelementos

Para seleccionar partes de un elemento HTML. Se indica con **`::`**. Ejemplos:

- `p::after`
- `p::before`
- `p::first-line`
- `p::first-letter`
- `p::selection`
- `dialog::backdrop`
- `li::marker`
- ...

Mas información en https://www.w3schools.com/css/css_pseudo_elements.asp


## 3.5. Selectores de atributos

Para seleccionar partes de un elemento HTML. Se indica con **`[]`**. Ejemplos:

- `a[target]`
- `a[target="_blank"]`
- `input[type="text"]`
- `input[type="button"]`
- ...

Más información en https://www.w3schools.com/css/css_attribute_selectors.asp


# 4. Cascada, especificidad y herencia

Estos 3 aspectos determinan que valor de propiedad será aplicado a un elemento cuando dicha propiedad aparece varias veces con distintos valores en la hoja de estilo a aplicar.

## 4.1. Cascada

El listado de reglas CSS que establecemos es interpretado de forma secuencial. Es decir, si definimos una propiedad al principio de la hoja de estilos y más adelante volvemos a definir la misma propiedad con otro valor, la que se aplicará será esta última, puesto que sobreescrirá a la primera.


## 4.2. Especificidad

| Peso | Tipo                                          | Ejemplo                          |
| ---: | --------------------------------------------- | -------------------------------- |
| 1000 | en línea                                      | `<h1 style="color: pink;"></h1>` |
|  100 | id                                            | #navbar                          |
|   10 | clases, pseudoclases, selectores de atributos | .test, :hover, [href]            |
|    1 | elementos, pseudoelementos                    | h1, p::before                    |


> Material de consulta: https://www.w3schools.com/css/css_specificity.asp


## 4.3. Herencia

Muchas de los valores de las propiedades se heredan de padres a hijos, es decir que elementos contenedores a elementos contenidos.

No todas las propiedades son heredadas. Las propiedades que se heredan son:

- `border-collapse`
- `border-spacing`
- `caption-side`
- `color`
- `cursor`
- `direction`
- `empty-cells`
- `font-family`
- `font-size`
- `font-style`
- `font-variant`
- `font-weight`
- `font-size-adjust`
- `font-stretch`
- `font`
- `letter-spacing`
- `line-height`
- `list-style-image`
- `list-style-position`
- `list-style-type`
- `list-style`
- `orphans`
- `quotes`
- `tab-size`
- `text-align`
- `text-align-last`
- `text-decoration-color`
- `text-indent`
- `text-justify`
- `text-shadow`
- `text-transform`
- `visibility`
- `white-space`
- `widows`
- `word-break`
- `word-spacing`
- `word-wrap`

Cuando trabajamos con propiedades heredables, dos valores que son de gran utilidad son:

- `initial`: Si la propiedad es heredada, ignoramos y establecemos valor predeterminado.
- `inherit`: Si la propiedad no es heredada, forzamos a heredar el valor del padre.

Podemos indicar que un elemento haga un *reset* de todas las propiedades, incluso las [predeterminadas](https://www.w3schools.com/cssref/css_default_values.php). Por ejemplo:

```css
p {
  all: initial;
}
```

También podemos indicar que un elemento herede todas las propiedades de su padre, incluso las no heredables. Por ejemplo:

```css
p {
  all: inherit;
}
```



# 5. Position

Un elemento HTML puede ser posicionado de 5 maneras posibles:

- `static`
- `relative`
- `absolute`
- `fixed`
- `sticky`

Para hacer uso en CSS de las `position` anteriores, escribimos:

```css
position: relative;
position: absolute;
position: fixed;
position: sticky;
```

Una vez establecido el modo de posicionado, podemos utilizar las propiedades `top`, `bottom`, `left` y `right` para indicar el desplazamiento respecto de la posición original del elemento en cuestión.

El resto de elementos no son desplazados de su posición.

**static**

Los elementos HTML son colocados de esta manera de forma predeterminada. Por tanto, es innecesario indicarlo. Las propiedades `top`, `bottom`, `left`, `right` no tienen efecto. 

**relative**

Las propiedades `top`, `bottom`, `left`, `right` indican desplazamiento **respecto de la posición original** del elemento.

El elemento **deja espacio vacío** en su posición original.

**absolute**

Las propiedades `top`, `bottom`, `left`, `right` indican desplazamiento **respecto al ancestro posicionado más cercano** del elemento. 

Si el elemento no tiene antepasados ​​posicionados (en forma `relative`, `absolute`, `fixed` o `sticky`), entonces utiliza el cuerpo del documento y se mueve junto con el desplazamiento de la página.

El elemento **no deja espacio vacío** en su posición original.

**fixed**

Las propiedades `top`, `bottom`, `left`, `right` indican desplazamiento **respecto al viewport**. Por tanto, el elemento siempre permanece en el mismo lugar incluso si se desplaza la página. 

El elemento **no deja espacio vacío** en su posición original.

**sticky**

Las propiedades `top` y `bottom` indican desplazamiento **respecto al viewport**, pero sólo se aplica cuando el desplazamiento de la página hace que el elemento pueda desaparecer de la vista. En este caso, el elemento se pegará al *viewport* 

El elemento **deja espacio vacío** en su posición original.

La posición `sticky` es usada a menudo para posicionar cabeceras, barras de navegación y similares que no queremos que desaparezcan de la vista al desplazar hacia abajo la página. En este caso suele usarse junto a la propiedad `top`.

La posición `sticky` es usada a menudo para posicionar pies de página y similares que no queremos que desaparezcan de la vista al desplazar hacia arriba la página. En este caso suele usarse junto a la propiedad `bottom`.


Ejemplo:

```css
header {
  position: sticky;
  top: 0px;
}

footer {
  position: sticky;
  bottom: 0px;
}
```

Más información en https://www.w3schools.com/css/css_positioning.asp


## 5.1. z-index

Esta propiedad especifica el orden de pila de un elemento (qué elemento debe colocarse delante o detrás de los demás). Puede entenderse como la posición del elemento en el `eje de coordenadas Z`

![z-index](assets/z-index.png)

Un elemento puede tener un orden de pila positivo o negativo. Por defecto, el valor de `z-index` es 0. Elementos con valores más elevados se superponen sobre elementos con valores más bajos.

![z-index](assets/z-index.webp)

> [!NOTE] 
> 
> `z-index` sólo funciona en elementos posicionados (`absolute`, `relative`, `fixed`, or `sticky`) y elementos flexibles (elementos que son hijos directos de un elemento `display: flex`).

# 6. Alineación horizontal y vertical

Existen numerosas formas de alinear un elemento tanto horizontalmente como verticalmente.

Para más información consultar https://www.w3schools.com/css/css_align.asp

# 7. Recursos

## 7.1. Herramientas

- [Conversor px / em](https://www.w3schools.com/cssref/css_pxtoemconversion.php)

## 7.2. Formación

- [Valores por defecto de los elementos HTML](https://www.w3schools.com/cssref/css_default_values.php)
- [Unidades de medida](https://www.w3schools.com/cssref/css_units.php)
- [Listado de entidades](https://www.w3schools.com/cssref/css_entities.php)
- [Posicionamiento](https://www.geeksforgeeks.org/css-positioning-elements/?ref=lbp)
