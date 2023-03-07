create schema abpro_2;
use abpro_2;

create table capacitaciones (
	idCapacitacion int not null auto_increment primary key,
    rutCliente varchar(15) not null,
    dia varchar(10),
    hora varchar(5),
    lugar varchar(50) not null,
    duracion int not null,
    cantidadAsistentes int
);

create table asistentes (
	idAsistente int not null auto_increment primary key,
    nombres varchar(100) not null,
    edad int not null,
    capacitaciones_idCapacitacion int not null
);

alter table asistentes add foreign key (capacitaciones_idCapacitacion) references capacitaciones(idCapacitacion);

insert into capacitaciones (rutCliente, dia, hora, lugar, duracion, cantidadAsistentes) values
('14.232.983-2', 'Viernes', '10:00', 'Quillota #980 Viña del Mar', 60, 40),
('15.371.271-9', 'Viernes', '12:00', 'Arturo Prat #244 Limache', 20, 60),
('7.585.475-7', 'Viernes', '11:00', 'Quillota #980 Viña del Mar', 75, 30),
('7.904.448-2 ', 'Miércoles', '09:00', '6 oriente #1115 Viña del Mar', 75, 20),
('5.542.409-8 ', 'Miércoles', '12:00', '6 oriente #1115 Viña del Mar', 60, 8),
('10.211.277-6 ', 'Miércoles', '10:00', 'Quillota #980 Viña del Mar', 60, 40),
('5.834.225-4', 'Miércoles', '09:00', 'Caupolicán #491 Villa Alemana', 75, 30),
('9.257.132-7', 'Lunes', '10:00', 'La Florida', 20, 60),
('6-069.062-6 ', 'Lunes', '11:00', 'Caupolicán #491 Villa Alemana', 75, 20),
('16.214.564-k', 'Lunes', '12:00', 'Arturo Prat #244 Limache', 90, 40);

insert into asistentes (nombres, edad, capacitaciones_idCapacitacion) values
('Pablo Torres', 23, 1),
('Javier Malbran', 24, 2),
('Christopher Díaz', 23, 3),
('Yolanda Malbran', 29, 3),
('Javier Rubio', 30, 3),
('Nicolás Molina', 26, 3),
('Nicolás Sanhueza', 24, 4),
('Gonzalo Guajardo', 23, 5),
('Constanza Gajardo', 22, 6),
('Antonia Aranda', 25, 7),
('Sebastián Fernández', 23, 8),
('Jose Ortega', 24, 9),
('Daniel Ferrada', 23, 10);

select * from capacitaciones;
select * from asistentes;

/* 1 */
select * from capacitaciones where dia = 'Lunes' and duracion < 90;

/* 2 */
select nombres, rutCliente, lugar, duracion from asistentes
inner join capacitaciones on asistentes.capacitaciones_idCapacitacion = capacitaciones.idCapacitacion;

/* 3 */
select rutCliente, dia, hora from capacitaciones; 

/* 4 */
select lugar, duracion, dia, hora, count(idCapacitacion) as cantidad_asistentes from asistentes
inner join capacitaciones on asistentes.capacitaciones_idCapacitacion = capacitaciones.idCapacitacion
group by lugar, duracion, dia, hora
having count(idCapacitacion) > 3;