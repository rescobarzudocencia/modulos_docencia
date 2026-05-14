# UT4 PROGRAMACIÓN ORIENTADA A OBJETOS <!-- omit in toc -->
---
- [1. Introducción](#1-introducción)
- [2. POO](#2-poo)
  - [2.1. Definiendo clases](#21-definiendo-clases)
  - [2.2. Definidendo atributos](#22-definidendo-atributos)
  - [2.3. Definiendo metodos](#23-definiendo-metodos)
- [3. Herencia](#3-herencia)
  - [3.1. Extendiendo y modificando métodos](#31-extendiendo-y-modificando-métodos)
  - [3.2. Uso de super()](#32-uso-de-super)
  - [3.3. Herencia múltiple](#33-herencia-múltiple)

---


# 1. Introducción

Se trata de un paradigma de programación introducido en los años 1970s, pero que no se hizo popular hasta años más tarde.

Este modo o paradigma de programación nos permite organizar el código de una manera que se asemeja bastante a como pensamos en la vida real, utilizando las famosas **clases**. Estas nos permiten agrupar un conjunto de variables y funciones que veremos a continuación.

Cosas de lo más cotidianas como un perro o un coche pueden ser representadas con clases. Estas clases tienen diferentes características, que en el caso del perro podrían ser la edad, el nombre o la raza. Llamaremos a estas características, **atributos**.

Por otro lado, las clases tienen un conjunto de funcionalidades o cosas que pueden hacer. En el caso del perro podría ser andar o ladrar. Llamaremos a estas funcionalidades **métodos**.

Por último, pueden existir diferentes tipos de perro. Podemos tener uno que se llama Toby o el del vecino que se llama Laika. Llamaremos a estos diferentes tipos de perro **objetos**. Es decir, el concepto abstracto de perro es la **clase**, pero Toby o cualquier otro perro particular será el **objeto**.
# 2. POO
## 2.1. Definiendo clases

Vista ya la parte teórica, vamos a ver como podemos hacer uso de la programación orientada a objetos en Python. Lo primero es crear una clase, para ello usaremos el ejemplo de perro.
```python
# Creando una clase vacía
class Perro:
    pass
```
Se trata de una clase vacía y sin mucha utilidad práctica, pero es la mínima clase que podemos crear. Notese el uso del `pass` que no hace realmente nada, pero daría un error si después de los : no tenemos contenido.

Ahora que tenemos la clase, podemos crear un objeto de la misma. Podemos hacerlo como si de una variable normal se tratase. Nombre de la variable igual a la clase con (). Dentro de los paréntesis irían los parámetros de entrada si los hubiera.

```python
# Creamos un objeto de la clase perro
mi_perro = Perro()
```

## 2.2. Definidendo atributos

A continuación vamos a añadir algunos atributos a nuestra clase. Antes de nada es importante distinguir que existen dos tipos de atributos:

+ Atributos de **instancia**: Pertenecen a la instancia de la clase o al objeto. Son atributos particulares de cada instancia, en nuestro caso de cada perro.
+ Atributos de **clase**: Se trata de atributos que pertenecen a la clase, por lo tanto serán comunes para todos los objetos.


Empecemos creando un par de atributos de instancia para nuestro perro, el nombre y la raza.
Para ello creamos un método  \_\_init\_\_ que será llamado automáticamente cuando creemos un objeto. Se trata del constructor.
```python
class Perro:
  # El método __init__ es llamado al crear el objeto
  def __init__(self, nombre, raza):
    print(f"Creando perro {nombre}, {raza}")
    # Atributos de instancia
    self.nombre = nombre
    self.raza = raza
```
Ahora que hemos definido el método init con dos parámetros de entrada, podemos crear el objeto pasando el valor de los atributos. Usando `type()` podemos ver como efectivamente el objeto es de la clase **Perro**.
```python
mi_perro = Perro("Toby", "Bulldog")
print(type(mi_perro))
# Creando perro Toby, Bulldog
# <class '__main__.Perro'>
```
Seguramente te hayas fijado en el self que se pasa como parámetro de entrada del método. Es una variable que representa la instancia de la clase, y deberá estar siempre ahí.
El uso de \_\_init\_\_ y el doble \_\_ no es una coincidencia. Cuando veas un método con esa forma, significa que está reservado para un uso especial del lenguaje. En este caso sería lo que se conoce como constructor. Hay gente que llama a estos métodos mágicos.
Por último, podemos acceder a los atributos usando el objeto y .. Por lo tanto.
```python
print(mi_perro.nombre) # Toby
print(mi_perro.raza) # Bulldog
```
Hasta ahora hemos definido atributos de instancia, ya que son atributos que pertenecen a cada perro concreto. Ahora vamos a definir un **atributo de clase**, que será común para todos los perros. Por ejemplo, la especie de los perros es algo común para todos los objetos Perro.
```python
class Perro:
  # Atributo de clase
  especie = 'mamífero'
  # El método __init__ es llamado al crear el objeto
  def __init__(self, nombre, raza):
    print(f"Creando perro {nombre}, {raza}")
    # Atributos de instancia
    self.nombre = nombre
    self.raza = raza
```
Dado que es un atributo de clase, no es necesario crear un objeto para acceder al atributos. Podemos hacer lo siguiente.
```python
print(Perro.especie) # mamífero
```
Se puede acceder también al atributo de clase desde el objeto.
```python
mi_perro = Perro("Toby", "Bulldog")
mi_perro.especie # 'mamífero'
```
De esta manera, todos los objetos que se creen de la clase perro compartirán ese atributo de clase, ya que pertenecen a la misma.
## 2.3. Definiendo metodos

En realidad cuando usamos __init__ anteriormente ya estábamos definiendo un método, solo que uno especial. A continuación vamos a ver como definir métodos que le den alguna funcionalidad interesante a nuestra clase, siguiendo con el ejemplo de perro.

Vamos a codificar dos métodos, ladrar y caminar. El primero no recibirá ningún parámetro y el segundo recibirá el número de pasos que queremos andar. Como hemos indicado anteriormente **self** hace referencia a la instancia de la clase. Se puede definir un método con **def** y el nombre, y entre **()** los parámetros de entrada que recibe, donde siempre tendrá que estar self el primero.

```python
class Perro:
  # Atributo de clase
  especie = 'mamífero'
  # El método __init__ es llamado al crear el objeto
  def __init__(self, nombre, raza):
    print(f"Creando perro {nombre}, {raza}")
    # Atributos de instancia
    self.nombre = nombre
    self.raza = raza
  def ladra(self):
    print("Guau")
  def camina(self, pasos):
    print(f"Caminando {pasos} pasos")
```
Por lo tanto si creamos un objeto mi_perro, podremos hacer uso de sus métodos llamándolos con . y el nombre del método. Como si de una función se tratase, pueden recibir y devolver argumentos.

```python
mi_perro = Perro("Toby", "Bulldog") # Creando perro Toby, Bulldog
mi_perro.ladra() # Guau
mi_perro.camina(10) # Caminando 10 pasos
```

# 3. Herencia 

Para entender la herencia, es fundamental entender la programación orientada a objetos, por lo que te recomendamos empezar por ahí antes.

La **herencia** es un proceso mediante el cual se puede crear una clase **hija** que hereda de una clase **padre**, compartiendo sus métodos y atributos. Además de ello, una clase hija puede sobreescribir los métodos o atributos, o incluso definir unos nuevos.

Se puede crear una clase hija con tan solo pasar como parámetro la clase de la que queremos heredar. 

En el siguiente ejemplo vemos como se puede usar la herencia en Python, con la clase `Perro` que hereda de `Animal`. Así de fácil.
```python
# Definimos una clase padre
class Animal:
  pass
# Creamos una clase hija que hereda de la padre
class Perro(Animal):
  pass
```

## 3.1. Extendiendo y modificando métodos

Continuemos con nuestro ejemplo de perros y animales. Vamos a definir una clase padre Animal que tendrá todos los atributos y métodos genéricos que los animales pueden tener. Esta tarea de buscar el denominador común es muy importante en programación. Veamos los atributos:

+ Tenemos la especie ya que todos los animales pertenecen a una.
+ Y la edad, ya que todo ser vivo nace, crece, se reproduce y muere.
  
Y los métodos o funcionalidades:

+ Tendremos el método hablar, que cada animal implementará de una forma. Los perros ladran, las abejas zumban y los caballos relinchan.
+ Un método moverse. Unos animales lo harán caminando, otros volando.
+ Y por último un método descríbeme que será común.
  
Definimos la clase padre, con una serie de atributos comunes para todos los animales como hemos indicado.

```python
class Animal:
  def __init__(self, especie, edad):
    self.especie = especie
    self.edad = edad
# Método genérico pero con implementación particular
  def hablar(self):
    # Método vacío
    pass
# Método genérico pero con implementación particular
  def moverse(self):
    # Método vacío
    pass
# Método genérico con la misma implementación
  def describeme(self):
    print("Soy un Animal del tipo", type(self).__name__)
```
Tenemos ya por lo tanto una clase genérica Animal, que generaliza las características y funcionalidades que todo animal puede tener. Ahora creamos una clase Perro que hereda del Animal. Como primer ejemplo vamos a crear una clase vacía, para ver como los métodos y atributos son heredados por defecto.
```python
# Perro hereda de Animal
class Perro(Animal):
  pass
mi_perro = Perro('mamífero', 10)
mi_perro.describeme() # Soy un Animal del tipo Perro
```
Con tan solo un par de líneas de código, hemos creado una clase nueva que tiene todo el contenido que la clase padre tiene, pero aquí viene lo que es de verdad interesante. Vamos a crear varios animales concretos y sobreescrbir algunos de los métodos que habían sido definidos en la clase Animal, como el hablar o el moverse, ya que cada animal se comporta de una manera distinta.
Podemos incluso crear nuevos métodos que se añadirán a los ya heredados, como en el caso de la Abeja con picar().
```python
class Perro(Animal):
  def hablar(self): 
    print("Guau!")
  def moverse(self):
    print("Caminando con 4 patas")
class Vaca(Animal):
  def hablar(self):
    print("Muuu!")
  def moverse(self):
    print("Caminando con 4 patas")
class Abeja(Animal):
  def hablar(self):
    print("Bzzzz!")
    defmoverse(self):
    print("Volando")
# Nuevo método
  def picar(self):
    print("Picar!")
```
Por lo tanto ya podemos crear nuestros objetos de esos animales y hacer uso de sus métodos que podrían clasificarse en tres:

+ Heredados directamente de la clase padre: **describeme()**
+ Heredados de la clase padre pero modificados: **hablar()** y **moverse()**
+ Creados en la clase hija por lo tanto no existentes en la clase padre: **picar()**

## 3.2. Uso de super()

En pocas palabras, la función **super()** nos permite acceder a los métodos de la clase padre desde una de sus hijas. Volvamos al ejemplo de **Animal** y **Perro**.
```python
class Animal:
  def __init__(self, especie, edad):
    self.especie = especie
    self.edad = edad
  def hablar(self):
    pass
  def moverse(self):
    pass
  def describeme(self):
    print("Soy un Animal del tipo", type(self).__name__)
```
Tal vez queramos que nuestro Perro tenga un parámetro extra en el constructor, como podría ser el dueño. Para realizar esto tenemos dos alternativas:
+ Podemos crear un nuevo \_\_init__ y guardar todas las variables una a una.
+ O podemos usar super() para llamar al \_\_init__ de la clase padre que ya aceptaba la especie y edad, y sólo asignar la variable nueva manualmente.
```python
class Perro(Animal):
  def __init__(self, especie, edad, dueño):
    # Alternativa 1
    # self.especie = especie
    # self.edad = edad
    # self.dueño = dueño
    # Alternativa 2
    super().__init__(especie, edad)
    self.dueño = dueño
mi_perro = Perro('mamífero', 7, 'Luis')
mi_perro.especie
mi_perro.edad
mi_perro.dueño
```
## 3.3. Herencia múltiple

En Python es posible realizar **herencia múltiple**. En otros posts hemos visto como se podía crear una clase padre que heredaba de una clase hija, pudiendo hacer uso de sus métodos y atributos. La herencia múltiple es similar, pero una clase **hereda de varias clases** padre en vez de una sola.
Veamos un ejemplo. Por un lado tenemos dos clases `Clase1` y `Clase2`, y por otro tenemos la `Clase3` que hereda de las dos anteriores. Por lo tanto, heredará todos los métodos y atributos de ambas.
```python
class Clase1:
  pass
class Clase2:
  pass
class Clase3(Clase1, Clase2):
  pass
```
Es posible también que una clase herede de otra clase y a su vez otra clase herede de la anterior.
```python
class Clase1:
  pass
class Clase2(Clase1):
  pass
class Clase3(Clase2):
  pass
```
