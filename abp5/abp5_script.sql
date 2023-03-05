CREATE SCHEMA abp5;
USE abp5;

CREATE TABLE clientes (
  idcliente int NOT NULL,
  nombres varchar(50) NOT NULL,
  apellidos varchar(50),
  direccion varchar(70),
  telefono int,
  PRIMARY KEY (idcliente)
);

CREATE TABLE ventas (
  idventa int NOT NULL auto_increment,
  vendedor varchar(50) NOT NULL,
  cantarticulos int,
  subtotal int,
  impuesto int,
  total int,
  clientes_idcliente int,
  PRIMARY KEY (idventa)
);

ALTER TABLE ventas ADD FOREIGN KEY (clientes_idcliente) REFERENCES clientes(idcliente) ON DELETE SET NULL;

/* 1. Desarrolle una consulta que permita generar una secuencia para el campo idcliente de la tabla clientes.
 Junto con ello, debe crear un trigger o disparador que, al momento de insertar un registro, asigne de manera automática el identificador a la tabla. */
 
CREATE TRIGGER asignar_idcliente
BEFORE INSERT ON clientes
FOR EACH ROW
SET NEW.idcliente = (SELECT idcliente FROM clientes ORDER BY idcliente DESC LIMIT 1) + 1;

/*2. Genere dos consultas de inserción de registros en la tabla clientes, sin indicar el identificador de clientes en ella. */
INSERT INTO clientes (nombres, apellidos, direccion, telefono) VALUES
	("Walala", "En la Guitarra", "Calle Walala #123", 99111111),
    ("Azathoth", "Dios Exterior", "Calle LoveCraft #123", 99222222);

SELECT * FROM clientes;

/* 3. Genere una consulta que añada una restricción por chequeo de control de valores en la tabla ventas al campo cantarticulos, 
dando opción a que este sea solo un valor entre 1 y 5 (sólo números enteros). */

ALTER TABLE ventas ADD CHECK (cantarticulos >= 1 AND cantarticulos <= 5);
