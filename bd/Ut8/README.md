# UT8 POSTGRESQL <!-- omit in toc -->
---


- [1. Introducción.](#1-introducción)
- [2. Datos complejos.](#2-datos-complejos)
  - [2.1. Tipos de gran tamaño.](#21-tipos-de-gran-tamaño)
  - [2.2 Tipos definidos por el usuario.](#22-tipos-definidos-por-el-usuario)
  - [2.3. Colecciones.](#23-colecciones)
- [3. Herencia.](#3-herencia)
  - [3.1. Herencia incompleta.](#31-herencia-incompleta)



# 1. Introducción.

Una base de datos objeto-relacional combina dos enfoques distintos:

+ El modelo relacional, que organiza la información en tablas (filas y columnas).
+ La programación orientada a objetos, que trabaja con objetos que agrupan datos y comportamiento.
  
Mientras que las bases de datos relacionales tradicionales se centran únicamente en los datos, el modelo orientado a objetos introduce estructuras más complejas y dinámicas. Para resolver esta diferencia, surgen las bases de datos objeto-relacionales, que amplían el modelo relacional incorporando características propias de los objetos.

En este contexto, PostgreSQL es uno de los sistemas gestores más destacados, ya que, aunque es una base de datos relacional, incluye extensiones que permiten trabajar con conceptos propios de la programación orientada a objetos.

Gracias a estas extensiones, PostgreSQL permite utilizar:

+ Tipos de datos compuestos (similares a objetos).
+ Arrays y estructuras complejas.
+ Tipos de datos definidos por el usuario.
+ Enumeraciones.
+ Herencia de tablas.

Estas características coinciden con las principales aportaciones de los Sistemas de Gestión de Bases de Datos Objeto-Relacionales (SGBDOR), que incluyen:

+ El uso de datos complejos.
+ La posibilidad de herencia.
+ La implementación de objetos mediante tipos abstractos definidos por el usuario.

En conclusión, las bases de datos objeto-relacionales representan una evolución del modelo relacional clásico, permitiendo manejar estructuras de datos más complejas. PostgreSQL es un ejemplo claro de este enfoque, ya que integra herramientas que acercan el mundo relacional al paradigma orientado a objetos.

# 2. Datos complejos.

## 2.1. Tipos de gran tamaño.

Son tipos de datos para almacenar gran cantidad de información entre los que podemos incluir los **BLOB** (Binary Large Object), que pueden guardar objetos de imagen, audio y vídeo, y los **CLOB** (Character Large Object), que almacenan texto.

```sql
CREATE TABLE entregas_tareas (
    entrega_id INT PRIMARY KEY,
    alumno_id INT NOT NULL,
    fecha_entrega TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Campo CLOB: Guarda la justificación o respuesta escrita por el alumno
    comentarios_alumno CLOB,  
    -- Campo BLOB: Guarda el archivo adjunto (el proyecto en sí)
    archivo_adjunto BLOB
);
```

## 2.2 Tipos definidos por el usuario.

Son tipos de datos que crea el usuario: simples o estructurados y están definidos sobre otros predefinidos en el sistema gestor.

Los atributos compuestos del modelo conceptual eran transformados en atributos simples en el modelo relacional. En los sistemas objeto-relacionales no se tiene que realizar esta transformación: pueden ser creados como objetos. Dependiendo de como se implemente el tipo de dato estructurado por el SGBDOR se soportarán en mayor o en menor medida las características del modelo orientado a objetos.

Para poder crear un tipo de dato se utiliza la sentencia **CREATE TYPE** y hay que tener en cuenta que dos tipos de datos diferentes, aunque estén definidos sobre el mismo tipo de dato base, no se pueden comparar, a no ser que se fuerce la comparación con la función **CAST** o con el operador conversor de tipos del SGBD utilizado. Por ejemplo, en el caso de que se cree un tipo EUROS y otro DOLARES, aunque estén los dos definidos como decimal, el sistema no deja sumarlos porque son de diferente tipo, hay que usar la función CAST.

El tipo de dato estructurado estará formado por: atributos y funciones o métodos que definan su comportamiento. El estándar **SQL:1999** distingue dos tipos de datos abstractos: los que permiten el encapsulamiento y los que no (tipo tupla). Estos últimos utilizan procedimientos externos al tipo de dato estructurado (funciones, disparadores) para añadir funcionalidad a los datos que incluyen, como por ejemplo PostgreSQL. Sin embargo, Oracle implementa un tipo de datos que permite el encapsulamiento: los atributos y los métodos que definen su comportamiento se almacenan en el mismo lugar, característica inherente en el modelo orientado a objetos.

```sql
-- Creamos el tipo personalizado para estados de un pedido
CREATE TYPE estado_pedido AS ENUM ('pendiente', 'procesando', 'enviado', 'entregado');

-- Creamos un tipo compuesto para representar una dirección
CREATE TYPE direccion_tipo AS (
    calle VARCHAR(100),
    ciudad VARCHAR(50),
    codigo_postal VARCHAR(10)
);
-- Usamos el tipo en una tabla como si fuera cualquier otro tipo de dato
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente VARCHAR(100),
    direccion direccion_tipo,
    estado estado_pedido DEFAULT 'pendiente'
);
-- Insertamos datos en la tabla, el id no lo introducidmos ya que
-- el tipo de dato SERIAL es autoincremental

INSERT INTO pedidos (id, cliente, direccion,estado) 
VALUES ('Ana Gómez', ('Calle Mayor 12', 'Madrid', '28001'));
```
## 2.3. Colecciones.

Son tipos que permiten almacenar conjuntos de valores en cualquier columna. Esto provoca que no se cumpla un concepto fundamental en el modelo relacional: **la primera forma normal**.

Por otro lado, si se utiliza un tipo de dato estructurado como dominio de una columna, cada fila de esa columna solo puede contener un objeto y se mantendría la restricción del modelo relacional de que la intersección de cada fila con cada columna esté formada por valores atómicos.

```sql
CREATE TABLE empleado (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    -- Definimos las columnas telefs y emails como un array de texto usando []
    telefs VARCHAR(14)[],
    emails VARCHAR(40)[] 
);
-- Insertar
INSERT INTO empleado VALUES(
    DEFAULT, 'Damián Polaina','secretario deportivo',
    '{"34123456789","34987654321"},{"dampol@gmail.com","dampol@hotmail.com"}
);
```

> Algunas funciones de PostgreSQL que trabajan con arrays son

+ **array_append(array, elemento)**: Agrega el elemento al final del array.
+ **array_cat(array1, array2)**: Concatena los dos arrays pasados como parámetros.
+ **array_length(array, dimension)**: Devuelve la longitud de la dimensión de la matriz
+ **array_positions(array, elemento)**: Devuelve una matriz de subíndices de todas las apariciones del segundo argumento en la matriz dada (debe ser unidimensional).
+ **array_replace(array, elemento1, elemento2)**: Reemplaza cada elemento de la matriz igual a elemento1 con el valor de elemento2.

Estas funciones se utilizan principalmente en dos lugares: en las consultas de selección (**SELECT**) para ver los datos modificados al momento, o en las sentencias de actualización (**UPDATE**) para cambiar permanentemente el contenido de la tabla.

> Ejemplo de cada una

```sql
-- Queremos añadir un nuevo email a la lista de Damián.
UPDATE empleado
SET emails = array_append(emails,'nuevo_correo@empresa.com')
WHERE id=1;

-- Ver los teléfonos actuales junto con uno de centralita solo para el informe.
SELECT nombre, array_cat(telefs,'{"900123123"}') AS todos_los_contactos FROM empleado;

-- Saber cuantos telefonos tiene cada empleado
SELECT nombre,array_length(telefs,1) AS total_telefonos
FROM empleado;

-- Imagina que en la tabla empleado, un trabajador ha registrado por error el mismo número de teléfono dos veces en su lista, de esta forma: telefs = {"34611111111", "900000000", "34611111111"}.

SELECT nombre, array_positions(telefs,'34611111111') AS donde_esta
FROM empleado
WHERE id=1;

-- Imagina que el secretario deportivo ha cambiado su correo de Hotmail a Outlook y queremos actualizarlo en su lista de emails.
SELECT nombre, array_replace(emails,'poldam@hotmail.com','poldman@outlook.com')
FROM empleado
WHERE id=1;
```

# 3. Herencia.

En el modelo relacional hemos utilizado el concepto de herencia a través de las entidades llamadas **supertipo** y **subtipo**. En el supertipo se agrupaban las características comunes de todos los subtipos y en estos solo se incluían sus características específicas. Entre el supertipo y el subtipo había una relación especial **"Es un"**: un ejemplar del subtipo es un ejemplar del supertipo que hereda todas las características del supertipo.

Hemos transformado estas entidades al modelo relacional de tres formas posibles y una de ellas lo hacía creando interrelaciones 1:1 entre cada pareja (supertipo, subtipo) del esquema conceptual. Los SGBDOR incorporan un mecanismo directo y automático de transformación, sin tener que crear el tipo de interrelación 1:1, utilizando **INHERITS** en el subtipo.

En PostgreSQL las tablas y las tuplas son como clases y objetos en el paradigma orientado a objetos. Las tablas que proceden del subtipo (clase derivada) heredan los atributos de la tabla supertipo (clase principal). Algunas operaciones sobre la tabla subtipo pueden dar lugar a errores de integridad, como veremos en el ejemplo que mostramos a continuación.

+ Forma de ver la herencia en programación

![Herencia 1](../img/8_herencia1.png)

+ Forma de ver la herencia en el diagrama entidad relación.
  
![Herencia 2](../img/8_herencia2.png)

> Ejemplo

Supongamos que deseamos crear una pequeña base de datos para gestionar las clases (actividades) que se imparten en un pequeño gimnasio. Algunos requerimientos de este sistema de información son:

+ Cada clase la imparte un solo monitor.
+ Una clase tendrá asignados varios horarios, por ejemplo, la clase de boxeo sepuede impartir los lunes a partir de las 8:00h y los miércoles a partir de las 10:00h.
+ Algunas clases serán “online” y retransmitidas mediante una aplicación de videoconferencia.
+ Es habitual que un monitor pueda impartir distintas clases.
+ La información que falta por exponer queda representada en el DER (DiagramaEntidad-Relación) mostrado en la figura siguiente.

![Herencia 3](../img/8_herencia3.png)

[Sql del ejemplo.](ejemplo.sql)

## 3.1. Herencia incompleta.

En PostgreSQL como en cualquier sistema gestor relacional si intentamos insertar un registro en la tabla **clase** (supertipo) con un identificador existente nos devolverá un error por duplicidad en clave primaria. Asimismo, si en esta inserción introducimos un monitor inexistente (**monitor_id**), retornará otro error al no existir un valor en la tabla padre (monitor) que se corresponda con la clave ajena en la tabla hija (clase). Este comportamiento es el esperado, pero no es el mismo cuando operamos con la tabla **claseonline** (subtipo, también llamada subclase o derivada) ya que el sistema no hace ninguna comprobación para garantizar la integridad de entidad y la integridad referencial.

Vamos a ir mostrando basándonos en el ejemplo.

La información existente en las tablas del ejemplo 7 es la siguiente:

```sql
SELECT * FROM monitor;
```
![Ejemplo Herencia 1](../img/8_ejeherencia1.png)

```sql
SELECT * FROM clase;
```
![Ejemplo Herencia 2](../img/8_ejeherencia2.png)

Para consultar solo la información de una de las tablas de la jerarquía debemos poner detrás de la cláusula **FROM** la palabra **ONLY** nombretabla.

La información existente en las tablas es la siguiente:

```sql
SELECT * FROM ONLY claseonline;
```
![Ejemplo Herencia 3](../img/8_ejeherencia3.png)

Si realizamos la inserción descrita más abajo en la tabla claseonline, debería rechazarla, ya que provoca duplicidad en los valores de la clave primaria de la tabla clase; sin embargo, la operación es aceptada:

```sql
INSERT INTO claseonline VALUES( 1,'boxeo', 2, ARRAY[ROW('martes','17:00'),
ROW('jueves','17:00')] ::thorario[], 'Zoom','r4');

SELECT * FROM clase;
```

![Ejemplo Herencia 4](../img/8_ejeherencia4.png)

Comprobamos que hay duplicidad de valores en la clave primaria de la tabla **clase**: el campo **id** tiene el valor 1 para las clases de pilates y boxeo y por tanto no se respeta la **integridad de entidad**.

> [!note]
> Esto pasa porque en la herencia de PostgreSQL, la restricción de "Clave Primaria" de la tabla padre no se aplica automáticamente a las tablas hijas.

Asimismo, si realizamos esta otra inserción descrita a continuación sobre la tabla claseonline, debería rechazarla, ya que el valor de la clave foránea (monitor_id) no existe en la clave primaria (id) de la tabla con la que se corresponde (monitor); sin embargo, la operación es aceptada.

```sql
INSERT INTO claseonline VALUES(
DEFAULT,'baile',3,ARRAY[ROW('martes','19:00'),ROW('jueves', '21:00')] ::thorario[],'Meet','r5' );
SELECT * FROM clase;
```

![Ejemplo Herencia 5](../img/8_ejeherencia5.png)

Comprobamos que podemos introducir el **monitor_id** con valor 3 que no está dado de alta en la tabla **monitor** y por tanto no se respeta la **integridad referencial**.

Para que no existan inconsistencias en la base de datos añadiremos un disparador en la tabla claseonline que se active en las operaciones de inserción y actualización y que realice este tipo de comprobaciones:

```sql
--- DISPARADOR 
CREATE OR REPLACE FUNCTION ChkIntegridClaseOnline() RETURNS TRIGGER AS $$
BEGIN

IF EXISTS (SELECT * FROM clase WHERE id=NEW.id)
THEN
    RAISE NOTICE 'Operación rechazada';
    RAISE NOTICE 'Duplicidad de clases: ya existe una clase con el identificador %',NEW.id;
    RETURN NULL;
END IF;

IF NOT EXISTS (SELECT * FROM monitor WHERE id=NEW.monitor_id) THEN
    RAISE NOTICE 'Operación rechazada';
    RAISE NOTICE 'Monitor inexistente: se debe dar de alta previamente al monitor %',NEW.monitor_id;
    RETURN NULL;
END IF;

RAISE NOTICE 'La operación de % ha sido aceptada',TG_OP; -- Trigger Operation (Operación del Disparador), 
-- puede tomar los valores de INSERT, UPDATE, DELETE
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER ChkIntegridClaseOnline BEFORE INSERT OR UPDATE ON claseonline FOR EACH ROW 
EXECUTE PROCEDURE ChkIntegridClaseOnline(); -- Conecta el disparador con la función que hemos definido arriba
```

Podemos eliminar los dos últimos registros introducidos en la tabla:

```sql
DELETE FROM claseonline WHERE id IN (1,7);
SELECT * FROM clase;
```

![Ejemplo Herencia 2](../img/8_ejeherencia2.png)

Introducimos en la base de datos el trigger ChkIntegridClaseOnline e intentamos insertar los datos borrados anteriormente (inconsistentes):
```sql
INSERT INTO claseonline VALUES (1,'boxeo',2,
ARRAY[ROW('martes','17:00'),ROW('jueves','17:00')]::thorario[],'Zoom','r4');
```

![Ejemplo Herencia 6](../img/8_ejeherencia6.png)

No se permite introducir un valor de una clave primaria duplicada.

```sql
INSERT INTO claseonline VALUES(DEFAULT,'baile',3,
ARRAY[ROW('martes','19:00'),ROW('jueves','21:00')]::thorario[], 'Meet','r5');
```

![Ejemplo Herencia 7](../img/8_ejeherencia7.png)

Tampoco se permite introducir un valor en la clave foránea (monitor_id), heredada de la tabla clase, que no exista en la clave primaria (id) de la tabla (monitor) con la que se corresponde.

Por tanto, todas las tablas cumplen las restricciones de integridad de la base de datos.