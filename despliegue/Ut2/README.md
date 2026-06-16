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
- [5. Contenedores.](#5-contenedores)
  - [5.1. Asignando nombre a los contenedores.](#51-asignando-nombre-a-los-contenedores)
  - [5.2. Ejecución de servicios. Puertos y variables de entorno.](#52-ejecución-de-servicios-puertos-y-variables-de-entorno)
  - [5.3. Ejecutar órdenes en contenedores.](#53-ejecutar-órdenes-en-contenedores)
  - [5.4. Obtener información de los contenedores.](#54-obtener-información-de-los-contenedores)
    - [5.4.1. Docker ps.](#541-docker-ps)
    - [5.4.2. Docker inspect.](#542-docker-inspect)
    - [5.4.3. Docker Logs.](#543-docker-logs)
  - [5.5. Gestión de contenedores.](#55-gestión-de-contenedores)
- [6. Persistencia en Docker.](#6-persistencia-en-docker)


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
>Me permite **bajar todas las versiones de una imagen** de una >sola vez. Esto **puede ser peligroso** si una imagen tiene >muchas >versiones disponibles. Lo conseguiremos con la opción >`-a` o `--all-tags`.

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

# 5. Contenedores.

Los contenedores son creados a partir de las **imágenes**. Eso lo podemos conseguir de la siguiente manera:
      
+ **docker pull nombre_imagen:version** que descargará desde el repositorio una imagen con la versión indicada o la última versión (**latest**) si no indicamos versión.
+ Y la orden fundamental para ejecutar contenedores que es **docker run **cuya función principal es poner en ejecución contenedores en base a una imagen de referencia que le indicaremos. Una **CUESTIÓN IMPORTANTE** que debemos de tener en cuenta al usar docker run es que si vamos a **ejecutar un contenedor** que usa como base una **imagen que no tenemos**, esta **se descargará de manera automática**. Para buscar las imágenes que queremos la opción que os recomiendo es usar el buscador de Docker Hub.

Esta orden **docker run** tiene una sintaxis sencilla pero multitud de opciones de las que explicaremos algunas. No obstante la estructura general es la siguiente:


![Docker run](../img/docerRun.png)

Solo vamos a ver algunas de las opciones que posee este comando:
+ **-d** o **--detach** para ejecutar un contenedor (normalmente porque tenga un servicio) en background.
+ **-e** o **--env** para establecer variables de entorno en la ejecución del contenedor.
+ **-h** o **--hostname** para establecer el nombre de red parar el contenedor.
+ **--help** para obtener ayuda de las opciones de docker.
+ **--interactive** o **-i** para mantener la STDIN abierta en el contenedor.
+ **--ip** si quiero darle una ip concreta al contenedor.
+ **--name** para darle nombre al contenedor.
+ **--net** o **--network** para conectar el contenedor a una red determinada.
+ **-p** o **--publish** para conectar puertos del contenedor con los de nuestro host.
+ **--restart** que permite reiniciar un contenedor si este se "cae" por cualquier motivo.
+ **--rm** que destruye el contenedor al pararlo.
+ **--tty** o **-t** para que el contenedor que vamos a ejecutar nos permita un acceso a un terminal para poder ejecutar órdenes en él.
+ **--user** o **-u** para establecer el usuario con el que vamos a ejecutar el contenedor.
+ **--volume** o **-v** para montar un bind mount o un volumen en nuestro contenedor.
+ **--wordirk** o **-w** para establecer el directorio de trabajo en un contenedor.

A continuación vamos a ver algunos ejemplos básicos. En apartados posteriores de este mismo módulo y en módulos posteriores continuaremos con la introducción de más opciones:

> **Ejemplo 1**

```bash
# Descargar una imagen de manera previa
docker pull ubuntu:18.04
# Crear un contenedor de ubuntu:18.04 y tener acceso a un shell en él. Si no hemos descargado la imagen de manera previa se descargará.
docker run -it ubuntu:18.04 /bin/bash
root@ef2bea1d6cb1:/#
```
Al crear el contenedor se nos da un acceso a un shell del mismo. Es importante destacar que **estamos accediendo como root**. Al salir del terminal el contenedor se para.

> **Ejemplo 2**
```bash
# Crear un contenedor de ubuntu:18.04 y listar el contendido de la carpeta /
docker run ubuntu:18.04 ls /
```
bin boot dev etc ...

Al crear el contenedor se ejecuta la orden ls / y posteriormente el contenedor pasa a estar parado. Y ya no podremos acceder a él. 


> **Ejemplo 3**

```bash
# Crear un contenedor de httpd (Servidor Apache)
docker run httpd
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2. Set the 'ServerName' directive globally to suppress this message
[Mon Dec 07 10:01:52.670809 2020] [mpm_event:notice] [pid 1:tid 140412541457536] AH00489: Apache/2.4.46 (Unix) configured -- resuming normal operations
[Mon Dec 07 10:01:52.670973 2020] [core:notice] [pid 1:tid 140412541457536] AH00094: Command line: 'httpd -D FOREGROUND'
```
Al ejecutar esa orden se crea un servidor Web Apache 2.4 en la ip mostrada y se nos muestra por pantalla el log de dicho servicio. Introducir la Ip en el navegador.

> **Ejemplo 4**

```bash
# Crear un contenedor de debian 9 y mostrar el contenido de una carpeta establecida con el parámetro -w
docker run -it -w /etc debian:9 ls
```
Al crear el contenedor se ejecuta la orden ls desde el directorio /etc, posteriormente el contenedor pasa a estar parado. Y ya no podremos acceder a él. 

> [!NOTE] 
> 
>Conforme vayamos creando contenedores hay dos órdenes que nos van a interesar para hacer un seguimiento de qué tenemos en nuestro sistema.

```bash
# Mostrar los contenedores en ejecución (Estado Up)
docker ps
# Mostrar todos los contenedores creados ya estén en ejecución (Estado Up) o parados (Estado Exited)
docker ps -a
```

[Referencia Docker run](https://docs.docker.com/engine/reference/commandline/run/)

## 5.1. Asignando nombre a los contenedores.

Hasta ahora cuando hemos puesto en ejecución los contenedores la propia aplicación docker ha sido  la que nos ha dado un **nombre por defecto**. Estos nombres creados aleatoriamente por docker **constan de dos nombres aleatorios unidos por un guión bajo _**, por ejemplo: happy_golick, magical_mclean etc.

Evidentemente esto no es operativo. Son nombre **difíciles de recordar**, que no tienen nada que ver con los contenedores que queremos lanzar e **imposible de gestionar y memorizar** cuando empezamos a tener muchos contenedores en nuestro sistema.

Por este motivo es conveniente que hagamos **obligatorio el uso del flag --name** cuando usamos la orden docker run. De esta manera, si usamos nombre elegidos por nosotros serán más fáciles de recordar que los asignados por defecto. Ademas podemos elegir nombres que tenga relación con la función que va a desempeñar dicho contenedor.

Pondremos varios ejemplos:

```bash
# Damos el nombre de servidorBD a un contenedor de la imagen mysql:8.0.22

docker run -d --name servidorBD -p 3306:3306 mysql:8.0.22

# Damos el nombre de servidorWeb a un contenedor de la imagen httpd:latest (Apache)

docker run -d --name servidorWeb -p 80:80 httpd
```

## 5.2. Ejecución de servicios. Puertos y variables de entorno.

Una de las cosas que más interesantes de docker no es ya el hecho de que se puede **probar todas versiones de los distintos sistemas** que van apareciendo, es el hecho de que **PARA PROBAR Y USAR CUALQUIER SERVICIO Y CUALQUIER APLICACIÓN NO TENGO QUE INSTALAR NADA EN MI SISTEMA**, sea cual sea el servicio o la aplicación que se me ocurra, siempre la tengo en Docker Hub. Solo tengo que buscarla, averiguar cuál es la versión que quiero y lanzar el contenedor o contenedores necesarios. 


Nos vamos a centrar en servicios de un solo contenedor, estamos hablando de servidores de bases de datos, servidores web, servidores de aplicaciones etc... servicios que de otra parte son de uso casi diario en nuestras aulas. Veremos en módulos posteriores aplicaciones que requieren la interacción de más de un contenedor.

Para la ejecución de contenedores de este tipo vamos a tener que en cuenta varias cosas:

+ Usar el **flag -d** para que el servicio se ejecute en **modo background o dettach**. Si no lo hacemos se bloqueará el terminal mostrando el log del servicio (en ciertas ocasiones puede interesarnos) y tendremos que salir del mismo con Ctrl+C. Esto para el contenedor aunque podremos arrancarlo posteriormente.
+ Si queremos que el servicio que vamos a lanzar sea accesible desde el exterior tendremos que añadir el **flag -p** de la siguiente manera **-p PUERTO_EN_HOST:PUERTO_EN_CONTENEDOR** que normalmente sería el puerto por defecto del servicio. Esto es una **REDIRECCIÓN DE PUERTOS**. Podemos tener varias reglas -p al arrancar (dependiendo del servicio será necesario) y es muy importante recordar que no podemos tener dos servicios escuchando en el mismo puerto. Si lo intentamos se nos mostrará un mensaje de error.
+ **Comprobar y definir** si es necesario las **variables de entorno** que puede tener el contenedor. Las variables de entorno importantes se describen en la página de las imágenes en DockerHub y para usarlas tenemos que usar el **flag -e NOMBRE_VARIABLE=VALOR**.

Para ilustrar todo esto vamos a poner varios ejemplos:

```bash
# Ejecuto un servidor Apache sin el flag -d ni redirección de puertos. Se bloquea el terminal mostrando los logs y tendré que salir con Ctrl+C

docker run httpd

# Ejecuto un servidor Apache en background y accediendo desde el exterior a través del puerto 8888 de mi máquina.

docker run -d --name servidorWeb -p 8888:80 httpd

# Ejecuto un servidor Apache en background y accediendo desde el exterior a través del puerto 8888 de mi máquina. Y hacemos que cuando se reinicie el servicio Docker el contenedor se arranque automáticamente.

docker run –restart always -d --name servidorWeb -p 8888:80 httpd

# Creación de un servidor de base de datos mariadb accediendo desde el exterior a través del puerto 3306 y estableciendo una contraseña de root mediante una variable de entorno

docker run -it -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mariadb
```

## 5.3. Ejecutar órdenes en contenedores.

Con los contenedores en ejecución vamos a querer ejecutar órdenes en ellos. Querremos realizar operaciones como:

+ Instalar paquetes.
+ Modificar o ver el contenido de ciertos ficheros.
+ Habilitar ciertos módulos de servicios
      
Esto lo podemos hacer de dos maneras o bien obteniendo un terminal del contenedor y ejecutando las órdenes necesarias desde allí o bien directamente ejecutando una orden determinada "contra" el contenedor. Para ambos casos voy a necesitar la orden **docker exec** y es **NECESARIO QUE EL CONTENEDOR ESTÉ EN EJECUCIÓN**.

La sintaxis de esta orden es bastante sencilla y muy similar a la de docker run:

```bash
docker exec [opciones] nombre_contenedor orden [argumentos]
```
Algunas de las opciones más importantes son:

+ **-it** (-i y -t juntos) si vamos a querer tener interactividad con el contenedor ejecutando un shell (/bin/bash normamente). Una vez tenemos el terminal ya podremos trabajar desde dentro del propio sistema.
+ **-u** o **--user** si quiero ejecutar la orden como si fuera un usuario distinto del de root.
+ **-w** o **--workdir** si quiero ejecutar la orden desde un directorio concreto.

Lo vamos a ver mejor con algunos ejemplos:

```bash
# Obtener un terminal en un contenedor que ejecutar un servidor Apache (httpd) y que se llama web

docker exec -it web /bin/bash

root@5d96ce1f7374:/usr/local/apache2#

# Mostrar el contenido de la carpeta /usr/local/apache2/htdocs del contenedor web. Como no hace falta interactividad no es necesario -it

docker exec web ls /usr/local/apache2/htdocs

# Crear directamente un fichero "HOLA MUNDO" en el directorio raíz del servidor apache. Utilizo sh -c para ordenes compuestas o complejas

docker exec -it web sh -c "echo 'HOLA MUNDO' > /usr/local/apache2/htdocs/index.html"
```

Adicionalmente existe otra orden que nos va a ser de mucha utilidad cuando trabajemos con contenedores, la orden docker cp que me permite mover ficheros desde mi sistema al contenedor y desde el contenedor a mi sistema. Su sintaxis es muy sencilla y la vamos a ilustrar con dos ejemplos, uno en cada sentido:

```bash
# Copiar mi fichero prueba.html al fichero /usr/local/apache2/htdocs/index.html de mi contenedor llamado web que es un servidor Apache (httpd)

docker cp prueba.html web:/usr/local/apache2/htdocs/index.html

#Copiar el fichero index.html que se encuenta en /usr/local/apache2/htdocs/index.html de mi contenedor llamado web un fichero llamado test.html en mi directorio HOME

docker cp web:/usr/local/apache2/htdocs/index.html $HOME/test.html
```

> [!NOTE] 
> LOS CONTENEDORES VIENEN CON SOLO LO IMPRESCINDIBLE INSTALADO. SI QUIERO INSTALAR ALGO DEBO NORMALMENTE HACER ANTES UN APT UPDATE (ya que la mayoría son basados en Debian).

## 5.4. Obtener información de los contenedores.

Conforme vayamos usando docker el número de contenedores que tenemos funcionando irá en aumento hasta que llegue un momento en que no sepamos con seguridad aspectos como si el contenedor tenía persistencia o no, si tenía redirección de puertos o no, si le había puesto algún nombre o estaba usando un nombre concedido por docker etc.
En ese contexto hay varios comandos docker que me van a ayudar a obtener información de un contenedor. En este curso vamos a usar los dos siguientes:

+ La orden docker ps.
+ La orden docker inspect.
+ La orden docker logs.

### 5.4.1. Docker ps.

La orden **docker ps** nos va a servir para obtener información de los contenedores ya arrancados. La información que nos proporciona va a ser menos exhaustiva que la que podemos obtener con **docker inspect** pero nos puede ayudar a determinar aspectos como:

+ El **estado** del contenedor (Parado EXITED o Funcionado UP).
+ La **imagen** de la que deriva el contenedor.
+ El **tamaño** actual del contenedor.
+ La orden que ejecuta el contenedor al arrancar, lo que se llama el ENTRYPOINT.
+ El **nombre** del contenedor, ya sea dado por nosotros o por docker.
+ **Cuando fue creado** el contenedor.
+ Las **redirecciones de puertos**, en caso de haberlas.

Como muchas de las órdenes de **docker ps** tiene multitud de opciones (flags) así que para ilustrar su uso mejor vamos a poner varios ejemplos de las más usadas.
```bash
# Mostrar los contenedores que están en ejecución
docker ps
# Mostrar todos los contenedores, estén parados o en ejecución (-a o --all)
docker ps -a
# Añadir la información del tamaño del contenedor a la información por defecto (-s o --size)
docker ps -a -s
# Mostrar información del último contenedor que se ha creado (-l o --latest). Da igual el estado
docker ps -l
# Filtar los contenedores de acuerdo a algún criterio usando la opción (-f o --filter)
# Filtrado por nombre
docker ps --filter name=servidor_web
# Filtrado por puerto. Contenedores que hacen público el puerto 8080
docker ps --filter publish=8080
```

### 5.4.2. Docker inspect.

Si la información que hemos obtenido usando docker ps , que es una información general, no es suficiente para nuestro objetivo deberemos usar la docker inspect que nos va a dar una información detallada del contenedor que seleccione. Lo podemos hacer de las siguientes formas:
```bash
# Por nombre. Por ejemplo: Mostrar información detallada del contenedor cuyo nombre es jenkins
docker inspect jenkins
# Por id. Por ejemplo: Mostrar información detallada del contenedor cuyo id es 5e5adf6815bc
docker inspect 5e5adf6815bc
```
Al ejecutar esto obtendremos una imagen similar a la siguiente:
![Docker Inspect](../img/dockerInspect.png)

Esta imagen es una imagen parcial, porque se nos muestra mucha información, está en formato JSON (JavaScript Object Notation) y nos da datos sobre aspectos como:

+ El id del contenedor.
+ Los puertos abiertos y sus redirecciones.
+ Los bind mounts y volúmenes usados.
+ El tamaño del contenedor
+ La configuración de red del contenedor.
+ El ENTRYPOINT que es lo que se ejecuta al hacer docker run.
+ El valor de las variables de entorno.
+ Y muchas más cosas....

Adicionalmente podemos formatear la salida usando https://pkg.go.dev/text/template y el flag --format/-f. Una descripción detallada queda fuera de los objetivos de este curso pero vamos a poner varios ejemplos:
```bash
# Mostrar la ip del contenedor
docker inspect --format 'La ip es {{.NetworkSettings.Networks.bridge.IPAddress}}' jenkins
La ip es 172.17.0.2
# Mostrar las redirecciones de puertos del contenedor
docker inspect --format 'Las redirecciones de puertos son {{.NetworkSettings.Ports}}' jenkins
Las redirecciones de puertos son map[50000/tcp:[{0.0.0.0 50000}] 8080/tcp:[{0.0.0.0 9090}]]
```

> [!NOTE] 
> 
>Para poder este formateo debemos conocer en profundidad la estructura del JSON que nos devuelve.

### 5.4.3. Docker Logs.
Los dos comandos que hemos visto anteriormente nos dan información relativa al contenedor pero no nos dan información de lo que está pasando en el contenedor. Para determinar este tipo de cosas siempre hemos tenido los logs y siguen estando disponibles aunque estemos en docker mediante el uso de la orden docker logs, que me va a servir tanto para contenedores que estén parados como para contenedores en ejecución.

Los podemos hacer de las siguientes formas:
```bash
# Por nombre. Por ejemplo: Mostrar los logs del contenedor cuyo nombre es jenkins
docker logs jenkins
# Por id. Por ejemplo: Mostrar los logs cuyo id es 5e5adf6815bc
docker logs 5e5adf6815bc
```
Como todas las órdenes docker logs tiene más opciones más cuyo uso vamos a ilustrar con ejemplos:
```bash
# Opción -f o --follow . Sigue escuchando la salida que pueden dar los logs del contenedor
docker logs -f jenkins
# Opción  --tail 5. Muestra las 5 últimas líneas de los logs del contenedor en cuestión
docker logs --tail 5 jenkins
```
## 5.5. Gestión de contenedores.

Con el paso del tiempo iremos ejecutando muchos contenedores y llegará un momento en que tengamos la necesidad de realizar operaciones como las siguientes:

+ Parar un contenedor que no estamos necesitando o que , puede ser, esté ejecutando un servicio que ocupe un puerto que queremos ocupar con otro servicio o contenedor.
+ Eliminar un contenedor que instalamos y que ya no necesitamos. Puede ser que ya ni nos acordemos del motivo por el cual teníamos "eso" en nuestro sistema (a mí al menos me pasa).
+ Queremos iniciar un contenedor que estaba parado pero que vamos a volver a necesitar.
+ Queremos reiniciar un contenedor para que nuevas opciones de configuración sean aplicadas.

Para operaciones de ese tipo tenemos las siguientes órdenes docker:

+ **docker stop** para detener el contenedor, ya sea por nombre o por ID.
+ **docker rm** para borrar el contenedor, ya sea por nombre o por ID.
+ **docker start** iniciar un contenedor que estaba parado previamente, ya sea por nombre o por ID.
+ **docker restart** para reiniciar un contenedor que previamente ya estaba en ejecución.

Cada una de ellas tiene diferentes flags u opciones. Vamos a ver las más importantes mediante ejemplos:
```bash
# Para un contenedor en ejecución que se llame servidorWeb
docker stop servidorWeb
# Para un contenedor en ejecución cuyo ID es ea9b922190d8 pero esperando 10 segundo (-t o --time)
docker stop -t 10 ea9b922190d8
# Borrar un contenedor que se llama servidorBD
docker rm servidorBD
# Borrado un contenedor que se llame jenkins aunque esté en ejecución (--force o -f)
docker rm -f jenkins
# Inicio de un contenedor con nombre jenkins
docker start jenkins
# Inicio de un contenedor con nombre jenkins pero haciendo el attach de la entrada estándar para poder interactuar con él (-i o --interactive)
docker start -i jenkins
# Reinicio de un contenedor con ID ea9b922190d8
docker restart ea9b922190d8
```

Hay que tener en cuenta varias cosas que si pensamos un poco ya nos indica los efectos el propio sentido común:

+ Si hago **docker start** y el contenedor ya está iniciado, no pasa nada.
+ Si hago **docker stop** y el contenedor ya está parado, no pasa nada.
+ Si hago **docker restart** y el contenedor ya está parado, es lo mismo que si ejecutar un docker start.
+ Pero es importante destacar que **SI UN CONTENEDOR ESTÁ EN EJECUCIÓN NO PODEMOS BORRARLO** salvo que usemos la opción -f. 

# 6. Persistencia en Docker.
