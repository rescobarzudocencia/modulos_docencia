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
> **Ejemplos while**

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





# 4. Excepciones