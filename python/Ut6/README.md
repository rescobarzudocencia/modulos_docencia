# UT6 MÓDULOS Y ENTORNOS VIRTUALES <!-- omit in toc -->
---
- [1. Módulos](#1-módulos)
- [2. Entornos Virtuales](#2-entornos-virtuales)
  - [2.1. Introducción](#21-introducción)
  - [2.2. Entornos Virtuales](#22-entornos-virtuales)
  - [2.3. Manejo de paquetes](#23-manejo-de-paquetes)


# 1. Módulos
Un módulo o module en Python es un fichero .py que **alberga un conjunto de funciones, variables o clases** y que puede ser usado por otros módulos. Nos permiten reutilizar código y organizarlo mejor en namespaces. Por ejemplo, podemos definir un módulo mimodulo.py con dos funciones suma() y resta().
```python
# mimodulo.py
def suma(a, b):
    return a + b
def resta(a, b):
    return a - b
```
Una vez definido, dicho módulo puede ser usado o importado en otro fichero, como mostramos a continuación. Usando import podemos importar todo el contenido.
```python
# otromodulo.py
import mimodulo
print(mimodulo.suma(4, 3)) # 7
print(mimodulo.resta(10, 9)) # 1
```
También podemos importar únicamente los componentes que nos interesen como mostramos a continuación.
```python
from mimodulo import suma, resta
print(suma(4, 3)) # 7
print(resta(10, 9)) # 1
```
Por último, podemos importar todo el módulo haciendo uso de *, sin necesidad de usar mimodulo.
```python
from mimodulo import *
print(suma(4, 3)) # 7
print(resta(10, 9)) # 1
```
> Rutas y uso de sys.path

Normalmente los módulos que importamos están en la misma carpeta, pero es posible acceder también a módulos ubicados en una subcarpeta. Imaginemos la siguiente estructura:
```
├── ejemplo.py
├── carpeta
│
 └── modulo.py
```
Donde modulo.py contiene lo siguiente:
```python
# modulo.py
def hola():
    print("Hola")
```
Desde nuestro ejemplo.py, podemos importar el módulo modulo.py de la siguiente manera:
```python
from carpeta.modulo import *
print(hola())# Hola
```
Es importante notar que Python busca los módulos en las rutas indicadas por el sys.path. Es decir, cuando se importa un módulo, lo intenta buscar en dichas carpetas. Puedes ver tu sys.path de la siguiente manera:
```python
import sys
print(sys.path)
```
Como es obvio, verás que la carpeta de tu proyecta está incluida, pero ¿y si queremos importar un módulo en una ubicación distinta? Pues bien, podemos añadir al sys.path la ruta en la que queremos que Python busque.
```python
import sys
sys.path.append(r'/ruta/de/tu/modulo')
```
Una vez realizado esto, los módulos contenidos en dicha carpeta podrán ser importados sin problema como hemos visto anteriormente.

> **Cambiando los Nombres con as**

Por otro lado, es posible cambiar el nombre del módulo usando as. Imaginemos que tenemos un módulo moduloconnombrelargo.py.
```python
# moduloconnombrelargo.py
hola = "hola"
```
En vez de usar el siguiente import, tal vez queramos asignar un nombre más corto al módulo.
```python
import moduloconnombrelargo
print(moduloconnombrelargo.hola)
```
Podemos hacerlo de la siguiente manera con as:
```python
import moduloconnombrelargo as m
print(m.hola)
```

> **Módulos y función Main**

Un problema muy recurrente es cuando creamos un módulo con una función como en el siguiente ejemplo, y añadimos algunas sentencias a ejecutar.
```python
# modulo.py
def suma(a, b):
    return a + b
c = suma(1, 2)
print("La suma es:", c)
```
Si en otro módulo importamos nuestro modulo.py, tal como está nuestro código el contenido se ejecutará, y esto puede no ser lo que queramos.
```python
# otromodulo.py
import modulo
# Salida: La suma es: 3
```
Dependiendo de la situación, puede ser importante especificar que únicamente queremos que se ejecute el código si el módulo es el \_\_main__. Con la siguiente modificación, si hacemos import modulo desde otro módulo, este fragmento ya no se ejecutará al ser el módulo main otro.
```python
# modulo.py
def suma(a, b):
    return a + b
if (__name__ == '__main__'):
    c = suma(1, 2)
    print("La suma es:", c)
```

> Recargando Módulos

Es importante notar que los módulos solamente son cargados una vez. Es decir, no importa el número de veces que llamemos a import mimodulo, que sólo se importará una vez.
Imaginemos que tenemos el siguiente módulo que imprime el siguiente contenido cuando es importado.
```python
# mimodulo.py
print("Importando mimodulo")
def suma(a, b):
    return a + b
def resta(a, b):
    return a - b
```

# 2. Entornos Virtuales
## 2.1. Introducción

Las aplicaciones en Python usualmente hacen uso de paquetes y módulos que no forman parte de la librería estándar. Las aplicaciones a veces necesitan una versión específica de una librería, debido a que dicha aplicación requiere que un bug particular haya sido solucionado o bien la aplicación ha sido escrita usando una versión obsoleta de la interfaz de la librería.

Esto significa que tal vez no sea posible para una instalación de Python cumplir los requerimientos de todas las aplicaciones. Si la aplicación A necesita la versión 1.0 de un módulo particular y la aplicación B necesita la versión 2.0, entonces los requerimientos entran en conflicto e instalar la versión 1.0 o 2.0 dejará una de las aplicaciones sin funcionar.

La solución a este problema es crear un **entorno virtual**, un directorio que contiene una instalación de Python de una versión en particular, además de unos cuantos paquetes adicionales.

Diferentes aplicaciones pueden entonces usar entornos virtuales diferentes. Para resolver el ejemplo de requerimientos en conflicto citado anteriormente, la aplicación A puede tener su propio entorno virtual con la versión 1.0 instalada mientras que la aplicación B tiene otro entorno virtual con la versión 2.0. Si la aplicación B requiere que actualizar la librería a la versión 3.0, esto no afectará el entorno virtual de la aplicación A.

## 2.2. Entornos Virtuales
Para ejecutar entornos virtuales debemos tener instalado el paquete venv para la versión de python instalada.
Si no tenemos instalado el paquete al crear el entorno virtual nos pedirá que instalemos el paquete, por ejemplo en la versión 3.12 sería ejecutar:

**sudo apt install python3.12-venv**

Una vez instalado procedemos a crear nuestro entorno virtual.

> **Crear el entorno virtual**

**python -m venv tutorial-env**

Esto creará el directorio **tutorial-env** si no existe, y también creará directorios dentro de él que contienen una copia del intérprete de Python y varios archivos de soporte.

Una ruta común para el directorio de un entorno virtual es .venv. Ese nombre mantiene el directorio típicamente escondido en la consola y fuera de vista mientras le da un nombre que explica cuál es el motivo de su existencia. También permite que no haya conflicto con los ficheros de definición de variables de entorno .env que algunas herramientas soportan.
Una vez creado el entorno virtual, podrás activarlo.

> **Activar el entorno virtual**

**source tutorial-env/bin/activate**

Activar el entorno virtual cambiará el prompt de tu consola para mostrar que entorno virtual está usando, y modificará el entorno para que al ejecutar python sea con esa versión e instalación en
particular.

Para desactivar el entorno virtual hay que ejecutar:

**deactivate**

## 2.3. Manejo de paquetes

Puede instalar, actualizar y eliminar paquetes usando un programa llamado pip. De forma
predeterminada, pip instalará paquetes desde el índice de Paquetes de Python. Puede navegar por el
índice de paquetes de Python yendo a él en su navegador web, desde el siguiente enlace:

https://pypi.org/

Esto nos es util cuando estamos utilizando Entornos Virtuales, ya que vamos a ir instalando los diferentes paquetes necesarios para que nuestro entorno funcione.

+ Para instalar un paquete: **python -m pip install novas o pip install novas**
+ Instalar un paquete de una versión determinada: **python -m pip install requests==2.6.0 o pip install requests==2.6.0**
+ Actualizar un paquete a la ultima versión: **python -m pip - - upgrade requests o pip - -upgrade requests**
+ Eliminar paquetes: **pip unistall pandas**
  
https://docs.python.org/es/3/tutorial/venv.html

