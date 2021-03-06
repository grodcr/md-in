#-----------------------------------------------------------------
# ¿ Cuáles el monto promedio de descuento aplicado durante los últimos 6 meses?
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

#-----------------------------------------------------------------
# Usando 24 meses en lugar de 6, debido a ausencia de datos
SELECT AVG(ho.precioVenta * ho.descuento) as Promedio
FROM tarea1.hechosordenes ho
	INNER JOIN tarea1.dimordenes dimO ON ho.idDimOrden= dimO.idOrden
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 24 MONTH)
