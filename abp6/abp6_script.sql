CREATE DATABASE abp6;
use abp6;

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

/* 1. Genere una consulta de inserción de datos en la tabla clientes. Inserte un registro indicando solo los campos que no permiten valores nulos */

INSERT INTO clientes (idcliente, nombres) VALUES (1,"Carlos");

SELECT * FROM clientes;
/* 2. Genere dos consultas de inserción de datos en la tabla de ventas. Inserte dos registros distintos de esta manera, usando dos sintaxis diversas. 
Ambas ventas ingresadas deben estar asociadas al cliente ingresado en el ítem anterior. */

INSERT INTO ventas (idventa, vendedor , cantarticulos, subtotal , impuesto, total, clientes_idcliente) VALUES
(1, "Alexis Sanchez", 3, 10000, 700, 10700, 1);

INSERT INTO ventas (idventa, vendedor , cantarticulos, subtotal , impuesto, total, clientes_idcliente) VALUES
(2, "Cristiano Ronaldo", 2, 7500, 500, 7500, 1);

SELECT * FROM ventas;

/* 3. Incluya un comando para confirmar los cambios incluidos en las sentencias anteriore */
COMMIT;

/* 4. Genere una consulta que modifique el registro ingresado en el ítem 1 de este ejercicio, en específico otorgando valores a los campos que están nulos */
UPDATE clientes
SET apellidos = "Fernandez", direccion = "El fernanfloo", telefono = 542482 WHERE idcliente = 1;
SELECT * FROM clientes;
/* 5. Incluya un comando para deshacer los cambios realizados anteriormente. */
ROLLBACK;
