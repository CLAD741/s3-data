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