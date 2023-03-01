USE abp4;

/* 1. Genere tres consultas de inserción de clientes; en las primeras dos deben ir incorporados
	todos los datos, mientras que la restante debe estar considerado solo el identificador de
	cliente, nombres y apellidos. */

INSERT INTO clientes (idcliente, nombres, apellidos, direccion, telefono) VALUES
	(1, 'Gato', 'El Gatrolo', 'Calle Gato #123', 11999999),
    (2, 'Letuse', 'Lechuga', 'Calle Lechuga #234', 22999999);
INSERT INTO clientes (idcliente, nombres, apellidos) VALUES
	(3, 'Eme', 'Emerme');
    
SELECT * FROM clientes;

/* 2. Genere cinco consultas de inserción de registros en la tabla ventas. No se pide un formato
específico de consulta de inserción. Estas ventas deben estar asociadas lógicamente a
alguno de los clientes antes creados. */
ALTER TABLE ventas ADD FOREIGN KEY (clientes_idcliente) REFERENCES clientes(idcliente);

INSERT INTO ventas (idventas, vendedor, cantArticulos, subtotal, impuesto, total, clientes_idcliente) VALUES
	(1, 'Conomon', 3, 3500, 500, 4000, 1),
    (2, 'Sasito', 2, 2000, 200, 3700, 2),
    (3, 'Waffle', 4, 4000, 700, 4700, 3),
    (4, 'Joel', 3, 6000, 900, 6900, 2),
    (5, 'Waffle', 5, 7500, 550, 8050, 2);

SELECT * FROM ventas;    

/* 3. Genere una consulta que permita actualizar el campo total de la tabla ventas, igualándolo
a la suma del subtotal y el impuesto. */

UPDATE ventas 
SET total = subtotal + impuesto;

/* 4. Finalmente, genere una consulta en la que se elimine un cliente a través de su identificado (idcliente), 
y posterior a eso otra consulta que elimine todas las ventas asociadas a dicho cliente (siempre de acuerdo con el campo idcliente). */

ALTER TABLE ventas DROP FOREIGN KEY ventas_ibfk_1;
ALTER TABLE ventas ADD FOREIGN KEY (clientes_idcliente) REFERENCES clientes(idcliente) ON DELETE SET NULL;

DELETE FROM clientes WHERE idcliente = 1;
DELETE FROM ventas WHERE clientes_idcliente IS NULL;

SELECT * FROM ventas;    
SELECT * FROM clientes;    