# UT6 PROCEDIMIENTOS, FUNCIONES, CURSORES Y TRIGGER <!-- omit in toc -->
---

- [1. Introduccion.](#1-introduccion)


# 1. Introduccion.




Cómo realizar transacciones con procedimientos almacenados
Podemos utilizar el manejo de errores para decidir si hacemos ROLLBACK de una transacción. En el siguiente ejemplo vamos a capturar los errores que se produzcan de tipo SQLEXCEPTION y SQLWARNING.

Ejemplo:

DELIMITER $$
CREATE PROCEDURE transaccion_en_mysql()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- ERROR
        ROLLBACK;
    END;
 
    DECLARE EXIT HANDLER FOR SQLWARNING
    BEGIN
        -- WARNING
        ROLLBACK;
    END;

    START TRANSACTION;
    -- Sentencias SQL
    COMMIT;
END
$$
En lugar de tener un manejador para cada tipo de error, podemos tener uno común para todos los casos.

DELIMITER $$
CREATE PROCEDURE transaccion_en_mysql()
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
    BEGIN
        -- ERROR, WARNING
        ROLLBACK;
    END;
 
    START TRANSACTION;
    -- Sentencias SQL
    COMMIT;
END
$$