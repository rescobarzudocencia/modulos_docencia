# UT2 MODELO ENTIDAD RELACIÓN <!-- omit in toc -->
---


- [1. Introducción.](#1-introducción)
- [2. Modelo Entidad/Relación (E/R).](#2-modelo-entidadrelación-er)
- [2.1. Entidades.](#21-entidades)
  - [2.1.1. Entidades fuertes.](#211-entidades-fuertes)
  - [2.1.2. Entidades débiles.](#212-entidades-débiles)
- [2.2. Atributos.](#22-atributos)
  - [2.2.1. Atributos Identificadores.](#221-atributos-identificadores)
  - [2.2.2. Atributos descriptivos.](#222-atributos-descriptivos)
  - [2.2.3. Atributos heredados.](#223-atributos-heredados)
  - [2.2.4. Atributos compuestos.](#224-atributos-compuestos)
  - [2.2.5. Atributos Multivaluados.](#225-atributos-multivaluados)
    - [2.2.6. Atributos heredados por identidifacion.](#226-atributos-heredados-por-identidifacion)
  - [2.3 Ejemplos de atributos.](#23-ejemplos-de-atributos)
- [2.3. Relaciones.](#23-relaciones)



# 1. Introducción.
En este tema veremos como hacer el diseño conceptual y lógico de una base de datos. Empezaremos elaborando el modelo conceptual usando diagramas Entidad-Relación y Entidad-Relación extendidos. 

Este diseño es de más alto nivel, más próximo al usuario y más alejado del diseño físico de la BD. A continuación, a partir del modelo Entidad-Relación, procederemos a generar el modelo relacional, el cual ya se halla muy próximo al modelo físico de BD. 

Veremos las reglas de transformación que hemos de seguir para ello. Por último deberemos normalizar las tablas obtenidas para evitar redundancias. Resumiendo, los 2 modelos lógicos, de mayor a menor nivel de abstracción, que veremos en este tema son:

+ Modelo Entidad-Relación (extendido)
+ Modelo Relacional

Cuando hemos de desarrollar una base de datos se distinguen claramente dos fases de trabajo, **Análisis** y **Diseño**. En la siguiente tabla te describimos las etapas que forman parte de cada fase.

|Fase de Análisis|Fase de Diseño|
|:--------------:|:------------:|
|**Análisis de entidades**: Se trata de localizar y definir las entidades y sus atributos. |Diseño de tablas.|
|**Análisis de relaciones**: Se definirán las relaciones existentes entre entidades, | Normalización.|
|**Obtención del Esquema Conceptual** a través del modelo E-R.|Aplicación de retrodiseño, si fuese necesario.|
|Diseño físico| Paso a la implementación física en el SGBD|


# 2. Modelo Entidad/Relación (E/R).

Para la realización de esquemas que ofrezcan una visión global de los datos, Peter Chen en 1976 y 1977 presenta dos artículos en los que se describe el **modelo Entidad/Relación**. Con el paso del tiempo, este modelo ha sufrido modificaciones y mejoras. Actualmente, el modelo **entidad/relación extendido (ERE)** es el más aceptado, aunque existen variaciones que hacen que este modelo no sea totalmente un estándar.

Para la realización de los esquemas E/R seguirmos la siguiente nomenclatura:

![Figuras E/R](../img/2_figurasEr.png)

# 2.1. Entidades.

Una entidad es cualquier objeto o elemento acerca del cual se pueda almacenar información en la BD. Las entidades pueden ser concretas como una persona, un objeto  o abstractas como una fecha. Las entidades se representan gráficamente mediante rectángulos y su nombre aparece en el interior. Un nombre de entidad sólo puede aparecer una vez en el esquema conceptual.

+ Se representan gráficamente mediante un rectángulo.
+ Se recomienda nombrarlas en singular y su nombre aparece en el interior del rectángulo.
+ El nombre de entidad sólo puede aparecer una vez en el modelo entidad relación.

## 2.1.1. Entidades fuertes.

Se dice que una entidad es fuerte si puede existir por sí misma sin que dependa de la existencia de otra entidad.

![Entidades Fuertes](../img/2_entidadesFuertes.png)

## 2.1.2. Entidades débiles.

Si una entidad depende de la existencia de otra, será débil por existencia o por identificación.

![Entidades Débiles](../img/2_entidadesDebiles.png)

Vemos que **Factura** es una entidad fuerte, mientras que **LineaFactura** es debil, ya que una factura está compuesta por muchas **líneas de factura**, y por sí sola no podemos identificar a que factura corresponde esta línea.

Vamos a visualizar con tablas:

> Entidad Factura

| ID Factura | Fecha | Cliente | ID Fiscal / NIF | Moneda | Total Factura |
| :--- | :---: | :--- | :---: | :---: | :---: |
| **FAC-001** | 2026-06-15 | Alimentos S.A. | A12345678 | EUR | 41,00 € |
| **FAC-002** | 2026-06-18 | Tech Solutions | B87654321 | EUR | 185,00 € |
| **FAC-003** | 2026-06-22 | Constructora Norte | A55566677 | EUR | 885,00 € |

> Entidad Linea Factura

| ID Línea | ID Factura  | Descripción Producto     | Cantidad | Precio Unitario | Total Línea |
| :------: | :---------- | :----------------------- | :------: | :-------------: | :---------: |
|  L-001   | **FAC-001** | Harina de trigo 1kg      |    10    |     1,50 €      |   15,00 €   |
|  L-002   | **FAC-001** | Azúcar refinada 1kg      |    5     |     1,20 €      |   6,00 €    |
|  L-003   | **FAC-001** | Aceite de girasol 1L     |    8     |     2,50 €      |   20,00 €   |
|  L-004   | **FAC-002** | Ratón inalámbrico        |    2     |     25,00 €     |   50,00 €   |
|  L-005   | **FAC-002** | Teclado mecánico         |    2     |     60,00 €     |  120,00 €   |
|  L-006   | **FAC-002** | Alfombrilla XL           |    1     |     15,00 €     |   15,00 €   |
|  L-007   | **FAC-003** | Cemento gris (saco)      |    50    |     7,00 €      |  350,00 €   |
|  L-008   | **FAC-003** | Arena de río (m³)        |    3     |     45,00 €     |  135,00 €   |
|  L-009   | **FAC-003** | Ladrillo cerámico (pack) |    5     |     80,00 €     |  400,00 €   |


# 2.2. Atributos.

Las entidades se representan mediante un conjunto de **atributos**. Éstos describen características o propiedades que posee cada miembro de un conjunto de entidades. El mismo atributo establecido para un conjunto de entidades o, lo que es lo mismo, para un tipo de entidad, almacenará información parecida para cada ocurrencia de entidad. Pero, cada ocurrencia de entidad tendrá su propio valor para cada atributo.

+ Representado con un circulo y el nombre del atributo.
+ Si el nombre es muy grande el nombre puede colocarse al lado del circulo. Si no podemos etiquetarlo dentro del circulo.

## 2.2.1. Atributos Identificadores.

También llamados como **clave principal** o *+*, estos atributos tienen la particularidad de no repetir valores dentro de la entidad y sirven para **identificar de forma univoca cada ocurrencia**. Tal como se aprecia en el gráfico anterior, el Documento es un identificador único debido a que este atributo identifica a cada cliente de manera única.

+ Se representa con un circulo relleno de negro.

## 2.2.2. Atributos descriptivos.

Los atributos descriptores son los más comunes que se pueden evidenciar en las entidades de un modelo entidad relación, estos atributos describen diversas propiedades de una entidad.

+ Se representa con un circulo en blanco.

## 2.2.3. Atributos heredados.

Estos atributos cuyos valores se calculan a partir de los valores de otros atributos. Por ejemplo, la edad se calcula a partir de la fecha de nacimiento y la fecha actual.

## 2.2.4. Atributos compuestos.

Un atributo compuesto es un atributo que puede ser descompuesto en otros atributos pertenecientes a distintos dominios. En muchas ocasiones un atributo compuesto puede ser un identificador de una entidad.

+ Se representa en forma de arbol los atributos compuestos.

## 2.2.5. Atributos Multivaluados.

Es un atributo que almacenan varios valores de un mismo dominio. En ocasiones se confunden con los atributos compuestos. Por ejemplo, las habilidades o teléfonos de un empleado.

+ Se representa con un `#`  al final nombre del atributo.

### 2.2.6. Atributos heredados por identidifacion.

Estos atributos son heredados de otra entidad cuando la relación entre ambas es por Identificación. Esto se verá más adelante.

+ Se representa con un circulo en gris.

## 2.3 Ejemplos de atributos.

![Tipos atributos](../img/2_tiposAtributos.png)

+ Clave principal: Dni.
+ Atributo descritptivo: Direccion.
+ Atributo Compuesto: Apellidos.
+ Atributo Multivaluado: Telefono.
+ Atributo heredado por Id; AñoNacimiento.

# 2.3. Relaciones.

