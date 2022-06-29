USE Estudiante_4;
--------------------- Modelo de hecho movimiento
CREATE TABLE Fecha (
Fecha DATETIME, 
Dia TINYINT, 
Mes VARCHAR(20), 
Anio SMALLINT,
Numero_semana_ISO TINYINT,
PRIMARY KEY(Fecha));

CREATE TABLE Producto (
ID_Producto SMALLINT, 
Nombre VARCHAR(100),
Marca VARCHAR(30), 
Paquete_de_compra VARCHAR(20), 
Color VARCHAR(10), 
Necesita_refrigeracion BOOLEAN, 
Dias_tiempo_entrega SMALLINT, 
cantidad_por_salida INT, 
Precio_minorista_recomendado FLOAT, 
Paquete_de_venta VARCHAR(20), 
Precio_unitario FLOAT,
PRIMARY KEY(ID_Producto));

CREATE TABLE Proveedor(
ID_proveedor INT,
Nombre VARCHAR(20),
Categoria VARCHAR(20),
Contacto_principal VARCHAR(30),
Referencia VARCHAR(30),
Dias_pago INT, 
Codigo_postal INT,
PRIMARY KEY(ID_proveedor)
);

CREATE TABLE TipoTransaccion(
ID_Tipo_transaccion TINYINT,
Tipo VARCHAR(20),
PRIMARY KEY(ID_Tipo_transaccion));

CREATE TABLE Cliente(
ID_Cliente INT,
Cliente_Factura VARCHAR(100),
Grupo_compras INT,
Categoria INT,
Nombre VARCHAR(100),
Codigo_postal VARCHAR(100),
Contacto_principal VARCHAR(100),
PRIMARY KEY(ID_Cliente)
);

CREATE TABLE Movimiento(
Fecha_movimiento DATETIME,
ID_Producto SMALLINT,
ID_Proveedor INT,
ID_Cliente INT,
ID_Tipo_transaccion TINYINT,
Cantidad INT,
PRIMARY KEY (Fecha_movimiento, ID_Producto, ID_Proveedor, ID_Cliente,
ID_Tipo_transaccion, Cantidad)
)

INSERT INTO Fecha
VALUES('2020-04-01 23:30:17',01,'Apr',2020,5),
('2020-12-11 21:48:17',11,'dec',2020,6),
('2019-09-17 22:26:58',17,'sept',2019,8),
('2020-12-31 02:03:29',31,'dec',2020,9),
('2019-12-31 09:52:15',31,'dec',2019,7)

INSERT INTO Producto
VALUES (2,'Guayos Roman','adidas','BOX','AZUL',False,12,15,500000,'Dajr18',1200000),
(3,'Guayos Messi','adidas','BOX','MORADO',False,12,15,800000,'adr4',800000),
(4,'Guayos Tevez','puma','BOX','BLANCOS',False,12,15,100000,'Oq43',600000),
(5,'Guayos Ronaldo','NIKE','BOX','AZUL',False,12,15,200000,'da3',3000000),
(1,'Guayos CR7','NIKE','BOX','ROJO',False,12,15,700000,'Oqer34',1000000)


INSERT INTO Proveedor
VALUES(1,'Carlos burns',1,'Adigol',1,14,76623),
(2,'Sr burns',2,'Cuma',2,15,723),
(3,'Carlos Smith',3,'Mike',3,13,153),
(4,'John Doe',4,'Ardidas',4,14,623),
(5,'Carl y Lenny',5,'Adigol',5,12,723)

INSERT INTO TipoTransaccion
VALUES(1,'VENDIDA'),
(2, 'REEMBOLSO'),
(3,'REEMPLAZO'),
(4,'CANCELACION'),
(5,'PROMOCION')


INSERT INTO Cliente
VALUES 
(1,'Pepita Wakelin',	3,	2,	'Pris Poynser',	33150,	'Lief Lloyd'),
(2,'Nada Kemston',	4,	5,	'Agnese Callington',	68455,	'Davis Penchen'),
(3,'Ilse Bulfit',	4,	2,	'Sky Beale',	4515	,'Dell Olivella'),
(4,'Boonie Lossman',	4,	5,	'Dee dee', 	34320,	'Cherin Gagan'),
(5,'Cassandry Lafoy',	5,	2,	'Robert Larver',	1548	,'Dom Hazelgrove')



INSERT INTO Movimiento 
VALUES('2020-04-01 23:30:17',1,1,1,1,3),
('2020-12-11 21:48:17',2,2,2,2,6),
('2019-09-17 22:26:58',3,3,3,3,2),
('2020-12-31 02:03:29',4,4,4,4,9),
('2019-12-31 09:52:15',5,5,5,5,7)



SELECT SUM(cantidad) FROM Movimiento m
WHERE Fecha_movimiento > '2020-09-17' 
--INNER JOIN Producto p
--INNER JOIN Proveedor pr
--INNER JOIN TipoTransaccion tt
--WHERE Fecha_movimiento >= @fecha_inicio  AND Fecha_movimiento <= @fecha_fin
--AND p.ID_Producto = m.ID_Producto
--AND pr.ID_Proveedor = m.ID_Proveedor
--AND tt.ID_Tipo_transaccion = m.TipoTransaccion