USE abproScript;

/* Realice una consulta que permita listar todas las capacitaciones de un cliente en
particular, indicando el nombre completo, la edad y el correo electrónico de los
asistentes. */

SELECT c.idcapacitacion, a.nombreCompleto, a.edad, a.correo 
FROM capacitacion c
INNER JOIN asistentes a ON c.idcapacitacion = a.Capacitacion_idcapacitacion
WHERE Cliente_idcliente = 2;

/* Realice una consulta que permita desplegar todas las visitas en terreno realizadas a los
clientes que sean de la comuna de Valparaíso. Por cada visita debe indicar todos los
chequeos que se hicieron en ella, junto con el estado de cumplimiento de cada uno. */

SELECT v.idvisita, cv.estadoCumplimiento, count(idvisita) as cantidad_chequeos 
FROM visita v
INNER JOIN cliente c ON c.idcliente = v.Cliente_idcliente
INNER JOIN chequeo_visita cv ON cv.Visita_idvisita = v.idvisita
WHERE c.comuna = 'Valparaiso'
GROUP BY v.idvisita, cv.estadoCumplimiento;

/* Realice una consulta que despliegue los accidentes registrados para todos los clientes,
indicando los datos de detalle del accidente, y el nombre, apellido, RUT y teléfono del
cliente al que se asocia dicha situación. */

SELECT  c.idcliente, c.nombres, c.apellidos, c.rutcliente, c.telefono, a.fechaAccidente, a.horaAccidente, a.lugarAccidente, a.origen, a.consecuencias
FROM accidente a
INNER JOIN cliente c ON c.idcliente = a.Cliente_idcliente;