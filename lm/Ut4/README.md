# UT4 Javascript <!-- omit in toc -->
---

- [1. Introducción.](#1-introducción)
- [2. Formas de escribir Javascript.](#2-formas-de-escribir-javascript)
  - [2.1. Script de línea.](#21-script-de-línea)
  - [2.2. Script externo.](#22-script-externo)
- [3. Entrada y salida de datos.](#3-entrada-y-salida-de-datos)
  - [3.1. Entrada de datos.](#31-entrada-de-datos)
  - [3.2. Salida de datos.](#32-salida-de-datos)
- [4 Camelcase vs Pascalcase.](#4-camelcase-vs-pascalcase)
  - [4.1 Camelcase.](#41-camelcase)
  - [4.2 Pascalcase.](#42-pascalcase)
- [5. Declaración de Variables y Constantes.](#5-declaración-de-variables-y-constantes)
  - [5.1. Variables.](#51-variables)
  - [5.2. Constantes.](#52-constantes)
- [6. Tipos de datos.](#6-tipos-de-datos)
  - [6.1. Tipos de datos Simples.](#61-tipos-de-datos-simples)
  - [6.2. Conversión entre tipos de datos.](#62-conversión-entre-tipos-de-datos)
  - [6.3. Tipos de datos compuestos.](#63-tipos-de-datos-compuestos)
    - [6.3.1. Array.](#631-array)
      - [6.3.1.1. Arrays → String.](#6311-arrays--string)
      - [6.3.1.2. String → Arrays.](#6312-string--arrays)
  - [6.3.2. Objetos.](#632-objetos)
  - [6.3.3. Set.](#633-set)
    - [6.3.3.1. Métodos de los Set.](#6331-métodos-de-los-set)
  - [6.3.4. Map.](#634-map)
    - [6.3.4.1. Métodos de los Map.](#6341-métodos-de-los-map)
- [7 Métodos funcionales para colecciones.](#7-métodos-funcionales-para-colecciones)
  - [7.1. Método map.](#71-método-map)
  - [7.2. Método filter.](#72-método-filter)
- [8. Operadores.](#8-operadores)
- [9. Sentencias de control.](#9-sentencias-de-control)
  - [9.1. Condicionales.](#91-condicionales)
    - [9.1.1. If else](#911-if-else)
    - [9.1.2. Switch](#912-switch)
    - [9.1.2. Operador Ternario](#912-operador-ternario)


# 1. Introducción.
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

# 2. Formas de escribir Javascript.

## 2.1. Script de línea.

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

## 2.2. Script externo.

Utilizando un fichero externo donde vamos a codificar todas nuestras funciones Javascript. Para ello debemos hacer referencia a nuestro **fichero.js** dentro del **head**. 

> [!IMPORTANT] 
> Este es el que se va a utilizar.

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


# 3. Entrada y salida de datos.

## 3.1. Entrada de datos.

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
+ **console.log** muestra mensajes por consola, para poder visualizarlos tenemos que entrar en las herramientas de desarrollo pulsando `F12` o `Ctrl + Shift + J`, en Windows/Linux y en Mac `Cmd + Option + J`. Una vez dentro buscamos **Console**.




# 4 Camelcase vs Pascalcase.

Son convenciones utilizadas para nombrar las variables, funciones, clases etc.., son usadas para unir palabras sin usar espacios en blanco.

> [!IMPORTANT] 
> Estas convenciones serán obligatorias su uso en este módulo, para el nombrado de variables, constantes , funciones, etc...

## 4.1 Camelcase.

Se nombra la primera palabra en minúscula y la segunda en mayuscula.

```
mivariableEjemplo
```

Se usa principalmente para nombrar elementos que epresentan datos específicos o acciones, tales como:

+ Variables locales.
+ Funciones y métodos.
+ Propiedades en objetos (en JavaScript, TypeScript o Java).

## 4.2 Pascalcase.

Se nombra la primera palabra en mayuscula y la segunda en mayuscula.

```
MivariableEjemplo
```

Se reserva para nombres de estructuras de alto nivel y tipos en la mayoría de los lenguajes de programación, como por ejemplo:

+ Clases y constructores.
+ Interfaces.
+ Tipos personalizados (Types) o Enums.
+ Componentes de frameworks web (como React).



# 5. Declaración de Variables y Constantes.

## 5.1. Variables.

A partir de ES6 se recomienda utilizar la palabra clave **let** en lugar de **var** para la declaración de variables. La razón es que **let** declara la variable en un ámbito de bloque al igual que la mayoría de los lenguajes de programación, lo cual es menos propenso a errores en el momento de la ejecución del código. Por contra, las variables declaradas con **var** siguen existiendo fuera del bloque en el cual fueron declaradas, estando únicamente limitadas en su visibilidad por la función en la que fueron declaradas.

```js
var a=1;
let b=2;
```

## 5.2. Constantes.

Desde ES6 también podemos declarar constantes. Un constante es un dato que "no puede ser modificado en tiempo de ejecución". Se declara mediante la palabra reservada **const**.

``` js
const  a = 10;
a = 20; // TypeError: Assignment to constant variable.
const b = [1, 2, 3];
b = [ 1, 4 ];  // Uncaught TypeError: Assignment to constant variable
```

# 6. Tipos de datos.
## 6.1. Tipos de datos Simples.

Los tipos de datos primitivos son:

+ Números enteros y reales.
+ Texto.
+ Booleanos.

```js
const  a = 10;
a = 20;        // TypeError: Assignment to constant variable.
const b = [1, 2, 3];
b = [ 1, 4 ];  // Uncaught TypeError: Assignment to constant variable
const pi=3.14;
// Un número muy grande (se añade n al final)
const bignumber = 12345678901234567890n;
// Un valor de verdadero o falso
let boolean = true;
```
## 6.2. Conversión entre tipos de datos.

Para convertir	 entre tipos de datos tenemos las siguientes funciones:

+ **parseInt** convierte los datos a enteros.
+ **parseFloat** convierte los datos en coma flotante.
+ **toString** para convertir a texto.

```js
let a = "12";       // es string
let b = "23.01";    // es string
let c = 50;         // es number
console.log ( c + c );  // 100
console.log ( c + a );             // 5012
console.log ( c + parseInt(a) );   // 62 
console.log ( a + b );             // 1223.01
console.log ( c + parseFloat(b) ); // 73.01 
c.toString();                      // "50", es string
```
## 6.3. Tipos de datos compuestos.
### 6.3.1. Array.

Colección de valores separados por comas y dentro de corchetes. En Javascript, a diferencia de otros lenguajes, los valores no tienen  que ser del mismo tipo.

```js
let a;
a = [ 100, 200, 23 ]; 
typeof a;              // object
a instanceof Array;    // true 
a = [ 100, "hola", true ]; 
typeof a;              // object
a instanceof Array;    // true
// Los elementos están indexados, empezando en 0
a[0]   // 100
a[1]   // "hola"
a[2]   // true
// para mostrarlos por pantalla con bucle for in
for (let i in a)  console.log (i + " ---> " + a[i]);
```

#### 6.3.1.1. Arrays → String.
Es frecuente realizar conversiones de un Array a String. Para ello se aplica el método **join** al array. Dicho método recibe una cadena de texto como separador.

La sintaxis es: `array.join(separador)`.

+ **separador** (Opcional): El carácter o cadena que se insertará entre los elementos. Si no lo incluye, el array se separará por defecto con una coma.

```js
let array = ['Tierra', 'Mar', 'Aire'];
array.join (' y ');    // "Tierra y Mar y Aire"
['Tierra', 'Mar', 'Aire'].join (' y ');    // "Tierra y Mar y Aire"
```
Si el método join no recibe ningún parámetro entonces la separación se realiza mediante comas:
```js
['Tierra', 'Mar', 'Aire'].join ();   // "Tierra,Mar,Aire"
```

#### 6.3.1.2. String → Arrays.

También es frecuente realizar conversiones de un String a Array. Para ello se aplica el método **split** al string. Dicho método recibe una cadena de texto como separador.

La sintaxis es: `cadena.split(separador)`.

+ **separador** (Opcional): El carácter o cadena que se insertará entre los elementos. Si se omite la cadena completa se guarda como un único elemento.

```js
let texto = 'Tierra y Mar y Aire';
texto.split (' y ');  // ["Tierra", "Mar", "Aire"] 
'Tierra y Mar y Aire'.split (' y ');  // ["Tierra", "Mar", "Aire"]
```
Si el método split no recibe ningún parámetro entonces se devuelve un array con un único elemento:
```js
'Tierra y Mar y Aire'.split ();       // ["Tierra y Mar y Aire"]
```
## 6.3.2. Objetos.

Colección de **clave:valor** separados por comas y dentro de llaves.

```js
let persona;
persona = { nombre:"José",  edad:30,  altura:170 };
typeof persona;              // object
// Propiedades del objeto
persona.nombre   // "José"
persona.edad     // 30
persona.altura   // 170
```
Asignación de valores a las propiedades mediante variables:
```js
let persona = { nombre: 'Jose', edad: 22 }
let miNombre = 'Juan'
let miEdad = 33

persona = { nombre: miNombre, edad: miEdad }    
// { nombre: 'Juan', edad: 33 }
let nombre = 'Eva'
let edad = 11

persona = { nombre: nombre, edad: edad }        
// { nombre: 'Eva', edad: 11 }
```
Para almacenar más de un objeto podemos crear un Array de Objetos de la siguiente forma:
```js
const usuarios = [
  { id: 1, nombre: "Ana", edad: 25 },
  { id: 2, nombre: "Luis", edad: 30 },
  { id: 3, nombre: "Sofía", edad: 22 }
];
// Los mostramos de la siguiente forma
for (let i in usuarios)  
console.log (i + " ---> " + usuarios[i].id,usuarios[i].nombre,usuarios[i].edad);
```

## 6.3.3. Set.

Los **Set** o **conjuntos**, son colecciones de elementos similares a los Array, pero con una diferencia particular: **no pueden contener elementos duplicados**. 

```js
const set = new Set();  
// Set({})               (Conjunto vacío)
const set = new Set([5, 6, 7, 8, 9]);     
// Set({5, 6, 7, 8, 9})  (Conjunto con 5 elementos)
const set = new Set([5, 5, 7, 8, 9]);     
// Set({5, 7, 8, 9})     (Conjunto con 4 elementos)
set.constructor.name;                     // "Set"

```
### 6.3.3.1. Métodos de los Set.

+ **.size** devuelve el número de elementos del set.
+ **.add(elemento)** añade un elemento al set. Devuelve el set.
+ **.has(elemento)** Comprueba si elemento ya existe en el conjunto. Devuelve si existe. Booleano
+ **.delete(elemento)** Elimina el elemento del conjunto. Devuelve si lo eliminó correctamente.


```js
const set = new Set();
set.size;    // 0
const set = new Set([5, 6, 7, 8]);
set.size;    // 4
const set = new Set([5, 6, 7, 8, 8]);
set.size;    // 4 (El 8 sólo se inserta una vez)
```
## 6.3.4. Map.

Los **Map** o **mapas**, son estructuras muy similares a los objetos de Javascript, sin embargo, son un poco más potentes y eficientes. Es una estructura que permite almacenar pares clave-valor (como los objetos), pero con ciertas diferencias:
+ Permite claves de cualquier tipo, no solo string  y symbol  como los objetos.
+ Garantiza un orden de elementos insertados, al contrario que los objetos.
+ Es una estructura de datos más eficiente para búsquedas de datos.
```js
const map = new Map();                                       
// Mapa vacío
const map = new Map([[1, "uno"]]);                           
// { 1=>"uno" }
const map = new Map([[1, "uno"], [2, "dos"], [3, "tres"]]);  
// { 1=>"uno", 2=>"dos" ... }
map.constructor.name;                     // "Map"
```
Podemos crear un Array de Maps:
```js
const usuarios = [
  { id: 1, nombre: "Ana", email: "ana@ejemplo.com" },
  { id: 2, nombre: "Luis", email: "luis@ejemplo.com" },
  { id: 3, nombre: "Sara", email: "sara@ejemplo.com" }
];
usuarios.forEach(objeto => {
  console.log(`El nombre es: ${objeto.nombre}`, `El email es: ${objeto.email}`);
});
```
### 6.3.4.1. Métodos de los Map.

+ **.size** Propiedad que devuelve el número de elementos que tiene el mapa.
+ **.set(key, value)** Establece o modifica la clave key con el valor value.
+ **.has(key)** Comprueba si key ya existe en el mapa y devuelve si existe o no.
+ **.get(key)** Obtiene el valor de la clave key del mapa.
+ **.delete(key)** Elimina el elemento con la clave key del mapa. Devuelve si lo eliminó correctamente.
+ **.clear()** Vacía el mapa completamente.

# 7 Métodos funcionales para colecciones.
## 7.1. Método map.
Crea un nuevo array con los resultados de aplicar una función a cada elemento del array original. Este método no modifica el array original.
+ Uso básico, toma un array y lo eleva al cuadrado y devuelve un nuevo array.
```js
const numeros = [1, 2, 3, 4];
const cuadrados = numeros.map(num => num ** 2);
console.log(cuadrados); // [1, 4, 9, 16]
```
+ Uso con objetos, extrae los nombres de los objetos de usuario y los coloca en un nuevo array.

```js
const usuarios = [
  { nombre: 'Luis', edad: 25 },
  { nombre: 'Ana', edad: 30 }
];
const nombres = usuarios.map(usuario => usuario.nombre);
console.log(nombres); // ['Luis', 'Ana']
```
## 7.2. Método filter.
Crea un nuevo array con todos los elementos que pasan el filtro puesto, implementado este filtro por una función. Al igual que map no modifica el array original.

+ Uso básico, filtra los números mayores que tres y devuelve un nuevo array con dichos valores.
```js
const numeros = [1, 2, 3, 4, 5];
const mayoresDeTres = numeros.filter(num => num > 3);
console.log(mayoresDeTres); // [4, 5]
``` 
+ Uso con objetos, selecciona los usuarios mayores de edad.
```js
const usuarios = [
  { nombre: 'Luis', edad: 25 },
  { nombre: 'Ana', edad: 30 },
  { nombre: 'Luis', edad: 19 }
];
const mayoresDeEdad = usuarios.filter(usuario => usuario.edad >= 18);
console.log(mayoresDeEdad); // [{ nombre: 'Luis', edad: 25 }, { nombre: 'Ana', edad: 30 }]
```
Más métodos funcionales
https://www.luisllamas.es/javascript-metodos-funcionales-en-arrays/


# 8. Operadores.

+ Operador de asignación: =
+ Operadores aritméticos: + , - , * ,** (exponencia), / , % (modulo), ++ (incremento), -- (decremento)
+ Suma de números y cadenas de caracteres: + 
```js
let x= 5 + 5;//10
let y= "5" + 5;//”55”
let z = "Hello" + 5;//”Hello5”
```
+ Operadores de asignación y aritméticos: podemos combinar los operadores aritméticos con el de asignación: +=,-=,*=,/=,%=,**= , += → x+=y --- x=x+y
+ Operadores de comparación: == , === (igual valor e igual tipo), !=,!==, >,<,>=,<=
+ Operadores lógicos: && (and), || (or), ! (not)
+ Operador spread: … utilizado para descomponer un array o una cadena de caracteres en elementos individuales.

Ejemplo de uso del operador spread:
```js
let arr1 = [1, 2, 3];
let arr2 = [...arr1, 4, 5]; 
console.log(arr2);// arr2 es [1, 2, 3, 4, 5]
```
Si el uso del operador spread
```js
let arr1 = [1, 2, 3];
let arr2 = [arr1, 4, 5]; 
console.log(arr2);// arr2 es [[1, 2, 3], 4, 5]
```

# 9. Sentencias de control.
## 9.1. Condicionales.
### 9.1.1. If else

### 9.1.2. Switch

### 9.1.2. Operador Ternario