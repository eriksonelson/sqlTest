DROP DATABASE IF EXISTS prueba;
CREATE DATABASE IF NOT EXISTS prueba;

USE prueba;

CREATE TABLE sucursal(
id_sucursal int UNSIGNED AUTO_INCREMENT not NULL PRIMARY KEY,
nombre varchar(50) not null,
ciudad varchar(50) not null
);

CREATE TABLE cliente(
rut_cliente varchar (15) not NULL PRIMARY KEY,
nombre varchar(50) not null,
direccion VARCHAR(50) not null,
comuna VARCHAr(50) not null
);

CREATE TABLE pedido(
id_pedido int unsigned AUTO_INCREMENT not null PRIMARY KEY,
id_sucursal int unsigned not null,
rut_cliente VARCHAR(15) not null,
fecha_pedido date,
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
FOREIGN KEY (rut_cliente) REFERENCES cliente(rut_cliente) ON DELETE CASCADE
);

CREATE TABLE articulos_pedidos(
id_pedido int unsigned not null PRIMARY KEY,
id_nro_articulo int UNIQUE,
cod_articulo int UNIQUE,
unidades_pedidas int,
precio_unitario int,
FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) on DELETE CASCADE
);

CREATE TABLE articulos_despachados(
id_despacho int unsigned not null PRIMARY KEY,
id_pedido int,
id_nro_articulo int,
cod_articulo int,
cantidad_despachado int,
monto_pedido int,
fecha_pedido date,
FOREIGN KEY (id_pedido) REFERENCES articulos_pedidos(id_pedido) on DELETE CASCADE,
FOREIGN KEY (id_nro_articulo) REFERENCES articulos_pedidos(id_nro_articulo) on DELETE CASCADE,
FOREIGN KEY (cod_articulo) REFERENCES articulos_pedidos(cod_articulo) on DELETE CASCADE
);


INSERT INTO sucursal (nombre_sucursal, ciudad)
VALUES 
('Santiago Centro','Santiago'),
('Talca centro','Talca'),
('Iquique centro','Iquique'),
('Puerto montt centro','Puerto montt'),
('Concepcion centro','Concepcion'),
('Pedro aguirre cerda','Santiago'),
('Maipu','santiago');

INSERT INTO cliente (rut_cliente,nombre,direccion,comuna)
VALUES
('17893299-6','Nelson Soto','uno poniente 7543','pedro aguirre cerda'),
('18730545-5','Nilson Soto','Ejercito 1245','Iquique'),
('17414495-8','Emma soto','Anaxagoras 5809','Santiago centro'),
('11162891-2','Cristian Munoz','uno poniente 7549','Puerto Montt'),
('9743019-5','Erikson Soto','cardenal caro 2816','la dehesa'),
('17666946-2','Nicolas hazbun','los pioneros 3792','pedro aguirre cerda');

INSERT INTO pedido (id_sucursal,rut_cliente,fecha_pedido)
VALUES
(1,'17893299-6',1,'12-12-2019'),
(2,'17893299-6',2,'10-12-2016'),
(3,'17893299-6',3,'10-12-2015'),
(4,'17893299-6',4,'03-03-2015'),
(5,'17893299-6',5,'05-11-2016'),
(6,'17893299-6',6,'02-11-2015'),
(1,'17893299-6',7,'22-11-2015');

INSERT into articulos_pedido
(id_pedido,id_nro_articulo,cod_articulo,unidades_pedidas,precio_unitario)
VALUES
(1,001,111,2,2000),
(2,002,222,3,12000),
(3,003,333,1,23000),
(4,004,444,1,4000),
(5,005,555,1,50000),
(6,006,666,2,6000),
(1,007,777,3,15000);

INSERT INTO articulos_despachados 
(id_despacho,id_pedido,id_nro_articulo,cod_articulo,cantidad_despachado,monto_pedido,fecha_pedido)
VALUES
(1,1,001,111,2,4000,'12-12-2019'),
(2,2,002,222,3,36000,'10-12-2016'),
(3,3,003,333,1,23000,'10-12-2015'),
(4,4,004,444,1,4000,'03-03-2015'),
(5,5,005,555,1,50000,'05-11-2016'),
(6,6,006,666,2,12000,'02-11-2015'),
(2,1,007,777,2,45000,'22-11-2015');

