create schema abpro_1;
use abpro_1;

create table capacitaciones (
	idCapacitacion int not null auto_increment primary key,
    rutCliente varchar(15) not null,
    dia varchar(10),
    hora varchar(5),
    lugar varchar(50) not null,
    duracion int not null,
    cantidadAsistentes int
);

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

select * from capacitaciones;

/* 1 */
select idCapacitacion, hora, dia, rutCliente from capacitaciones;

/* 2 */
select * from capacitaciones
where duracion = 60 and cantidadAsistentes > 30;

/* 3 */
select cantidadAsistentes, duracion, lugar, hora, dia, rutCliente, idCapacitacion 
from capacitaciones
where (rutCliente like '%1-9%' or rutCliente like '%2-7%') and lugar = 'La Florida';

/* 4 */
select idCapacitacion, duracion, cantidadAsistentes from capacitaciones
where (duracion > 30 and duracion < 90) or cantidadAsistentes < 10;

/* 5 */
select idCapacitacion, dia, cantidadAsistentes, duracion from capacitaciones
where (dia = 'Lunes' or dia = 'Miércoles' or dia = 'Viernes') 
and cantidadAsistentes > 50 
and duracion < 30;