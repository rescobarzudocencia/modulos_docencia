# UT2 ESTRUCTURAS DE CONTROL, FUNCIONES Y EXCEPCIONES <!-- omit in toc -->
---
- [1. Sentencias Condicionales](#1-sentencias-condicionales)
  - [1.1 Sentencia IF](#11-sentencia-if)
  - [1.2 Match](#12-match)
- [2. Sentencias Repetitivas](#2-sentencias-repetitivas)
  - [2.1 Bucle FOR](#21-bucle-for)
  - [2.2 Bucle WHILE](#22-bucle-while)
- [3. Funciones](#3-funciones)
- [4. Excepciones](#4-excepciones)




# 1. Sentencias Condicionales
## 1.1 Sentencia IF

Un ejemplo sería si tenemos dos valores a y b que queremos dividir. Antes de entrar en el bloque de código que divide a/b, sería importante verificar que b es distinto de cero, ya que la división por cero no está definida. Es aquí donde entran los condicionales if.
```python
a = 4
b = 2
if b != 0:
  print(a/b)
```
En este ejemplo podemos ver como se puede usar un if en Python. Con el operador != se comprueba que el número b sea distinto de cero, y si lo es, se ejecuta el código que está indentado.
Por lo tanto un if tiene dos partes:

+ La condición que se tiene que cumplir para que el bloque de código se ejecute, en nuestro caso b!=0.
+ El bloque de código que se ejecutará si se cumple la condición anterior.
  
Es muy importante tener en cuenta que la sentencia if debe ir terminada por : y el bloque de código a ejecutar debe estar indentado. Si usas algún editor de código, seguramente la indentación se producirá automáticamente al presionar enter. Nótese que el bloque de código puede también contener más de una línea, es decir puede contener más de una instrucción.

```python
if b != 0:
  c = a/b
  d = c + 1
  print(d)
```
Todo lo que vaya después del if y esté indentado, será parte del bloque de código que se ejecutará si la condición se cumple. Por lo tanto el segundo print() “Fuera if” será ejecutado siempre, ya que está fuera del bloque if.

```python
if b != 0:
  c = a/b
  print("Dentro if")
print("Fuera if")
```
Se puede también combinar varias condiciones entre el if y los :. Por ejemplo, se puede requerir que un número sea mayor que 5 y además menor que 15. Tenemos en realidad tres operadores usados conjuntamente, que serán evaluados por separado hasta devolver el resultado final, que será True si la condición se cumple o False de lo contrario.
```python
a = 10
if a > 5 and a < 15:
	print("Mayor que 5 y menos que 15")
```
Es muy importante tener en cuenta que a diferencia de en otros lenguajes, en Python no puede haber un bloque if vacío. El siguiente código daría un SyntaxError. 
```python
if a > 5:
```
Por lo tanto si tenemos un if sin contenido, tal vez porque sea una tarea pendiente que estamos dejando para implementar en un futuro, es necesario hacer uso de **pass** para evitar el error. Realmente **pass** no hace nada, simplemente es para tener contento al interprete de código.
```python
if a > 5:
	pass
```
Algo no demasiado recomendable pero que es posible, es poner todo el bloque que va dentro del if en la misma línea, justo a continuación de los :. Si el bloque de código no es muy largo, puede ser útil para ahorrarse alguna línea de código.
```python
if a > 5: print("Es > 5")
```
Si tu bloque de código tiene más de una línea, se pueden poner también en la misma línea
separándolas con ;.
```python
if a > 5: print("Es > 5"); print("Dentro del if")
```

> **Uso de else y elif**

Es posible que no solo queramos hacer algo si una determinada condición se cumple, sino que además queramos hacer algo de lo contrario. Es aquí donde entra la cláusula** else.** La parte del if se comporta de la manera que ya hemos explicado, con la diferencia que si esa condición no se cumple, se ejecutará el código presente dentro del else. Notese que ambos bloque de código son excluyentes, se entra o en uno o en otro, pero nunca se ejecutarán los dos.

```python
x = 5
if x == 5:
  print("Es 5")
else:
  print("No es 5")
```


Con la cláusula **elif** podemos ejecutar tantos bloques de código distintos como queramos según la condición. Traducido al lenguaje natural, sería algo así como decir: si es igual a 5 haz esto, si es igual a 6 haz lo otro, si es igual a 7 haz lo otro.
Se puede usar también de manera conjunta todo, el if con el elif y un else al final. Es muy
importante notar que if y else solamente puede haber uno, mientras que elif puede haber
varios.
```python
x = 5
if x == 5:
	print("Es 5")
elif x == 6:
	print("Es 6")
elif x == 7:
	print("Es 7")
else:
	print("Es otro")
```

> **Operador ternario**

El operador ternario  es una herramienta muy potente que muchos lenguajes de programación tienen. En Python es un poco distinto a lo que sería en C, pero el
concepto es el mismo. Se trata de una cláusula if, else que se define en una sola línea y puede ser usado por ejemplo, dentro de un print().
```python
x = 5
print("Es 5" if x == 5 else "No es 5") #Es 5
```
Existen tres partes en un operador ternario, que son exactamente iguales a los que había en un if else. Tenemos la condición a evaluar, el código que se ejecuta si se cumple, y el código que se ejecuta si no se cumple. En este caso, tenemos los tres en la misma línea.
```
# [código si se cumple] if [condición] else [código si no se cumple]
```

## 1.2 Match

Match es similar a los Switch o Case que ofrecen otros lenguajes de programación.
Para ver el funcinamiento vamos a ver el siguiente ejemplo, dependiendo del valor de la hora del día vamos a indicar si estamos desayunando, almorzando o cenando. Primero vamos a verlo con sentencias If y después lo veremos con la sentencia match.

**Ejemplo If**
```python
if hora == 8:
	print("Desayuno")
elif hora == 14:
	print("Comida")
elif hora == 21:
	print("Cena")
else:
	print("No toca comer")
```
**Con match:**
```python
hora = 8
match hora:
	case 8:
		print("Desayuno")
	case 14:
		print("Comida")
	case 21:
		print("Cena")
	case _:
		print("No toca comer")
```
# 2. Sentencias Repetitivas
## 2.1 Bucle FOR


El for es un tipo de bucle, que el  número de iteraciones de un esta definido de antemano, mientras que en un while no. En el siguiente ejemplo vemos un bucle for que se ejecuta 5 veces, y donde la i incrementa su valor “automáticamente” en 1 en cada iteración.
```python
for i in range(0, 5):
	print(i)
# Salida: 0  1  2  3  4
```


En Python se puede iterar prácticamente todo, como por ejemplo una cadena. En el siguiente
ejemplo vemos como la i va tomando los valores de cada letra. Mas adelante explicaremos que es esto de los **iterables** e **iteradores**.
```python
for i in "Python":
print(i)
#Salida: P y t h o n
```

> **Iterables e iteradores**

Para entender al cien por cien los bucles for, y como Python fue diseñado como lenguaje de
programación, es muy importante entender los conceptos de iterables e iteradores. 
Empecemos con un par de definiciones:
+ Los **iterables** son aquellos objetos que como su nombre indica pueden ser iterados, lo que dicho de otra forma es, que puedan ser indexados. Si piensas en un array (o una list en Python), podemos indexarlo con lista por ejemplo, por lo que sería un iterable.
+ Los **iteradores** son objetos que hacen referencia a un elemento, y que tienen un método next que permite hacer referencia al siguiente.

> **For anidados**

Es posible anidar los for, es decir, meter uno dentro de otro. Esto puede ser muy útil si
queremos iterar algún objeto que en cada elemento, tiene a su vez otra clase iterable. Podemos tener por ejemplo, una lista de listas, una especie de matriz.
```python
lista = [[56, 34, 1],
		[12, 4, 5],
		[9, 4, 3]]
```
Si iteramos usando sólo un for, estaremos realmente accediendo a la segunda lista, pero no a los elementos individuales.
```python
for i in lista:
	print(i)
#[56, 34, 1]
#[12, 4, 5]
#[9, 4, 3]
```
Si queremos acceder a cada elemento individualmente, podemos anidar dos for. Uno de ellos se encargará de iterar las columnas y el otro las filas.
```python
for i in lista:
	for j in i:
		print(j)
# Salida: 56,34,1,12,4,5,9,4,3
```
> **Ejemplos for**

Iterando cadena al revés. Haciendo uso de [::-1] se puede iterar la lista desde el último al primer elemento.
```python
texto = "Python"
for i in texto[::-1]:
	print(i) #n,o,h,t,y,P
```
Itera la cadena saltándose elementos. Con [::2] vamos tomando un elemento si y otro no.
```python
texto = "Python"
for i in texto[::2]:
	print(i) #P,t,o
```

> **Uso del range**

Uno de las iteraciones mas comunes que se realizan, es la de iterar un número entre por ejemplo 0 y n. Si ya programas, estoy seguro de que estas cansado de escribir esto, aunque sea en otro lenguaje.
Pongamos que queremos iterar una variable i de 0 a 5. Haciendo uso de lo que hemos visto
anteriormente, podríamos hacer lo siguiente.
```python
for i in (0, 1, 2, 3, 4, 5):
	print(i) #0, 1, 2, 3, 4, 5
```
Se trata de una solución que cumple con nuestro requisito. El contenido después del in se trata de una clase que como ya hemos visto antes, es iterable, y es de hecho una tupla. Sin embargo, hay otras formas de hacer esto en Python, haciendo uso del range().
```python
for i in range(6):
	print(i) #0, 1, 2, 3, 4, 5
```
El range() genera una secuencia de números que van desde 0 por defecto hasta el número que se pasa como parámetro menos 1. En realidad, se pueden pasar hasta tres parámetros separados por coma, donde el primer es el inicio de la secuencia, el segundo el final y el tercero el salto que se desea entre números. Por defecto se empieza en 0 y el salto es de 1.
```
#range(inicio, fin, salto)
```
Por lo tanto, si llamamos a range() con (5,20,2), se generarán números de 5 a 20 de dos en
dos. Un truco es que el range() se puede convertir en list.
Y mezclándolo con el for, podemos hacer lo siguiente.
```python
for i in range(5, 20, 2):
	print(i) #5,7,9,11,13,15,17,19
```

## 2.2 Bucle WHILE

El uso del while nos permite ejecutar una sección de código repetidas veces, de ahí su nombre.
El código se ejecutará mientras una condición determinada se cumpla. Cuando se deje de cumplir, se saldrá del bucle y se continuará la ejecución normal. Llamaremos iteración a una ejecución completa del bloque de código.
Cabe destacar que existe dos tipos de bucles, los que tienen un número de iteraciones no definidas, y los que tienen un número de iteraciones definidas. El while estaría dentro del primer tipo. Mas adelante veremos los for, que se engloban en el segundo.
```python
x = 5
while x > 0:
	x -=1
	print(x) # Salida: 4,3,2,1,0
```

Por lo tanto el while tiene dos partes:
+ La condición que se tiene que cumplir para que se ejecute el código.
+ El bloque de código que se ejecutará mientras la condición se cumpla.
```python
while True:
	print("Bucle infinito")
```
Es posible tener un while en una sola línea, algo muy útil si el bloque que queremos ejecutar es corto. En el caso de tener mas de una sentencia, las debemos separar con ;.
```python
x = 5
while x > 0: x-=1; print(x)
```

También podemos usar otro tipo de operación dentro del while, como la que se muestra a
continuación. En este caso tenemos una lista que mientras no este vacía, vamos eliminando su primer elemento.
```python
x = ["Uno", "Dos", "Tres"]
while x:
	x.pop(0)
	print(x)
#['Dos', 'Tres']
#['Tres']
#[]
```

> **Else y while**

Algo no muy corriente en otros lenguajes de programación pero si en Python, es el uso de la
cláusula else al final del while. Podemos ver el ejemplo anterior mezclado con el else. La
sección de código que se encuentra dentro del else, se ejecutará cuando el bucle termine, perosolo si lo hace “por razones naturales”. Es decir, si el bucle termina porque la condición se deja de cumplir, y no porque se ha hecho uso del break.
```python
x = 5
while x > 0:
	x -=1
	print(x) #4,3,2,1,0
else:
	print("El bucle ha finalizado")
```
> **Bucles anidados**

Ya hemos visto que los bucles while tienen una condición a evaluar y un bloque de código a
ejecutar. Hemos visto ejemplos donde el bloque de código son operaciones sencillas como la resta -, pero podemos complicar un poco mas las cosas y meter otro bucle while dentro del primero. Es algo que resulta especialmente útil si por ejemplo queremos generar  permutaciones de números, es decir, si queremos generar todas las combinaciones posibles. Imaginemos que queremos generar todas las combinaciones de de dos números hasta 2. Es decir, 0-0, 0-1, 0-2,… hasta 2-2.
```python
# Permutación a generar
i = 0
j = 0
while i < 3:
	while j < 3:
		print(i,j)
		j += 1
	i += 1
	j = 0
```
> **Ejemplo while**

Árbol de navidad en Python. Imprime un árbol de navidad formado con * haciendo uso del while y de la multiplicación de un entero por una cadena, cuyo resultado en Python es replicar la cadena.
```python
z = 7
x = 1
while z > 0:
print(' ' * z + '*' * x + ' ' * z)
x+=2
z-=1
# *
# ***
# *****
# *******
# *********
# ***********
```
# 3. Funciones
Python tiene funciones nativas como **len()** para calcular la longitud de una lista, pero al igual que en otros lenguajes de programación, también podemos definir **nuestras propias funciones**. Para ello hacemos uso de **def**.
```python
def nombre_funcion(argumentos):
    código
    return retorno
```

Cualquier función tendrá un **nombre**, unos **argumentos de entrada**, un **código** a ejecutar y unos **parámetros de salida**. Al igual que las funciones matemáticas, en programación nos permiten realizar diferentes operaciones con la entrada, para entregar una determinada salida que dependerá del código que escribamos dentro. Por lo tanto, es totalmente análogo al clásico **y=f(x)** de las matemáticas.

```python
def f(x):
    return 2*x
y=f(3)
print(y) # 6
```
> **Pasando argumentos de entrada**

+ **Argumentos por posición**
Los argumentos por posición o **posicionales **son la forma más básica e intuitiva de pasar parámetros. Si tenemos una función **resta()** que acepta dos parámetros, se puede llamar como se muestra a continuación.
```python
def resta(a, b):
    return a-b
resta(5, 3) # 2
```
Al tratarse de parámetros posicionales, se interpretará que el primer número es la **a** y el segundo la **b.** El número de parámetros es fijo, por lo que si intentamos llamar a la función con solo uno, dará error.
```python
resta(1) # Error! TypeError
```
Tampoco es posible usar mas argumentos de los tiene la función definidos, ya que no sabría que hacer con ellos. Por lo tanto si lo intentamos, Python nos dirá que toma 2 posicionales y estamos pasando 3, lo que no es posible.
```python
#TypeError: resta() takes 2 positional arguments but 3 were given
resta(5,4,3) # Error
```
+ **Argumentos por nombre**

Otra forma de llamar a una función, es usando el nombre del argumento con **=** y su valor. El siguiente código hace lo mismo que el código anterior, con la diferencia de que los argumentos no son posicionales.
```python
resta(a=3, b=5) # -2
```
Al indicar en la llamada a la función el nombre de la variable y el valor, el orden ya no importa, y se podría llamar de la siguiente forma.
```python
resta(b=5, a=3) # -2
```

+ **Argumentos por defecto**

Tal vez queramos tener una función con algún parámetro opcional, que pueda ser usado o no dependiendo de diferentes circunstancias. Para ello, lo que podemos hacer es asignar un valor por defecto a la función. En el siguiente caso **c** valdría cero salvo que se indique lo contrario.
```python
def suma(a, b, c=0):
    return a+b+c
suma(5,5,3) # 13
```
Dado que el parámetro **c** tiene un valor por defecto, la función puede ser llamada sin ese valor.
```python
suma(4,3) # 7
```
Podemos incluso asignar un valor por defecto a todos los parámetros, por lo que se podría llamar a la función sin ningún argumento de entrada.
```python
def suma(a=3, b=5, c=0):
    return a+b+c
suma() # 8
```
Las siguientes llamadas a la función también son válidas
```python
suma(1)     # 6
suma(4,5)   # 9
suma(5,3,2) # 10
```
O haciendo uso de lo que hemos visto antes y usando los nombres de los argumentos.
```python
suma(a=5, b=3) #8
```

+ **Argumentos de longitud variable**

Imaginemos que queremos una función suma() como la de antes, pero en este caso necesitamos que sume todos los números de entrada que se le pasen, sin importar si son 3 o 100. Una primera forma de hacerlo sería con una lista.
```python
def suma(numeros):
    total = 0
    for n in numeros:
        total += n
    return total
suma([1,3,5,4]) # 13
```
Python tiene una herramienta muy potente. Si declaramos un argumento con **\***, esto hará que el argumento que se pase sea empaquetado en una tupla de manera automática. No confundir **\*** con los punteros en otros lenguajes de programación, no tiene nada que ver.
```python
def suma(*numeros):
    print(type(numeros))    # <class 'tuple'>
    total = 0
    for n in numeros:
        total += n
    return total
suma(1, 3, 5, 4) # 13
```
Usando doble ** es posible también tener como parámetro de entrada una lista de elementos almacenados en forma de clave y valor. En este caso podemos iterar los valores haciendo uso de **items()**.
```python
def suma(**kwargs):
    suma = 0;
    for key, value in kwargs.items():
        print(key, value)
        suma += value
    return suma
suma(a=5, b=20, c=23) # 48
```
> **Sentencia Return**

El uso de la sentencia return permite realizar dos cosas:

+ Salir de la función y transferir la ejecución de vuelta a donde se realizó la llamada.
+ Devolver uno o varios parámetros, fruto de la ejecución de la función.

> **Paso por valor y referencia**

En muchos lenguajes de programación existen los conceptos de paso por **valor** y por **referencia** que aplican a la hora de como trata una función a los parámetros que se le pasan como entrada. Su comportamiento es el siguiente:

+ Si usamos un parámetro pasado por **valor**, se creará una copia local de la variable, lo que implica que cualquier modificación sobre la misma no tendrá efecto sobre la original.
+ Con una variable pasada como **referencia**, se actuará directamente sobre la variable pasada, por lo que las modificaciones afectarán a la variable original.
  
En Python las cosas son un poco distintas, y el comportamiento estará definido por el tipo de variable con la que estamos tratando. 

Veamos un ejemplo de paso por valor.
```python
x = 10
def funcion(entrada):
    entrada = 0
funcion(x)
print(x) # 10
```
Vemos como el valor de x no se modifica.
No pasa lo mismo si por ejemplo x es una lista como en el siguiente ejemplo. En este caso Python lo trata como si estuviese pasada por referencia, lo que hace que se modifique la variable original. La variable original x ha sido modificada.
```python
x = [10, 20, 30]
def funcion(entrada):
 entrada.append(40)
funcion(x)
print(x) # [10, 20, 30, 40]
```
> **Funciones lambda**

Las funciones **lambda** o anónimas son un tipo de funciones en Python que típicamente se definen en una línea y cuyo código a ejecutar suele ser pequeño.
Lo que significa algo así como, “las funciones lambda son simplemente una versión acortada, que puedes usar si te da pereza escribir una función”
Lo que sería una función que suma dos números como la siguiente.
```python
def suma(a, b):
    return a+b
```
Se podría expresar en forma de una función lambda de la siguiente manera.
```python
lambda a, b : a + b
```
La primera diferencia es que una función lambda no tiene un nombre, y por lo tanto salvo que sea asignada a una variable, es totalmente inútil. Para ello debemos.
```python
suma = lambda a, b: a + b
```
Una vez tenemos la función, es posible llamarla como si de una función normal se tratase.
```python
suma(2, 4)
```
Si es una función que solo queremos usar una vez, tal vez no tenga sentido almacenarla en una variable. Es posible declarar la función y llamarla en la misma línea.
```python
(lambda a, b: a + b)(2, 4)
```

> **Recursividad**

La recursividad o recursión es un concepto que proviene de las matemáticas, y que aplicado al mundo de la programación nos permite resolver problemas o tareas donde las mismas pueden ser divididas en subtareas cuya funcionalidad es la misma. Dado que los  subproblemas a resolver son de la misma naturaleza, se puede usar la misma función para resolverlos. Dicho de otra manera, una función recursiva es aquella que está definida en función de sí misma, por lo que se llama repetidamente a sí misma hasta llegar a un punto de salida.
Cualquier función recursiva tiene dos secciones de código claramente divididas:

+ Por un lado tenemos la sección en la que la función se llama a sí misma.
+ Por otro lado, tiene que existir siempre una condición en la que la función retorna sin volver a llamarse. Es muy importante porque de lo contrario, la función se llamaría de manera indefinida.
  
Veamos unos ejemplos con el factorial y la serie de fibonacci.

**Calcular factorial**

Uno de los ejemplos mas usados para entender la recursividad, es el cálculo del factorial de un número n!. El factorial de un número n se define como la multiplicación de todos sus números predecesores hasta llegar a uno. Por lo tanto 5!, leído como cinco factorial, sería 5\*4\*3\*2\*1.
Utilizando un enfoque tradicional no recursivo, podríamos calcular el factorial de la siguiente manera.
```python
def factorial_normal(n):
    r = 1
  i = 2
    while i <= n:
        r *= i
        i += 1
    return r
factorial_normal(5) # 120
```
Dado que el factorial es una tarea que puede ser dividida en subtareas del mismo tipo (multiplicaciones), podemos darle un enfoque recursivo y escribir la función de otra manera.
```python
def factorial_recursivo(n):
    if n == 1:
        return 1
    else:
        return n * factorial_recursivo(n-1)
factorial_recursivo(5) # 120
```
**Serie de Fibonacci**

Otro ejemplo muy usado para ilustrar las posibilidades de la recursividad, es calcular la serie de fibonacci. Dicha serie calcula el elemento n sumando los dos anteriores n-1 + n-2. Se asume que los dos primeros elementos son 0 y 1.
```python
def fibonacci_recursivo(n):
    if n == 0:
        return 0
    elif n == 1:
       return 1
    else:
        return fibonacci_recursivo(n-1) + fibonacci_recursivo(n-2)
fibonacci_recursivo(7)# 13
```
Podemos ver que siempre que la n sea distinta de cero o uno, se llamará recursivamente a la función, buscando los dos elementos anteriores. Cuando la n valga cero o uno se dejará de llamar a la función y se devolverá un valor concreto. Podemos calcular el elemento 7, que será 0,1,1,2,3,5,8,13, es decir, 13.

# 4. Excepciones

Las excepciones en Python son una herramienta muy potente que la gran mayoría de lenguajes de programación modernos tienen. Se trata de una **forma de controlar el comportamiento de un programa cuando se produce un error**.
Esto es muy importante ya que salvo que tratemos este error, el programa se parará, y esto es algo que en determinadas aplicaciones no es una opción válida.
Imaginemos que tenemos el siguiente código con dos variables a y b y realizamos su división a/b.
```
a = 4
b = 2
c = a/b
```
Pero imaginemos ahora que por cualquier motivo las variables tienen otro valor, y que por ejemplo b tiene el valor 0. Si intentamos hacer la división entre cero, este programa dará un error y su ejecución terminará de manera abrupta.
```python
a = 4; b = 0
print(a/b)# ZeroDivisionError: division by zero
```
Ese “error” que decimos que ha ocurrido es lanzado por Python (raise en Inglés) ya que la división entre cero es una operación que matemáticamente no está definida.

Se trata de la excepción **ZeroDivisionError**. 

En base a esto es muy importante controlar las excepciones, porque por muchas comprobaciones que realicemos es posible que en algún momento ocurra una, y si no se hace nada el programa se parará.

Una primera aproximación al control de excepciones podría ser el siguiente ejemplo. Podemos realizar una comprobación manual de que no estamos dividiendo por cero, para así evitar tener un error tipo ZeroDivisionError.

Sin embargo es complicado escribir código que contemple y que prevenga todo tipo de excepciones. Para ello, veremos más adelante el uso de except.
```python
a = 5
b = 0
# A través de esta comprobación prevenimos que se divida entre cero.
if b!=0:
    print(a/b)
else:
    print("No se puede dividir!")
```
> **Uso de raise**

También podemos ser nosotros los que levantemos o lancemos una excepción. Volviendo a los ejemplos usados en el apartado anterior, podemos ser nosotros los que levantemos ZeroDivisionError o NameError usando raise. La sintaxis es muy fácil.
```python
raise ZeroDivisionError("Información de la excepción")
```
O podemos lanzar otra de tipo NameError.
```python
raise NameError("Información de la excepción")
```
Se puede ver como el string que hemos pasado se imprime a continuación de la excepción. Se puede llamar también sin ningún parámetro como se hace a continuación.
```python
raise ZeroDivisionError
```
Visto esto, ya sabemos como una excepción puede ser lanzada. Existen dos maneras principalmente:

+ Hacemos una operación que no puede ser realizada (como dividir por cero). En este caso Python se encarga de lanzar automáticamente la excepción.
+ O también podemos lanzar nosotros una excepción manualmente, usando **raise**.
+ Habría un tercer caso que sería lanzar una excepción que no pertenece a las definidas por defecto en Python. 
  
A continuación veremos que podemos hacer para controlar estas excepciones, y que hacer cuando se lanza una para que no se interrumpa la ejecución del programa.

> **Uso de try y except**

La buena noticia es que las excepciones que hemos visto antes, pueden ser capturadas y manejadas adecuadamente, sin que el programa se detenga. Veamos un ejemplo con la división entre cero.
```python
a = 5; b = 0
try:
    c = a/b
except ZeroDivisionError:
    print("No se ha podido realizar la división")
```
En este caso no verificamos que **b!=0**. Directamente intentamos realizar la división y en el caso de que se lance la excepción **ZeroDivisionError**, la capturamos y la tratamos adecuadamente.
La diferencia con el ejemplo anterior es que ahora no se para el programa y se puede seguir ejecutando. Prueba a ejecutar el código y ver que pasa. Verás como el programa ya no se para.
Entonces, lo que hay dentro del **try** es la sección del código que podría lanzar la excepción que se está capturando en el **except**. Por lo tanto cuando ocurra una excepción, se entra en el **except** pero **el programa no se para**.


También se puede capturar diferentes excepciones como se ve en el siguiente ejemplo.
```python
try:
    #c = 5/0       # Si comentas esto entra en TypeError
    d = 2 + "Hola" # Si comentas esto entra en ZeroDivisionError
except ZeroDivisionError:
    print("No se puede dividir entre cero!")
except TypeError:
    print("Problema de tipos!")
```

> **Uso de else**

Al ya explicado **try** y **except** le podemos añadir un bloque más, el **else**. Dicho bloque se ejecutará si no ha ocurrido ninguna excepción. Fíjate en la diferencia entre los siguientes códigos.
```python
try:
    # Forzamos una excepción al dividir entre 0
    x = 2/0
except:
    print("Entra en except, ha ocurrido una excepción")
else:
    print("Entra en else, no ha ocurrido ninguna excepción")
#Entra en except, ha ocurrido una excepción
```

> **Uso de finally**

A los ya vistos bloques **try**, **except** y **else** podemos añadir un bloque más, el **finally**. Dicho bloque se ejecuta siempre, haya o no haya habido excepción.

Este bloque se suele usar si queremos ejecutar algún tipo de acción de limpieza. Si por ejemplo estamos escribiendo datos en un fichero pero ocurre una excepción, tal vez queramos borrar el contenido que hemos escrito con anterioridad, para no dejar datos inconsistentes en el fichero.

En el siguiente código vemos un ejemplo. Haya o no haya excepción el código que haya dentro de finally será ejecutado.
```python
try:
    # Forzamos excepción
    x = 2/0
except:
    # Se entra ya que ha habido una excepción
    print("Entra en except, ha ocurrido una excepción")
finally:
    # También entra porque finally es ejecutado siempre
    print("Entra en finally, se ejecuta el bloque finally")
#Entra en except, ha ocurrido una excepción
#Entra en finally, se ejecuta el bloque finally
```
