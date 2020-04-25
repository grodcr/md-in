# detalle de ordenes de los ultimos 6 meses
SELECT hechos.*, (hechos.cantidad * hechos.descuento) descuentoTotal, tarea1.dimordenes.fechaOrden
FROM tarea1.hechosordenes hechos
INNER JOIN tarea1.dimordenes ON hechos.idDimOrden=tarea1.dimordenes.idOrden
WHERE tarea1.dimordenes.fechaOrden >= '2018-06-01';

# total por orden, ultimos 6 meses
SELECT hechos.idDimOrden, SUM(cantidad * (precioVenta - descuento)) totalOrden
FROM tarea1.hechosordenes hechos
INNER JOIN tarea1.dimordenes ON hechos.idDimOrden=tarea1.dimordenes.idOrden
WHERE tarea1.dimordenes.fechaOrden >= '2018-06-01'
GROUP BY hechos.idDimOrden;

# pregunta 4: promedio de descuento aplicado durante los ultimos 6 meses
SELECT AVG(hechos.cantidad * hechos.descuento) descuentoPromedio
FROM tarea1.hechosordenes hechos
INNER JOIN tarea1.dimordenes ON hechos.idDimOrden=tarea1.dimordenes.idOrden
WHERE tarea1.dimordenes.fechaOrden >= '2018-06-01';