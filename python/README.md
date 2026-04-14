# INTRODUCCIÓN A PYTHON
---
![logo de python](img/logo_python.png)

[1.- Introducción.](#1-introducción)

[2.- Instalación de Python.](#2-instalación-de-python)

[3.- Sintaxis de Python.](#3-sintaxis-de-python)

[3.1 Entradas y salida de datos](#31-entrada-y-salida-de-datos)

[4.- Tipos de datos y operadores](#4-tipos-de-datos-y-operadores)

[4.1 Tipos de datos](#41-tipos-de-datos)

[4.1.1. Enteros](#411-enteros)



---


# 1. Introducción
Python es uno de los lenguajes de programación mas utilizado en el mundo. Según el índice
TIOBE Python está a la cabeza del ranking como podemos ver en la siguiente imagen:

![uso de python](img/uso_python.png)

Python es también usado para fines diversos como son los siguientes:

- **Desarrollo Web:** Existen frameworks como Django, Pyramid, Flask o Bottle que permiten desarrollar páginas web a todos los niveles.
- **Ciencia y Educación:** Debido a su sintaxis tan sencilla, es una herramienta perfecta para enseñar conceptos de programación a todos los niveles. En lo relativo a ciencia y cálculo numérico, existen gran cantidad de librerías como SciPy o Pandas.
- **Desarrollo de Interfaces Gráficos:** Gran cantidad de los programas que utilizamos tienen un interfaz gráfico que facilita su uso. Python también puede ser usado para desarrollar GUIs con librerías como Kivy o pyqt.
- **Desarrollo Software:** También es usado como soporte para desarrolladores, como para testing.
- **Machine Learning:** En los último años ha crecido el número de implementaciones en Python de librerías de aprendizaje automático como Keras, TensorFlow, PyTorch o sklearn.
- **Visualización de Datos:** Existen varias librerías muy usadas para mostrar datos en gráficas, como matplotlib, seaborn o plotly.
- **Finanzas y Trading:** Gracias a librerías como QuantLib o qtpylib y a su facilidad de uso, es cada vez más usado en estos sectores.

**Características de Python**

Como cualquier otro lenguaje, Python tiene una serie de características que lo hacen diferente al resto. Las explicamos a continuación:

- Es un lenguaje interpretado, no compilado.
- Usa tipado dinámico, lo que significa que una variable puede tomar valores de distinto tipo.
- Es fuertemente tipado, lo que significa que el tipo no cambia de manera repentina. Para que se produzca un cambio de tipo tiene que hacer una conversión explícita.
- Es multiplataforma, ya que un código escrito en macOS funciona en Windows o Linux y viceversa.

Tal vez algunos de estos conceptos puedan resultante extraños si estás empezando en el mundo de la programación. El siguiente código pretende ilustrar algunas de las características de Python.

Algunas cosas curiosidad que en otros lenguajes no pasan. La función acepta un parámetro entrada pero no se especifica su tipo. La x almacena primero una cadena, luego un float y luego un integer. La función funcion() es llamada con un int, pero su valor se divide entre 2 y el resultado es convertido automáticamente en un float.

```python
def funcion(entrada): 
    return entrada/2 
x = "Hola" 
x = 7.0 
x = int(x) 
x = funcion(x) 
print(x) #3.5
print(type(x)) #<class 'float'> 
``` 

# 2. Instalación de Python
La forma más recomendable es la instalación desde la página oficial de Python, aunque muchas distribuciones Linux ya vienen con la versión 3 instalada.

La página oficial es la siguiente: [Instalacion de python](https://www.python.org/downloads/) donde elegirémos el SO donde vamos a realizar la instalación.

Una vez instalado comprobamos si está bién instalado con el siguiente comando, que nos mostrarà la versión instalada:

```bash
python3 -V
```
# 3. Sintaxis de Python
La sintaxis es el **el conjunto de reglas que definen como se tiene que escribir el código de un determinado lenguaje de programación**. 

**Comentarios**

Son bloques de código usados para comentar el código. Ofrecer a otros programadores o a nosotros mismos información relevante acerca de código escrito. Estos comentarios no existen para el interprete de Python.

Los comentarios se indican con **#** si son de una sola línea.

```python
# esto es un comentario
```
También podemos comentar varias líneas usando triples comillas dobles o simples.

```python
""" Esto es un comentario
de varias lineas """
```
**Identación y bloques de código**

En Python los bloques de código se representan con indentación, y aunque hay un poco de debate con respecto a usar tabulador o espacios, la norma general es usar **cuatro espacios**.

En el siguiente código tenemos un **condicional if**. Justo después tenemos un **print()** indentado con cuatro espacios. Por lo tanto, todo lo que tenga esa indentación pertenecerá al bloque del if.
```python
if True: 
    print("True")
```
Esto es muy importante ya que el código anterior y el siguiente no son lo mismo. De hecho el siguiente código daría un error ya que el if no contiene ningún bloque de código, y eso es algo que no se puede hacer en Python.
```python
if True: 
print("True")
```
En Python no es necesario terminar las sentencias con **;**, basta con un salto de línea, pero si podemos usarlo para tener dos sentencias en la misma línea.

```python
x=5
y=10
# podemos declarar las dos varables en una sola línea
x=5;y=10
``` 
En algunas situaciones se puede dar el caso de que queramos tener una sola instrucción en varias línea de código. Uno de los motivos principales podría ser que fuera demasiado larga, y de hecho en la especificación PEP8 se recomienda que las líneas no excedan los 79 caracteres.

Haciendo uso de **\** se puede romper el código en varias líneas, lo que en determinados casos hace que el código sea mucho más legible.

```python
x = 1 + 2 + 3 + 4 +\

    5 + 6 + 7 + 8
```
Si por lo contrario estamos dentro de un bloque rodeado con paréntesis (), bastaría con saltar a la siguiente línea.
```python
x = (1 + 2 + 3 + 4 +
     5 + 6 + 7 + 8)
```
Se puede hacer lo mismo para llamadas a funciones
```python
def funcion(a, b, c):
    return a+b+c

d = funcion(10,
23,
3)
```
**Creando variables**

Las variables son los objetos que van a almacenar la información manejada de nuestro programa, para asignarle un valor se utiliza el simbolo **=**.

A con tinuación vemos varias formas de asignar valores  a las variables.
```python
x=10
x=y=z=10
x,y = 4,2
nombre="Rafael"
temp=23.3
```
**Nombres de las variables**

Para nombrar las variables hay que tener encuenta las siguientes normas:

- Distinción en tre mayúsculas y minúsculas, **x** y **X** son variables diferentes.
- El nombre no puede empezar por nun número.
- No se permiten en uso de guiones -
- No se permiten en uso de espacios.

Ejemplos:

```python
# Valido
_variabe=10
variable10=10
Variable=10
# No Valido
2variabe=10
var-iable=10
var iable=10
```

**Palabras reservadas en Python**
Son palabras que no podemos utilizar para nombrar variables ni funciones, ya que las reserva internamente para su funcionamiento.

```python
import keyword
print(keyword.kwlist)

# ['False', 'None', 'True', 'and', 'as', 'assert',
# 'async', 'await', 'break', 'class', 'continue',
# 'def', 'del', 'elif', 'else', 'except', 'finally',
# 'for', 'from', 'global', 'if', 'import', 'in', 'is',
# 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise',
# 'return', 'try', 'while', 'with', 'yield']
``` 

## 3.1 Entrada y salida de datos

Para leer desde teclado utilizamos **input** y para mostrar los datos por pantalla utlizamos **print**, en el siguiente ejemplo vemos como utilizamos los dos comandos.

```python
#Entrada 
cadena = input("Introduce una cadena: ")

#Salida print(cadena) 
#Como formatear texto y variables en un print 
nombre = "Marcos" 
apellidos = "Rivera Gavilán" 
correo = "riveragavilanmarcos@gmail.com" 

print("Hola me llamo " + nombre + " " + apellidos + " y mi correo es " + correo)
#El + concatena sin espacios 

print(f"Hola me llamo {nombre} {apellidos} y mi correo es {correo}")
# Al estar dentro de una cadena ponemos los espacios normalmente 

print("Hola me llamo {} {} y mi correo es {}".format(nombre, apellidos, correo))
# Al estar dentro de una cadena ponemos los espacios normalmente
```


# 4. Tipos de datos y operadores
## 4.1 Tipos de datos
### 4.1.1 Enteros