# UT2 DOCKER <!-- omit in toc -->
---
- [1.Introducción.](#1introducción)
  - [1.1. Virtualización.](#11-virtualización)
  - [1.2. Contenedores.](#12-contenedores)
  - [1.3. Glosario.](#13-glosario)
- [2. Instalación.](#2-instalación)


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


