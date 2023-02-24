/* USAR DATABASE */
USE abp1;
/* MOSTRAR TABLA */
SELECT * FROM abp1.ventas;

/* AGREGAR ELEMENTOS A LA TABLA */
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (1, "Sas", "Gatrolo", 3, 4500, 500, 5000);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (2, "Sas", "Letuse", 5, 10000, 2500, 12500);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (3, "Cono", "Zwaffle", 1, 1500, 100, 1600);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (4, "Joel", "Tito", 1, 570, 20, 590);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (5, "Sas", "Sonia Garrido", 2, 900, 200, 5200);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (6, "Joel", "Sonia Garrido", 2, 2500, 2500, 5000);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (7, "Joel", "Sonia Garrido", 5, 10000, 560, 10560);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (8, "Cono", "Gatrolo", 2, 3500, 500, 4000);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (9, "Sas", "Gatrolo", 1, 1500, 500, 2000);
INSERT INTO ventas (idventas, comprador, vendedor, cantArticulos, subtotal, impuesto, total) VALUES (10, "Joel", "Gatrolo", 2, 6200, 700, 6900);
/* EDITAR ELEMENTOS DE LA TABLA */
UPDATE ventas SET subtotal = 5000 WHERE idventas = 5;

/* 1- CONSULTA PARA OBTENER REGISTROS DE LA TABLA DONDE LA CANTIDAD SEA MAYOR QUE 2 */
SELECT * FROM abp1.ventas WHERE cantArticulos > 2;

/* 2- CONSULTA PARA OBTENER REGISTROS DE LA TABLA DONDE SUBTOTAL SEA MENOR QUE 1000
	DESPLEGANDO SOLO ID DE VENTA, EL COMPRADOR Y LA CANTIDAD DE ARTICULOS */
SELECT idventas, comprador, cantArticulos FROM abp1.ventas WHERE subtotal < 1000;

/* 3- CONSULTA QUE PERMITA OBTENER REGISTROS SI EL VENDEDOR SE LLAMA "SONIA GARRIDO" y total > 5000
	INDICAR TODOS ELEMENTOS DE LA TABLA PERO EN ORDEN INVERSO */
SELECT * FROM abp1.ventas WHERE vendedor = "Sonia Garrido" ORDER BY total DESC;

/* 4- CONSULTA QUE RETORNE LOS REGISTROS DE LA TABLA TALES QUE COMPRADOR ES "Sas" O BIEN
	VENDEDOR ES "GATROLO" DESPLEGAR CAMPOS vendedor, comprador y total, en ese orden */
SELECT vendedor, comprador, total FROM abp1.ventas WHERE comprador = "Sas" OR vendedor = "Gatrolo";

/* CONSULTA QUE DESPLIEGUE TODOS LOS CAMPOS DEL REGISTRO TALES QUE EL IDENTIFICADOR
	ESTE EN EL SIGUIENTE CONJUNTO: 2, 5, 6, 9 */
SELECT * FROM abp1.ventas WHERE idventas = 2 OR idventas = 5 OR idventas = 6 OR idventas = 9;