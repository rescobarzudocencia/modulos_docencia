# UT1 INTRODUCCIÓN, INSTALACIÓN, TIPOS DE DATOS Y OPERADORES <!-- omit in toc -->
---



- [1. Introducción](#1-introducción)
- [2. Instalación de Python](#2-instalación-de-python)
- [3. Sintaxis de Python](#3-sintaxis-de-python)
  - [3.1 Entrada y salida de datos](#31-entrada-y-salida-de-datos)
- [4. Tipos de datos y operadores](#4-tipos-de-datos-y-operadores)
  - [4.1 Tipos de datos](#41-tipos-de-datos)
    - [4.1.1 Enteros](#411-enteros)
    - [4.1.2 Booleanos](#412-booleanos)
    - [4.1.3 Float](#413-float)
    - [4.1.4 Cadenas o strings](#414-cadenas-o-strings)
    - [4.1.5 Listas](#415-listas)
    - [4.1.6 Set](#416-set)
    - [4.1.7 Tupla](#417-tupla)
    - [4.1.8 Diccionario](#418-diccionario)
  - [4.2 Tipos de operadores](#42-tipos-de-operadores)
    - [4.2.1 De asignación](#421-de-asignación)


---


# 1. Introducción
Python es uno de los lenguajes de programación mas utilizado en el mundo. Según el índice
TIOBE Python está a la cabeza del ranking como podemos ver en la siguiente imagen:

![uso de python](../img/uso_python.png)

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

La página oficial es la siguiente: [Instalación de python](https://www.python.org/downloads/) donde elegirémos el SO donde vamos a realizar la instalación.

Una vez instalado comprobamos si está bien instalado con el siguiente comando, que nos mostrara la versión instalada:

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
> **Creando variables**

Las variables son los objetos que van a almacenar la información manejada de nuestro programa, para asignarle un valor se utiliza el simbolo **=**.

A con tinuación vemos varias formas de asignar valores  a las variables.
```python
x=10
x=y=z=10
x,y = 4,2
nombre="Rafael"
temp=23.3
```
> **Nombres de las variables**

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

> **Palabras reservadas en Python**

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
Python no tiene el problema de otros lenguajes que dependiendo del valor del entero a representar teníamos que  definir un tipo u otro, Python se encarga de asignar mas o menos memoria al número y podemos representar practicamente cualquier número.

```python
i = 12
print(i)          #12
print(type(i)) #<class 'int'>
```
Convertir a **int**
```python
b = int(1.6)
print(b) #1
```
### 4.1.2 Booleanos

Al igual que en otros lenguajes de programación, en Python existe el tipo bool o booleano. Es un tipo de dato que permite almacenar dos valores **True** o **False**.
```python
x = True
y = False
```
Un valor booleano también puede ser el resultado de evaluar una expresión. Ciertos operadores como el mayor que, menor que o igual que devuelven un valor bool.
```python
print(1 > 0)  #True
print(1 <= 0) #False
print(9 == 9) #True
```
### 4.1.3 Float
El tipo numérico float permite representar un número positivo o negativo con decimales, es decir, números reales. Si vienes de otros lenguajes, tal vez conozcas el tipo doble, lo que significa que tiene el doble de precisión que un float. En Python las cosas son algo distintas, y los float son en realidad double.
```python
f = 0.10093
print(f)  #0.10093
print(type(f)) #<class 'float'>
```
> ***Conversión a float**

También se puede declarar usando la notación científica con e y el exponente. El siguiente ejemplo sería lo mismo que decir 1.93 multiplicado por diez elevado a -3.
```python
f = 1.93e-3
```

También podemos convertir otro tipo a float haciendo uso de float(). Podemos ver como True es en realidad tratado como 1, y al convertirlo a float, como 1.0.
```python
a = float(True)
b = float(1)
print(a, type(a)) #1.0 <class 'float'>
print(b, type(b)) #1.0 <class 'float'>
```

> ***Rango representable***

Alguna curiosidad es que los float no tienen precisión infinita. Podemos ver en el siguiente ejemplo como en realidad f se almacena como si fuera 1, ya que no es posible representar tanta precisión decimal.

```python
f = 0.99999999999999999
print(f)
 #1.0
print(1 == f) #True
```
Los float a diferencia de los int tienen unos valores mínimo y máximos que pueden representar.
La  mínima  precisión  es  ***2.2250738585072014e-308***  y  la  máxima
***1.7976931348623157e+308***, pero si no nos crees, lo puedes verificar tu mismo.

### 4.1.4 Cadenas o strings
Las cadenas en Python o strings son un tipo inmutable que permite almacenar secuencias de
caracteres. Para crear una, es necesario incluir el texto entre comillas dobles ***"***. Puedes obtener más ayuda con el comando ***help(str)***.
```python
s = "Esto es una cadena"
print(s)  #Esto es una cadena
print(type(s)) #<class 'str'>
```
También es valido declarar las cadenas con comillas simples simples ***'***.
```python
s = 'Esto es otra cadena'
print(s)  #Esto es otra cadena
print(type(s)) #<class 'str'>
```
Las cadenas no están limitadas en tamaño, por lo que el único límite es la memoria de tu ordenador.
Una situación que muchas veces se puede dar, es cuando queremos introducir una comilla, bien sea
simple ***'*** o doble ***"*** dentro de una cadena. Si lo hacemos de la siguiente forma tendríamos un error,
ya que Python no sabe muy bien donde empieza y termina.
Para resolver este problema debemos recurrir a las secuencias de escape. En Python hay varias, pero
las analizaremos con más detalle en otro capítulo. Por ahora, la más importante es ***\"***, que nos
permite incrustar comillas dentro de una cadena.
```python
s = "Esto es una comilla doble \" de ejemplo"
print(s) #Esto es una comilla doble " de ejemplo
```
Podemos incluir un salto de línea con ***\n***.
```python
s = "Primer linea\nSegunda linea"
print(s)
#Primer linea
#Segunda linea
```
***Ejemplos de String***

Para entender mejor la clase ***string***, vamos a ver unos ejemplos de como se comportan. Podemos
sumar dos strings con el operador ***+***. Lo que hace es concatenar los String.
```python
s1 = "Parte 1"
s2 = "Parte 2"
print(s1 + " " + s2) #Parte 1 Parte 2
```
Se puede multiplicar un ***string*** por un ***int***. Su resultado es replicarlo tantas veces como el valor
del entero.
```python
s = "Hola "
print(s*3) #Hola Hola Hola
```
Con ***chr()*** and ***ord()*** podemos convertir entre carácter y su valor numérico que lo representa y
viceversa. El segundo sólo función con caracteres, es decir, un string con un solo elemento.
```python
print(chr(8364)) #€
print(ord("€")) #110
```
La longitud de una cadena viene determinada por su número de caracteres, y se puede consultar con
la función ***len()***.
```python
print(len("Esta es mi cadena"))# 17
```
> ***Algunos métodos de la Clase String***

+ ***capitalize()***
  
El método capitalize() se aplica sobre una cadena y la devuelve con su primera letra en mayúscula.
```python
s = "mi cadena"
print(s.capitalize()) #Mi cadena
``` 
+ ***lower()***
  
El método lower() convierte todos los caracteres alfabéticos en minúscula.
  ```python
  s = "MI CADENA"
  print(s.lower()) #mi cadena
  ```

+ ***swapcase()***
  
El método swapcase() convierte los caracteres alfabéticos con mayúsculas en minúsculas y viceversa.
  ```python
  s = "mI cAdEnA"
  print(s.swapcase()) #Mi CaDeNa
  ```
+ ***upper()***

El método upper() convierte todos los caracteres alfabéticos en mayúsculas.
  ```python
  s = "mi cadena"
  print(s.upper())
  ```
+  ***count(sub[,start[,end]])***
  
El método count() permite contar las veces que otra cadena se encuentra dentro de la primera.   Permite también dos parámetros opcionales que indican donde empezar y acabar de buscar.
  ```python
  s = "el bello cuello "
  print(s.count("llo")) #2
  ``` 
+  ***split(sep=None, maxsplit =-1)***
  
El método split() divide una cadena en subcadenas y las devuelve almacenadas en una lista. La división es realizada de acuerdo a el primer parámetro, y el segundo parámetro indica el número máximo de divisiones a realizar.
  ```python
  s = "Python,Java,C"
  print(s.split(",")) #['Python', 'Java', 'C']
  ``` 

### 4.1.5 Listas

Son un tipo de dato que permite almacenar datos de cualquier tipo.

> ***Crear listas en Python***

Las listas en Python son uno de los tipos o estructuras de datos más versátiles del lenguaje, ya que
permiten almacenar un conjunto arbitrario de datos. Es decir, podemos guardar en ellas prácticamente lo que sea. Si vienes de otros lenguajes de programación, se podría decir que son similares a los arrays.
```python
lista = [1, 2, 3, 4]
```
Una lista sea crea con[]separando sus elementos con comas,. Una gran ventaja es que pueden almacenar tipos de datos distintos.
```python
lista = [1, "Hola", 3.67, [1, 2, 3]]
```
Algunas propiedades de las listas:

+ Son ***ordenadas***, mantienen el orden en el que han sido definidas
+ Pueden ser formadas por tipos ***arbitrarios***.
+ Pueden ser ***indexadas*** con[i].
+ Se pueden ***anidar***, es decir, meter una dentro de la otra.
+ Son ***mutables***, ya que sus elementos pueden ser modificados.
+ Son ***dinámicas***, ya que se pueden añadir o eliminar elementos.

> ***Acceder y modificar lisas***

Si tenemos una lista a con 3 elementos almacenados en ella, podemos accederusando corchetes y un índice, que va desde 0 a n-1 siendo n el tamaño de la lista.
```python
a = [90, "Python", 3.87]
print(a[0]) #90
print(a[1]) #Python
print(a[2]) #3.87
```
Se puede también acceder al último elemento usando el índice[-1].
```python
a = [90, "Python", 3.87]
print(a[-1]) #3.87
```
También podemos tener listas anidadas, es decir, una lista dentro de otra. Incluso podemos tener una lista dentro de otra lista y a su vez dentro de otra lista. Para acceder a sus elementos sólo tenemos que usar ***[]*** tantas veces como niveles de anidado tengamos.
```python
x = [1, 2, 3, ['p', 'q', [5, 6, 7]]]
print(x[3][0]) #p
print(x[3][2][0]) #5
print(x[3][2][2]) #7
```
También es posible crear sublistas más pequeñas de una más grande. Para ello debemos de usar:entre corchetes, indicando a la izquierda el valor de inicio, y a la izquierda el valor final que no está incluido. Por lo tanto[0:2]creará una lista con los elementos[0]y[1]de la original.
```python
l = [1, 2, 3, 4, 5, 6]
print(l[0:2]) #[1, 2]
print(l[2:6]) #[3, 4, 5, 6]
```
> ***Iterar listas***

En Python es muy fácil iterar una lista, mucho más que en otros lenguajes de programación.
```python
lista = [5, 9, 10]
for l in lista:
    print(l)
```
Si necesitamos un índice acompañado con la lista, que tome valores desde 0 hasta n-1, se puede hacer de la siguiente manera.
```python
lista = [5, 9, 10]
for index, l in enumerate(lista):
  print(index, l)
```
> ***Metodos para listas***

+ ***append (obj)***
  
El método append() añade un elemento al final de la lista.
```python
l = [1, 2]
l.append(3)
print(l) #[1, 2, 3]
```
+ *** extend(iterable )***

El método extend() permite añadir una lista a la lista inicial.
```python
l = [1, 2]
l.extend([3, 4])
print(l) #[1, 2, 3, 4]
```
+ ***insert(index,obj)***

El método insert() añade un elemento en una posición o índice determinado.
```python
l = [1, 3]
l.insert(1, 2)
print(l) #[1, 2, 3]
```
+ ***remove(obj)***

El método remove() recibe como argumento un objeto y lo borra de la lista.
```python
l = [1, 2, 3]
l.remove(3)
print(l) #[1, 2]
```
+ ***pop(index=-1)***
  
El método pop() elimina por defecto el último elemento de la lista, pero si se pasa como parámetro un índice permite borrar elementos diferentes al último.
```python
l = [1, 2, 3]
l.pop()
print(l) #[1, 2]
```
+ ***reverse()***

El método reverse() inverte el órden de la lista.
```python
l = [1, 2, 3]
l.reverse()
print(l) #[3, 2, 1]
```
+ ***sort()***

El método sort() ordena los elementos de menos a mayor por defecto.
```python
l = [3, 1, 2]
l.sort()
print(l) #[1, 2, 3]
```
Y también permite ordenar de mayor a menor si se pasa como parámetro reverse=True.
```python
l = [3, 1, 2]
l.sort(reverse=True)
print(l) #[3, 2, 1]
```
+ ***index(obj[,index])***

El método index() recibe como parámetro un objeto y devuelve el índice de su primera aparición. Como hemos visto en otras ocasiones, el índice del primer elemento es el 0.
```python
l = ["Periphery", "Intervals", "Monuments"]
print(l.index("Intervals"))
```

### 4.1.6 Set
Los sets en Python son una estructura de datos usada para almacenar elementos de una manera similar a las listas, pero con ciertas diferencias.

> ***Crear set en Python***

Los set en Python son un tipo que permite almacenar varios elementos y acceder a ellos de una forma muy similar a las listas pero con ciertas diferencias:

+ Los elementos de un set son único, lo que significa que no puede haber elementos duplicados.
+ Los set son desordenados, lo que significa que no mantienen el orden de cuando son declarados.
+ Sus elementos deben ser inmutables.

Para crear un set en Python se puede hacer con ***set()*** y pasando como entrada cualquier tipo iterable, como puede ser una lista. Se puede ver como a pesar de pasar elementos duplicados como dos 8 y en un orden determinado, al imprimir el set no conserva ese orden y los duplicados se han eliminado.
```python
s = set([5, 4, 6, 8, 8, 1])
print(s)  #{1, 4, 5, 6, 8}
print(type(s)) #<class 'set'>
```
Se puede hacer lo mismo haciendo uso de **{}** y sin usar la palabra **set()** como se muestra a continuación.
```python
s = {5, 4, 6, 8, 8, 1}
print(s)  #{1, 4, 5, 6, 8}
print(type(s)) #<class 'set'>
```
A diferencia de las listas, en los set no podemos modificar un elemento a través de su índice. Si lo intentamos, tendremos un TypeError.
```python
s = set([5, 6, 7, 8])
#s[0] = 3 #Error! TypeError
```
Los sets se pueden iterar de la misma forma que las listas.
```python
s = set([5, 6, 7, 8])
for ss in s:
  print(ss) #8, 5, 6, 7
```

Con la función len() podemos saber la longitud total del set. Como ya hemos indicado, los duplicados son eliminados.
```python
s = set([1, 2, 2, 3, 4])
  print(len(s)) #4
```
> ***Metodos de los Sets***

+ ***s.add(elem)***
El método add() permite añadir un elemento al set.
```python
l = set([1, 2])
l.add(3)
print(l) #{1, 2, 3}
```
+ ***s.remove(elem)***
  
El método remove() elimina el elemento que se pasa como parámetro. Si no se encuentra, se lanza la excepción KeyError.
```python
s = set([1, 2])
s.remove(2)
print(s) #{1}
```
+ ***s.discard(elem)***
  
El método discard() es muy parecido al remove(), borra el elemento que se pasa como parámetro, y si no se encuentra no hace nada.
```python
s = set([1, 2])
s.discard(3)
print(s) #{1, 2}
```
+ ***s.pop()***
El método pop() elimina un elemento aleatorio del set.
```python
s = set([1, 2])
s.pop()
print(s) #{2}
```
+ ***s.clear()***
+ 
El método clear() elimina todos los elementos de set.
```python
s = set([1, 2])
s.clear()
print(s) #set()
```
### 4.1.7 Tupla
### 4.1.8 Diccionario
## 4.2 Tipos de operadores
### 4.2.1 De asignación