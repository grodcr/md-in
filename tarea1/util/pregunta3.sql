#-------------------------------------------------------------------------------------------------
# ¿Cuáles son los estados y las ciudades en éstos que han reportado mayores ventas a lo
# largo de los tres años? ¿Para cuáles categorías de producto?

SELECT dimO.estado, dimO.ciudad , sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 3 YEAR)
GROUP BY dimO.estado, dimO.ciudad
ORDER BY TotalVenta DESC;

SELECT dimO.ciudad , sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 3 YEAR)
GROUP BY dimO.ciudad
ORDER BY TotalVenta DESC;

SELECT dimO.estado , sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 3 YEAR)
GROUP BY dimO.estado
ORDER BY TotalVenta DESC;
