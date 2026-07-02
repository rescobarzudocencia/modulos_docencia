
CREATE TYPE tdiasemana AS ENUM 
('lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo');

CREATE TYPE thorario AS (
    diasem tdiasemana,
    horaini TIME
);
CREATE TABLE monitor(
    id SERIAL,
    nombrem VARCHAR(60) NOT NULL,
    telef CHAR(14),
    emails VARCHAR(50)[],
    PRIMARY KEY(id)
);

CREATE TABLE clase(
    id SERIAL, 
nombrec VARCHAR(50) NOT NULL,
    monitor_id INTEGER NOT NULL REFERENCES monitor(id),
    horario thorario[],
    PRIMARY KEY(id)
);

CREATE TABLE claseonline(
    appvc VARCHAR(50) NOT NULL,
    conexion VARCHAR(60)
)INHERITS (clase); -- Con el INHERITS estas indicando que hereda de la tabla clase

INSERT INTO monitor VALUES(DEFAULT,'Eduardo Cano','610364579',
  '{"edumonit@hotmail.com","eduprof@gmail.com"}'); -- como es un array el campo email lo pongo entre {}, y van las llaves entre comillas porque es un texto 
-- Tambien podemos usar ARRAY para poner los datos en luga de {}
INSERT INTO monitor VALUES(DEFAULT,'Mariló Hurtado','650382772', '{"mlprof@yahoo.com","mlmon@gmail.com"}');

INSERT INTO clase VALUES(DEFAULT, 'pilates',1,
  ARRAY[ROW('lunes','8:00'),ROW('viernes','8:00')]::thorario[]); -- Lo ponemos con ARRAY porque es un tipo que hemos creado por eso es conveniente ponerlo con la palabra ARRAY despues usas ROW porque es una fila con en día de la semana y la hora y depues ponemos los :: porque le estas indicando a PostgresSQUL que lo transforme al tipo ese 

INSERT INTO clase VALUES(DEFAULT,'spinning',1,
  ARRAY[ROW('lunes','10:00'),ROW('viernes','10:00')]::thorario[]);

INSERT INTO clase VALUES(DEFAULT,'yoga',1,
  ARRAY[ROW('lunes','12:00'),ROW('viernes','12:00')]::thorario[]);

INSERT INTO claseonline VALUES(DEFAULT,'step',2,
  ARRAY[ROW('martes','8:00'),ROW('jueves','8:00')]::thorario[],'Zoom','r1');

INSERT INTO claseonline VALUES(DEFAULT,'zumba',2,
  ARRAY[ROW('martes','10:00'),ROW('jueves','10:00')]::thorario[],'Meet','r2');

INSERT INTO claseonline VALUES(DEFAULT,'GAC',2,
ARRAY[ROW('martes','12:00'),
ROW('jueves','12:00')]::thorario[],'Teams','r3'
);
INSERT INTO clase VALUES(1, 'pilates',1,
  ARRAY[ROW('lunes','8:00'),ROW('viernes','8:00')]::thorario[]);

SELECT * FROM clase;



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

