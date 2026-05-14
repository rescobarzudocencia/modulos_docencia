# UT5 FICHEROS Y DIRECTORIOS <!-- omit in toc -->
---

- [1. Leeer archivos en Python](#1-leeer-archivos-en-python)
  - [1.1. Método read()](#11-método-read)
  - [1.2. Método readline()](#12-método-readline)
  - [1.3. Argumentos de open()](#13-argumentos-de-open)
- [2 Escribir archivos en Python](#2-escribir-archivos-en-python)
  - [2.1. Metodo Write()](#21-metodo-write)
  - [2.2. Metodo writelines()](#22-metodo-writelines)
  - [2.3. Uso del with](#23-uso-del-with)
- [3. Crear un servidor Web](#3-crear-un-servidor-web)


# 1. Leeer archivos en Python

Al igual que en otros lenguajes de programación, en Python es posible **abrir ficheros y leer su contenido**. Los ficheros o archivos pueden ser de lo más variado, desde un simple texto a contenido binario. Para simplificar nos centraremos en **leer un fichero de texto**.

Imagínate entonces que tienes un fichero de texto con unos datos, como podría ser un .txt o un .csv, y quieres leer su contenido para realizar algún tipo de procesado sobre el mismo. Nuestro
fichero podría ser el siguiente.
```
# contenido del fichero ejemplo.txt
Contenido de la primera línea
Contenido de la segunda línea
Contenido de la tercera línea
Contenido de la cuarta línea
```
Podemos abrir el fichero con la función open() pasando como argumento el nombre del fichero que queremos abrir.
```python
fichero = open('ejemplo.txt')
```
## 1.1. Método read()
Con `open()` tendremos ya en fichero el contenido del documento listo para usar, y podemos imprimir su contenido con `read()`. El siguiente código imprime todo el fichero.
```python
print(fichero.read())
#Contenido de la primera línea
#Contenido de la segunda línea
#Contenido de la tercera línea
#Contenido de la cuarta línea
```

## 1.2. Método readline()
Es posible también leer un número de líneas determinado y no todo el fichero de golpe. Para ello hacemos uso de la función `readline()`. Cada vez que se llama a la función, se lee una línea.
```python
fichero = open('ejemplo.txt')
print(fichero.readline())
print(fichero.readline())
# Contenido de la primera línea
# Contenido de la segunda línea
```
Es **muy importante saber** que una vez hayas leído todas las líneas del archivo, la función ya no devolverá nada, porque se habrá llegado al final. Si quieres que readline() funcione otra vez, podrías por ejemplo volver a leer el fichero con `open()`.

Otra forma de usar readline() es pasando como argumento un número. Este número leerá un determinado número de caracteres. El siguiente código lee todo el fichero carácter por carácter.
```python
fichero = open('ejemplo.txt')
caracter = fichero.readline(1)
while caracter != "": 
  #print(caracter)
  caracter = fichero.readline(1) ## Método readlines()
```
Existe otro método llamado `readlines()`, que devuelve una lista donde cada elemento es una línea del fichero.
```python
fichero = open('ejemplo.txt')
lineas = fichero.readlines()
print(lineas)
#['Contenido de la primera línea\n', 'Contenido de la segunda línea\n',
#'Contenido de la tercera línea\n', 'Contenido de la cuarta línea']
```
De manera muy sencilla podemos iterar las líneas e imprimirlas por pantalla.
```python
fichero = open('ejemplo.txt')
lineas = fichero.readlines()
for linea in lineas:
  print(linea)  
```
## 1.3. Argumentos de open()

Hasta ahora hemos visto la función `open()` con tan solo un argumento de entrada, el nombre del  fichero. Lo cierto es que existe un segundo argumento que es importante especificar. Se trata del modo de apertura del fichero. 

+ ‘r’: Por defecto, para leer el fichero.
+ ‘w’: Para escribir en el fichero.
+ ‘x’: Para la creación, fallando si ya existe.
+ ‘a’: Para añadir contenido a un fichero existente.
+ ‘b’: Para abrir en modo binario.

Por lo tanto lo estrictamente correcto si queremos leer el fichero sería hacer lo siguiente. Aunque el modo r sea por defecto, es una buena práctica indicarlo para darle a entender a otras personas que lean nuestro código que no queremos modificarlo, tan solo leerlo.
```python
fichero = open('ejemplo.txt', 'r')
```
Otra cosa que debemos hacer cuando trabajamos con ficheros en Python, es cerrarlos una vez que ya hemos acabado con ellos. Aunque es verdad que el fichero normalmente acabará siendo cerrado automáticamente, es importante especificarlo para evitar tener comportamientos inesperados.

Por lo tanto si queremos cerrar un fichero sólo tenemos que usar la función `close()` sobre el mismo. Por lo tanto tenemos tres pasos:

+ Abrir el fichero que queramos. En modo texto usaremos ‘r’.
+ Usar el fichero para recopilar o procesar los datos que necesitábamos.
+ Cuando hayamos acabado, cerramos el fichero.
```python
fichero = open('ejemplo.txt', 'r')
# Usar la variable fichero
# Cerrar el fichero
fichero.close()
```
# 2 Escribir archivos en Python

A continuación te explicamos como escribir datos en un fichero usando Python. Imagínate que tienes unos datos que te gustaría guardar en un fichero para su posterior análisis. Te explicamos como guardarlos en un fichero, por ejemplo, .txt. 

Lo primero que debemos de hacer es crear un objeto para el fichero, con el nombre que queramos. Al igual que vimos en el post de leer ficheros, además del nombre se puede pasar un segundo parámetro que indica el modo en el que se tratará el fichero. Los más relevantes en este caso son los siguientes. Para más información consulta la documentación oficial.

+ ‘w’: Borra el fichero si ya existiese y crea uno nuevo con el nombre indicado.
+ ‘a’: Añadirá el contenido al final del fichero si ya existiese (append end Inglés)
+ ‘x’: Si ya existe el fichero se devuelve un error.

Por lo tanto con la siguiente línea estamos creando un fichero con el nombre datos_guardados.txt.
```python
# Abre un nuevo fichero
fichero = open("datos_guardados.txt", 'w')
```
Si por lo contrario queremos añadir el contenido al ya existente en un fichero de antes, podemos hacerlo en el modo append como hemos indicado.

```python
# Abre un nuevo y añade el contenido al final
fichero = open("datos_guardados.txt", 'a')
```
## 2.1. Metodo Write()

Ya hemos visto como crear el fichero. Veamos ahora como podemos añadir contenido. Empecemos escribiendo un texto.
```python
fichero = open("datos_guardados.txt", 'w')
fichero.write("Contenido a escribir")
fichero.close()
```
Por lo tanto si ahora abrimos el fichero datos_guardados.txt, veremos como efectivamente contiene una línea con Contenido a escribir. ¿A que es fácil?
Es muy importante el uso de `close()` ya que si dejamos el fichero abierto, podríamos llegar a tener un comportamiento inesperado que queremos evitar. Por lo tanto, siempre que se abre un fichero es necesario cerrarlo cuando hayamos acabado.
Compliquemos un poco más las cosas. Ahora vamos a guardar una lista de elementos en el fichero, donde cada elemento de la lista se almacenará en una línea distinta.
```python
# Abrimos el fichero
fichero = open("datos_guardados.txt", 'w')
# Tenemos unos datos que queremos guardar
lista = ["Manzana", "Pera", "Plátano"]
# Guardamos la lista en el fichero
for linea in lista:
  fichero.write(linea + "\n")
# Cerramos el fichero
fichero.close()
```

## 2.2. Metodo writelines()

También podemos usar el método writelines() y pasarle una lista. Dicho método se encargará de guardar todos los elementos de la lista en el fichero.
```python
fichero = open("datos_guardados.txt", 'w')
lista = ["Manzana", "Pera", "Plátano"]
fichero.writelines(lista)
fichero.close()
# Se guarda
# ManzanaPeraPlátano
```
Tal vez te hayas dado cuenta de que en realidad lo que se guarda es ManzanaPeraPlátano, todo junto. Si queremos que cada elemento se almacene en una línea distinta, deberíamos añadir el salto de línea en cada elemento de la lista como se muestra a continuación.
```python
fichero = open("datos_guardados.txt", 'w')
lista = ["Manzana\n", "Pera\n", "Plátano\n"]
fichero.writelines(lista)
fichero.close()
```

## 2.3. Uso del with

Podemos ahorrar una línea de código si hacemos uso de lo siguiente. En este caso nos podemos ahorrar la llamada al close() ya que se realiza automáticamente. El código anterior se podría
reescribir de la siguiente manera.
```python
lista = ["Manzana\n", "Pera\n", "Plátano\n"]
with open("datos_guardados.txt", 'w') as fichero:
  fichero.writelines(lista)
```

> Ejemplo

El uso de ‘x’ hace que si el fichero ya existe se devuelve un error. En el siguiente código creamos un fichero e inmediatamente después intentamos crear un fichero con el mismo nombre con la
opción ‘x’. Por lo tanto se devolverá un error.
```python
f = open("mi_fichero.txt", "w")
# f = open("mi_fichero.txt", "x")
# Error! Ya existe
```
En este otro ejemplo vamos a usar un fichero para establecer una comunicación entre dos funciones.
A efectos prácticos puede no resultar muy útil, pero es un buen ejemplo para mostrar la lectura y escritura de ficheros.

Tenemos por lo tanto una función `escribe_fichero()` que recibe un mensaje y lo escribe en un fichero determinado. Y por otro lado tenemos una función `lee_fichero()` que devuelve el mensaje que está escrito en el fichero.

Date cuenta lo interesante del ejemplo, ya que podríamos tener estos dos códigos ejecutándose en diferentes maquinas o procesos, y **podrían comunicarse a través del fichero**. Por un lado se escribe y por el otro se lee.

```python
# Escribe un mensaje en un fichero
def escribe_fichero(mensaje):
  with open('fichero_comunicacion.txt', 'w') as fichero:
    fichero.write(mensaje)
# Leer el mensaje del fichero
def lee_fichero():
  mensaje = ""
  with open('fichero_comunicacion.txt', 'r') as fichero:
    mensaje = fichero.read()
  # Borra el contenido del fichero para dejarlo vacío
  f = open('fichero_comunicacion.txt', 'w')
  f.close()
  return mensaje
escribe_fichero("Esto es un mensaje")
print(lee_fichero())
```


# 3. Crear un servidor Web

Con Python podemos crea un servidor Web con el siguiente comando:

**python -m http.server 8000 --directory /ruta/al/directorio**

 + 8000 → es el puerto en que está escuchando el servidor web.
 + /ruta/al/directorio → donde vamos almacenar la pagina web.