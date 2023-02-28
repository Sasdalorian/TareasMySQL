DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/* 1. Lista el nombre de todos los productos que hay en la tabla producto. */
SELECT nombre FROM producto;

/* 2. Lista los nombres y los precios de todos los productos de la tabla producto. */
SELECT nombre, precio FROM producto;

/* 3. Lista todas las columnas de la tabla producto. */
SELECT * FROM producto;

/* 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). */
SELECT nombre, TRUNCATE(precio * 0.95, 2), precio FROM producto;

/* 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
	Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares. */
SELECT nombre, TRUNCATE(precio * 0.95, 2) AS euros, precio AS dolares FROM producto;

/* 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los
	nombres a mayúscula. */
SELECT UPPER(nombre), precio FROM producto;

/* 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los
	nombres a minúscula. */
SELECT LOWER(nombre), precio FROM producto;

/* 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en
	mayúsculas los dos primeros caracteres del nombre del fabricante. */
SELECT nombre, LEFT(nombre, 2)  FROM fabricante;

/* 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor
	del precio. */
SELECT nombre, ROUND(precio) FROM producto;

/* 10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del
	precio para mostrarlo sin ninguna cifra decimal. */
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

/* 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto */
SELECT id_fabricante FROM producto;

/*12. Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los
	identificadores que aparecen repetidos. */
SELECT DISTINCTROW id_fabricante FROM producto;

/* 13. Lista los nombres de los fabricantes ordenados de forma ascendente. */
SELECT nombre FROM fabricante ORDER BY nombre ASC;

/* 14. Lista los nombres de los fabricantes ordenados de forma descendente. */
SELECT nombre FROM fabricante ORDER BY nombre DESC;

/* 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
	y en segundo lugar por el precio de forma descendente. */
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

/* 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante */
SELECT nombre FROM fabricante LIMIT 5;

/* 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también
se debe incluir en la respuesta. */
SELECT nombre FROM fabricante LIMIT 3, 10;

/* 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT) */
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

/* 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT) */
SELECT nombre FROM producto ORDER BY precio DESC LIMIT 1;

/* 20. Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2. */
SELECT nombre FROM producto WHERE id_fabricante = 2;

/* 21. Lista el nombre de los productos que tienen un precio menor o igual a 120 */
SELECT nombre FROM producto WHERE precio <= 120;

/* 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400 */
SELECT nombre FROM producto WHERE precio >= 400;

/* 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400. */
SELECT nombre FROM producto WHERE precio < 400;

/* 24. Lista todos los productos que tengan un precio entre 80 y 300. Sin utilizar el
operador BETWEEN. */
SELECT nombre, precio FROM producto WHERE precio >= 80 AND precio <= 300;

/* 25. Lista todos los productos que tengan un precio entre 60 y 200. Utilizando el operador BETWEEN. */
SELECT nombre, precio FROM producto WHERE precio BETWEEN 60 AND 200;

/* 26. Lista todos los productos que tengan un precio mayor que 200 y que el identificador de fabricante sea igual a 6 */
SELECT * FROM producto WHERE precio > 200 AND id_fabricante = 6;

/* 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN. */
SELECT * FROM producto WHERE id_fabricante = 1 OR id_fabricante =  3 OR id_fabricante = 5;

/* 28. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN. */
SELECT * FROM producto WHERE id_fabricante IN (1, 3, 5);

/* 29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del
	precio). Cree un alias para la columna que contiene el precio que se llame céntimos. */
SELECT nombre, (precio * 100) AS céntimos FROM producto;

/* 30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S. */
SELECT nombre FROM fabricante WHERE nombre LIKE "S%";

/* 31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e. */
SELECT nombre FROM fabricante WHERE nombre LIKE "%e";

/* 32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w. */
SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";

/* 33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres. */
SELECT nombre FROM fabricante WHERE CHARACTER_LENGTH(nombre) = 4;

/* 34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre. */
SELECT nombre FROM producto WHERE nombre LIKE "%portatil%";

/* 35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el
nombre y tienen un precio inferior a 215 . */
SELECT nombre FROM producto WHERE nombre LIKE "%monitor%" AND precio < 215;

/* 36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180.
Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por
el nombre (en orden ascendente). */
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;


			/* CONSULTAS MULTITABLA (COMPOSICION INTERNA) */
            
/* 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id;

/* 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
alfabético */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id ORDER BY f.nombre ASC;

/* 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del
fabricante y nombre del fabricante, de todos los productos de la base de datos. */
SELECT p.id, p.nombre, f.id, f.nombre FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id;

/* 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato. */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p 
	JOIN fabricante f ON p.id_fabricante = f.id ORDER BY p.precio ASC LIMIT 1;

/* 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro. */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p 
	JOIN fabricante f ON p.id_fabricante = f.id ORDER BY p.precio DESC LIMIT 1;

/* 6. Devuelve una lista de todos los productos del fabricante Lenovo. */
SELECT * FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Lenovo";
    
/* 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200. */
SELECT * FROM producto p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Crucial" AND p.precio > 200;

/* 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard, Seagate.
	Sin utilizar el operador IN. */
SELECT p.id, p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Asus" OR f.nombre LIKE "Seagate" OR f.nombre LIKE "Hewlett-Packard";

/* 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard, Seagate.
Utilizando el operador IN. */
SELECT p.id, p.nombre, p.precio, f.nombre AS 'nombre fabricante' FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/* 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo
nombre termine por la vocal e. */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante'  FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE '%e';
    
/* 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante
contenga el carácter w en su nombre. */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante'  FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE '%w%';
    
/* 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a 180. Ordene el resultado en primer lugar por el
precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente) */
SELECT p.nombre, p.precio, f.nombre AS 'nombre fabricante'  FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
    
/* 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos
fabricantes que tienen productos asociados en la base de datos. */
SELECT f.id, f.nombre from producto p
	JOIN fabricante f ON p.id_fabricante = f.id;
    
		/* CONSULTAS MULTITABLA (COMPOSICION EXTERNA) */
	/* Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN. */ 
    
/* 1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que
no tienen productos asociados. */
SELECT * FROM fabricante f
	LEFT JOIN producto p ON p.id_fabricante = f.id;

/* 2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado. */
SELECT * FROM fabricante f
	LEFT JOIN producto p ON p.id_fabricante = f.id
    WHERE p.id_fabricante IS NULL;
    
/* 3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta. 
Respuesta: No, ya que se puede tener fabricantes sin tener productos, pero sin fabricantes, ¿como obtendre el producto?
			Aparte de que en este ejercicio, los productos dependen del fabricante*/

			/* CONSULTAS RESUMEN */

/* 1. Calcula el número total de productos que hay en la tabla productos */
SELECT count(id) AS 'Cantidad de Productos' FROM producto;

/* 2. Calcula el número total de fabricantes que hay en la tabla fabricante. */
SELECT count(id) AS 'Cantidad de Fabricantes' FROM fabricante;

/* 3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos */
SELECT count(distinct(id_fabricante)) AS 'Cantidad de Fabricantes' FROM producto;

/* 4. Calcula la media del precio de todos los productos. */
SELECT avg(precio) FROM producto;

/* 5. Calcula el precio más barato de todos los productos. */
SELECT MIN(precio) FROM producto;

/* 6. Calcula el precio más caro de todos los productos. */
SELECT MAX(precio) FROM producto;

/* 7. Lista el nombre y el precio del producto más barato. */
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

/* 8. Lista el nombre y el precio del producto más caro */
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

/* 9. Calcula la suma de los precios de todos los productos */
SELECT SUM(precio) AS 'Suma de todos los productos' FROM producto;

/* 10. Calcula el número de productos que tiene el fabricante Asus */
SELECT COUNT(p.id) FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Asus";

/* 11. Calcula la media del precio de todos los productos del fabricante Asus. */
SELECT avg(precio) FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Asus";

/* 12. Calcula el precio más barato de todos los productos del fabricante Asus. */
SELECT MIN(p.precio) FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Asus";

/* 13. Calcula el precio más caro de todos los productos del fabricante Asus */
SELECT MAX(p.precio) FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Asus";

/* 14. Calcula la suma de todos los productos del fabricante Asus. */
SELECT SUM(p.precio) FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Asus";

/* 15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene
el fabricante Crucial. */
SELECT MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(p.nombre) FROM producto p
	JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE "Crucial";
    
/* 16. Muestra el número total de productos que tiene cada uno de los fabricantes. 
El listado también debe incluir los fabricantes que no tienen ningún producto. 
El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. 
Ordene el resultado descendentemente por el número de productos. */
SELECT f.nombre, COUNT(p.nombre) AS Cantidad_Productos FROM fabricante f
	LEFT JOIN producto p ON p.id_fabricante = f.id
    GROUP BY f.id ORDER BY Cantidad_Productos DESC;

/* 17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los
fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan */
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio) FROM fabricante f
	INNER JOIN producto p ON p.id_fabricante = f.id
    GROUP BY f.id;

/* 18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los
		fabricantes que tienen un precio medio superior a 200. 
	No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente. */
SELECT f.id, MAX(p.precio), MIN(p.precio), AVG(p.precio) AS Precio_Medio, COUNT(p.nombre) AS Cantidad_Productos FROM fabricante f
	INNER JOIN producto p ON p.id_fabricante = f.id 
    GROUP BY f.id HAVING Precio_Medio > 200;

/*19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y
el número total de productos de los fabricantes que tienen un precio medio superior a 200. 
Es necesario mostrar el nombre del fabricante. */
SELECT f.nombre AS Nombre_Fabricante, MAX(p.precio), MIN(p.precio), AVG(p.precio) AS Precio_Medio, COUNT(p.nombre) AS Cantidad_Productos FROM fabricante f
	INNER JOIN producto p ON p.id_fabricante = f.id 
    GROUP BY f.id HAVING Precio_Medio > 200;

/* 20. Calcula el número de productos que tienen un precio mayor o igual a 180. */
SELECT COUNT(nombre) FROM producto
	WHERE precio >= 180;
    
/* 21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180. */
SELECT f.nombre, COUNT(p.nombre) FROM producto p
	INNER JOIN fabricante f ON p.id_fabricante = f.id WHERE p.precio >= 180
    GROUP BY f.id;

/* 22. Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante. */
SELECT f.id, AVG(p.precio) FROM fabricante f
	INNER JOIN producto p ON p.id_fabricante = f.id
    GROUP BY f.id;

/* 23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante. */
SELECT f.nombre, AVG(p.precio) FROM fabricante f
	INNER JOIN producto p ON p.id_fabricante = f.id
    GROUP BY f.id;

/* 24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150. */
SELECT f.nombre, AVG(p.precio) AS promedio_precio FROM fabricante f
	JOIN producto p ON f.id = p.id_fabricante
	GROUP BY f.id
    HAVING AVG(p.precio) >= 150;
    
/* 25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos. */
SELECT f.nombre, COUNT(p.nombre) AS Cantidad_Productos FROM fabricante f
	LEFT JOIN producto p ON f.id = p.id_fabricante
    GROUP BY f.id HAVING Cantidad_Productos >= 2;

/* 26. Devuelve un listado con los nombres de los fabricantes y 
		el número de productos que tiene cada uno con un precio superior o igual a 220.
		No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición. */
SELECT f.nombre, COUNT(p.nombre) AS Cantidad_Productos FROM fabricante f
	LEFT JOIN producto p ON f.id = p.id_fabricante
    WHERE p.precio >= 220
    GROUP BY f.nombre 