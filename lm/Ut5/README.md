# UT5 JSON <!-- omit in toc -->
---
- [1. JSON.](#1-json)
  - [1.1. Convertir JSON a un objeto.](#11-convertir-json-a-un-objeto)
  - [1.2. Convertir un obejto a JSON.](#12-convertir-un-obejto-a-json)



# 1. JSON.

**JSON** son las siglas de **JavaScript Object Notation**, y no es más que un formato ligero de datos, con una estructura (notación) específica, que es totalmente compatible de forma nativa con Javascript. Como su propio nombre indica, JSON se basa en la sintaxis que tiene Javascript para crear objetos.

Los JSON son cadenas - útiles cuando se quiere transmitir datos a través de una red. Debe ser convertido a un objeto nativo de JavaScript cuando se requiera acceder a sus datos. Esto no es un problema, dado que JavaScript posee un objeto global JSON que tiene los métodos disponibles para convertir entre ellos.

Sintaxis:
+ Los datos se presentan en pares nombre-valor.
+ Los datos se separan por comas.
+ Las llaves contienen objetos.
+ Los corchetes contienen matrices.
  
Los ficheros tienen extensión **.json**.

> Ejemplo para almacenar información de los hobbies de una persona:

```json
{
  "nombre": "Ana",
  "edad": 30,
  "activo": true,
  "hobbies": ["leer", "correr", "programar"]
}
```
> Ejemplo para almacenar información de los hobbies de dos personas:

```json
[
  {
    "nombre": "Ana",
    "edad": 30,
    "activo": true,
    "hobbies": ["leer", "correr", "programar"]
  },
  {
    "nombre": "Carlos",
    "edad": 25,
    "activo": false,
    "hobbies": ["videojuegos", "música"]
  }
]
```

> Ejemplo para almacenar superheroes, ejemplo mas completo de JSON

```json
{
  "squadName": "Super hero squad",
  "homeTown": "Metro City",
  "formed": 2016,
  "secretBase": "Super tower",
  "active": true,
  "members": [
    {
      "name": "Molecule Man",
      "age": 29,
      "secretIdentity": "Dan Jukes",
      "powers": ["Radiation resistance", "Turning tiny", "Radiation blast"]
    },
    {
      "name": "Madame Uppercut",
      "age": 39,
      "secretIdentity": "Jane Wilson",
      "powers": [
        "Million tonne punch",
        "Damage resistance",
        "Superhuman reflexes"
      ]
    },
    {
      "name": "Eternal Flame",
      "age": 1000000,
      "secretIdentity": "Unknown",
      "powers": [
        "Immortality",
        "Heat Immunity",
        "Inferno",
        "Teleportation",
        "Interdimensional travel"
      ]
    }
  ]
}
```

## 1.1. Convertir JSON a un objeto.

**JSON.parse()** → Acepta una cadena JSON como parámetro, y devuelve el objeto JavaScript correspondiente.

```js
const json = '{"nombre":"Ana","edad":30}';
const obj = JSON.parse(json);
console.log(obj.nombre); // Ana
console.log(obj.edad); // 30
```
Y si tuviesemos el siguiente JSON

```js
const json = '[{"nombre":"Ana","edad":30},{"nombre":"Pedro","edad":40}]';
```
¿Cómo accederíamos a los nombres del objeto.?

## 1.2. Convertir un obejto a JSON.

**JSON.stringfy(obj)** → Acepta un objeto como parámetro, y devuelve la forma de cadena JSON equivalente.

```js
const obj = { nombre: "Ana", edad: 30 };
const json = JSON.stringify(obj);
console.log(json); // {"nombre":"Ana","edad":30}
```
