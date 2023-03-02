CREATE SCHEMA abpro4;
USE abpro4;

CREATE TABLE asistente(
	idasistente INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    capacitacion_idcapacitacion INT,
    PRIMARY KEY(idasistente)
);
CREATE TABLE capacitacion(
	idcapacitacion INT NOT NULL,
    rutcliente VARCHAR(15) NOT NULL,
    dia VARCHAR(25),
    hora VARCHAR(5),
    lugar VARCHAR(50) NOT NULL,
    duracion INT NOT NULL,
    cantidadAsistente INT,
    PRIMARY KEY(idcapacitacion)
);

/* 1. Genere una consulta que permita insertar un registro en la tabla de capacitaciones,
indicando solo los campos que son obligatorios a la consulta. */
INSERT INTO capacitacion (idcapacitacion, rutcliente, lugar, duracion) VALUES
	(1, 119999999, "Viña del Mar", 2);

SELECT * FROM capacitacion;

/* 2. Incluya una sentencia que confirme los cambios incorporados en la sentencia anterior. */
COMMIT; 

/* 3. Agregue una consulta o instrucción que habilite el auto guardado de instrucciones para un
total de dos sentencias. */ 

START TRANSACTION;
INSERT INTO capacitacion (idcapacitacion, rutcliente, lugar, duracion) VALUES
	(2, 229999999, "Valparaiso", 4);
INSERT INTO capacitacion (idcapacitacion, rutcliente, lugar, duracion) VALUES
    (3, 339999999, "Peña blanca", 2);
COMMIT;

SELECT * FROM capacitacion;
/* PARA ACTIVAR EL COMMIT AUTOMATICO */
SET autocomit = 1;



/* 4. Agregue dos consultas para insertar un registro en la tabla de asistentes en cada una.
Incluya en la consulta todos los campos de la tabla en orden descendente respecto de cómo
aparece en la definición de la tabla. Asocie estos registros a la capacitación creada en el
ítem 1 de este ejercicio. */