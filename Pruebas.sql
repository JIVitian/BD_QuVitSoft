USE maxikiosco;

CALL insertarCliente('12345678', 'Mario', 'Mario', '2012345678', 'superm@gmail.com', '+549381203040', 4444, 'Salta', 'Wachipa', 'Falsa', 123, 2, 11);
CALL insertarCliente('12347612', 'Mario', 'Luigi', '2012347612', null, '+549381203055', null, null, null, null, null, null, null);
        
CALL insertarProveedor('123456789', 'Empresa Generica S.R.L', 'Fijo', '+54903495293', 'empresag@yahoo.com', 'Tucuman', 'Trancas', 'El tuerto', '7');
CALL insertarProveedor('192638164', 'Otra Empresa S.A', 'Recurrente', '034163974', null, null, null, null, null);

CALL insertarEmpleado('21121212', 'Alvarez', 'Cristian', '20211212127', 'elpity718@gmail.com', '+1248154233', 'Cajero',
		'Viejas Locas', '22000', current_date(), 'Concepción', 'Vela', 16, 6, 13);
CALL insertarEmpleado('92174762', 'Polo', 'Marco', '20921747627', 'marco-polo@hotmail.com', '+0303456', 'Cajero',
		'Barqueros Anonimos', '22000', current_date(), 'Simoca', 'EL fondo', 523, 2, 12);
        
CALL insertarUsuario(sha1('contraseña'), 'usuario', '21121212');
CALL insertarUsuario(sha1('otra contraseña'), 'usuario', '92174762');

CALL insertarTurno(1);
CALL insertarTurno(2);

CALL insertarArticulo('Chupetin', 'Arcor', 0, 0, 0, 0, 5, 'Chupetin bien fachero');
CALL insertarArticulo('Energizante', 'Monster', 0,0, 0, 0, 5, 'Bebida Energetica');
CALL insertarArticulo('Energizante', 'Speed', 0,0, 0, 0, 5, 'Bebida Energetica');
CALL insertarArticulo('Cepillo de Dientes', 'Colgate', 0,0, 0, 0, 5, 'Cepillo de dientes Multicolor');
CALL insertarArticulo('Jabon', 'Nivea', 0,0, 0, 0, 5, '');
CALL insertarArticulo('Energizante zero', 'Monster', 0,0, 0, 0, 5, 'Bebida Energetica');

CALL insertarRubro('Golosinas', 'Productos basados en azucar y derivados');

CALL insertarTiene(1,1);

CALL insertarLote(1, '2020-4-12', '2020-12-25');
CALL insertarLote(2, '2020-4-12', '2020-11-15');
CALL insertarLote(2, '2020-6-11', '2020-12-30');
CALL insertarLote(2, '2020-4-12', '2021-01-15');
CALL insertarLote(2, '2020-4-12', '2021-01-31');
CALL insertarLote(2, '2020-4-12', '2021-11-01');
CALL insertarLote(2, '2020-4-12', '2021-11-25');

CALL insertarCompra(20000, 'Monster x 200', current_date(), 3);

CALL insertarIngresa(1, 1, 10, 150);

CALL insertarVenta(100);

CALL insertarArtVendido(1, 1, 10);

CALL insertarLleva(1,1);

# Empiezo a probar los triggers que voy haciendo.

INSERT INTO ART_VENDIDO VALUES (1,2, 10, null);

CALL insertarVenta(100);

INSERT INTO ART_VENDIDO VALUES (2, 1, 15, null);

CALL insertarVenta(0);

INSERT INTO ART_VENDIDO VALUES (3, 2, 15, null);

INSERT INTO ART_VENDIDO VALUES (3, 1, 15, null);

/******************PRUEBAS PARA EL TRIGGER DE INGRESA*********************/

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

/*CONSULTA OBLIGARTORIA N°1*/
CALL vencimiento_proximo_a (current_date());


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


