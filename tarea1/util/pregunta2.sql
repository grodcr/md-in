-------------------------------------------------------------------------------------------------
-- ¿Cuáles son las categorías de producto que más ingresos han generado por mes en el último año?
 
SELECT dimP.categoria, MONTHNAME(dimO.fechaOrden) as Mes, sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 2 YEAR)
GROUP BY dimP.categoria, Mes
ORDER BY TotalVenta DESC;