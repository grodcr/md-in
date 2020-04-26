#-------------------------------------------------------------------------------------------------
# ¿Cuáles son los productos que más ingresos han generado en los dos últimos años? Los
# ingresos se desean analizar también por marca y año del modelo (annoModelo) del
# producto.

# Analisis por Ingresos ultimos 2 años de productos
SELECT dimP.*, sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 2 YEAR)
GROUP BY dimP.idProducto
ORDER BY TotalVenta DESC;

# Analisis por Ingresos ultimos 2 años por marcas
SELECT dimP.nomMarca, sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 2 YEAR)
GROUP BY dimP.nomMarca
ORDER BY TotalVenta DESC;

# Analisis por Ingresos ultimos 2 años por modelo
SELECT dimP.annoModelo, sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 2 YEAR)
GROUP BY dimP.annoModelo
ORDER BY TotalVenta DESC;

# Analisis por Ingresos ultimos 2 años por marcas y modelo
SELECT dimP.nomMarca, dimP.annoModelo, sum(precioVenta) as TotalVenta
FROM tarea1.dimordenes dimO 
	 INNER JOIN tarea1.hechosordenes ho ON dimO.idOrden = ho.idDimOrden
     LEFT JOIN tarea1.dimproductos dimP ON idDimProducto = dimP.idProducto
WHERE dimO.fechaOrden >= DATE_SUB(NOW(), INTERVAL 2 YEAR)
GROUP BY dimP.nomMarca, dimP.annoModelo
ORDER BY TotalVenta DESC;