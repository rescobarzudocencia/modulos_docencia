# UT2 DOCKER <!-- omit in toc -->
---
- [1.Introducción.](#1introducción)
  - [1.1. Virtualización.](#11-virtualización)
  - [1.2. Contenedores.](#12-contenedores)
  - [1.3. Glosario.](#13-glosario)
- [2. Instalación.](#2-instalación)
  - [2.1. Ayuda de docker.](#21-ayuda-de-docker)
- [3. Docker Hub.](#3-docker-hub)
- [4. Gestión de imágenes.](#4-gestión-de-imágenes)
  - [4.1. Descarga de imágenes.](#41-descarga-de-imágenes)
  - [4.2. Mostrar imágenes descargadas.](#42-mostrar-imágenes-descargadas)
  - [4.3. Borrado de imágenes.](#43-borrado-de-imágenes)
  - [4.4. Obteniendo inofrmación de las imágenes.](#44-obteniendo-inofrmación-de-las-imágenes)
  - [4.5. Otros comandos.](#45-otros-comandos)


# 1.Introducción.

Docker es una tecnología de virtualización "ligera" cuyo elemento básico es la utilización de contenedores en vez de máquinas virtuales y cuyo objetivo principal es el despliegue de aplicaciones encapsuladas en dichos contenedores.

Dicho de esta manera puede parecer que no es más que otra tecnología de virtualización, pero para entender mejor cómo ha surgido esta tecnología y comprender las ventajas que aporta debemos echar un poco la vista atrás y conocer la evolución en el despliegue de aplicaciones.

En esa **evolución** nos podemos encontrar, de manera general y simplificada, con tres grandes pasos:

+ Arquitectura de un único servidor
+ Virtualización
+ Contenedores

A continuación describiremos estos tres pasos haciendo especial hincapié en sus ventajas e inconvenientes.

## 1.1. Virtualización.

Con el tiempo y para superar las limitaciones del modelo de un único servidor la tecnología evolucionó hacia servidores con características de virtualización. De una manera simplificada podríamos decir que para desplegar aplicaciones nos encontrábamos con arquitecturas similares a las siguientes:

![Virtualización](../img/virtualizacion.png)

Estos enfoques tenían una serie de BENEFICIOS que derivaban principalmente de superar las limitaciones del modelo de servidor único. A saber:

+ Hay un **mejor aprovechamiento de los recursos**. Un servidor grande y potente se puede compartir entre distintas aplicaciones.
+ Los **procesos de migración y escalado no son tan dolorosos**, simplemente le doy más recursos a la máquina virtual dentro de mi servidor o bien muevo la máquina virtual a un nuevo servidor, propio o en la nube, más potente y que también tenga características de virtualización.
+ Esto además hizo que aparecieran **nuevos modelos de negocio en la nube** que nos permiten en cada momento tener y dimensionar las máquinas virtuales según nuestras necesidades y pagar únicamente por esas necesidades.

No obstante este enfoque también tiene algunos **INCONVENIENTES**:

+ Todas las máquinas virtuales siguen teniendo su propia memoria RAM, su almacenamiento y su CPU que será aprovechada al máximo...o no.
+ Para arrancar las máquinas virtuales tenemos que arrancar su sistema operativo al completo.
+ La portabilidad no está garantizada al 100%.

## 1.2. Contenedores.

El siguiente paso en la evolución, fue la aparición de los **CONTENEDORES**, eso que anteriormente hemos llamado "**máquinas virtuales ligeras**" . Su arquitectura general se puede ver en la siguiente imagen:

![Contenedores](../img/contenedores.png)

Y sus principales características son las siguientes:

+ Los contenedores utilizan el mismo Kernel Linux que la máquina física en la que se ejecutan gracias a la estandarización de los Kernel y a características como los Cgroups y los Namespaces. Esto elimina la sobrecarga que en las máquinas virtuales suponía la carga total del sistema operativo invitado.
+ Permiten aislar las distintas aplicaciones que tenga en los distintos contenedores.
+ Facilitan la distribución de las aplicaciones ya que éstas se empaquetan junto con sus dependencias y pueden ser ejecutadas posteriormente en cualquier sistema en el que se pueda lanzar el contenedor en cuestión.
+ Se puede pensar que se añade una capa adicional  el Docker Engine, pero esta capa apenas añade sobrecarga debido a que se hace uso del mismo Kernel.

Este enfoque por lo tanto aporta los siguientes **BENEFICIOS**:

+ Una mayor velocidad de arranque, ya que prescindimos de la carga de un sistema operativo invitado. Estamos hablando de apenas segundos para arrancar un contenedor (a veces menos).
+ Un gran portabilidad, ya que los contenedores empaquetan tanto las aplicaciones como sus dependencias de tal manera que pueden moverse a cualquier sistema en el que tengamos instalados el Docker Engine, y este se puede ser instalado en casi todos, por no decir todos.
+ Una mayor eficiencia ya que hay un mejor aprovechamiento de los recursos. Ya no tenemos que reservar recursos, como hacemos con las máquinas virtuales, sin saber si serán aprovechados al máximo o no.
  
Aunque como todo en esta vida, la tecnología de contenedores tiene algún **INCONVENIENTE**:

+ Los contenedores son más frágiles que las máquinas virtuales y en ocasiones se quedan en un estado desde el que no podemos recuperarlos. No es algo frecuente pero ocurre y para eso hay soluciones como la orquestación de contenedores que es algo que queda fuera del alcance de este curso que está más orientado a desarrolladores que a sistemas.

## 1.3. Glosario.

+ **Imagen** Una imagen es una plantilla (ya sea de una aplicación de un sistema) que podremos utilizar como base para la ejecución posterior de nuestras aplicaciones (contenedores). Si queremos una descripción más técnica y detallada diremos que es un archivo comprimido en el que, partiendo de un sistema base, se han ido añadiendo capas cada una de las cuales contiene elementos necesarios para poder ejecutar una aplicación o sistema. No tiene estado y no cambia salvo que generemos una nueva versión o una imagen derivada de la misma.
+ **Contenedor** Es una imagen que junto a unas instrucciones y variables de entorno determinadas se ejecuta. Tiene estado y podemos modificarlo. Estos cambios no afectan a la imagen o "plantilla" que ha servido de base.
+ **Repositorio** Almacén, normalmente en la nube desde el cual podemos descargar distintas versiones de una misma imagen para poder empezar a construir nuestras aplicaciones basadas en contenedores.
+ **Docker** Plataforma, mayormente opensource, para el desarrollo, empaquetado y distribución de aplicaciones de la empresa Docker Inc (anteriomente Dot Cloud Inc). Es un término que se suele utilizar indistintamente al del Docker Engine.
+ **Docker Engine** Aplicación cliente-servidor que consta de tres componentes: un servicio **dockerd** para la ejecución de los contenedores, un **API** para que otras aplicaciones puedan comunicarse con ese servicio y una aplicación de línea de comandos **docker cli** que sirve para gestionar los distintos elementos (contenedores, imágenes, redes, volúmenes etc..)
+ **Docker Hub** Registro de repositorios de imágenes de la empresa Docker Inc. Accesible a través de la URL https://hub.docker.com/


# 2. Instalación.

Para instalar Docker vamos a instalar el paquete **docker.io**, para ello hay que instalarlo con el sofware de la distribución que estamos utilizando. Es recomendable actualizar los repositorios y después instalarlo.

Si no estuviera seguimos el siguiente enlace.

https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

Comprobamos si docker se ha instalado correctamente

```bash
sudo systemctl status docker
```
![Comprobar Docker Instalado](../img/compDockerInstalado.png)

Una vez instalado, por defecto se usa utilizando permisos de administrador, y puede ser un engorro cada vez utilizar sudo para ello vamos a ver que hacer para poder utilizar Docker con un usuario.

Primero vamos a comprobar si el grupo docker ha sido creado.

```bash
sudo cat /etc/group | grep docker
```
![Comprobar Grupo Docker](../img/comprobarGrupoDocker.png)

Si no lo hubiese creado lo creamos:
```bash
sudo groupadd docker
```
Añadir nuestro usuario al grupo ya que si no lo hacemos tenemos que utilizar siempre el sudo para realizar cualquier acción.
```bash
sudo usermod -aG docker $USER
```
Reiniciamos la máquina.

Para ver que todo está funcionando vamos a instalar el contenedor Hello World.

```bash
docker run hello-world
```
![Hello World](../img/helloWorld.png)

Otra de las utilidades que vamos a utilizar es **docker-compose**. Aunque la instalación la veremos más adelante, podemos realizar ya la instalación.

La instalación de docker-compose es un proceso muy sencillo. Si somos usuarios de MAC y Windows no tendremos que instalar nada ya que docker-compose es una de las herramientas que por defecto se incluyen dentro de Docker Desktop. 

Si somos usuarios de Linux su instalación se realiza únicamente con dos pasos:

```bash
# Descarga del fichero mediante la orden curl y colocación en el directorio adecuado. 
sudo curl -L "https://github.com/docker/compose/releases/download/2.40.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Concesión de los permisos de ejecución
sudo chmod +x /usr/local/bin/docker-compose

# Comprobación de que la instalación está correcta.
docker-compose --version
docker-compose version 2.40.3
```


> [!IMPORTANT]
>
> Si no se descargase hay que realizar manualmente la descarga:

1. Lo descargamos de: https://github.com/docker/compose/releases/tag/v2.40.3/
2. El fichero a descargar es **docker-compose-linux-x86_64**.
3. Copiarlo al directorio correcto **sudo cp  /home/usuario/Descargas/docker-compose-linux-x86_64 /usr/local/bin/docker-compose** Sustituyendo usuario por el usuario local.
 4. Darle permisos de ejecución: **sudo chmod +x /usr/local/bin/docker-compose**.
 5. Comprobar la versión: **docker-compose --version**.

## 2.1. Ayuda de docker.

Si necesitamos ayuda se puede mostrar con la opción **--help**.
```bash
docker rmi --help
docker --help
```

# 3. Docker Hub.

Es un repositorio donde podemos descargar imagenes de servicios que queramos montar.
Podemos aceder desde [Enlace Docker Hub](https://hub.docker.com/)

Cuando hemos ejecutado **docker run hello-world** ha pasado dos cosas:

+ Se **DESCARGA** la imagen que es algo así como la "plantilla" para la creación de contenedores en ejecución.
+ Se **EJECUTA** el contenedor.

# 4. Gestión de imágenes.

Como ya hemos dicho las imágenes son la plantilla a partir de las cuales vamos a generar nuestros contenedores.

## 4.1. Descarga de imágenes.

Un comando útil es la búsqueda de imágenes para poder crear nuestros contenedores, utilizaremos el siguiente comando, por ejemplo si queremos instalar un contenedor con **ubuntu** podemos buscar las imágenes ya creadas con el siguiente comando:

```bash
docker search ubuntu
```

![Docker buscar imagen ubuntu](../img/dockerSearchUbuntu.png)

De la información que nos muestra una de las columnas más importantes es la de ST**ARS que son las estrellas que tiene dicha imagen, en modo gráfico también. 

Descargamos las imágenes con el comando 

```
docker pull imagen:version
```

Indicando el nombre de la imagen y la versión de la misma (**TAG**). Si no indicamos nada se descarga la última versión (latest). 

```bash
# mysql - Es el nombre de la imagen 8.0.22 es la versión o TAG
docker pull mysql:8.0.22
```

Es recomendable usar `docker pull` por las siguientes razones:

+ Me permite **actualizar** una determina pareja imagen:versión a su última actualización. Solo tendré que hacer **docker pull con el mismo imagen:versión**.
+ Suponiendo que ya teníamos previamente la versión descargada. Actualiza la versión mysql:5.7

```
docker pull mysql:5.7
```

> [!IMPORTANT]
>
>Me permite **bajar todas las versiones de una imagen** de una >sola vez. Esto **puede ser peligroso** si una imagen tiene muchas >versiones disponibles. Lo conseguiremos con la opción `-a` o >`--all-tags`.

## 4.2. Mostrar imágenes descargadas.

Cada vez que descarguemos una imagen podemos mostrar por pantalla una lista de las imágenes que tenemos en nuestro sistema usando la orden:

```bash
# Listas imágenes descargas
docker images o docker image ls
```

La información que se nos muestra se organiza en forma tabular y nos proporciona los siguientes datos:

+ **IMAGE**: Nombre de la imagen en el repositorio., con la versión de la imagen descargada Por ejemplo: mysq:5.7
+ **ID**: Un identificador que es único para cada imagen. Siempre podemos usar este ID en vez del nombre.
+ **DISK SIZE**: Tamaño de la imagen.

## 4.3. Borrado de imágenes.

Conforme vamos avanzando en el uso de Docker iremos **acumulando imágenes** en nuestro sistema. Estas imágenes, bien es cierto, no ocupan tanto espacio como una máquina virtual pero si hemos descargado varias decenas o centenas de las mismas (basta un par docker pull -a para eso) al final nos encontraremos con que podemos llegar a ocupar una cantidad considerable de espacio en disco si no tenemos cierto control sobre las mismas.

En este caso, para una mejor gestión, podemos empezar a borrar imágenes de la siguiente forma:

```bash
# Borrado de la imagen mysql:8.0.22
docker rmi mysql:8.0.22
# Borrado de una imagen usando su IMAGE ID
docker rmi dd7265748b5d
# Borrado de dos imágenes (o varias) a la vez. Puedes usar nombre e IMAGE ID
docker rmi mysql:8.0.22 mysql:5.7
```


> [!IMPORTANT]
>
>No podemos borrar una imagen si ya tenemos un contenedor que está usándola.

Si aun así queremos borrarla **podemos forzar ese borrado**, lo cual afectará, evidentemente, a los contenedores que tuviéramos referenciando esa imagen. Eso lo conseguimos añadiendo la opción `-f` o `--force`. Por ejemplo:

```bash
# Borra la imagen httpd (Apache latest) aunque hubiera contenedores que estuvieran usando esa imagen.
docker rmi -f httpd
```
Este proceso de borrado, sobre todo si tenemos muchas imágenes,  puede ser un proceso engorroso. Para facilitar esto disponemos de la orden **docker image prune** que tiene tres opciones básicas:

+ **-a** o **--all** para borrar todas las imágenes que no están siendo usadas por contenedores
+ **-f** o **--force** para que no nos solicite confirmación. Es una operación que puede borrar muchas imágenes de una tacada y debemos ser cuidadosos. Os recomiendo no usar esta opción.
+ **--filter** para especificar ciertos filtros a las imágenes.

Para demostrar su funcionamiento vamos a poner varios ejemplos:

```bash
# Borrar todas las imágenes sin usar
docker image prune -a
# Borrado de las imágenes creadas hace más de una semana 10 días
docker image prune --filter until="240h"
```

## 4.4. Obteniendo inofrmación de las imágenes.

Una vez tenemos ya las imágenes descargadas es muy interesante conocerlas al máximo para poder utilizarlas. Para ello tenemos **dos fuentes principales**:

+ La **página de la imagen en DockerHub** que suele recoger sobre todo información relativa a aspectos como:
  + Una descripción de la aplicación o servicio que contiene la imagen.
  + Una lista de versiones TAGs disponibles.
  + Variables de entorno interesantes.
  + Cómo ejecutar la imagen.
+ La salida de las órdenes **docker image inspect / docker inspect** que nos da ya una información más detallada sobre las características, con todos los metadatos de la misma.

Veamos un ejemplo de la misma:

```bash
# Dos formas de obtener información de la imagen mysql:8.0.22
docker image inspect mysql:8.0.22
docker inspect mysql:8.0.22
```
Está en formato JSON (JavaScript Object Notation) y nos da datos sobre aspectos como:

+ El id y el checksum de la imagen.
+ Los puertos abiertos.
+ La arquitectura y el sistema operativo de la imagen.
+ El tamaño de la imagen.
+ Los volúmenes.
+ El ENTRYPOINT que es lo que se ejecuta al hacer docker run.
+ Las capas.
+ Y muchas más cosas....

Adicionalmente podemos formatear la salida usando Go  y el flag `--format/-f`. Una descripción detallada queda fuera de los objetivos de este curso pero vamos a poner varios ejemplos:

```bash
# Mostrar la arquitectura y el sistema
docker inspect --format '{{.Architecture}} es la arquitectura y el SO es {{.Os}}' mysql:8.0.22
 amd64 es la arquitectura y el SO es linux
# Mostrar la lista de puertos expuestos
docker inspect --format '{{.Config.ExposedPorts}}' mysql:8.0.22
map[3306/tcp:{} 33060/tcp:{}]
```
NOTA: Para poder este formateo debemos conocer en profundidad la estructura del JSON que nos devuelve.


## 4.5. Otros comandos.

Además de los comandos que hemos visto en los apartados anteriores la orden **docker image** tiene una gran variedad de **subcomandos**, que si bien no son necesarios para poder empezar con docker si que es bueno conocer que existen, os recomiendo los siguientes:

+ **docker image build** para construir una imagen desde un fichero Dockerfile.
+ **docker image history** para que se nos muestre por pantalla la evolución de esa imagen.
+ **docker image save / docker image load (o docker save / docker load)** para guardar imágenes en fichero y cargarlas desde fichero.
+ **docker image tag ( docker tag)** para añadir TAGs (versiones) a las distintas imágenes.
