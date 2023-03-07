CREATE SCHEMA abp8;
USE abp8;

CREATE TABLE ventas (
	idventa INT NOT NULL,
    vendedor VARCHAR(50),
    cantArticulos INT NOT NULL,
    subtotal INT NOT NULL,
    impuesto INT NOT NULL,
    total INT NOT NULL,
    clientes_idcliente INT NOT NULL,
    PRIMARY KEY(idventa)
);
CREATE TABLE detalleventa (
	ventas_idventa INT NOT NULL,
    producto_idproducto INT NOT NULL,
    cantidad INT,
    PRIMARY KEY(ventas_idventa, producto_idproducto)
);
CREATE TABLE clientes (
	idcliente  INT NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(70),
    telefono INT,
    PRIMARY KEY(idcliente)
);
CREATE TABLE producto (
	idproducto INT NOT NULL,
    nombreprod VARCHAR(50) NOT NULL,
    valor INT NOT NULL,
    PRIMARY KEY(idproducto)
);

/* 1. Genere una restricción de tipo única para el campo nombreprod de la tabla producto. */
ALTER TABLE producto ADD UNIQUE INDEX (nombreprod);

/* 2. Genere las consultas para convertir el campo idproducto en un campo de tipo autoincremental. */
ALTER TABLE producto MODIFY COLUMN idproducto INT NOT NULL AUTO_INCREMENT;

/* 3. Genere las consultas para insertar cuatro productos en la base de datos. Recuerde hacer uso de la secuencia. */
INSERT INTO producto (nombreprod, valor) VALUES
	('Television', 2500),
    ('Audifonos', 1000),
    ('Notebook', 2500),
    ('Charmander', 5000);
    
SELECT * FROM producto;
/*4. Genere las consultas para insertar ocho registros en la tabla detalleventa. */
INSERT INTO detalleventa (ventas_idventa, producto_idproducto, cantidad) VALUES
	(1, 2, 3),
    (2, 1, 1),
    (3, 4, 2),
    (4, 2, 1),
    (5, 1, 2),
    (6, 3, 3),
    (7, 2, 5),
    (8, 4, 1);
    
SELECT * FROM detalleventa;
/*5. Finalmente, incluya una sentencia de confirmación de la acción. */
COMMIT;
