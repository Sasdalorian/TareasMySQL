CREATE DATABASE abp7;
use abp7;

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


/* 1. Genere una sentencia que permita activar el auto guardado de transacciones en la base de datos. */
SET autocommit = 1;

/* 2. Genere dos consultas independientes: una que permita insertar un registro en la tabla de clientes, y otra que inserte una nueva, asociada al cliente antes registrado. */
INSERT INTO clientes (idcliente,nombres,apellidos) VALUES (1, "Gato", "El Gatrolo");

INSERT INTO ventas (idventa,vendedor,cantarticulos,subtotal,impuesto,total,clientes_idcliente) VALUES (1, "Sas", 3, 1500, 500, 2000, 1);

SELECT * FROM clientes;
SELECT * FROM ventas;

/* 3. Genere una sentencia que permita desactivar el auto guardado de transacciones en la base de datos */
SET autocommit = 0;

/* 4. Incluya una consulta de eliminación de la venta recién creada. */
DELETE FROM ventas WHERE idventa = 1;
SELECT * FROM ventas;

/* 5. Genere una consulta que deshaga todos los cambios antes realizados */
 ROLLBACK;