# UT3 MODELO RELACIONAL <!-- omit in toc -->
---

- [1. Introducción.](#1-introducción)
- [2. Elementos y propiedades del modelo relacional](#2-elementos-y-propiedades-del-modelo-relacional)
- [3. Transformación de un esquema E/R a esquema relacional.](#3-transformación-de-un-esquema-er-a-esquema-relacional)
  - [3.1. Entidades.](#31-entidades)
  - [3.2. Relaciones binarias.](#32-relaciones-binarias)
    - [3.2.1. Relaciones N:M.](#321-relaciones-nm)
    - [3.2.2 Relaciones 1:N.](#322-relaciones-1n)
    - [3.2.3. Relaciones 1:1.](#323-relaciones-11)
    - [3.2.4. Relaciones reflexivas.](#324-relaciones-reflexivas)
    - [3.2.5. Relaciones N-arias.](#325-relaciones-n-arias)
    - [3.2.6. Interrelaciones débiles.](#326-interrelaciones-débiles)
    - [3.2.7. Generalización y especialización.](#327-generalización-y-especialización)
      - [3.2.7.1. Ejemplo de especialización exclusiva/total.](#3271-ejemplo-de-especialización-exclusivatotal)
      - [3.2.7.2. Ejemplo de especialización inclusiva/total.](#3272-ejemplo-de-especialización-inclusivatotal)
- [4. Normalización.](#4-normalización)





# 1. Introducción.

**Edgar Frank Codd** definió las bases del **modelo relacional** a finales de los 60. En 1970 publicaba el documento “A Relational Model of data for Large Shared Data Banks” (“Un modelo relacional de datos para grandes bancos de datos compartidos”). 

El modelo relacional de datos es el **modelo lógico** en el que se basan la mayoría de los Sistemas Gestores de Bases de Datos (SGBD) usados en la actualidad, tales como ORACLE, Access, MySQL,MS SQL Server, postgreSQL, etc.

Los objetivos que buscaba Codd con el modelo relacional iban encaminados a obtener:

+ **Independencia física**. Almacenamiento/manipulación. Un cambio físico en la base de datos no afecta a los programas.
+ **Independencia lógica**. Añadir, eliminar o modificar elementos en la BD no debe repercutir en los programas y/o usuarios que acceden a ellos.
+ **Flexibilidad**. Ofrecer al usuario los datos en la forma más adecuada a cada aplicación.
+ **Uniformidad**. Las estructuras lógicas de los datos son tablas. Facilita la concepción y utilización de la BD por parte de los usuarios.
+ **Sencillez**. Por las características anteriores y por los sencillos lenguajes de usuario que utiliza, el modelo relacional es fácil de comprender y utilizar por parte del usuario final.

# 2. Elementos y propiedades del modelo relacional

+ **Relación (tabla)**: Representan las entidades de las que se quiere almacenar información en la BD. Esta formada por:
  + **Filas (Registros o Tuplas)**: Corresponden a cada ocurrencia de la entidad.
  + **Columnas (Atributos o campos)**: Corresponden a las propiedades de la entidad. Siendo rigurosos una relación está constituida sólo por los atributos, sin las tuplas.
+ Las relaciones tienen las siguientes **propiedades**:
  + Cada relación tiene un nombre y éste es distinto del nombre de todas las demás relaciones de la misma BD.
  + No hay dos atributos que se llamen igual en la misma relación.
  + El orden de los atributos no importa: los atributos no están ordenados.
  + Cada tupla es distinta de las demás: no hay tuplas duplicadas. (Como mínimo se diferenciarán en la clave principal)
  + El orden de las tuplas no importa: las tuplas no están ordenadas.
+ **Clave candidata**: atributo que identifica unívocamente una tupla. Cualquiera de las claves candidatas se podría elegir como clave principal.
+ **Clave Principal**: Clave candidata que elegimos como identificador de la tuplas.
+ **Clave Alternativa**: Toda clave candidata que no es clave primaria (las que no hayamos elegido como clave principal)
+ Una clave principal no puede asumir el valor nulo (**Integridad de la entidad**).
+ **Dominio de un atributo**: Conjunto de valores que pueden ser asumidos por dicho atributo.
+ **Clave Externa o foránea o ajena**: el atributo o conjunto de atributos que forman la clave principal de otra relación. Que un atributo sea clave ajena en una tabla significa que para introducir datos en ese atributo, previamente han debido introducirse en la tabla de origen. Es decir, los valores presentes en la clave externa tienen que corresponder a valores presentes en la clave principal correspondiente (**Integridad Referencial**).


# 3. Transformación de un esquema E/R a esquema relacional.

Pasamos ya a enumerar las normas para traducir del Modelo E/R al modelo relacional, ayudándonos del siguiente ejemplo (el ejemplo no tiene toda la casuistica que vamos a ver solo algunas):

![Ejemplo ER](../img/3_ejemploER.webp)

> [!NOTE]
> Al pasar del esquema E/R al esquema Relacional deberemos añadir las **claves foráneas** necesarias para establecer las interrelaciones entre las tablas. Dichas claves foráneas no aparecen representadas en el esquema E/R.


> [!IMPORTANT]
> Se deben elaborar los diagramas relacionales de tal forma que, posteriormente al introducir datos, **no quede ninguna clave foránea a valor nulo (NULL)**. Para ello se siguen las reglas que se muestran a continuación.

## 3.1. Entidades.

Cada entidad se transforma en una tabla. El identificador (o identificadores) de la entidad pasa a ser la clave principal de la relación y aparece **subrayada** o con la indicación: PK (Primary Key). Si hay clave alternativa esta se pone en «negrita».

Transformación de la Entidad AULA.

aula([cod_aula](#),num_plazas,num_ordenadores)

## 3.2. Relaciones binarias.

### 3.2.1. Relaciones N:M.

Cada una de las entidades que participan genera una tabla. Además generamos otra tabla que genera la relación, con las claves primarias de ambas entidades. Esta tercera tabla la clave primaria será la agregación de las claves principales de las entidades. Estas claves hay que declararlas como claves foráneas  **FK (Foreign Key)**. Se indicarán en **negrita**.


> [!NOTE]
> Los atributos de la relación pasan a la tabla que la relación genera.

Realicemos el paso a tablas de la relación N:M entre MÓDULO (1,n) y ALUMNO (1,n). Este tipo de relación siempre genera tabla y los atributos de la relación, pasan a la tabla que ésta genera.

alumno([num_expediente](#),nombre,tlfno,fecha_nac)

modulo([cod_modulo](#),nombre)

cursa([**num_expediente,cod_modulo**](#),nota)

### 3.2.2 Relaciones 1:N.

Podemos tener 2 casos:

+ **Caso 1**: Si la entidad del lado «1» presenta participación (0,1), entonces se crea una nueva tabla para la relación que incorpora como claves ajenas las claves de ambas entidades. La clave principal de la relación será sólo la clave de la entidad del lado «N». Si la relación tuviese atributo se agregaria a la nueva tabla.
  
Realicemos el paso a tablas de la relación 1:N entre PROFESOR (1,n) y EMPRESA (0,1). Como en el lado «1» encontramos participación mínima 0, se generará una nueva tabla. Donde la clave principal es la clave principal de la entidad que participa con cardinalidad mínima 1. Si elegimos la de cardinalidad mínima 0, podemos obtener valores nulos, y una clave primaria no puede poseer valores nulos.

empresa([cod_empresa](#),nombre)

profesor([dni](#),nombre,tlfno,direccion)

trabaja([**dni_profesor**](#),**cod_empresa**)

+ **Caso 2**: Para el resto de situaciones, la entidad del lado «N» recibe como clave ajena la clave de la entidad del lado «1». Propagación de clave. Los atributos propios de la relación pasan a la tabla donde se ha incorporado la clave ajena. Si la relación tiene atributo también se propaga.

Realicemos el paso a tablas de la relación 1:N entre MÓDULO (1,1) y TEMA (1,n). Como no hay participación mínima «0» en el lado 1, no genera tabla y la clave principal del lado «1» pasa como foránea al lado «n».

modulo([codigo_modulo](#),nombre)

tema([cod_tema](#),titulo,**cod_modulo**)

### 3.2.3. Relaciones 1:1.

Podemos tener 3 casos:

+ **Caso 1**: Si las dos entidades participan con participación (0,1), entonces se crea una nueva tabla para la relación. Si la interrelación tuviese atributo se agregaría a la nueva tabla.


No se presenta ninguna situación así en el esquema estudiado. Una situación donde puede darse este caso es en HOMBRE (0,1) se casa con MUJER (0,1). Es similar al caso 1 del apartado anterior en relaciones 1:N, aunque en este caso debemos establecer una restricción de valor único para FK2.

hombre([dni_h](#),nombre,tlfno,direccion)

mujer([dni_m](#),nombre,tlfno,direccion)

secasacon([**dni_m**](#),**dni_h**)


+ **Caso 2**: Si alguna entidad, pero no las dos, participa con participación mínima 0 (0,1), entonces se pone la clave ajena en dicha entidad, para evitar en lo posible, los valores nulos. Propagación de clave. Si la relación tuviese atributo también se propagaría el atributo.


+ **Caso 3**: Si tenemos una relación 1:1 y ninguna tiene participación mínima 0, elegimos la clave principal de una de ellas y la introducimos como clave clave ajena en la otra tabla. Se elegirá una u otra forma en función de como se quiera organizar la información para facilitar las consultas. Los atributos propios de la relación pasan a la tabla donde se introduce la clave ajena. Propagación de clave. Si la relación tuviese atributo también se propagaría el atributo.

Caso 2 y 3. Realicemos el paso a tablas de la relación 1:1 entre ALUMNO (1,1) y BECA (0,1). Como BECA tiene participación mínima 0, incorporamos en ella, como clave foránea, la clave de ALUMNO. Esta forma de proceder también es válida para el caso 3, pudiendo acoger la clave foránea cualquiera de las entidades.

alumno([num_expediente](#),nombre,tlfno,fecha_nac)

beca([id](#),cuantia,fecha,**num_expediente**)

> [!IMPORTANT]
> Las claves propagadas no pueden contener valores NULOS.


### 3.2.4. Relaciones reflexivas.

 + Si es **1:1**, no genera tabla. En la entidad se introduce dos veces la clave, una como clave principal y otra como clave ajena. Se suele introducir una modificación en el nombre por diferenciarlas. 
 + Si es **1:N**, se puede generar tabla o no. Si hubiese participación 0 en el lado 1, obligatoriamente se generaría tabla. 
 + Si es N:N, la relación genera tabla.

Realicemos el paso a tablas de la relación reflexiva de ALUMNO. Como no tiene participación mínima «0» en el lado 1, no genera tabla. La clave principal de ALUMNOS, volverá a aparecer en ALUMNOS como clave foránea, igual que en cualquier relación 1:N. Ahora bien, como no puede haber dos campos con el mismo nombre en la misma tabla, deberemos cambiar un poco el nombre de la clave principal, para que haga referencia al papel que ocupa como clave foránea.

alumno([num_expediente](#),nombre,tlfno,fecha_nac,**num_expediente_delegado**)


### 3.2.5. Relaciones N-arias.

Relaciones n-arias (solo veremos hasta grado 3): Siempre generan tabla. Las claves principales de las entidades que participan en la relación pasan a la nueva tabla como claves foráneas. Y solo las de los lados «n» forman la principal. Si hay atributos propios de la relación, estos se incluyen en esa tabla.

### 3.2.6. Interrelaciones débiles.

La interrelación que provenga de una entidad débil con dependencia en existencia o en identificación se modeliza como propagación de clave y la clave ajena no admitir valores nulos,
tal y como se ha indicado en la transformación de las interrelaciones 1:1.


### 3.2.7. Generalización y especialización.

Existen varias soluciones para realizar el el paso a tablas de una especialización. La solución que se elija en cada caso dependerá del tipo de especialización que estemos resolviendo: total, parcial, inclusiva o exclusiva.

Las 3 soluciones posibles que podemos aplicar son las siguientes:

1. Crear una única tabla para la superclase. En este caso todos los atributos de las subclases se guardarían en la superclase.

2. Crear una tabla sólo para las subclases. En este caso los atributos de la superclase habría que guardarlos en cada una de las subclases.

3. Crear una tabla para cada una de las entidades, tanto para la superclase como las subclases. En este caso las subclases tendrían que guardar la clave de la primaria de la superclase.

#### 3.2.7.1. Ejemplo de especialización exclusiva/total.


#### 3.2.7.2. Ejemplo de especialización inclusiva/total.


# 4. Normalización.
