USE maxikiosco;

CALL insertarEmpleado('31921863', 'Ramirez', 'Yoel', '21319218636', 'ramyoel@hotmail.com.ar', '+549381846231', 'Gerente',
		'RT', 40000, '2020-7-19', 'San Miguel', 'Crisostomo Alvaréz', 1105, 2, 13);
CALL insertarEmpleado('21121212', 'Alvarez', 'Cristian', '20211212127', 'elpity718@gmail.com', '+1248154233', 'Cajero',
		'Viejas Locas', '22000', current_date(), 'Concepción', 'Vela', 16, 6, 21);
CALL insertarEmpleado('92174762', 'Polo', 'Marco', '20921747627', 'marco-polo@hotmail.com', '+0303456', 'Cajero',
		'Barqueros Anonimos', '22000', current_date(), 'Simoca', 'EL fondo', 523, 2, 4);
CALL insertarEmpleado('43330070', 'Romero', 'Jorge', '20433300707', 'jromero@gmail.com', '+54387612341', 'Repositor',
		'Mora', 20000, CURDATE(), 'Tafi Viejo', 'Vicente Lopez', 1021, null, null);
CALL insertarEmpleado('41340350', 'Juanes', 'Carlos', '20413403507', 'cj99@gmail.com.ar', '+543819823', 'Repartidor',
		'IPS', 21000, CURDATE(), 'San Miguel', 'Av. Jujuy', 4024, 1, 1);
CALL insertarEmpleado('39012974', 'Sale', 'José', '22390129747', 'jsale@yahoo.com.', '+54381937621', 'Repositor',
		null, 20000, CURDATE(), 'San Miguel', 'Corrientes', 350, null, null);
        
CALL insertarUsuario(sha1('Juanito'), 'gerente', '31921863');
CALL insertarUsuario(sha1('contraseña'), 'usuario', '21121212');
CALL insertarUsuario(sha1('otra contraseña'), 'usuario', '92174762');

CALL insertarTurno(1);
CALL insertarTurno(2);
CALL insertarTurno(3);

CALL insertarProveedor('122456789', 'DistriTuc S.A', 'Fijo', '+5490381092233', 'distrituc@gmail.com.ar', 'Tucuman', 'Trancas', 'Nestor Kirchner', '742');
CALL insertarProveedor('343223452', 'Mollos Hnos. S.R.L', 'Recurrente', '0381980012', 'mhnos@yahoo.com', 'Tucuman', 'Tafi Viejo', 'Lola Mora', '405');
CALL insertarProveedor('322419241', 'J.D S.A', 'Fijo', '03865390010', 'jordano@outlook.com', 'Tucuman', 'Concepción', 'Sarmiento', 1200);
CALL insertarProveedor('213182948', 'Arcor S.A', 'Recurrente', '420134', 'contactoarcor@gmail.com.ar', 'Tucuman', 'Tafi Viejo', 'San Justo', 2052);

CALL insertarCliente('34908421', 'Morales', 'Ana Sofia', '21349084212', 'anitayanoesanita@gmail.com', '+549381999932', 4000, 'Tucuman', 'Lomas de Tafí', 'Falsa', 123, 7, 24);
CALL insertarCliente('30124876', 'Altozano', 'Jaime', '21301248763', 'altozanoj@outlook.com', '+549381937321', 'Tucuman', 'Trancas', 'Eva Perón', null, null, null, null);
CALL insertarCliente('37983212', 'Llanos', 'Iván', '19379832124', 'illanos@gmail.com.ar', '+549381882301', 4000, 'Tucuman', 'San Miguel', 'Benjamin Araoz', 144, 5, 3);
CALL insertarCliente('39251243', 'Roberto', 'Carlos', '21392512436', 'robertcharly@yahoo.com', '+549381920213', 4000, 'Tucuman', 'Famailla', 'Benjamin Matienzo', 840, 10, 5);
CALL insertarCliente('30638212', 'Santaolaya', 'Javier', '23306382129', 'javisantaolaya@hotmail.com', '+549381394400', 4444, 'Salta', 'El Tala', 'María M. Burda', 320, null, null);  

CALL insertarArticulo('Gaseosa 2lts', 'Coca-Cola', 40, 'Gaseosa sabor Cola de envase descartable');
CALL insertarArticulo('Chupetin', 'Arcor', 50, 'Chupetin bien fachero');
CALL insertarArticulo('Energizante', 'Monster', 20, 'Bebida Energetica');
CALL insertarArticulo('Energizante', 'Speed', 20, 'Bebida Energetica');
CALL insertarArticulo('Cepillo de Dientes', 'Colgate', 10, 'Cepillo de dientes Multicolor');
CALL insertarArticulo('Jugo de Manzana', 'Ades', 20,'Jugo de Frutas');
CALL insertarArticulo('Chocolate Blanco', 'Arcor', 40, 'Chocolate');
CALL insertarArticulo('Encendedor', 'Vic', 10, 'Encendedor');
CALL insertarArticulo('Cerveza Negra', 'Salta', 50, 'Bebida alcoholica');
CALL insertarArticulo('Lenguetazo', 'Arcor', 60, 'Golosina');
CALL insertarArticulo('Papas Fritas', 'Lays', 40, 'Papas fritas clasicas');
CALL insertarArticulo('Energizante zero', 'Monster', 20, 'Bebida Energetica');

CALL insertarRubro('Comestibles', 'Productos hechos para el consumo.');
CALL insertarRubro('Golosinas', 'Productos basados en azucar y derivados.');
CALL insertarRubro('Bebidas', 'Bebidas sin alcohol.');
CALL insertarRubro('Bebidas Alcoholicas', 'Bebidas con cierto grado de alcohol.');
CALL insertarRubro('Higiene', 'Productos destinados a la higiene personal.');
CALL insertarRubro('Cocina', 'Productos para la cocina.');

CALL insertarTiene(1,3);
CALL insertarTiene(2,1);
CALL insertarTiene(1,1);
CALL insertarTiene(3,3);
CALL insertarTiene(4,3);
CALL insertarTiene(5,5);
CALL insertarTiene(6,3);
CALL insertarTiene(7,1);
CALL insertarTiene(7,2);
CALL insertarTiene(8,6);
CALL insertarTiene(9,4);
CALL insertarTiene(10,2);
CALL insertarTiene(11,1);
CALL insertarTiene(12,3);

CALL insertarCompra('2020-07-20', 1);
CALL insertarCompra('2020-07-20', 2);
CALL insertarCompra('2020-07-20', 3);
CALL insertarCompra('2020-07-20', 4);

CALL insertarIngresa(1, 1, 650, 45550);
CALL insertarIngresa(2, 1, 700, 7000);
CALL insertarIngresa(3, 1, 300, 15000);
CALL insertarIngresa(4, 2, 300, 16500);
CALL insertarIngresa(5, 2, 200, 14000);
CALL insertarIngresa(6, 2, 200, 12000);
CALL insertarIngresa(7, 3, 250, 13750);
CALL insertarIngresa(8, 3, 200, 7000);
CALL insertarIngresa(9, 3, 350, 22750);
CALL insertarIngresa(10, 4, 300, 4500);
CALL insertarIngresa(11, 4, 300, 21000);
CALL insertarIngresa(12, 4, 300, 15000);

CALL insertarLote(1, '2020-07-20', '2021-06-25');
CALL insertarLote(2, '2020-07-20', '2020-11-15');
CALL insertarLote(3, '2020-07-20', '2022-03-26');
CALL insertarLote(4, '2020-07-20', '2022-04-22');
CALL insertarLote(5, '2020-07-20', '2020-12-10');
CALL insertarLote(6, '2020-07-20', '2021-01-14');
CALL insertarLote(7, '2020-07-20', '2020-12-05');
CALL insertarLote(8, '2020-07-20', '2020-11-25');
CALL insertarLote(9, '2020-07-20', '2020-12-03');
CALL insertarLote(10, '2020-07-20', '2020-11-12');
CALL insertarLote(11, '2020-07-20', '2021-12-16');
CALL insertarLote(12, '2020-07-20', '2020-11-27');

CALL insertarVenta('2020-10-12', CURTIME());
CALL insertarVenta('2020-10-16', CURTIME());
CALL insertarVenta('2020-10-21', CURTIME());
CALL insertarVenta('2020-10-23', CURTIME());
CALL insertarVenta('2020-10-31', CURTIME());
CALL insertarVenta('2020-11-14', CURTIME());

CALL insertarArtVendido(1, 1, 20);
CALL insertarArtVendido(1, 2, 20);
CALL insertarArtVendido(1, 3, 20);
CALL insertarArtVendido(2, 4, 20);
CALL insertarArtVendido(2, 5, 20);
CALL insertarArtVendido(2, 6, 20);
CALL insertarArtVendido(3, 7, 20);
CALL insertarArtVendido(3, 8, 20);
CALL insertarArtVendido(3, 9, 20);
CALL insertarArtVendido(4, 10, 20);
CALL insertarArtVendido(4, 11, 20);
CALL insertarArtVendido(4, 12, 20);
CALL insertarArtVendido(5, 1, 20);
CALL insertarArtVendido(5, 3, 20);
CALL insertarArtVendido(5, 5, 20);
CALL insertarArtVendido(6, 7, 20);
CALL insertarArtVendido(6, 9, 20);
CALL insertarArtVendido(6, 11, 20);

CALL insertarLleva(5,1);
CALL insertarLleva(6,2);
CALL insertarLleva(7,3);
CALL insertarLleva(8,4);
CALL insertarLleva(8,5);
CALL insertarLleva(9,6);

INSERT INTO REALIZA VALUE (1,1);
INSERT INTO REALIZA VALUE (2,1);
INSERT INTO REALIZA VALUE (3,2);
INSERT INTO REALIZA VALUE (4,2);
INSERT INTO REALIZA VALUE (5,3);
INSERT INTO REALIZA VALUE (6,3);


/*
# Empiezo a probar los triggers que voy haciendo.

INSERT INTO ART_VENDIDO VALUES (1,2, 10, null);

CALL insertarVenta(100);

INSERT INTO ART_VENDIDO VALUES (2, 1, 15, null);

CALL insertarVenta(0);

INSERT INTO ART_VENDIDO VALUES (3, 2, 15, null);

INSERT INTO ART_VENDIDO VALUES (3, 1, 15, null);

/******************PRUEBAS PARA EL TRIGGER DE INGRESA*********************

CALL insertarIngresa(2,1, 20, 200);

CALL insertarCompra(2000, 'Chupetin x 200', current_date(), 3);

CALL insertarIngresa(2,2, 100, 1000);
CALL insertarIngresa(1,2, 200, 2000);

# Todaía no se como sería mejor manejar los precios de los articulos
# si debería asignarlos automaticamente en 0 o algún valor calculado en 
# función del costo y el IVA hasta que el usuario decida cambiarlos
# O simplemente debería ingresar el precio, suponiendo que ya lo tenga
# pensado, junto con el registro del propio Articulo.
UPDATE ARTICULO
SET precio = 15;

INSERT INTO VENTA VALUE (NULL, '2020-10-16', curtime(), 2193);
INSERT INTO VENTA VALUE (NULL, '2020-10-31', curtime(), 2393);
INSERT INTO VENTA VALUE (NULL, '2020-10-24', curtime(), 1113);
INSERT INTO VENTA VALUE (NULL, '2020-10-24', curtime(), 5231);

CALL insertarRubro('Bebida Energetica', 'Bebida Energetica');
CALL insertarTiene(3,2);

INSERT INTO LLEVA VALUES (1,2),(1,3),(1,4);
INSERT INTO LLEVA VALUE (2,5);

INSERT INTO VENTA VALUE (NULL, '2020-10-24', curtime(), 5231);
INSERT INTO VENTA VALUE (NULL, '2020-10-24', curtime(), 5231);
INSERT INTO VENTA VALUE (NULL, '2020-10-24', curtime(), 5231);
CALL insertarArtVendido(4, 1, 10);
CALL insertarArtVendido(5, 2, 10);
CALL insertarArtVendido(6, 2, 10);
CALL insertarArtVendido(4, 2, 2);
#INSERT INTO ART_VENDIDO VALUES (8,2, 10,NULL),(9,2, 10,NULL),(10,2, 10,NULL),(11,2, 10,NULL),(12,2, 10,NULL);

SELECT system_user();

DELETE FROM ARTICULO WHERE codigoArt = 5;

CALL insertarCompra(0, '', CURDATE(), 3);
CALL insertarIngresa(3, 4, 100, 9500);
UPDATE ARTICULO SET precio = 110 WHERE codigoArt = 4;

CALL insertarLleva(1,5);
CALL insertarLleva(1,6);
CALL insertarLleva(1,7);

SELECT stockActual, CONCAT(nombre, '\n', marca) INTO @stock, @producto
FROM ARTICULO
WHERE codigoArt = 2;
