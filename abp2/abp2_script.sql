/* CREAR DATABASE */
CREATE database abp2;
/* USAR DATABASE */
USE abp2;
/* MOSTRAR TABLA */
SELECT * FROM clientes;
SELECT * FROM ventas;

/* INSERTAR DATOS TABLA CLIENTES*/
INSERT INTO clientes VALUES (1, 'Antonia', 'Aranda', 'Calle Los Aromos #123', 991111111);
INSERT INTO clientes VALUES (2, 'Bernarda', 'Barros', 'Pasaje Manuel Balmaceda #456', 992222222);
INSERT INTO clientes VALUES (3, 'Carlos', 'Costa', 'Avenida Simon Bolivar #789', 993333333);
INSERT INTO clientes (idcliente, nombres, apellidos, telefono) VALUES (4, 'Carlos', 'Costa', 993333333);
INSERT INTO clientes (idcliente, nombres, apellidos, telefono) VALUES (5, 'Vicente', 'Villalobos', 993333333);

/* INSERTAR DATOS TABLA VENTAS */
INSERT INTO ventas (idventa, vendedor, cantArticulos, subtotal, impuesto, total, clientes_idcliente) 
	VALUES (1, 'Andres Aranda', 3, 4500, 500, 5000, 1);
INSERT INTO ventas (idventa, cantArticulos, subtotal, impuesto, total, clientes_idcliente) 
	VALUES (2, 2, 1200, 100, 1400, 1);
INSERT INTO ventas (vendedor, idventa, subtotal, cantArticulos, impuesto, total, clientes_idcliente)
	VALUES ('Cristina Cortes', 3 ,10480, 5, 20, 10500, 2);
INSERT INTO ventas (idventa, vendedor, cantArticulos, subtotal, impuesto, total, clientes_idcliente)
	VALUES (4, 'Daniela Duran', 1, 5000, 2500, 7500, 2);
INSERT INTO ventas (idventa, cantArticulos, clientes_idcliente, subtotal, impuesto, total)
	VALUES (5, 3, 3, 3800, 100, 4000);
    
/* 1- CONSULTA QUE OBTIENE TODAS LAS VENTAS QUE LA SUMA ENTRE subtotal Y impuesto DIFIERAN DE total */
SELECT * FROM ventas WHERE subtotal + impuesto != total;

/* 2- CONSULTA QUE PERMITA CONOCER LA SUMA TOTAL DE TODAS LAS VENTAS REGISTRADAS */
SELECT SUM(ALL total) FROM ventas;

/* 3- CONSULTA QUE PERMITA CONOCER EL LISTADO DE VENTAS DE LA CLIENTE "Antonia Aranda" */
SELECT * FROM ventas 
	INNER JOIN clientes ON idcliente = ventas.clientes_idcliente
		WHERE clientes.nombres = "Antonia";
        
/* 4- MOSTRAR identificador del cliente JUNTO CON nombre Y apellido EN UN SOLO CAMPO. DESPLEGAR LOS QUE NO TENGAN DIRECCION */
SELECT idcliente, CONCAT( nombres, " ", apellidos) FROM clientes WHERE direccion IS NULL;

/* 5- CONSULTA PARA SABER AL MISMO TIEMPO EL MONTO MINIMA VENTA Y MAXIMA VENTA REGISTRADA */
SELECT MAX(total), MIN(total) FROM ventas;