CREATE DATABASE abpro3;
USE abpro3;

CREATE TABLE `capacitacion` (
	`idcapacitacion` INT NOT NULL,
    `rutcliente` VARCHAR(15) NOT NULL,
    `dia` VARCHAR(25),
    `hora` VARCHAR(5),
    `lugar` VARCHAR(50) NOT NULL,
    `duracion` INT NOT NULL,
    `cantidadasistentes` INT,
    PRIMARY KEY (`idcapacitacion`)
);
    
CREATE TABLE `asistente` (
	`idasistente` INT NOT NULL,
    `nombres` VARCHAR(100) NOT NULL,
    `edad` INT NOT NULL,
    `capacitacion_idcapacitacion` INT NOT NULL,
	PRIMARY KEY (`idasistente`),
    KEY `capacitacion_idcapacitacion_idx` (`capacitacion_idcapacitacion`),
    CONSTRAINT `asistente_capacitacion_fk` FOREIGN KEY (`capacitacion_idcapacitacion`) REFERENCES `capacitacion` (`idcapacitacion`)
);

/* 1. Haga las consultas necesarias para convertir las llaves primarias de cada tabla en campos autonuméricos. */
ALTER TABLE asistente DROP FOREIGN KEY asistente_capacitacion_fk;

ALTER TABLE `asistente` CHANGE COLUMN `idasistente` `idasistente` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE `capacitacion` CHANGE COLUMN `idcapacitacion` `idcapacitacion` INT NOT NULL AUTO_INCREMENT;

ALTER TABLE asistente ADD FOREIGN KEY (capacitacion_idcapacitacion) REFERENCES capacitacion(idcapacitacion);

/* 2. Genere 3 consultas que permitan ingresar datos sobre la tabla Capacitación, sin asignar el
		campo idcapacitacion en la consulta misma. */
        
INSERT INTO capacitacion (idcapacitacion, rutcliente, dia, hora, lugar, duracion, cantidadasistentes) VALUES 
	( '1', '119999999', 'Martes', '14:30', 'Viña del Mar', 4, 10),
    ( '2', '229999999', 'Miercoles', '22:00', 'Quilpue', 2, 10),
    ( '3', '339999999', 'Jueves', '09:30', 'Valparaiso', 6, 10),
	('669999999', 'Lunes', '14:30', 'Viña del Mar', 3, 0);
INSERT INTO capacitacion (rutcliente, lugar, duracion, cantidadasistentes) VALUES 
	('449999999', 'Valparaiso', 5, 15),
	('559999999', 'Viña del Mar', 3, 15);

SELECT * FROM capacitacion;
/* 3. Genere 5 consultas que permitan ingresar datos sobre la xtabla Asistentes, sin asignar
		elcampo idasistente en la consulta misma. */
INSERT INTO asistente (nombres, edad, capacitacion_idcapacitacion) VALUES
	('Gatrolo', 23, 1),
    ('Letuse', 22, 2),
    ('Joel', 23, 3),
    ('Cono', 23, 4),
    ('Gordo', 24, 5);

SELECT * FROM asistente;

/* 4. Realice una consulta que permita establecer una restricción de tipo única sobre el campo
		nombres de la tabla Asistentes. */

ALTER TABLE asistente ADD UNIQUE index_name(nombres);
        
/* 5. Realice una consulta que permita actualizar los campos dia a “01/01/2020” y hora a “00:00” de la tabla capacitación,
		para todos aquellos registros tales que el día y la hora son igual a un valor nulo. */

UPDATE capacitacion SET dia = "01/01/2020", hora = "00:00" WHERE dia IS NULL AND hora IS NULL;

SELECT * FROM capacitacion;

/* 6. Realice una consulta que permita eliminar todas aquellas capacitaciones que no tienen asistentes. 
		Esto es, aquellas capacitaciones con el campo cantidadasistentes igual a 0, y sin registros relacionados en la tabla */

DELETE c FROM capacitacion c WHERE cantidadasistentes = 0 OR cantidadasistentes IS NULL;
SELECT * FROM capacitacion 