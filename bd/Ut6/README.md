# UT6 MANIPULACIÓN DE DATOS<!-- omit in toc -->
---
- [1. Inserción de datos.](#1-inserción-de-datos)
  - [1.1. INSERT con SELECT.](#11-insert-con-select)
  - [1.2. Creación de una tabla con datos de un SELECT.](#12-creación-de-una-tabla-con-datos-de-un-select)
- [2. Modificación de datos.](#2-modificación-de-datos)
  - [2.1. UPDATE con SELECT.](#21-update-con-select)
- [3. Eliminación de datos.](#3-eliminación-de-datos)
  - [3.2. Truncar una tabla](#32-truncar-una-tabla)
- [4. Transacciones.](#4-transacciones)
  - [4.1. AUTOCOMMIT.](#41-autocommit)
  - [4.2. START TRANSACTION, COMMIT y ROLLBACK,](#42-start-transaction-commit-y-rollback)
  - [4.3. SAVEPOINT, ROLLBACK TO SAVEPOINT y RELEASE SAVEPOINT.](#43-savepoint-rollback-to-savepoint-y-release-savepoint)
- [5. Acceso concurrente a los datos.](#5-acceso-concurrente-a-los-datos)


# 1. Inserción de datos.

Para obtener filas en una sentencia SELECT, previamente hemos tenido que introducir datos en las tablas de la base de datos. Hemos tratado anteriormente la sentencia SELECT porque las operaciones de inserción (**INSERT**), actualización (**UPDATE**) y borrado (**DELETE**) admiten en su sintaxis la cláusula SELECT.

Una vez creada la estructura de la base de datos podemos insertar tuplas en cualquiera de las tablas que la componen. Cuando se realiza una inserción, los valores introducidos en las columnas de la tabla deben cumplir todas las restricciones definidas en la misma: clave primaria, reglas de validación, etc.

```sql
INSERT INTO <tabla> [(nombre_columna,...)]
{ VALUES ({<valor> | DEFAULT | NULL} , ... ,) | <consulta_SELECT> }
```

Existen dos formas de realizar inserciones:

+ **Modo implícito**: Los nombres de las columnas de la tabla se omiten. Los valores de las columnas deben introducirse en el mismo orden en el que están definidas en la tabla y no se puede omitir ningún valor de ninguna columna.
+ **Modo explícito**: Se indican los nombres de las columnas donde se inserta la información. En este caso, los valores de las columnas tienen que especificarse en el orden establecido en la cláusula INSERT y se deben incluir todas las columnas que sean obligatorias (NOT NULL), aunque se pueden omitir los nombres de las columnas que tengan definidas un valor por defecto (DEFAULT) o ser nulas (NULL).

Los valores de las columnas a insertar deben ir encerrados entre comillas simples si
pertenecen a dominios de tipo fecha, hora o cadenas de caracteres.

> Ejemplo

Tenemos la tabla PROFESORES con los siguientes atributos:

```sql
create table profesores(
    dni INT PRIMARY KEY,
    cod_centro TINYINT NOT NULL,
    apellidos VARCHAR(30), 
    especialidad VARCHAR(15)
);
```
Damos de alta a una profesora con estos apellidos y nombre: ‘Pérez Fernández, Ana’, de la especialidad ‘INFORMÁTICA’ y con el código de centro 78. Las columnas a las que damos valores son: APELLIDOS, ESPECIALIDAD y COD_CENTRO:

```sql
INSERT INTO PROFESORES (APELLIDOS, ESPECIALIDAD, COD_CENTRO, DNI)
VALUES (‘Pérez Fernández, Ana’, ‘INFORMÁTICA’, 78, 14151617);
```
Insertamos ahora a un profesor de apellidos y nombre ‘Sánchez Márquez, Mario’ en el código de centro 34, con DNI 14141414 y de la especialidad de ‘SAI’:

```sql
INSERT INTO PROFESORES VALUES (14141414, 34, ‘Sánchez Márquez','Mario’, ‘SAI’);
```

No es necesario especificar el nombre de las columnas ya que las hemos dado un valor en la fila que insertamos para todas las columnas. Este valor ha de ir en el mismo orden en que las
columnas estén definidas en la tabla.

## 1.1. INSERT con SELECT.

Hasta ahora solo hemos insertado una fila, pero si a **INSERT** añadimos una consulta, se añaden tantas filas como devuelva la consulta. Si no se especifican los nombres de columna en **INSERT**, por defecto se consideran todas las columnas de la tabla.

```sql
INSERT INTO Nombretabla1 *(columna *,columna+…)+
SELECT ,columna *,columna+ … | *-
FROM Nombretabla2 [cláusulas de select];
```

> Ejemplo
```sql
INSERT INTO propietario (id, nombre, telefono, nacion)
SELECT id_i, nombre_i, telefono_i, nacion_i
FROM propietario_inactivo
WHERE nacion_i = 'España';
```
## 1.2. Creación de una tabla con datos de un SELECT.

La sentencia CREATE TABLE permite crear una tabla a partir de la consulta de otra tabla ya existente. La nueva tabla contendrá los datos obtenidos en la consulta. Se lleva a cabo esta acción con la cláusula AS colocada al final de la orden CREATE TABLE. El formato es el que sigue:
```sql
CREATE TABLE Nombretabla (
Columna [, Columna]
)AS consulta;
```
No es necesario especificar tipos ni tamaño de las columnas, ya que vienen determinados por los tipos y los tamaños de las recuperadas en la consulta. La consulta puede contener una subconsulta, una combinación de tablas o cualquier sentencia SELECT válida. Las restricciones CON NOMBRE no se crean en una tabla desde la otra, sólo se crean aquellas restricciones que carecen de nombre.

>Ejemplo: 
```sql
-- Se crea la tabla EMPLEYDEPART a partir de las tablas EMPLE y DEPART. Esta tabla contendrá el apellido y el nombre del departamento de cada empleado
CREATE TABLE EMPLEYDEPART AS
SELECT APELLIDO, DNOMBRE
FROM EMPLE, DEPART WHERE EMPLE.DEPT_NO = DEPART.DEPT_NO;
```

# 2. Modificación de datos.

La sentencia UPDATE se utiliza para modificar los valores de cualquier columna y de cualquier fila de una tabla.

> Sintaxis:
```sql
UPDATE <tabla>
SET { <columna> = <expresión> | DEFAULT [, ...] }
[, ( <columna> [, ...]) = ( subconsulta-SELECT ) ] [, ...]
[ WHERE <condiciones> ]
```
> Ejemplos:
```sql
UPDATE inmueble
SET direc = 'Avenida'
WHERE direc LIKE '%Avda.%';
--
UPDATE CENTROS SET DIRECCION = ‘C/Pilón 13’, NUM_PLAZAS = 295
WHERE COD_CENTRO = 22;
```

## 2.1. UPDATE con SELECT.

Podemos incluir una subconsulta en una sentencia **UPDATE**. La cláusula **SELECT** puede estar contenida en la cláusula WHERE o puede formar parte de **SET**.

Cuando la subconsulta (SELECT) forma parte de SET debe seleccionar una única fila y el mismo número de columnas, que las que hay entre paréntesis al lado de SET.

> Formato 1:
>
```sql
UPDATE nombretabla
SET (col1,col2,…)=(SELECT col1,col2,…)
WHERE condición
```

> Formato 2:

```sql
UPDATE nombretabla
SET columna1=(SELECT col1…),
columna2 =(SELECT col2…), …
WHERE condición
```

> Formato 3:

```sql
UPDATE nombretabla
SET columna1=valor1,
columna2=valor2 …
WHERE condición=(select…)
```

# 3. Eliminación de datos.

La sentencia DELETE se utiliza para eliminar aquellas filas de una tabla que son seleccionadas por la cláusula `[WHERE <condiciones>]`. Si se omite esta cláusula se eliminarán todas las filas de la tabla.

> Sintaxis:

```sql
DELETE FROM <tabla>
[ WHERE <condiciones> ]
```

La cláusula WHERE se utiliza de la misma forma que en las sentencias SELECT y UPDATE, por lo que en las condiciones de dicha cláusula se pueden usar subconsultas.

> Ejemplo:

```sql
DELETE FROM CENTROS WHERE COD_CENTRO=50;
```

## 3.2. Truncar una tabla

Truncar una tabla es quitar todas las filas de una tabla sin registrar las eliminaciones individuales de filas. Desde un punto de vista funcional, TRUNCATE TABLE es equivalente a la instrucción DELETE sin una cláusula WHERE; no obstante, TRUNCATE TABLE es más rápida y utiliza menos recursos de registros de transacciones y de sistema.

> Ejemplo:

```sql
TRUNCATE TABLE DEPART;
-- Borra las filas de la tabla DEPART, no borra la tabla.
```

# 4. Transacciones.

Una transacción está formada por un grupo de instrucciones que constituyen un bloque lógico de ejecución y se ejecutan de forma atómica, es decir, o se ejecutan todas las instrucciones que forman el bloque (**COMMIT**) o ninguna (**ROLLBACK**). La  transacción es una herramienta esencial para garantizar la integridad de los datos. Las operaciones que pueden violarla son aquellas que realizan modificaciones en los datos.

Las transacciones cumplen cuatro propiedades básicas denominadas ACID (Atomicity, Consistency, Isolation, Durability):

+ **Atomicidad**: las instrucciones que componen una transacción deben considerarse como una sola.
+ **Consistencia**: una operación no podrá dejar datos inconsistentes y los efectos de dicha operación deben conseguir un estado válido de la base de datos.
+ **Aislamiento**: los cambios provocados por una operación no deben afectar a otros producidos por otras operaciones que se ejecutan al mismo tiempo sobre la base de datos.
+ **Durabilidad**: una vez finalizada la transacción, deben conservarse los cambios provocados por aquella, aunque se produzcan fallos en la base de datos.

## 4.1. AUTOCOMMIT.

Algunos Sistemas Gestores de Bases de Datos, como MySQL tienen activada por defecto la variable **AUTOCOMMIT**. Esto quiere decir que automáticamente se aceptan todos los cambios realizados después de la ejecución de una sentencia SQL y no es posible deshacerlos.

Aunque la variable AUTOCOMMIT está activada por defecto al inicio de una sesión SQL, podemos configurarlo para indicar si queremos trabajar con transacciones implícitas o explícitas.

Podemos consultar el valor actual de AUTOCOMMIT haciendo:

```sql
SELECT @@AUTOCOMMIT;
```
Para desactivar la variable AUTOCOMMIT hacemos:

```sql
SET AUTOCOMMIT = 0;
```
Si hacemos esto siempre tendríamos una transacción abierta y los cambios sólo se aplicarían en la base de datos ejecutando la sentencia COMMIT de forma explícita.

Para activar la variable AUTOCOMMIT hacemos:

```sql
SET AUTOCOMMIT = 1;
```

> [!note]
Para poder trabajar con transacciones en MySQL es necesario utilizar InnoDB. Es el motor por defecto en MYSQL.

## 4.2. START TRANSACTION, COMMIT y ROLLBACK,

Los pasos para realizar una transacción en MySQL son los siguientes:

1. Indicar que vamos a realizar una transacción con la sentencia **START TRANSACTION**, **BEGIN** o **BEGIN WORK**.
2. Realizar las operaciones de manipulación de datos sobre la base datos (insertar, actualizar o borrar filas).
3. Si las operaciones se han realizado correctamente y queremos que los cambios se apliquen de forma permanente sobre la base de datos usaremos la sentencia **COMMIT**. Sin embargo, si durante las operaciones ocurre algún error y no queremos aplicar los cambios realizados podemos deshacerlos con la sentencia **ROLLBACK**.

[Enlace oficial de las transacciones](https://dev.mysql.com/doc/refman/8.0/en/commit.html)
, donde podemos ver la sintaxis.

Vamos a ver varios ejemplos para ver el uso de las transacciones, aunque cuando mejor se va a comprender es cuando estudiemos los procedimientos y las funciones.

> Ejemplo

```sql
DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;

CREATE TABLE cliente (
    id INT UNSIGNED PRIMARY KEY,
    nombre CHAR (20)
);

START TRANSACTION;
INSERT INTO cliente VALUES (1, 'Pepe');
COMMIT;

-- 1. ¿Qué devolverá esta consulta?
SELECT *
FROM cliente;

SET AUTOCOMMIT=0;
INSERT INTO cliente VALUES (2, 'Maria');
INSERT INTO cliente VALUES (20, 'Juan');
DELETE FROM cliente WHERE nombre = 'Pepe';

-- 2. ¿Qué devolverá esta consulta?
SELECT *
FROM cliente;

ROLLBACK;

-- 3. ¿Qué devolverá esta consulta?
SELECT *
FROM cliente;
```
## 4.3. SAVEPOINT, ROLLBACK TO SAVEPOINT y RELEASE SAVEPOINT.

+ **SAVEPOINT**: Nos permite establecer un punto de recuperación dentro de la transacción, utilizando un identificador. Si en una transacción existen dos SAVEPOINT con el mismo nombre sólo se tendrá en cuenta el último que se ha definido.
+ **ROLLBACK TO SAVEPOINT**: Nos permite hacer un ROLLBACK deshaciendo sólo las instrucciones que se hayan ejecutado hasta el SAVEPOINT que se indique.
+ **RELEASE SAVEPOINT**: Elimina un SAVEPOINT.

```sql
SAVEPOINT identifier
ROLLBACK [WORK] TO [SAVEPOINT] identifier
RELEASE SAVEPOINT identifier
```

> Ejemplo

```sql
DROP DATABASE IF EXISTS test;
CREATE DATABASE test CHARACTER SET utf8mb4;
USE test;

CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE
);

INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');

-- 1. Comprobamos las filas que existen en la tabla
SELECT *
FROM producto;

-- 2. Ejecutamos una transacción que incluye un SAVEPOINT
START TRANSACTION;
INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
SAVEPOINT sp1;
INSERT INTO producto (id, nombre) VALUES (5, 'Cinco');
INSERT INTO producto (id, nombre) VALUES (6, 'Seis');
ROLLBACK TO sp1;

-- 3. ¿Qué devolverá esta consulta?
SELECT *
FROM producto;
```

# 5. Acceso concurrente a los datos.

Cuando dos transacciones distintas intentan acceder concurrentemente a los mismos datos pueden ocurrir los siguientes problemas:

+ **Dirty Read (Lectura sucia)**. Sucede cuando una segunda transacción lee datos que están siendo modificados por una transacción antes de que haga COMMIT.

+ **Non-Repeatable Read (Lectura No Repetible)**. Se produce cuando una transacción consulta el mismo dato dos veces durante la ejecución de la transacción y la segunda vez encuentra que el valor del dato ha sido modificado por otra transacción.

+ **Phantom Read (Lectura fantasma)**. Este error ocurre cuando una transacción ejecuta dos veces una consulta que devuelve un conjunto de filas y en la segunda ejecución de la consulta aparecen nuevas filas en el conjunto que no existían cuando se inició lo transacción.

> Ejemplo de Dirty Read (Lectura sucia)

|Transacción 1|	Transacción 2|
|-------------|--------------|
|UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;| |
||SELECT saldo FROM cuentas WHERE id = 1;|
|ROLLBACK	| |

> Ejemplo de Non-Repeatable Read (Lectura No Repetible)

|Transacción 1|	Transacción 2|
|-------------|--------------|
|SELECT saldo FROM cuentas WHERE id = 1;	| |
| |UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;| 
|SELECT saldo FROM cuentas WHERE id = 1;	| |

> Ejemplo de Phantom Read (Lectura fantasma)

|Transacción 1|	Transacción 2|
|-------------|--------------|
|SELECT SUM(saldo) FROM cuentas;	| |
||INSERT INTO cuentas VALUES (4, 3000);|
|SELECT SUM(saldo) FROM cuentas;	| |

