# UT3 APACHE <!-- omit in toc -->
---

![Logo Apache](../img/apacheLogo.svg)


- [1. Introducción.](#1-introducción)
- [2. Instalación en Debian/Ubuntu.](#2-instalación-en-debianubuntu)
- [3. Ficheros de configuración.](#3-ficheros-de-configuración)
  - [3.1. Opciones de configuración para servidores virtuales.](#31-opciones-de-configuración-para-servidores-virtuales)
- [4. Host Virtuales.](#4-host-virtuales)
  - [4.1. Configuración de los puertos de escucha.](#41-configuración-de-los-puertos-de-escucha)
  - [4.2. Como funciona los Virtual Host.](#42-como-funciona-los-virtual-host)
  - [4.3. Ejemplo: Virtual Host basado en IP.](#43-ejemplo-virtual-host-basado-en-ip)
  - [4.4. Ejemplo: Servir el mismo contenido en varias IP.](#44-ejemplo-servir-el-mismo-contenido-en-varias-ip)
  - [4.5. Ejemplo: Sirviendo distintos sitios en distintos puertos.](#45-ejemplo-sirviendo-distintos-sitios-en-distintos-puertos)
- [5. Fichero .htacces.](#5-fichero-htacces)
- [6. Módulos en Apache.](#6-módulos-en-apache)
  - [6.1. Utilización de módulos.](#61-utilización-de-módulos)
  - [6.2. Módulos activos por defecto.](#62-módulos-activos-por-defecto)
- [7. Acceso autentificado.](#7-acceso-autentificado)
  - [7.1. Creación de contraseñas.](#71-creación-de-contraseñas)
  - [7.2. Restricciones de acceso a recursos.](#72-restricciones-de-acceso-a-recursos)
- [8. Protocolo Https.](#8-protocolo-https)
- [9. Enlaces Web.](#9-enlaces-web)




# 1. Introducción.

Protocolo de comunicaciones estándar que comunica servidores, proxys y clientes. Permite la transferencia de documentos web, sin importar cual es el cliente o cual es el servidor.
Es un protocolo basado en el esquema petición/respuesta. El cliente realiza una petición y el servido devuelve una respuesta.

El protocolo HTTP está basado en mensajes de texto plano y es un protocolo sin manejo de estados.

El usuario escribe una URL, indicando el protocolo, servidor y recurso que quiere obtener, el servidor procesa dicha información y devuelve un mensaje de respuesta, normalmente con el HTML de la página que se va a visualizar,…

Cuando se realiza una petición se puede utilizar uno de los siguientes métodos:

+ GET: Solicita un documento al servidor. Se pueden enviar datos en la URL.
+ HEAD: Similar a GET, pero sólo pide las cabeceras HTTP.
+ POST: Manda datos al servidor para su procesado. Similar a GET, pero además envía datos en el cuerpo del mensaje.
+ PUT: Almacena el documento enviado en el cuerpo del mensaje.
+ DELETE: Elimina el documento referenciado en la URL.

Cuando el servidor devuelve una respuesta se indica un código de estado:

![Apache codigos](../img/apacheCodigos.png)

# 2. Instalación en Debian/Ubuntu.

Para instalar el servidor web Apache en sistemas GNU/Linux Debian/Ubuntu y derivados, ejecutamos como administrador:

```bash
sudo apt update
sudo apt install apache2
apache2 -v # nos indica la versión de apache instalada
```

Para controlar el servicio apache2 podemos usar ([para más información](https://httpd.apache.org/docs/2.4/es/stopping.html)):

```bash
apache2ctl [-k start|restart|graceful|graceful-stop|stop]
```

La opción graceful es un reinicio suave, se terminan de servir las peticiones que están establecidas y cuando se finaliza se hace una reinicio del servidor.

Con esta herramienta podemos obtener también más información del servidor:

+ **apache2ctl -t** : Comprueba la sintaxis del fichero de configuración.
+ **apache2ctl -M** : Lista los módulos cargados.
+ **apache2ctl -S** : Lista los sitios virtuales y las opciones de configuración.
+ **apache2ctl -V** : Lista las opciones de compilación

Evidentemente el servidor está gestionado por Systemd, por lo tanto para controlar el arranque, reinicio y parada del servicio utilizaremos la siguiente instrucción:

``` bash
systemctl [start|stop|restart|reload|status] apache2.service
```
Podemos comprobar el funcionamiento del servidor abriendo el navegador y escribiendo la dirección.

```
http://localhost

http://127.0.0.1

http://IP_privada_servidor
```

# 3. Ficheros de configuración.

## 3.1. Opciones de configuración para servidores virtuales.

# 4. Host Virtuales.

## 4.1. Configuración de los puertos de escucha.

## 4.2. Como funciona los Virtual Host.

## 4.3. Ejemplo: Virtual Host basado en IP.

## 4.4. Ejemplo: Servir el mismo contenido en varias IP.

## 4.5. Ejemplo: Sirviendo distintos sitios en distintos puertos.

# 5. Fichero .htacces.

# 6. Módulos en Apache.

## 6.1. Utilización de módulos.

## 6.2. Módulos activos por defecto.

# 7. Acceso autentificado.

## 7.1. Creación de contraseñas.

## 7.2. Restricciones de acceso a recursos.

# 8. Protocolo Https.

# 9. Enlaces Web.

