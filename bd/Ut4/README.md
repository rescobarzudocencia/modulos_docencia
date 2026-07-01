# UT4 CREACION DE TABLAS, VISTAS Y GESTIÓN DE USUARIOS <!-- omit in toc -->
---


- [1. Introducción.](#1-introducción)
- [2. Elementos del lenguaje. Normas de escritura.](#2-elementos-del-lenguaje-normas-de-escritura)
- [3. Tipos de datos.](#3-tipos-de-datos)
  - [3.1. Tipos de dato numéricos.](#31-tipos-de-dato-numéricos)
  - [3.2. Tipos de dato con formato fecha.](#32-tipos-de-dato-con-formato-fecha)
  - [3.3. Tipos de dato con formato string.](#33-tipos-de-dato-con-formato-string)
- [4. Creación de la base de datos.](#4-creación-de-la-base-de-datos)



# 1. Introducción.

SQL (Structured Query Language) es el lenguaje fundamental de los SGBD relacionales. Es uno de los lenguajes más utilizados en informática en todos los tiempos. SQL surgió como una evolución de SEQUEL (Structured English Query Language), lenguaje definido por IBM en 1977. ANSI lo definió como estándar unos años más tarde (1986), y fue adoptado también por ISO al año siguiente. Es un lenguaje declarativo y, por tanto, lo más importante es definir qué se desea hacer, y no cómo hacerlo. De esto último ya se encarga el SGBD. Hablamos por tanto de un lenguaje normalizado que nos permite trabajar con cualquier tipo de lenguaje (ASP o PHP) en combinación con cualquier tipo de base de datos (Access, SQL Server, MySQL, Oracle, etc.). El lenguaje SQL puede ser utilizado tanto de forma interactiva (en una consola del SGBD) como inmerso dentro de un lenguaje anfitrión.

SQL posee dos características muy apreciadas, potencia y versatilidad, que contrastan con su facilidad para el aprendizaje, ya que utiliza un lenguaje bastante natural. Es por esto que las instrucciones son muy parecidas a órdenes humanas. Por esta característica se le considera un Lenguaje de Cuarta Generación. Aunque frecuentemente se oye que SQL es un "lenguaje de consulta", ten en cuenta que no es exactamente cierto ya que contiene muchas otras capacidades además de la de consultar la base de datos, como son la definición de la propia estructura de los datos, su manipulación, y la especificación de conexiones seguras.

# 2. Elementos del lenguaje. Normas de escritura.

El lenguaje SQL está compuesto por comandos, cláusulas, operadores, funciones y literales. Todos estos elementos se combinan en las instrucciones y se utilizan para crear, actualizar y manipular bases de datos. 

En SQL no se distingue entre mayúsculas y minúsculas. Da lo mismo como se escriba. El final de una instrucción o sentencia lo marca el signo de punto y coma.

Las sentencias SQL (SELECT, INSERT, …) se pueden escribir en varias líneas siempre que las palabras no sean partidas. Los comentarios en el código SQL pueden ser de 2 tipos:

+ de bloque: comienzan por /* y terminan por */
+ de línea: comienzan por – y terminan en final de línea

# 3. Tipos de datos.

Cuando se crea una tabla instrucción **CREATE TABLE** se debe especificar el tipo de dato para cada una de sus columnas, estos tipos de datos definen el dominio de valores que cada columna puede contener. Los tipos de datos primarios son: 

| Categoría    | Tipo de dato       | Tamaño aproximado    | Descripción                 | Ejemplo               |
| ------------ | ------------------ | -------------------- | --------------------------- | --------------------- |
| Numérico     | `TINYINT`          | 1 byte               | Entero muy pequeño          | `edad TINYINT`        |
| Numérico     | `SMALLINT`         | 2 bytes              | Entero pequeño              | `cantidad SMALLINT`   |
| Numérico     | `MEDIUMINT`        | 3 bytes              | Entero mediano              | `codigo MEDIUMINT`    |
| Numérico     | `INT` o `INTEGER`  | 4 bytes              | Entero                      | `id INT`              |
| Numérico     | `BIGINT`           | 8 bytes              | Entero muy grande           | `poblacion BIGINT`    |
| Numérico     | `DECIMAL(M,D)`     | Variable             | Decimal exacto              | `precio DECIMAL(8,2)` |
| Numérico     | `NUMERIC(M,D)`     | Variable             | Equivalente a DECIMAL       | `nota NUMERIC(4,2)`   |
| Numérico     | `FLOAT`            | 4 bytes              | Decimal de precisión simple | `temperatura FLOAT`   |
| Numérico     | `DOUBLE`           | 8 bytes              | Decimal de doble precisión  | `altura DOUBLE`       |
| Numérico     | `BIT(M)`           | Variable             | Almacena bits               | `permisos BIT(8)`     |
| Lógico       | `BOOLEAN` o `BOOL` | 1 byte               | Valor lógico (0 ó 1)        | `activo BOOLEAN`      |
| Texto        | `CHAR(n)`          | Fijo                 | Cadena de longitud fija     | `dni CHAR(9)`         |
| Texto        | `VARCHAR(n)`       | Variable             | Cadena de longitud variable | `nombre VARCHAR(50)`  |
| Texto        | `TINYTEXT`         | Hasta 255 caracteres | Texto corto                 | `comentario TINYTEXT` |
| Texto        | `TEXT`             | Hasta 65 KB          | Texto largo                 | `descripcion TEXT`    |
| Texto        | `MEDIUMTEXT`       | Hasta 16 MB          | Texto muy largo             | `articulo MEDIUMTEXT` |
| Texto        | `LONGTEXT`         | Hasta 4 GB           | Texto extremadamente largo  | `libro LONGTEXT`      |
| Fecha y hora | `DATE`             | 3 bytes              | Fecha                       | `fecha DATE`          |
| Fecha y hora | `TIME`             | 3 bytes              | Hora                        | `hora TIME`           |
| Fecha y hora | `DATETIME`         | 8 bytes              | Fecha y hora                | `fecha_hora DATETIME` |
| Fecha y hora | `TIMESTAMP`        | 4 bytes              | Marca temporal              | `creado TIMESTAMP`    |
| Fecha y hora | `YEAR`             | 1 byte               | Año                         | `curso YEAR`          |

## 3.1. Tipos de dato numéricos.
Listado de cada uno de los tipos de dato numéricos en MySQL, su ocupación en disco y valores. 

+ **INT (INTEGER)**: Ocupación de 4 bytes con valores entre -2147483648 y 2147483647 o entre 0 y 4294967295. 
+ **SMALLINT**: Ocupación de 2 bytes con valores entre -32768 y 32767 o entre 0 y 65535. 
+ **TINYINT**: Ocupación de 1 bytes con valores entre -128 y 127 o entre 0 y 255. 
+ **MEDIUMINT**: Ocupación de 3 bytes con valores entre -8388608 y 8388607 o entre 0 y 16777215. 
+ **BIGINT**: Ocupación de 8 bytes con valores entre -8388608 y 8388607 o entre 0 y 16777215. 
+ **DECIMAL (NUMERIC)**: Almacena los números de coma flotante como cadenas o string. 
+ **FLOAT (m,d)**: Almacena números de coma flotante, donde ‘m’ es el número de dígitos de la parte entera y ‘d’ el número de decimales. 
+ **DOUBLE (REAL)**: Almacena número de coma flotante con precisión doble. Igual que FLOAT, la diferencia es el rango de valores posibles. 
+ **BIT (BOOL, BOOLEAN)**: Número entero con valor 0 o 1. 

## 3.2. Tipos de dato con formato fecha. 
Listado de cada uno de los tipos de dato con formato fecha en MySQL, su ocupación en disco y valores. 

+ **DATE**: Válido para almacenar una fecha con año, mes y día, su rango oscila entre ‘1000- 01-01′ y ‘9999-12-31′. 
+ **DATETIME**: Almacena una fecha (año-mes-día) y una hora (horas-minutos-segundos), su rango oscila entre ‘1000-01-01 00:00:00′ y ‘9999-12-31 23:59:59′. 
+ **TIME**: Válido para almacenar una hora (horas-minutos-segundos). Su rango de horas oscila entre -838-59-59 y 838-59-59. El formato almacenado es ‘HH:MM:SS’. 
+ **TIMESTAMP**: Almacena una fecha y hora UTC. El rango de valores oscila entre ‘1970-01- 01 00:00:01′ y ‘2038-01-19 03:14:07′. 
+ **YEAR**: Almacena un año dado con 2 o 4 dígitos de longitud, por defecto son 4. El rango de valores oscila entre 1901 y 2155 con 4 dígitos. Mientras que con 2 dígitos el rango es desde 1970 a 2069 (70-69). 

## 3.3. Tipos de dato con formato string.

Listado de cada uno de los tipos de dato con formato string en MySQL, su ocupación en disco y valores. 

+ **CHAR**: Ocupación fija cuya longitud comprende de 1 a 255 caracteres. 
+ **VARCHAR**: Ocupación variable cuya longitud comprende de 1 a 255 caracteres. 
+ **TINYBLOB**: Una longitud máxima de 255 caracteres. Válido para objetos binarios como son un fichero de texto, imágenes, ficheros de audio o vídeo. No distingue entre minúsculas y mayúsculas. 
+ **BLOB**: Una longitud máxima de 65.535 caracteres. Válido para objetos binarios como son un fichero de texto, imágenes, ficheros de audio o vídeo. No distingue entre minúsculas y mayúsculas. 
+ **MEDIUMBLOB**: Una longitud máxima de 16.777.215 caracteres. Válido para objetos binarios como son un fichero de texto, imágenes, ficheros de audio o vídeo. No distingue entre minúsculas y mayúsculas. 
+ **LONGBLOB**: Una longitud máxima de 4.294.967.298 caracteres. Válido para objetos binarios como son un fichero de texto, imágenes, ficheros de audio o vídeo. No distingue entre minúsculas y mayúsculas. 
+ **SET**: Almacena 0, uno o varios valores una lista con un máximo de 64 posibles valores. 
+ **ENUM**: Igual que SET pero solo puede almacenar un valor. 
+ **TINYTEXT**: Una longitud máxima de 255 caracteres. Sirve para almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas. 
+ **TEXT**: Una longitud máxima de 65.535 caracteres. Sirve para almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas. 
+ **MEDIUMTEXT**: Una longitud máxima de 16.777.215 caracteres. Sirve para almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas. 
+ **LONGTEXT**: Una longitud máxima de 4.294.967.298 caracteres. Sirve para almacenar texto plano sin formato. Distingue entre minúsculas y mayúsculas. 

# 4. Creación de la base de datos.

Básicamente, la creación de la base de datos consiste en crear las tablas que la componen. Con el estándar de SQL la instrucción a usar sería **Create Database**, pero cada SGBD tiene un procedimiento para crear las bases de datos.


> Crear Base de datos.

```sql
create database nombreBaseDatos;
```
> Borrar Base de datos.

```sql
drop database nombreBaseDatos;
```
