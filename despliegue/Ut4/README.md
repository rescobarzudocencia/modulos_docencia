# UT4 SERVIDOR FTP <!-- omit in toc -->
---


![Ftp](../img/ftp.png)


- [1. Introducción.](#1-introducción)
- [2. Clientes FTP.](#2-clientes-ftp)
  - [2.1. Desde el navegador.](#21-desde-el-navegador)
  - [2.2. Modo Texto.](#22-modo-texto)
- [3. Servidor Ftp.](#3-servidor-ftp)
  - [3.1. Modo Activo.](#31-modo-activo)
  - [3.2. Modo Pasivo.](#32-modo-pasivo)
  - [3.3. Servidor Linux.](#33-servidor-linux)
  - [3.4. Servidor Windows.](#34-servidor-windows)


# 1. Introducción.

FTP, o Protocolo de Transferencia de Archivos (del inglés, File Transfer Protocol), es un protocolo de red estándar utilizado para transferir archivos entre computadoras a través de una red TCP/IP como Internet. Permite a un cliente FTP conectarse a un servidor FTP para descargar archivos de dicho servidor o subir archivos desde el cliente hacia el servidor. 

# 2. Clientes FTP.

Un cliente FTP es un programa o aplicación de software que se instala en un ordenador y permite transferir archivos a través de Internet a un servidor remoto, utilizando el Protocolo de Transferencia de Archivos (FTP) u otros protocolos similares como SFTP o FTPS para mayor seguridad. Estos clientes, como FileZilla o WinSCP, proporcionan una interfaz gráfica, generalmente con dos paneles, para gestionar fácilmente la subida, descarga, modificación y eliminación de archivos entre el equipo local y el servidor. 

## 2.1. Desde el navegador.

Escribir en la barra de direcciones la URL del servidor FTP:
```
protocolo://[ usuario [ :contraseña ] @ ] IPoDNSservidor-ftp [:puerto ] / carpetas/
```
Ejemplos:
```
ftp://ftp.uco.es
ftp://anonymous@ftp.rediris.es
ftp://ftp.ua.es:21
ftp://150.214.110.200
ftp://pedro:1234@131.244.1.1/docs
ftp://belen:1234@ftp.uco.es/alumnado
```

## 2.2. Modo Texto.

Sintaxis de la orden ftp:

`ftp [ IPoNombre-del-servidor ]`

Lo normal es que el servidor solicite un usuario, si no tenemos uno propio se suele asignar el de invitado (guest, anonymous, etc.). Después nos pide una contraseña (si somos invitados, suele ser nada o un e-mail). Tras esto aparece `ftp>` para introducir los comandos.

> Comandos FTP

Desde un símbolo del sistema o terminal basta con teclear el comando ftp de dos formas:

+ Usando parámetros detrás del comando ftp.
+ Solamente poniendo el comando ftp y cambiará el prompt a **ftp>**. En este punto con el comando help se mostrará la lista completa de comandos, de la que solo algunos son imprescindibles.

> [!NOTE]
> Algunos comandos pueden abreviarse, pero por claridad y compatibilidad en este documento siempre indicaremos el comando completo.

Los comandos pueden variar dependiendo de la versión de FTP empleada.

En Windows, al instalar el servidor FTP asegúrate de permitir el acceso desde el Firewall, por defecto los puertos suelen estar cerrados.

Las listas de comandos siguientes contienen comandos FTP que pueden ser de sistemas Windows,Linux o los dos a la vez:

> Comandos de control

Permiten abrir/cerrar la conexión, establecer el modo de transferencia, el puerto, etc.

| Linux y Windows         | Solo Windows   | Solo Linux  | Definición                                                                                                       |
| ----------------------- | -------------- | ----------- | ---------------------------------------------------------------------------------------------------------------- |
| **open** servidor       |                |             | Abre conexión al servidor FTP                                                                                    |
| **close**,**disconect** |                |             | Finaliza la sesión sin cerrar el cliente                                                                         |
|                         | **quote pasv** | **passive** | Activa el modo pasivo. Solicita al servidor que escuche en un puerto de datos distinto al puerto por defecto(20) |
| **type**                |                |             | Informa del tipo o modo de transferencia actual: ASCII o binario                                                 |
| **ascii**               |                |             | Cambia al modo texto ASCII                                                                                       |
| **binary**              |                |             | Cambia al modo binario                                                                                           |

> Comandos de autenticación

Permiten identificarnos, introduciendo un nombre de usuario y contraseña:

| Linux y Windows    | Definición                                          |
| ------------------ | --------------------------------------------------- |
| **user** [usuario] | Cambia el usuario actual por otro (pide contraseña) |

> Comandos de gestión de archivos y directorios

| Linux y Windows                          | Solo Windows | Solo Linux                         | Definición                                                                  |
| ---------------------------------------- | ------------ | ---------------------------------- | --------------------------------------------------------------------------- |
| **!**                                    |              |                                    | Ejecuta comando de la máquina local.                                        |
| **lcd**                                  |              |                                    | Muestra el directorio activo en el cliente.                                 |
| **pwd**                                  |              |                                    | Muestra el directorio activo del servidor                                   |
| **lcd** directorio                       |              |                                    | Cambia a otro directorio del cliente (lcd .. “sube” al directorio anterior) |
| **cd** directorio.                       |              |                                    | Cambia a otro directorio del servidor                                       |
|                                          | **!dir**     | **!ls**                            | Lista el contenido del directorio actual del cliente.                       |
|                                          | **dir**      | **ls**                             | Lista el contenido del directorio actual del servidor.                      |
| **mkdir** directorio, **mkd** directorio |              |                                    | Crea el directorio indicado en el servidor                                  |
| rmdir directorio                         |              |                                    | Elimina un directorio en el servidor(si está vacío)                         |
| **delete** archivo                       |              |                                    | Borra un archivo en el servidor                                             |
| **mdelete** patron                       |              |                                    | Borra múltiples archivos usando comodines (como el asterisco *)             |
| **rename** archivo nuevo_nombre |  |            | Cambia un nombre de archivo remoto |                                                        


> Comandos de Transferencia de Archivos

Permiten subir y bajar archivos:


|Linux y Windows|Definición|
|---------------|----------|
|**get** archivo|Descarga un archivo del servidor a la carpeta local.|
|**mget** archivo|Descarga múltiples archivos usando comodines.|
|**put** archivo|Sube un archivo local al servidor, en el directorio remoto actual.|
|**mput** archivo|Sube múltiples archivos desde el cliente.|

> Comandos de ayuda / información

|Linux y Windows|Definición|
|---------------|----------|
|**help** [comando], **?** [comando]|Muestra información el comando indicado. Sin argumento muestra todos los comandos.


# 3. Servidor Ftp.

Un servidor FTP es un programa de software que permite a los usuarios de Internet transferir archivos entre un ordenador y otro utilizando el Protocolo de Transferencia de Archivos (FTP). Los servidores FTP funcionan como puntos de almacenamiento centralizados y como puntos de conexión entre el remitente y el destinatario de los archivos, permitiendo operaciones de "obtener" (descargar) o "poner" (subir) archivos. Son esenciales para publicar sitios web, realizar copias de seguridad y compartir archivos en redes locales. 

## 3.1. Modo Activo.

Este modo funciona cuando el cliente solicita el servidor, enviando un comando **PORT**, a través de un puerto aleatorio, con un paquete dirigido al **puerto 21**, a fin de transferir un archivo. Una vez establecida la conexión, el servidor inicia otra.

El servidor, a través del **puerto 20**, se pone en contacto inmediatamente con el puerto siguiente del cliente, es decir, imaginemos que el puerto utilizado en la primera conexión, por este, fue el 1500, la utilizada a efectos de la segunda conexión será la 1501, canal de datos.

![Modo Activo](../img/ftpModoActivo.png)

Una vez establecida la conexión, todas las transferencias de archivos se realizan a través de los mismos puertos entre el cliente y el servidor. Por lo tanto, **el cliente establece el canal de comandos, pero es el servidor que establece el canal de datos**.

En el segundo esquema, la presencia de un firewall bloquea el intento de comunicación entre servidor y cliente, ya que el servidor utiliza un puerto diferente de la primera conexión.


## 3.2. Modo Pasivo.

En este, el cliente también se pone en contacto con el puerto 21 del servidor FTP a través de un comando **PASV**. En lugar de iniciar una segunda conexión de inmediato, el servidor responde que el cliente sólo puede ponerse en contacto con un segundo puerto diferente a la primera. Se realiza una segunda conexión entre el cliente y el servidor para la transferencia de datos.

El firewall no bloquea el intento de comunicación entre el servidor y el cliente, ya que ha sido el cliente quien inició la conexión ambas veces.

![Modo Pasivo](../img/ftpModoPasivo.png)

El modo pasivo se utiliza generalmente en situaciones que el servidor FTP no puede establecer el canal de datos, por culpa del firewall, aunque exista una regla en el servidor FTP.

Para un mejor control sobre la red, lo más indicado será utilizar el modo activo, que sólo requiere la apertura de los **puertos 20 y 21**. Ya que el modo pasivo, obliga la apertura de varios puertos, dejando la red más expuesta y con varios puntos de vulnerabilidad, precisamente por estar más puertos accesibles.

**Resumiendo (Modo activo)**:

+ El cliente abre el canal de comandos a través del puerto 1500.
+ Envía el comando PORT para el puerto 21 del servidor.
+ El servidor confirma la conexión del canal de comandos.
+ Abre el canal de datos en el puerto 20 para el cliente en el puerto 1501.
+ El cliente confirma la conexión por el canal de datos.
+ Los canales de comandos y datos están abiertos y listos para su actividad.

**Resumiendo (Modo Pasivo)**:
	
+ El cliente abre el canal de comandos a través del puerto 1500.
+ Envía el comando PASV al servidor dirigido al puerto 21.
+ El comando cambia la transmisión al modo pasivo.
+ A través del canal de comandos, el servidor envía al cliente el puerto que escuchará el canal de datos, por ejemplo 2345.
+ El cliente abre el canal de datos en el puerto 1501 para el puerto 2345 del servidor.
+ El servidor confirma la conexión del canal de datos.
+ Los canales de comandos y datos están abiertos y listos para su actividad.

## 3.3. Servidor Linux.

Uno de los servidores màs utilizados en Linux es **VSFTPD**,

Para su instalación es conveniente actualizar el sistema, una vez actualizado instalamos el servidor con el siguiente comando:

```bash
apt install vsftpd
```
El fichero de configuración se encuentra en:

**/etc/vsftp.conf**

Los parámetros más importantes que debemos descomentar en el servidor FTP son los siguientes:

+ **write_enable=YES** –> Esta directiva nos permite poder escribir (copiar archivos y carpetas) al servidor FTP.
+ **local_umask=022** –> Esta directiva nos permite habilitar los permisos nuevos cuando copiemos datos al servidro FTP, por defecto el umask es 077 pero podremos modificarlo por el valor que nosotros queramos, 022 es el umask más utilizado en otros servidores FTP.
+ **ftpd_banner** –> Esta directiva permite poner un banner de inicio de sesión.
+ **chroot_list_enable=YES** –> Nos permite habilitar el chroot de los diferentes usuarios del sistema, para que solamente un usuario entre en su carpeta /home/usuario y en ninguna más, es una medida de seguridad, pero hay que usarla con mucho cuidado ya que si un usuario tiene permisos en directorios superiores tendrá acceso al resto.
+ **chroot_list_enable=YES** –> Nos permite crear una lista con los usuarios en chroot, todos los que aparezcan aquí podrán conectarte.
+ **chroot_list_file=/etc/vsftpd.chroot_list** –> Es la lista de usuarios con sus rutas predeterminadas.

El servidor  utiliza los usuarios de sistema, con lo que añadir nuevos usuarios consiste en  crear usuarios en el sistema.


También tiene la opción de utilizar Sft, Secure Ftp, habilitando SSL. Por defecto viene deshabilitado y tenemos que habilitarlo.

```
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=NO
```

Cada vez que modificamos el fichero de configuración hay que  reiniciar el servicio con:

```bash
systemctl restart vsftpd
```

Para configurar el modo pasivo:

+ pasv_enable=YES
+ pasv_min_port=5000(o el valor mínimo que desees)
+ pasv_max_port=50100 (el valor máximo que desees)



Otro servidor Linux es **Filezilla Server**, que veremos la configuración para windows.

## 3.4. Servidor Windows.

Uno de los servidores mas utilizados es Filezilla Server. 
Si pulsamos sobre **Server/Configure**, nos aparecerá la pantalla de configuración apareciendo la siguiente pantalla. 

![Filezilla Server Configure](../img/filezillaServerConfigure.png)

**Server listeners**, en esta pantalla se va a configurar los puertos y las direcciones Ip por el cual va ha escuchar nuestro servidor Ftp. Por defecto viene **0.0.0.0** que indica que escucha por cualquier dirección Ip configurada en nuestra maquina. Aquí podemos configurar configurar la Ip si nuestro servidor tuviera mas de una Ip y quisiéramos escuchar por una en concreto.

![Filezilla Server Configure Protocols](../img/filezillaServerConfigureProtocols.png)

**En FTP and FTP over TLS** podemos configurar:

+ **Welcome message**: mensaje de bienvenida.
+ **Pasive mode**: modo pasivo del servidor

![Filezilla Server Configure Usuarios](../img/filezillaServerConfigureUsuarios.png)

En **Rights Management/Groups** podemos crear grupos de usuarios.
En **Rights Management/Users** creamos los usuarios de nuestro servidor FTP.

+ En **Avalilabe users** vemos los usuarios de nuestro sistema, y podemos añadir con Add además de borrar, renombrar y duplicar.
+ Cuando agreguemos un usuario en **Mount point**, tenemos que añadir el directorio raiz del usuario, y darle los permisos oportunos. Primero le damos **Add**. Y en **Mount options**, vamos a configurar los permisos del usuario sobre esa carpeta.

