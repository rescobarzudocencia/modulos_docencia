> DISEÑO DE INTERFACES WEB

# Anexo I: Frameworks CSS  <!-- omit in toc -->
> BOOTSTRAP, TAILWIND

- [1. Introducción](#1-introducción)
- [2. Bootstrap](#2-bootstrap)
  - [2.1. Instalación](#21-instalación)
  - [2.2. Desarrollo](#22-desarrollo)
  - [2.3. Características](#23-características)
    - [2.3.1. Diseño responsive](#231-diseño-responsive)
    - [2.3.2. Container](#232-container)
    - [2.3.3. Sistema de doce columnas](#233-sistema-de-doce-columnas)
- [3. Tailwind](#3-tailwind)
  - [3.1. Instalación](#31-instalación)
  - [3.2. Desarrollo](#32-desarrollo)
  - [3.3. Características](#33-características)
    - [3.3.1. Diseño responsive](#331-diseño-responsive)
    - [3.3.2. Container](#332-container)
    - [3.3.3. Modificadores](#333-modificadores)
    - [3.3.4. Propiedades con medidas múltiplo de 4px o 0.25rem](#334-propiedades-con-medidas-múltiplo-de-4px-o-025rem)
    - [3.3.5. Propiedades con medidas no múltiplo de 4px o 0.25rem](#335-propiedades-con-medidas-no-múltiplo-de-4px-o-025rem)
    - [3.3.6. Propiedades con medidas con sm, md, xl, 2xl, ...](#336-propiedades-con-medidas-con-sm-md-xl-2xl-)
    - [3.3.7. Propiedades con medidas específicas](#337-propiedades-con-medidas-específicas)
    - [3.3.8. Colores](#338-colores)
    - [3.3.9. Combinación de selectores](#339-combinación-de-selectores)
- [4. Reto Landing Page](#4-reto-landing-page)
  - [4.1. Solución usando Tailwind](#41-solución-usando-tailwind)
  - [4.2. Solución usando sólo CSS](#42-solución-usando-sólo-css)
- [5. Recursos](#5-recursos)
  - [5.1. Herramientas](#51-herramientas)
  - [5.2. Formación](#52-formación)


--- 

# 1. Introducción

En este tema comentaremos acerca de 2 famosos frameworks con filosofías bastante diferentes. Son Bootstrap y Tailwind.

En ambos se realiza el diseño siguiendo la estrategia de **Mobile first**.


# 2. Bootstrap

Referencia:
- [Documentación oficial de Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)


## 2.1. Instalación

En bootstrap no es necesario realizar instalación alguna. En su lugar, deberemos insertar 2 enlaces en el documento HTML a dar estilo, uno para CSS y otro para JS, puesto que algunos componentes de bootstrap necesitan javascript para su correcto funcionamiento.

Colocaremos dentro de la etiqueta `head` el siguiente enlace:

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
```

Colocaremos dentro de la etiqueta `body`, justo antes de su cierre, el siguiente enlace:

```html
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
```

## 2.2. Desarrollo

El desarrollo con Bootstrap no suele ser muy complicado. Normalmente se restringe a conocer un poco el framework y a escoger los componentes que necesitamos.

Bootstrap viene ya con muchos componentes que podremos usar simplemente copiando y pegando. Algunos ejemplos son:

- [Alertas](https://getbootstrap.com/docs/5.3/components/alerts/)
- [Botones](https://getbootstrap.com/docs/5.3/components/buttons/)
- [Card](https://getbootstrap.com/docs/5.3/components/card/)
- [Carrousel](https://getbootstrap.com/docs/5.3/components/carousel/)
- [Listas](https://getbootstrap.com/docs/5.3/components/list-group/)
- [Barras de navegación](https://getbootstrap.com/docs/5.3/components/navbar/)
- [Spinners](https://getbootstrap.com/docs/5.3/components/spinners/)
- [Toasts](https://getbootstrap.com/docs/5.3/components/toasts/)

## 2.3. Características

**VENTAJAS**

1. **Es fácil de usar**. Una vez el usuario dispone de los conocimientos necesarios, sacarle partido a este framework es muy simple. Al dominar los archivos principales gracias a la documentación oficial, solo precisas tener nociones básicas de HTML, CSS y JavaScript para comenzar a construir un sitio web.

2. **Ofrece una compatibilidad altísima**. Bootstrap ha sido diseñado para funcionar en cualquier navegador actual. Así que una vez termines tu sitio, tendrás la convicción de que va a ser funcional allá donde se abra. 

3. **Gestión eficiente de las imágenes**. Incluye clases para las imágenes que activan un redimensionamiento inteligente con el fin de adaptar los gráficos a cualquier tamaño de pantalla.

4. **Creación de contenido mediante rejillas adaptables**. Bootstrap utiliza como patrón de diseño un grid o rejilla que facilita el ajuste de los contenidos a toda clase de pantallas. Para ello, ofrece dos tipos de contenedores, uno fijo y otro fluido.

5. Hay una **comunidad muy grande** detrás del proyecto.


**DESVENTAJAS**

1. **Sobrecarga de código:** Bootstrap incluye una gran cantidad de archivos CSS y JavaScript que pueden generar una sobrecarga de código innecesaria si no se utilizan todos los componentes y estilos que el framework ofrece.

2. **Falta de personalización:** Aunque Bootstrap brinda una amplia gama de opciones de personalización, es posible que algunas necesidades específicas del sitio web no puedan cumplirse sin la adición de código personalizado.

3. **Mismo diseño reconocible:** El uso extensivo de Bootstrap ha llevado a que muchos sitios web tengan un aspecto similar debido al uso de los mismos componentes y estilos predefinidos, lo que puede restar originalidad y diferenciación visual.

### 2.3.1. Diseño responsive

Bootstrap incluye seis puntos de interrupción predeterminados,

| Punto de ruptura  | Infijo de clase | Dimensiones |
| ----------------- | --------------- | ----------- |
| Extra small       | None            | <576px      |
| Small             | sm              | ≥576px      |
| Medium            | md              | ≥768px      |
| Large             | lg              | ≥992px      |
| Extra large       | xl              | ≥1200px     |
| Extra extra large | xxl             | ≥1400px     |


### 2.3.2. Container

Los contenedores son el elemento de diseño más básico en Bootstrap y son necesarios cuando utilizamos el sistema de cuadrícula predeterminado. Los contenedores se utilizan para contener, rellenar y (a veces) centrar el contenido dentro de ellos.

La clase predeterminada `.container`  es un contenedor responsive de ancho fijo, lo que significa que su ancho máximo cambia en cada punto de interrupción.

```html
<div class="container">
  <!-- Content here -->
</div>
```

### 2.3.3. Sistema de doce columnas

El sistema de cuadrícula de Bootstrap utiliza una serie de contenedores, filas y columnas para diseñar y alinear el contenido. Está construido con flexbox y es totalmente responsivo.

Para cuadrículas que son iguales desde el dispositivo más pequeño hasta el más grande, usaremos las clases `.col` y `.col-*`. Especificares una clase numerada cuando necesitemos una columna de tamaño particular.

![ejemplo 1](assets/bootstrap-col.png)

```html
<div class="container text-center">
  <div class="row">
    <div class="col">col</div>
    <div class="col">col</div>
    <div class="col">col</div>
    <div class="col">col</div>
  </div>
  <div class="row">
    <div class="col-8">col-8</div>
    <div class="col-4">col-4</div>
  </div>
</div>
```

De apilado a horizontal. Usando un único conjunto de clases `.col-sm-*`, podemos crear un sistema de cuadrícula básico que comienza apilado y se vuelve horizontal en el punto de interrupción pequeño (`sm`).

![ejemplo 2](assets/bootstrap-col-sm-.png)

```html
<div class="container text-center">
  <div class="row">
    <div class="col-sm-8">col-sm-8</div>
    <div class="col-sm-4">col-sm-4</div>
  </div>
  <div class="row">
    <div class="col-sm">col-sm</div>
    <div class="col-sm">col-sm</div>
    <div class="col-sm">col-sm</div>
  </div>
</div>
```

El siguiente código fuente siguiente:

```html
<div class="container text-center">
  <div class="row">
    <div class="col-4">.col-4</div>
    <div class="col-4">.col-4</div>
    <div class="col-4">.col-4</div>
  </div>

  <div class="row">
    <div class="col-sm-4">.col-sm-4</div>
    <div class="col-sm-4">.col-sm-4</div>
    <div class="col-sm-4">.col-sm-4</div>
  </div>

  <div class="row">
    <div class="col-md-4">.col-md-4</div>
    <div class="col-md-4">.col-md-4</div>
    <div class="col-md-4">.col-md-4</div>
  </div>

  <div class="row">
    <div class="col-lg-4">.col-lg-4</div>
    <div class="col-lg-4">.col-lg-4</div>
    <div class="col-lg-4">.col-lg-4</div>
  </div>

  <div class="row">
    <div class="col-xl-4">.col-xl-4</div>
    <div class="col-xl-4">.col-xl-4</div>
    <div class="col-xl-4">.col-xl-4</div>
  </div>
</div>
```

Producirá los siguientes diseños:

**En pantallas `xs`:**

![xs](assets/bootstrap-col-xs.png)

**A partir de pantallas `sm`:**

![sm](assets/bootstrap-col-sm.png)

**A partir de pantallas `md`:**

![md](assets/bootstrap-col-md.png)

**A partir de pantallas `lg`:**

![lg](assets/bootstrap-col-lg.png)

**A partir de pantallas `xl`:**

![xl](assets/bootstrap-col-xl.png)


# 3. Tailwind

Referencia:
- [Documentación oficial de Tailwind](https://tailwindcss.com/docs)


## 3.1. Instalación

Existen distintas formas de instalar tailwind. Puedes consultarlas en la [documentación oficial](https://tailwindcss.com/docs/installation) 

**Existen numerosos frameworks web que ya lo incluyen de serie por lo que, en estos casos, no necesitaremos hacer nada.**

No obstante, si deseamos empezar a trabajar en un proyecto independiente del framework, podemos trabajar usando el Tailwind CLI, como se muestra a continuación:

```sh
npm init -y
npm i tailwindcss @tailwindcss/cli
```


Necesitaremos al menos 2 archivos:

- un archivo css de entrada, al que llamaré `entrada.css`
- un archivo css de salida, al que llamaré `style.css`

En el archivo `entrada.css` colocaremos el siguiente contenido:

```css
@import "tailwindcss";

/* Otro contenido CSS */
```
 
En el archivo `index.html` colocaremos la siguiente etiqueta `link` apuntando al archivo de css de salida, ya procesado:

```html
<html>
<head>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    
</body>
</html>
```

Por último, en el archivo `package.json`, crearemos los scrips siguientes:

```json
 ...
 "scripts": {
    "build": "@tailwindcss/cli  -i ./entrada.css -o ./style.css",
    "watch": "@tailwindcss/cli  -i ./entrada.css -o ./style.css --watch"
  },
  ...
```

## 3.2. Desarrollo

A continuación, ya podremos lanzar el script siguiente:

```sh
npm run watch
```

y empezar a editar los archivos html, añadiendo las clases tailwind deseadas. En nuestro caso lo haremos con el archivo `index.html`.

Es aconsejable tener un servidor web con recarga automática para ver los cambios en tiempo real. Una buena alternativa para ello es usar el plugin `Live Preview` de VSCode.

![VSCode](assets/vscode.png)


> [!NOTE]
>
> Si estamos usando un framework como **Next.js y tailwind v4**, no tendremos que hacer nada salvo indicar al crear el nuevo proyecto que vamos a usar tailwindcss.
>
> Se creará un archivo `src/app/globals.css`, donde podremos colocar nuestra configuración. A continuación se muestra un ejemplo:
>
> ```css
> @import "tailwindcss";
>
> @plugin "daisyui";
> 
>
> @theme {
>  --color-bright-red: hsl(12, 88%, 59%);
>  --color-dark-blue: hsl(228, 39%, 23%);
>  --font-sans: ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", sans-serif;
>  --screen-sm: 480px;
>  --screen-md: 768px;
>  --screen-lg: 976px;
>  --screen-xl: 1440px;
> }
>```



## 3.3. Características

**VENTAJAS**

1. Proceso de **desarrollo más rápido**

2. Te ayuda a practicar más tu CSS ya que las utilidades son similares

3. **Todas las utilidades y componentes son fácilmente personalizables**

4. **El tamaño total del archivo para la producción suele ser pequeño**

5. **Fácil de aprender si ya conoces el CSS**
   
6. Buena documentación para el aprendizaje
   

**DESVENTAJAS**

1. **Tu marcado puede parecer desorganizado** para proyectos grandes porque todos los estilos están en los archivos HTML.

2. **No es fácil de aprender si no entiendes bien el CSS.**

3. **Te ves obligado a construir todo desde cero**, incluidos los elementos de entrada. Cuando instalas Tailwind CSS, elimina todos los estilos CSS por defecto.

4. Tailwind CSS **no es la mejor opción si buscas minimizar el tiempo dedicado a desarrollar el frontend** de tu sitio web y centrarte principalmente en la lógica del backend.



### 3.3.1. Diseño responsive

| Prefijo | Ancho mínimo | CSS equivalente                      |
| ------- | ------------ | ------------------------------------ |
| `sm`    | 640px        | `@media (min-width: 640px) { ... }`  |
| `md`    | 768px        | `@media (min-width: 768px) { ... }`  |
| `lg`    | 1024px       | `@media (min-width: 1024px) { ... }` |
| `xl`    | 1280px       | `@media (min-width: 1280px) { ... }` |
| `2xl`   | 1536px       | `@media (min-width: 1536px) { ... }` |


De forma predeterminada, Tailwind utiliza un sistema ***mobile-first***, similar al que podrías estar acostumbrado en otros frameworks como Bootstrap.

Lo que esto significa es que las utilidades sin prefijo (como `uppercase`) tienen efecto en todos los tamaños de pantalla, mientras que las utilidades con prefijo (como `md:uppercase`) solo tienen efecto en el punto de interrupción especificado y superiores.

De forma predeterminada, los estilos aplicados por reglas como `md:flex` se aplicarán en ese punto de interrupción y permanecerán aplicados en puntos de interrupción más grandes.

### 3.3.2. Container

La clase `container` establece el ancho máximo de un elemento para que coincida con el ancho mínimo del punto de interrupción actual. Esto es útil si deseas diseñar para un conjunto fijo de tamaños de pantalla en lugar de intentar acomodar un *viewport* completamente fluido.

[Medidas de container](https://tailwindcss.com/docs/responsive-design#container-size-reference)

Ten en cuenta que, a diferencia de los contenedores que podría haber utilizado en otros marcos, el contenedor de Tailwind no se centra automáticamente y no tiene ningún relleno horizontal incorporado.

Para centrar un contenedor, usa la clase de utilidad `mx-auto`:

```html
<div class="container mx-auto">
  <!-- ... -->
</div>
```

### 3.3.3. Modificadores

Tailwind dispone de numerosos modificadores, que **se anteponen a las propiedades que deseemos**. Los modificadores cambian el momento o el lugar en los cuales las propiedades son aplicadas. 

Tailwind incluye modificadores para casi todo lo que necesitarás, incluyendo:

- Pseudoclases, como `:hover`, `:focus`, `:first-child` y `:required`
- Pseudoelementos, como `::before`, `::after`, `::placeholder` y :`:selection`
- Puntos de ruptura responsives como `sm:`, `md:`, `lg:`, ...
- Modo oscuro, como `dark:`

**Ejemplos:**

```html
<!-- Cambiamos color del buttón al pasar ratón por encima -->
<button class="bg-sky-500 hover:bg-sky-700 ...">
  Save changes
</button>

<!-- En modo claro, el fondo será blanco, en modo oscuro será negro... -->
<div class="bg-white dark:bg-black">
</div>

<!-- Ancho de 16 por defecto, 32 en pantallas medianas y 48 en pantallas grandes -->
<img class="w-16 md:w-32 lg:w-48" src="...">

<!--Aplicamos propiedad flex a partir de pantallas md (768px) -->
<div class="md:flex">
</div> 
```

Estos modificadores pueden incluso acumularse para apuntar a situaciones más específicas, por ejemplo, cambiar el color de fondo cuando estamos en modo oscuro, en el punto de interrupción medio, al pasar el mouse:

```html
<button class="dark:md:hover:bg-fuchsia-600 ...">
  Save changes
</button>
```


### 3.3.4. Propiedades con medidas múltiplo de 4px o 0.25rem

En Tailwind muchas clases de utilidad utilizan identificadores cuya cifra númerica se multiplicará por 4px al convertir a código CSS. Esta es la [escala de espaciado por defecto](https://tailwindcss.com/docs/customizing-spacing#default-spacing-scale). Por ejemplo:

| Clase | Propiedad CSS                |
| ----- | ---------------------------- |
| p-0.5 | padding: 0.125rem; /* 2px */ |
| p-1   | padding: 0.25rem; /* 4px */  |
| p-2   | padding: 0.25rem; /* 8px */  |

Esto sucede con las siguientes propiedades:

- [width](https://tailwindcss.com/docs/width)
- [height](https://tailwindcss.com/docs/height)
- [padding](https://tailwindcss.com/docs/padding)
- [margin](https://tailwindcss.com/docs/margin)
- [gap](https://tailwindcss.com/docs/gap)
- [*space between*](https://tailwindcss.com/docs/space)
- [*size*](https://tailwindcss.com/docs/size)
- ...alguna otra
  
Según la documentación, esta escala es heredada por padding, margin, width, minWidth, maxWidth, height, minHeight, maxHeight, gap, inset, space, translate y algunos plugins. [Esta escala puede personalizarse](https://tailwindcss.com/docs/customizing-spacing).


### 3.3.5. Propiedades con medidas no múltiplo de 4px o 0.25rem

Medidas que no siguen la convención anterior son:

- [border-width](https://tailwindcss.com/docs/border-width)
- [outline-width](https://tailwindcss.com/docs/outline-width)

En este caso, el número final representa el tamaño en píxeles. Por ejemplo, para poner borde y outline de 2px, escribimos:

```
border-2
outline-2
```

### 3.3.6. Propiedades con medidas con sm, md, xl, 2xl, ...

Medidas que siguen esta convención son:

- [font-size](https://tailwindcss.com/docs/font-size)
- [border-radius](https://tailwindcss.com/docs/border-radius)

Por ejemplo:

```
text-xs	     // font-size: 0.75rem; /* 12px */ line-height: 1rem; /* 16px */
text-sm	     // font-size: 0.875rem; /* 14px */ line-height: 1.25rem; /* 20px */
text-base	   // font-size: 1rem; /* 16px */ line-height: 1.5rem; /* 24px */
text-lg      // font-size: 1.125rem; /* 18px */ line-height: 1.75rem; /* 28px */
rounded	     // border-radius: 0.25rem; /* 4px */
rounded-full //	border-radius: 9999px;
```

###  3.3.7. Propiedades con medidas específicas

- [font-weight](https://tailwindcss.com/docs/font-weight)
- [text-align](https://tailwindcss.com/docs/text-align)
- [text-transform](https://tailwindcss.com/docs/text-transform)

Por ejemplo:

```
font-thin	  // font-weight: 100;
font-normal	// font-weight: 400;
font-bold	  // font-weight: 700;
text-left	  // text-align: left;
text-center	// text-align: center;
text-right	// text-align: right;
uppercase	  // text-transform: uppercase;
lowercase	  // text-transform: lowercase;
capitalize  // text-transform: capitalize;
```

### 3.3.8. Colores

Tailwind incluye una [paleta de colores](https://tailwindcss.com/docs/customizing-colors) predeterminada diseñada por expertos y lista para usar que es un excelente punto de partida si no tiene su propia marca específica en mente.

![Paleta de colores](assets/paleta-colores.png)

**Ejemplos**:

```
bg-slate-50      /* Color de fondo */
text-slate-950   /* Color de texto */
border-slate-300 /* Color de borde */
outline-black    /* Color de contorno */
shadow-slate-950 /* Color de sombra */
```

### 3.3.9. Combinación de selectores

Tailwind también soporta combinación de selectores. Por ejemplo, esto es usado a menudo cuando queremos aplicar un estilo al ascendiente, los descendientes o hermanos de un elemento según el estado de éste.



**Ascendiente**

Supongamos que queremos que el ascendiente de un `input` cambie de estilo al ser *checked* este último.

En HTML/CSS escribiriamos:

```html
<label>
  <input type="radio" />   Google Pay
</label>
```


```css
input:checked {
  border-color: #6366f1; /* indigo-500 */
}

/* Cuando el radio dentro del label está checked */
label:has(input:checked) {
  background-color: #eef2ff; /* indigo-50 */
  color: #312e81;            /* indigo-900 */
}
```

En tailwind hacemos uso de las variantes **[`has-*`](https://tailwindcss.com/docs/hover-focus-and-other-states#has)** 


```html
<label class="has-checked:bg-indigo-50 has-checked:text-indigo-900">  
  <input type="radio" class="checked:border-indigo-500" /> Google Pay
</label>
```


**Cualquier descendiente**

Supongamos que queremos que todos los descendientes `svg`, `h3` y `p` del elemento `a` cambien de estilo al hacer *hover* sobre éste último. 

En CSS escribiriamos:

```css
a:hover svg {
  /* ... */
}

a:hover h3 {
  /* ... */
}

a:hover p {
  /* ... */
}
```

En tailwind hacemos uso de la clase **[`group`](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-based-on-parent-state)** y las variantes **`group-*`**


```html
<a href="#" class="group ...">
  <div>
    <svg class="stroke-sky-500 group-hover:stroke-white ..." fill="none" viewBox="0 0 24 24">
      <!-- ... -->
    </svg>
    <h3 class="text-gray-900 group-hover:text-white ...">New project</h3>
  </div>
  <p class="text-gray-500 group-hover:text-white ...">Create a new project from a variety of starting templates.</p>
</a>
```


**Cualquier hermano**

Supongamos que queremos que todos los hermanos adjacentes `p` del elemento `input` cambien de estilo al tener un valor *invalid* éste último. 

En CSS escribiriamos:

```css
input:invalid ~ p {
  /* ... */
}
```

En tailwind hacemos uso de la clase **[`peer`](https://tailwindcss.com/docs/hover-focus-and-other-states#styling-based-on-sibling-state)** y las variantes **`peer-*`**


```html
 <input type="email" class="peer ..." />
 <p class="invisible peer-invalid:visible ...">Please provide a valid email address.</p>
```

> [!IMPORTANT] 
> 
> El elemento con clase `peer` debe declararse antes que el elemento hermano que lo referencia.
> 

# 4. Reto Landing Page

- [Descarga](https://www.frontendmentor.io/challenges/manage-landing-page-SLXqC6P5)


## 4.1. Solución usando Tailwind


1. Solución proporcionada por el canal de Youtube [AlexCGDesign](https://www.youtube.com/@AlexCGDesign)

- [Vídeo](https://www.youtube.com/watch?v=VcIQviqWDRs)
  
Vídeo en español de 1 hora y media aproximada de duración.


2. Solución proporcionada por el canal de Youtube [Traversy Media](https://www.youtube.com/@TraversyMedia)

- [Vídeo](https://www.youtube.com/watch?v=dFgzHOX84xQ) 

Vídeo en inglés de 1 hora y media aproximada de duración.



## 4.2. Solución usando sólo CSS

- Solución proporcionada por el canal de Youtube de [Kevin Powell](https://www.youtube.com/@KevinPowell)

Es una [lista de reproducción con 11 vídeos](https://youtube.com/playlist?list=PL4-IK0AVhVjNDRHoXGort7sDWcna8cGPA&si=5FF176VsDJEHSfbg). Cada vídeo tiene una duración entre 20 y 50 minutos aproximadamente.



# 5. Recursos

## 5.1. Herramientas

- [Generador de columnas para Bootstrap](https://mdbootstrap.com/docs/standard/tools/builders/grid/)
- [TailwindCSS Play](https://play.tailwindcss.com/)

## 5.2. Formación

- [Consejos prácticos de diseño y CSS para crear interfaces preparadas para el futuro.](https://defensivecss.dev/)
- [Documentación oficial de Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- [Bootstrap 5 Grid system](https://mdbootstrap.com/docs/standard/layout/grid/)
- [Documentación oficial de Tailwind](https://tailwindcss.com/docs)
- [DesarrolloWeb: Manual de Tailwind](https://desarrolloweb.com/manuales/manual-de-tailwindcss)
- [css2wind: Aprende Tailwind a partir de CSS](https://www.css2wind.com/)
- [TailwindCSS Course](https://tailwindcss.com/build-uis-that-dont-suck)
