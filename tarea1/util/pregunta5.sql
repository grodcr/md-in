#-------------------------------------------------------------------------------------------------
# ¿ Cuáles son las tiendas que han generado más ingresos por ventas en los dos últimos
# annos y y en qué estado se ubican?

SELECT dimO.nomTienda, dimO.estado , sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 2 YEAR)
GROUP BY dimO.nomTienda, dimO.estado
ORDER BY TotalVenta DESC;
