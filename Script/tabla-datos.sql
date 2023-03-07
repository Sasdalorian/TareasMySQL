CREATE SCHEMA abproScript;
USE abproScript;

CREATE TABLE Cliente (
	idcliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	rutcliente VARCHAR(15) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
	telefono VARCHAR(20) NOT NULL,
    afp VARCHAR(20),
    sistemaSalud INT,
    direccion VARCHAR(70) NOT NULL,
    comuna VARCHAR(50) NOT NULL,
	edad INT NOT NULL
);

CREATE TABLE Accidente (
	idaccidente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fechaAccidente DATE NOT NULL,
    horaAccidente VARCHAR(5) NOT NULL,
	lugarAccidente VARCHAR(150) NOT NULL,
    origen VARCHAR(100) NOT NULL,
    consecuencias VARCHAR(100),
	Cliente_idcliente INT NOT NULL
);

ALTER TABLE Accidente ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

create table Capacitacion (
	idcapacitacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fechaCapacitacion DATE NOT NULL,
    horaCapacitacion VARCHAR(5),
	lugarCapacitacion VARCHAR(50) NOT NULL,
    duracion INT,
	Cliente_idcliente INT NOT NULL
);

ALTER TABLE Capacitacion ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

create table Asistentes (
	idasistente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombreCompleto VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    correo VARCHAR(70),
    telefono VARCHAR(20),
    Capacitacion_idcapacitacion INT NOT NULL
);

ALTER TABLE Asistentes ADD FOREIGN KEY (Capacitacion_idcapacitacion) REFERENCES Capacitacion(idcapacitacion);

create table Visita (
	idvisita INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fechaVisita DATE NOT NULL,
    horaVisita VARCHAR(5),
    lugarVisita VARCHAR(50) NOT NULL,
    comentarios VARCHAR(250) NOT NULL,
    Cliente_idcliente INT NOT NULL
);

ALTER TABLE Visita ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

/* • Una tabla de chequeos, que permita registrar todas las diferentes revisiones que se
pueden hacer sobre una empresa. Se debe incluir un campo identificador y un nombre
del chequeo. */

CREATE TABLE Chequeo_cliente (
	idchequeo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombreChequeo VARCHAR(50) NOT NULL,
    Cliente_idcliente INT NOT NULL
);

ALTER TABLE Chequeo_cliente ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

/* • Una tabla que permita registrar qué chequeo se realiza a un cliente en una visita. Por
cada registro de esta tabla se debe considerar el estado de cumplimiento (si ese chequeo
se cumple, si se cumple con observaciones, o bien si no se cumple). */

CREATE TABLE Chequeo_visita (
    estadoCumplimiento VARCHAR(30) NOT NULL,
    Visita_idvisita INT NOT NULL
);

ALTER TABLE Chequeo_visita ADD FOREIGN KEY (Visita_idvisita) REFERENCES Visita(idvisita);

/* • Una tabla de usuarios, la que debe contener el nombre, apellido, la fecha de nacimiento
y el RUN. Esta tabla almacenará los usuarios registrados en la plataforma. */

CREATE TABLE Usuarios (
	idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    run INT NOT NULL,
    fechaNacimiento DATE,
    Cliente_idcliente INT NOT NULL
);

/* • Cada cliente debe asociarse a un usuario de sistema. Por tanto, debe agregar un campo
que permita asociar un cliente con un usuario de sistema. */

ALTER TABLE Usuarios ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

/* • Una tabla que permita registrar administrativos, de quienes se interesa saber su RUN, sus
nombres, sus apellidos, su correo electrónico y el nombre del área a la que pertenece. Al
igual que la tabla que almacena clientes, esta tabla de administrativos debe estar
asociada a la tabla de usuarios a través de una llave foránea. */

CREATE TABLE Administradores (
	areaTrabajo VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL,
    Usuario_idusuario INT NOT NULL
);

ALTER TABLE Administradores ADD FOREIGN KEY (Usuario_idusuario) REFERENCES Usuarios(idusuario);

/* • Se debe agregar una tabla que permita registrar profesionales, de quienes se requiere
conocer su RUN, sus nombres, sus apellidos, su teléfono, su título profesional y el
proyecto en el que se desempeña. Bajo la misma idea de las tablas que registran clientes
y administrativos, debe asociar un profesional a un usuario de sistema, por medio de una
llave ajena. */

CREATE TABLE Profesionales (
	idprofesional INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombreProyecto VARCHAR(100) NOT NULL,
    tituloProfesional VARCHAR(100) NOT NULL,
    Usuario_idusuario INT NOT NULL
);

ALTER TABLE Profesionales ADD FOREIGN KEY (Usuario_idusuario) REFERENCES Usuarios(idusuario);

/* - Una tabla que registre los pagos de cada cliente. Esta tabla debe contener un campo
identificador correlativo autoincremental, la fecha del pago, el monto del pago, el mes y
año que se está pagando (en campos distintos). Es necesario recordar que un cliente tiene
muchos pagos, pero un registro de pago se asociará solo a un cliente. */

CREATE TABLE Pagos (
	idpago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fechaPago DATE NOT NULL,
    monto INT NOT NULL,
    mes VARCHAR(15) NOT NULL,
    año VARCHAR(4) NOT NULL,
    Cliente_idcliente INT NOT NULL
);

ALTER TABLE Pagos ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

/* - Una tabla que registre asesorías realizadas a los clientes. Una asesoría es una actividad
de verificación de situaciones que pueden generar problemas en el mediano plazo. Por
cada una de estas instancias se desea conocer un código único, la fecha de realización, el
motivo por el cual se solicita y el profesional al que se asignará dicha asesoría (debe existir
una llave foránea a la tabla profesional). */

CREATE TABLE Asesorias (
	idasesoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fechaAsesoria VARCHAR(50) NOT NULL,
    motivo VARCHAR(200),
    Profesionales_idprofesional INT NOT NULL,
    Cliente_idcliente INT NOT NULL
);

ALTER TABLE Asesorias ADD FOREIGN KEY (Profesionales_idprofesional) REFERENCES Profesionales(idprofesional);
ALTER TABLE Asesorias ADD FOREIGN KEY (Cliente_idcliente) REFERENCES Cliente(idcliente);

/* - Por cada asesoría, se generan una o más actividades de mejora, que son
recomendaciones que el profesional hace al cliente. En cada una de estas instancias se
registra un campo único autoincremental, el título de la actividad de mejora, la
descripción de esta y el plazo en días de resolución. */

CREATE TABLE Actividades (
	idactividad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tituloActividad VARCHAR(50) NOT NULL,
    descripcion VARCHAR(250),
    plazo VARCHAR(3),
    Asesorias_idasesoria INT NOT NULL
);

ALTER TABLE Actividades ADD FOREIGN KEY (Asesorias_idasesoria) REFERENCES Asesorias(idasesoria);


		/* INSERCION DE DATOS */
        
INSERT INTO Cliente (rutcliente, nombres, apellidos, telefono, afp, sistemaSalud, direccion, comuna, edad) VALUES
	('14.232.983-2', 'María Fernanda', 'López García', 12345678, 'modelo', 1, 'Avenida Apoquindo #6415', 'Las Condes', 23),
	('15.371.271-9', 'Alejandro Javier', 'Pérez Hernández', 43245769, 'plan vital', 2, 'Chacabuco #865', 'Valparaiso', 22),
	('9.257.132-7', 'Javier Ignacio', 'Torres Pérez', 56743290, 'capital', 1, '6 oriente #1115', 'Viña del Mar', 25);
    
SELECT * FROM Cliente;

INSERT INTO Accidente (fechaAccidente, horaAccidente, lugarAccidente, origen, consecuencias, Cliente_idcliente) VALUES
	('2022-12-14', '14:00', 'Taller de manufacción', 'Trabajador operaba sierra sin EPP adecuados', 'Lesión grave y posible amputación', 3),
	('2023-02-12', '15:00', 'Taller de construcción', 'Andamio mal asegurado', 'Caída desde altura, lesiones graves o muerte', 1),
	('2022-08-21', '12:00', 'Línea de producción', 'Fuga de vapor desde un equipo', 'Quemaduras, posible hospitalización', 2);
    
SELECT * FROM Accidente;

INSERT INTO Capacitacion (fechaCapacitacion, horaCapacitacion, lugarCapacitacion, duracion, Cliente_idcliente) VALUES
	('2023-03-23', '10:00', 'Quillota #980 Viña del Mar', 60, 1),
	('2023-05-12', '12:00', 'Arturo Prat #244 Limache', 20, 3),
	('2023-07-16', '11:00', 'Quillota #980 Viña del Mar', 75, 2);

SELECT * FROM Capacitacion;

INSERT INTO Asistentes (nombreCompleto, edad, correo, telefono, Capacitacion_idcapacitacion) VALUES
	('Juan Carlos Bodoque Rojo', 23, 'juancarlosbr@gmail.com', 11999999, 1),
	('Javier Ignacio Malbran Ortega', 24, 'javierignaciomo@gmail.com', 22999999, 2),
	('Christopher Derecha Díaz Catolico', 23, 'christopherderechadc@gmail.com', 33999999, 3);

SELECT * FROM Asistentes;

INSERT INTO Usuarios (run, fechaNacimiento, Cliente_idcliente) VALUES
	(1-9, '1998-02-12', 3),
    (2-8, '1999-08-23', 1),
    (3-7, '2001-01-1', 2);
    
SELECT * FROM Usuarios;

INSERT INTO Visita (fechaVisita, horaVisita, lugarVisita, comentarios, Cliente_idcliente) VALUES
	('2023-02-23', '12:41', 'Quillota #980 Viña del Mar', 'Sin comentarios asociados.', 1),
    ('2022-09-01', '09:10', 'Quillota #980 Viña del Mar', 'Todo bien, todo correcto.', 2),
    ('2022-12-14', '10:34', 'Arturo Prat #244 Limache', 'Se registraron equipos y maquinarias con carencia de protecciones para el operario.', 3);

SELECT * FROM visita;

INSERT INTO Administradores (areaTrabajo, correo, Usuario_idusuario) VALUES
	('Direccion', 'javiertorresi@gmail.com', 3),
    ('Administracion', 'alejandrojavierperez@gmail.com', 2),
    ('Secretaria', 'marialopezfernanda@gmail.com', 1);
    
SELECT * FROM administradores;

INSERT INTO chequeo_visita (estadoCumplimiento, Visita_idvisita) VALUES
	('No cumple', 2),
    ('Si cumple', 3),
    ('Cumple con Observaciones', 1);
    
SELECT * FROM chequeo_visita;

INSERT INTO chequeo_cliente (nombreChequeo, Cliente_idcliente) VALUES
	('Chequeo Sistema Financiero', 3),
    ('Chequeo Administrativo', 2),
    ('Chequeo Sanitario', 1);
    
SELECT * FROM chequeo_cliente;

INSERT INTO profesionales (nombreProyecto, tituloProfesional, Usuario_idusuario) VALUES
	('Proyecto 1', 'Administracion de Empresas', 2),
    ('Proyecto 2', 'Secretario Ejecutivo', 1),
    ('Proyecto 3', 'Ingeniería en Proyectos de Ingeniería', 3);

SELECT * FROM profesionales;

INSERT INTO asesorias (fechaAsesoria, motivo, Profesionales_idprofesional, Cliente_idcliente) VALUES
	('2023-01-04', 'Cumplimiento legal de normas', 1, 1),
    ('2022-09-01', 'Motivo2', 2, 2),
    ('2023-02-23', 'Motivo3', 3, 3);
    
SELECT * FROM asesorias;

INSERT INTO actividades (tituloActividad, descripcion, plazo, Asesorias_idasesoria) VALUES
	('Actividad1', 'Descripcion promedio', '14', 1),
    ('Actividad2', 'Descripcion precaria', '26', 2),
    ('Actividad3', 'Descripcion Bacan', 241, 3);
    
SELECT * FROM actividades;

INSERT INTO pagos (fechaPago, monto, mes, año, Cliente_idcliente) VALUES
	('2023-03-03', 500000, 'Marzo', '2023', 1),
    ('2022-11-15', 950000, 'Noviembre', '2022', 2),
    ('2023-02-23', 870000, 'Febrero', '2023', 3);
    
SELECT * FROM pagos;
