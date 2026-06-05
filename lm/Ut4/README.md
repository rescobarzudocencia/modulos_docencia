# UT4 Javascript <!-- omit in toc -->
---

- [1. Introducción](#1-introducción)
- [2. Formas de escribir Javascript](#2-formas-de-escribir-javascript)
  - [2.1. Script de línea](#21-script-de-línea)
  - [2.2. Script externo](#22-script-externo)
- [3 Camelcase vs Pascalcase](#3-camelcase-vs-pascalcase)
  - [3.1 Camelcase](#31-camelcase)
  - [3.2 Pascalcase](#32-pascalcase)
- [4. Entrada y salida de datos](#4-entrada-y-salida-de-datos)
  - [4.1. Entrada de datos.](#41-entrada-de-datos)
  - [3.2. Salida de datos.](#32-salida-de-datos)


# 1. Introducción
JavaScript es un lenguaje con las siguientes características:

+ Es un lenguaje interpretado
+ Lenguaje de lado del cliente.
+ Lenguaje con tipado dinámico.
+ Multiparadigma, funcional y orientado a objetos.

JavaScript es utilizado para que el usuario interactue con el documento web, produciendo **eventos** que se asocian a código JavaScript. Por ejemplo el evento **onclick**.

Compiladores online:

https://www.programiz.com/javascript/online-compiler/ Recomendado

https://jsfiddle.net/

https://www.mycompiler.io/es/new/nodejs

# 2. Formas de escribir Javascript

## 2.1. Script de línea

Dentro del código Html mediante las marcas `<script>` y  `</script>`.


```html
<html>
  <head>
    <title>Título de la página</title>
    <script>
      console.log("¡Hola!");
    </script>
  </head>
  <body>
    <p>Ejemplo de texto.</p>
  </body>
</html>
```

## 2.2. Script externo

Utilizando un fichero externo donde vamos a codificar todas nuestras funciones Javascript. Para ello debemos hacer referencia a nuestro **fichero.js** dentro del **head**. 

<span style="color: #FF5733;">Este es el que se va a utilizar.</span>

```html
<html>
  <head>
    <title>Título de la página</title>
    <script src="js/index.js"></script>
  </head>
  <body>
    <p>Ejemplo de texto.</p>
  </body>
</html>
```


# 3 Camelcase vs Pascalcase

Son convenciones utilizadas para nombrar las variables, funciones, clases etc.., son usadas para unir palabras sin usar espacios en blanco.

<span style="color: #FF5733;">Estas convenciones serán obligatorias su uso en este módulo.</span>

## 3.1 Camelcase

Se nombra la primera palabra en minúscula y la segunda en mayuscula.

```
mivariableEjemplo
```

Se usa principalmente para nombrar elementos que epresentan datos específicos o acciones, tales como:

+ Variables locales.
+ Funciones y métodos.
+ Propiedades en objetos (en JavaScript, TypeScript o Java).

## 3.2 Pascalcase

Se nombra la primera palabra en mayuscula y la segunda en mayuscula.

```
MivariableEjemplo
```

Se reserva para nombres de estructuras de alto nivel y tipos en la mayoría de los lenguajes de programación, como por ejemplo:

+ Clases y constructores.
+ Interfaces.
+ Tipos personalizados (Types) o Enums.
+ Componentes de frameworks web (como React).



# 4. Entrada y salida de datos

## 4.1. Entrada de datos.

Para la entrada de datos por teclado tenemos el método **prompt**. Además de los textbox de los formularios.

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Ejemplo de JavaScript</title>
    <meta charset="UTF-8">
  </head>
  <body>
    <script>
      let nombre;
      let edad;
      nombre = prompt('Ingrese su nombre:');
      edad = prompt('Ingrese su edad:');
      document.write('Hola ');
      document.write(nombre);
      document.write(' asi que tienes ');
      document.write(edad);
      document.write(' años');
    </script>
  </body>
</html>
```

## 3.2. Salida de datos.

+ **Windows.alert** muestra una ventana con la información.
+ **Document.write** escribe directamente en el documento Html.
+ **Inner.html** escribe en  un elemento Htmal, usado con **.getElementById**

