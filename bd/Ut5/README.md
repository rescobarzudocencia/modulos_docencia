# UT5 CONSULTAS Y SUBCONSULTAS <!-- omit in toc -->
---

- [1. Consulta de datos.](#1-consulta-de-datos)
- [2. Operadores de comparación de cadenas de caracteres.](#2-operadores-de-comparación-de-cadenas-de-caracteres)
- [3. NULL y NOT NULL.](#3-null-y-not-null)
- [4. IN y BETWEEN.](#4-in-y-between)
- [5. Subconsultas.](#5-subconsultas)


# 1. Consulta de datos.

Para recuperar información o, lo que es lo mismo, para realizar consultas a la base de datos, utilizaremos una única sentencia **SELECT**. El usuario emplea esta sentencia con el nivel de complejidad apropiado para él: especifica qué es lo que quiere obtener, no dónde ni cómo. De la consulta se puede obtener: cualquier unidad de datos, todos los datos, cualquier subconjunto de datos, cualquier conjunto de subconjuntos de datos.

El formato de la sentencia SELECT es el siguiente:

```sql
SELECT [ALL|DISTINCT]
[expre_colum1, expre_colum2, ..., expre_column | * ]
[alias columna]
FROM [nombre_tabla1, nombre_tabla2, ..., nombre_tablan]
[WHERE condición]
[GROUP BY expre_colum1 , …, expre_column]
[HAVING condición2]
[ORDER BY expre_colum [DESC|ASC] [,expre_colum [DESC|ASC]]...];
```

Donde:
+ **expre_colum**: puede ser una columna de una tabla, una constante, una expresión aritmética, una función o varias funciones anidadas.
+ `*` : seleccionamos todas las columnas.
+ **DISTINCT**: no muestra valores duplicados.
```sql
SELECT DISTINCT DEPT_NO FROM EMPLE;
```
+ **ALL**: Recuperamos todas las filas es la opción por defecto.
+ **alias**: Cuando se consulta la base de datos, los nombres de las columnas se usan como cabeceras de presentación. Si el nombre resulta demasiado largo, corto o críptico, existe la
posibilidad de cambiarlo con la misma sentencia SQL de consulta creando un ALIAS. El ALIAS se pone entre comillas dobles, a la derecha de la columna.
```sql
SELECT NOMBRE_ALUMNO "Nombre Alumno", (NOTA1+NOTA2+NOTA3)/3 "Nota Media" FROM NOTAS_ALUMNOS;
```
+ **FROM**: FROM [nombre_tabla1, nombre_tabla2, ..., nombre_tablan]

Especifica la tabla o lista de tablas de las que se ecuperarán los datos. Por ejemplo, consultamos los nombres de alumnos y su nota en la tabla ALUMNOS:

```sql
SELECT NOM_ALUM, NOTA FROM ALUMNOS;
SELECT nombre, precio, precio*1.16 FROM ARTICULOS;
```

Es posible asociar un nuevo nombre a las tablas mediante alias. 

```sql
-- si la tabla ALUMNOS le damos el nombre de A, las columnas de la tabla irán acompañadas de A.
SELECT A.NOM_ALUM, A.NOTA FROM ALUMNOS A;
```

+ **WHERE**: [WHERE condición]
  
Obtiene las filas que cumplen la condición expresada. La complejidad de la condición es prácticamente ilimitada. 
El formato de la condición es: *expresión operador expresión*. Lasexpresiones pueden ser una constante, una expresión aritmética, un valor nulo o un nombre de columna. Se pueden construir condiciones múltiples usando los operadores lógicos
booleanos estándares: AND, OR y NOT. Está permitido emplear paréntesis para forzar el orden de evaluación.

Podemos utilizar los siguientes operadores:

|Operador|Descripcion|
|--------|-----------|
|<       | menor que|
|>       | mayor que |
|<>      | distinto |
|<=      | menor o igual|
|>=      | mayor o igual|
|=       | igual   |
|BETWEEN | especifica un intervalo de valores| 
|LIKE    | se utiliza para comparar |
|IN      | se utiliza para especificar si unos datos estan en un conjunto|
|AND     | Evalúa dos condiciones y devuelve un valor verdadero si ambas son verdaderas|
|OR     | Evalúa dos condiciones y devuelve un valor verdadero si alguna de las dos es verdaderas|
|NOT    | Devuelve el valor contrario a la expresión|

Veamos unos ejemplos de condiciones en la cláusula WHERE:

```sql
SELECT NOM_ALUM, NOTA FROM ALUMNOS WHERE NOTA = 5;
SELECT NOM_ALUM, NOTA FROM ALUMNOS WHERE (NOTA>=10) AND (CURSO=1);
```
+ **GROUP BY**: [GROUP BY expre_colum1 , …, expre_column]

Esta cláusula permite crear grupos de datos. Hasta ahora, todas las consultas han recuperado datos en bruto y sin ningún tipo de manipulación. Sin embargo, puede que en ocasiones queramos mostrar alguna tendencia en los datos que requiera que el servidor de la base de datos los procese de alguna manera antes de obtener el conjunto de resultados. Uno de estos mecanismos es la cláusula **group by**, que se utiliza para agrupar datos por los valores de las columnas. 

Por ejemplo, en lugar de consultar una lista de empleados y los departamentos a los que están asignados, es probable que deseemos ver una lista de departamentos junto con el número de empleados asignados a cada uno de ellos.

Cuando utilicemos la cláusula **group by**, también podemos utilizar la cláusula **having**, que le permite filtrar los datos de grupo del mismo modo que la cláusula **where** permite filtrar datos sin manipular.

Vamos a ver la diferencia de usar group by o no:

+ **Sin group by**: Si hacemos:
```sql
select SUM(pvp) from dormitorio;
-- Obtenemos la suma de todo el dinero de la tabla.
```

+ **Con group by**: Si hacemos:
```sql
select inmueble_id,SUM(pvp) from dormitorio
group by inmueble_id;
-- Obtenemos la suma por cada casa.
```
+ **HAVING**: [HAVING condición2]

Esta cláusula siempre viene acompañada de una cláusula **GROUP BY**. Y permite restringir los gruposformados por GROUP BY. Sería el WHERE de los grupos.

+ **ORDER BY**: [ORDER BY expre_columna [DESC|ASC] [,expre columna[DESC|ASC]]...]

Esta cláusula especifica el criterio de clasificación del resultado de la consulta. **ASC** especifica una ordenación ascendente, y **DESC** descendente. Es posible anidar los criterios. El situado más a la izquierda será el principal. 

```sql
SELECT * FROM ALUMNOS ORDER BY NOM_ALUM, CURSO DESC;
-- ordena por NOM_ALUM ascendente y por CURSO descendente.
```
También se puede indicar mediante un número, que indica la posición de la columna a la derecha de SELECT, el criterio de clasificación.

```sql
SELECT DEPT_NO, DNOMBRE, LOC FROM DEPART ORDER BY 2;
-- ordena la salida por la segunda columna que es DNOMBRE.
```
Podemos ver la estructura de una tabla con el comando DESC.
```sal
DESC  NOTAS_ALUMNOS;
```
Nos muestra el nombre de los campos, el tipo de dato si es admite valores NULL, las claves primaria y foráneas y los valores por defecto de los campos.

# 2. Operadores de comparación de cadenas de caracteres.

Para comparar cadenas de caracteres, hasta ahora hemos utilizado el operador de comparación Igual a (=). 

```sql
-- Partiendo de la tabla EMPLE, obtenemos el apellido de los ANALISTAS del departamento 10.
SELECT APELLIDO FROM EMPLE WHERE OFICIO = 'ANALISTA' AND DEPT_NO=10;
```

Pero este operador no nos sirve si queremos hacer consultas de este tipo: Obtener los datos de los empleados cuyo apellido empiece por una «P» u «obtener los nombres de alumnos que incluyan la palabra Pérez». Para especificar este tipo de consultas, en SQL usamos el operador LIKE que permite utilizar los siguientes caracteres especiales en las cadenas de comparación:

+ **% Comodín**: representa cualquier cadena de 0 o más caracteres.
+ **'_' Marcador de posición**: representa un carácter cualquiera.

**Ejemplos**: (Hemos de tener en cuenta que las mayúsculas y minúsculas son significativas, ‘m’ no es lo mismo que ‘M’, y que las constantes alfanuméricas deben encerrarse siempre entre
comillas simples).

+ **LIKE 'Director'** la cadena 'Director'.
+ **LIKE 'M%'** cualquier cadena que empiece por 'M'.
+ **LIKE '%X%'** cualquier cadena que contenga una 'X'.
+ **LIKE ' _M'** cualquier cadena de 3 caracteres terminada en 'M'.
+ **LIKE 'N_'** una cadena de 2 caracteres que empiece por 'N'.
+ **LIKE '_R%'** cualquier cadena cuyo segundo carácter sea una 'R' .

```sql
-- apellidos que empiezan por J
SELECT APELLIDO FROM EMPLE WHERE APELLIDO LIKE 'J%';
-- apellidos que tengan una R en segunda posición
SELECT APELLIDO FROM EMPLE WHERE APELLIDO LIKE '_R%';
-- apellidos que empieces por A y tengan una O en su interior
SELECT APELLIDO FROM EMPLE WHERE APELLIDO LIKE 'A%O%';
```

# 3. NULL y NOT NULL.

Se dice que una columna de una fila es NULL si está completamente vacía. Para comprobar si el valor de una columna es nulo empleamos la expresión: columna IS NULL. Si queremos saber si el valor de una columna no es nulo, usamos la expresión: columna IS NOT NULL. Cuando comparamos con valores nulos o no nulos no podemos utilizar los operadores de igualdad, mayor o menor.

```sql
-- a partir de la tabla EMPLE, consultamos los apellidos de los empleados cuya comisión es nula
SELECT APELLIDO FROM EMPLE WHERE COMISION IS NULL;
-- si queremos consultar los apellidos de los empleados cuya comisión no sea nula teclearemos esto:
SELECT APELLIDO FROM EMPLE WHERE COMISION IS NOT NULL;
```

# 4. IN y BETWEEN.

También podemos comparar una columna o una expresión con una lista de valores utilizando los operadores IN y BETWEEN.

El operador **IN** nos permite comprobar si una expresión pertenece o no (NOT) a un conjunto de valores, haciendo posible la realización de comparaciones múltiples. 

Su formato es:
```sql
<expresión> [NOT] IN (lista de valores separados por comas)
```

```sql
-- Consulta los apellidos de la tabla EMPLE cuyo número de departamento sea 10 o 30:
SELECT APELLIDO FROM EMPLE WHERE DEPT_NO IN(10,30);
-- Consulta los apellidos de la tabla EMPLE cuyo número de departamento no sea ni 10 ni 30:
SELECT APELLIDO FROM EMPLE WHERE DEPT_NO NOT IN(10,30);
-- Consulta los apellidos de la tabla EMPLE cuyo oficio sea 'VENDEDOR', 'ANALISTA' o 'EMPLEADO':
SELECT APELLIDO FROM EMPLE WHERE OFICIO IN ('VENDEDOR', 'ANALISTA','EMPLEADO');
```

El operador **BETWEEN** comprueba si un valor está comprendido o no (NOT) dentro de un rango de valores, desde un valor inicial a un valor final. 

Su formato es:
```sql
<expresión> [NOT] BETWEEN valor_inicial AND valor_final
```
```sql
-- A partir de la tabla EMPLE, obtén el apellido y el salario de los empleados cuyo salario esté comprendido entre 1500 y 2000
SELECT APELLIDO, SALARIO FROM EMPLE WHERE SALARIO BETWEEN 1500
AND 2000;
```

# 5. Subconsultas.

A veces, para realizar alguna operación de consulta, necesitamos los datos devueltos por otra consulta; una subconsulta, que no es más que una sentencia SELECT dentro de otra SELECT. Las subconsultas son aquellas sentencias SELECT que forman parte de una cláusula WHERE de una sentencia SELECT anterior. Una subconsulta consistirá en incluir una declaración SELECT como parte de una cláusula WHERE. El formato de una subconsulta es similar a éste:

```sql
SELECT ...
FROM ...
WHERE columna operador_comparativo (SELECT ...
                                    FROM ...
                                    WHERE ... );
```

La subconsulta (el comando SELECT entre paréntesis) se ejecutará primero y, posteriormente, el valor extraído es «introducido» en la consulta principal.

Las instrucciones que incluyen una subconsulta suelen emparejarse con uno de estos patrones en las secciones WHERE o HAVING:

+ Expresión_WHERE/HAVING **[NOT] IN** (subconsulta).
+ Expresión_WHERE/HAVING **operador_comparación [ANY | ALL]** (subconsulta).
+ WHERE **[NOT] EXISTS** (subconsulta).

```sql
-- Con la tabla EMPLE, obtén el APELLIDO de los empleados con el mismo OFICIO que 'GIL'.
SELECT APELLIDO FROM EMPLE WHERE OFICIO = (SELECT OFICIO FROM EMPLE WHERE APELLIDO ='GIL');
-- Obtener aquellos apellidos de empleados cuyo oficio sea alguno de los oficios que hay en el departamento 20.
SELECT APELLIDO FROM EMPLE WHERE OFICIO IN (SELECT OFICIO FROM EMPLE WHERE DEPT_NO=20);
--Listar los departamentos que tengan empleados.
SELECT DNOMBRE, DEPT_NO FROM DEPART WHERE EXISTS (SELECT * FROM EMPLE WHERE EMPLE.DEPT_NO= DEPART.DEPT_NO);
-- Obtener los datos de los empleados cuyo salario sea igual a algún salario de los empleados del departamento 30.
SELECT * FROM EMPLE WHERE SALARIO = ANY (SELECT SALARIO FROM EMPLE WHERE DEPT_NO=30);
-- Obtener los datos de los empleados cuyo salario sea menor a cualquier salario de los empleados del departamento 30.
SELECT * FROM EMPLE WHERE SALARIO < ALL (SELECT SALARIO FROM EMPLE WHERE DEPT_NO=30);
-- Usamos las tablas EMPLE y DEPART. Queremos consultar los datos de los empleados que trabajen en 'MADRID' o 'BARCELONA'. La localidad de los departamentos se obtiene de la tabla DEPART. Hemos de relacionar las tablas EMPLE y DEPART por el número de departamento.
SELECT EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO,  COMISION, DEPT_NO FROM EMPLE WHERE DEPT_NO IN (SELECT DEPT_NO FROM DEPART WHERE LOC IN ()'MADRID','BARCELONA'));
```
