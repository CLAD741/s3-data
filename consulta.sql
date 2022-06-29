-- versiòn bàsica que cuenta solamente 
-- teniendo en cuenta fecha de inicio

SELECT SUM(cantidad) FROM Movimiento m
WHERE Fecha_movimiento > '2020-09-17' 


-- Teniendo en cuenta intervalo completo
SELECT SUM(cantidad) FROM Movimiento m
WHERE Fecha_movimiento >= @fecha_inicio  AND Fecha_movimiento <= @fecha_fin




-- Agregando info de producto
SELECT cantidad, nombre FROM Movimiento m
INNER JOIN Producto p
WHERE Fecha_movimiento >= @fecha_inicio  AND Fecha_movimiento <= @fecha_fin
AND p.ID_Producto = m.ID_Producto

-- Posteriormente para ir agregando filtros con otras tablas se harà un 
-- INNER JOIN con cada tabla donde se traeran los campos requeridos
-- Tambièn filtra como se necesite
SELECT * FROM Movimiento m
INNER JOIN Producto p
INNER JOIN Proveedor pr
INNER JOIN TipoTransaccion tt
WHERE Fecha_movimiento >= @fecha_inicio  AND Fecha_movimiento <= @fecha_fin
AND p.ID_Producto = m.ID_Producto
AND pr.ID_Proveedor = m.ID_Proveedor
AND tt.ID_Tipo_transaccion = m.TipoTransaccion