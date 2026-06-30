# UT2 MODELO ENTIDAD RELACIÓN <!-- omit in toc -->
---


- [1. Introducción.](#1-introducción)
- [2. Modelo Entidad/Relación (E/R).](#2-modelo-entidadrelación-er)
- [2.1. Entidades.](#21-entidades)
  - [2.1.1. Entidades fuertes.](#211-entidades-fuertes)
  - [2.1.2. Entidades débiles.](#212-entidades-débiles)
- [2.2. Atributos.](#22-atributos)
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

# 2.2. Atributos.

# 2.3. Relaciones.