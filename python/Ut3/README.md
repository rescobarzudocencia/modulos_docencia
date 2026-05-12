# UT3 ESTRUCTURA DE DATOS DINÁMICAS <!-- omit in toc -->
---
- [1. Listas](#1-listas)
- [2. Set](#2-set)
- [3. Tupla](#3-tupla)
- [4 Diccionario](#4-diccionario)

---


# 1. Listas



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

# 2. Set
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

El método clear() elimina todos los elementos de set.
```python
s = set([1, 2])
s.clear()
print(s) #set()
```
# 3. Tupla

Las tuplas en Python son un tipo o estructura de datos que permite almacenar datos de una manera muy parecida a las listas, con la salvedad de que son inmutables.

> ***Crear una Tupla en Python***

Las tuplas en Python o tuples son muy similares a las listas, pero con dos diferencias. Son inmutables, lo que significa que no pueden ser modificadas una vez declaradas, y en vez de inicializarse con corchetes se hace con ***()***. Dependiendo de lo que queramos hacer, las tuplas pueden ser más rápidas.
```python
tupla = (1, 2, 3)
print(tupla) #(1, 2, 3)
```
También pueden declararse sin ***()***, separando por , todos sus elementos.
```python
tupla = 1, 2, 3
print(type(tupla)) #<class 'tuple'>
print(tupla)  #(1, 2, 3)
```
> ***Operaciones con tuplas***

Como hemos comentado, las tuplas son tipos inmutables, lo que significa que una vez asignado su valor, no puede ser modificado. Si se intenta, tendremos un TypeError.
Como las Listas pueden ser anidadas.

Se puede iterar una tupla de la misma forma que se hacía con las listas.
```python
tupla = [1, 2, 3]
for t in tupla:
  print(t) #1, 2, 3
```
> ***Métodos con tuplas***

+ ***count(obj)***

El método count() cuenta el número de veces que el objeto pasado como parámetro se ha encontrado en la lista.
```python
l = [1, 1, 1, 3, 5]
print(l.count(1)) #3
```

+ ***index(obj[,index])***

El método index() busca el objeto que se le pasa como parámetro y devuelve el índice en el que se ha encontrado.
```python
l = [7, 7, 7, 3, 5]
print(l.index(5)) #4
```
En el caso de no encontrarse, se devuelve un ValueError.
```python
l = [7, 7, 7, 3, 5]
#print(l.index(35)) #Error! ValueError
```
El método index() también acepta un segundo parámetro opcional, que indica a partir de que índice empezar a buscar el objeto.
```python
l = [7, 7, 7, 3, 5]
print(l.index(7, 2)) #2
```

# 4 Diccionario
Los diccionarios en Python son una estructura de datos que permite almacenar su contenido en forma de llave y valor.

> ***Crear dicionarios en Python***
>
Un diccionario en Python es una colección de elementos, donde cada uno tiene una llave ***key*** y un valor ***value***. Los diccionarios se pueden crear con paréntesis ***{}*** separando con una coma cada par ***key: value***. En el siguiente ejemplo tenemos tres keys que son el nombre, la edad y el documento.
```python
d1 = {
"Nombre": "Sara",
"Edad": 27,
"Documento": 1003882
}
print(d1) #{'Nombre': 'Sara', 'Edad': 27, 'Documento': 1003882}
```
Otra forma equivalente de crear un diccionario en Python es usando dict() e introduciendo los pares key: value entre paréntesis.
```python
d2 = dict([
('Nombre', 'Sara'),
('Edad', 27),
('Documento', 1003882),])
print(d2) #{'Nombre': 'Sara', 'Edad': '27', 'Documento': '1003882'}
```
También es posible usar el constructor dict() para crear un diccionario.
```python
d3 = dict(Nombre='Sara',
Edad=27,
Documento=1003882)
print(d3) #{'Nombre': 'Sara', 'Edad': 27, 'Documento': 1003882}
```
Algunas propiedades de los diccionario en Python son las siguientes:
+ Son dinámicos, pueden crecer o decrecer, se pueden añadir o eliminar elementos.
+ Son indexados, los elementos del diccionario son accesibles a través del key.
+ Y son anidados, un diccionario puede contener a otro diccionario en su campo value.

> ***Acceder y modificar elementos***

Se puede acceder a sus elementos con [] o también con la función get()
```python
print(d1['Nombre'])  #Sara
print(d1.get('Nombre')) #Sara
```

Para modificar un elemento basta con usar [] con el nombre del key y asignar el valor que queremos.
```python
d1['Nombre'] = "Laura"
print(d1) #{'Nombre': Laura', 'Edad': 27, 'Documento': 1003882}
```
Si el key al que accedemos no existe, se añade automáticamente.
```python
d1['Direccion'] = "Calle 123"
print(d1) #{'Nombre': 'Laura', 'Edad': 27, 'Documento': 1003882, 'Direccion': 'Calle 123'}
```
> ***Iterar un diccionario***

Los diccionarios se pueden iterar de manera muy similar a las listas u otras estructuras de datos.
Para imprimir los key.
```python
# Imprime los key del diccionario
for x in d1:
  print(x)
```
> ***Métodos de diccionarios en Python***

+ ***clear()***
  
El método clear() elimina todo el contenido del diccionario.
```python
d = {'a': 1, 'b': 2}
d.clear()
print(d) #{}
```
+ ***get(key[,default])***

El método get() nos permite consultar el value para un key determinado. El segundo parámetro es opcional, y en el caso de proporcionarlo es el valor a devolver si no se encuentra la key.
```python
d = {'a': 1, 'b': 2}
print(d.get('a')) #1
print(d.get('z', 'No encontrado')) #No encontrado
```
+ ***items()***

El método items() devuelve una lista con los keys y values del diccionario. Si se convierte en list se puede indexar como si de una lista normal se tratase, siendo los primeros elementos las key y los segundos los value.
```python
d = {'a': 1, 'b': 2}
it = d.items()
print(it)  #dict_items([('a', 1), ('b', 2)])
print(list(it))  #[('a', 1), ('b', 2)]
print(list(it)[0][0]) #a
```
+ ***keys()***
  
El método keys() devuelve una lista con todas las keys del diccionario.
```python
d = {'a': 1, 'b': 2}
k = d.keys()
print(k)  #dict_keys(['a', 'b'])
print(list(k)) #['a', 'b']
```
+ ***values()***
  
El método values() devuelve una lista con todos los values o valores del diccionario.
```python
d = {'a': 1, 'b': 2}
print(list(d.values())) #[1, 2]
```
+ ***pop(key[,default])***

El método pop() busca y elimina la key que se pasa como parámetro y devuelve su valor asociado. Daría un error si se intenta eliminar una key que no existe.
```python
d = {'a': 1, 'b': 2}
d.pop('a')
print(d) #{'b': 2}
```
También se puede pasar un segundo parámetro que es el valor a devolver si la key no se ha encontrado. En este caso si no se encuentra no habría error.
```python
d = {'a': 1, 'b': 2}
d.pop('c', -1)
print(d) #{'a': 1, 'b': 2}
```
+ ***popitem()***
  
El método popitem() elimina de manera aleatoria un elemento del diccionario.
```python
d = {'a': 1, 'b': 2}
d.popitem()
print(d) #{'a': 1}
```
+ ***update(obj)***
  
El método update() se llama sobre un diccionario y tiene como entrada otro diccionario. Los value son actualizados y si alguna key del nuevo diccionario no esta, es añadida.
```python
d1 = {'a': 1, 'b': 2}
d2 = {'a': 0, 'd': 400}
d1.update(d2)
print(d1) #{'a': 0, 'b': 2, 'd': 400}
```
