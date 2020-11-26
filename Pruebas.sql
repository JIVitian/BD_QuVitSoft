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

CALL insertarArticulo('Chupetin', 'Arcor', 2.1, 15, 20, 5, 'Chupetin bien fachero');
CALL insertarArticulo('Energizante', 'Monster', 10, 80, 20, 5, 'Bebida Energetica');

CALL insertarRubro('Golosinas', 'Productos basados en azucar y derivados');

CALL insertarTiene(1,1);

CALL insertarLote(1, '2020-12-25', 15);

CALL insertarCompra(20000, 'Monster x 200', current_date(), 3);

CALL insertarIngresa(1, 1, 10, 150);

CALL insertarVenta(100);

CALL insertarArtVendido(1, 1, 10, 150);

CALL insertarLleva(1,1);