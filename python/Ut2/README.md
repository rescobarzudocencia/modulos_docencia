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
```python
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
## 2.2 Bucle WHILE
# 3. Funciones
# 4. Excepciones