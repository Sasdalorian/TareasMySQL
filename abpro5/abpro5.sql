CREATE DATABASE abrpo5;
USE abrpo5;

/* 1. Genere un set de consultas que permitan crear las tablas indicadas en el modelo. 
Tenga en consideración las llaves primarias, los tipos de dato indicados y las condiciones de nulidad. */

CREATE TABLE clientes (
	rutcliente INT NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    afp VARCHAR(30),
    sistemaSalud INT,
    direccion VARCHAR(70),
    comuna VARCHAR(50),
    edad INT NOT NULL,
    PRIMARY KEY(rutcliente)
);
CREATE TABLE accidente (
	accidenteid INT NOT NULL,
    dia DATE,
    hora VARCHAR(5),
    lugar VARCHAR(50) NOT NULL,
    origen VARCHAR(100),
    consecuencias VARCHAR(100),
    cliente_rutcliente INT,
    PRIMARY KEY(accidenteid)
);
CREATE TABLE capacitacion ( 
	idcapacitacion INT NOT NULL,
    fecha DATE,
    hora VARCHAR(5),
    lugar VARCHAR(50) NOT NULL,
    duracion INT,
    cantidadAsistentes INT,
    cliente_rutcliente INT,
    PRIMARY KEY(idcapacitacion)
);
CREATE TABLE asistentes (
	idasistente INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    capacitacion_idcapacitacion INT NOT NULL,
    PRIMARY KEY(idasistente)
);

/* 2. Desarrolle consultas que permitan crear las llaves foráneas antes indicadas, respetando el sentido lógico de su creación. */
ALTER TABLE accidente ADD FOREIGN KEY (cliente_rutcliente) REFERENCES clientes(rutcliente) ON DELETE SET NULL;
ALTER TABLE capacitacion ADD FOREIGN KEY (cliente_rutcliente) REFERENCES clientes(rutcliente) ON DELETE SET NULL;
ALTER TABLE asistentes ADD FOREIGN KEY (capacitacion_idcapacitacion) REFERENCES capacitacion(idcapacitacion);

/* 3. Genere una consulta que permita crear una restricción de valor único sobre el campo
“telefono” de la tabla Cliente. */

ALTER TABLE clientes ADD UNIQUE INDEX (telefono);

/* 4. Genere una consulta que permita restringir los valores posibles del campo sistemasalud de
la tabla Cliente al conjunto {1,2}. */

ALTER TABLE clientes ADD CHECK (sistemaSalud  = 1 OR sistemaSalud = 2);
ALTER TABLE clientes DROP CONSTRAINT clientes_chk_1;

/* 5. Genere las consultas para insertar cuatro registros en la tabla Cliente, 
	y consultas para insertar siete registros en la tabla Accidente, asociados a los clientes recién ingresados. */

INSERT INTO clientes (rutcliente, nombres, apellidos, telefono, afp, sistemaSalud, direccion, comuna, edad) VALUES
	(119999999, "Emerson", "Eme", 11100000000, "Capital", 1, "Calle Emerson #123", "Viña del Mar", 31),
    (229999999, "Waffle", "Z", 22200000000, "Cuprum", 2, "Calle Zwaffle #456", "Peña Blanca", 23),
    (339999999, "Nacho", "Wokoski", 33300000000, "Habitat", 2, "Calle Nachos #789", "Quilpue", 22),
    (449999999, "Joel", "Pixu", 44400000000, "Modelo", 1, "Calle Joel #246", "Reñaca", 24);
    
SELECT * FROM clientes;

INSERT INTO accidente (accidenteid, dia, hora, lugar, origen, consecuencias, cliente_rutcliente) VALUES
	(1, "2021-07-12", "15:45", "Septimo piso en construccion", "Falta de medidas de seguridad, no utiliza EPP", "Traumatismo Craneal, Fracturas", 119999999),
    (2, "2021-10-24", "17:24", "Áreas de almacenamiento", "Almacenamiento Inadecuado", "Laceracion y Contuciones", 229999999),
	(3, "2022-01-2", "13:56", "Maquinarias", "No respetar los procedimientos de seguridad, falta de mantenimiento, falta de señalización", "Amputaciones e incluso la muerte", 339999999),
	(4, "2022-04-17", "16:43", "Laboratorios", "Falta de etiquetado", " Irritaciones, quemaduras y cáncer", 449999999),
	(5, "2022-07-22", "22:12", "Líneas de producción", "Falta de capacitación, no utilizar el equipo ergonómico adecuado", "Discapacidad y dolores crónicos", 229999999),
	(6, "2022-09-15", "17:57", "Áreas de producción", "No seguir los procedimientos de seguridad", "Lesiones graves, quemaduras, paro cardíaco e incluso la muerte", 449999999),
	(7, "2022-09-15", "18:00", "Cualquier área de la empresa", " Falta de mantenimiento, mal uso de equipos, almacenamiento inadecuado de materiales inflamables", "interrupción de la producción, incluso la muerte", 119999999);

SELECT * FROM accidente;