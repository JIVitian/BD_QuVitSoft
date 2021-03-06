-- TFI: Maxikiosko
-- Grupo: QuVitSoft
-- Integrantes:
-- - Quevedo, Franco
-- - Vitian, Jorge Ivan

USE maxikiosco;

/***********************SP DE INSERCIÓN***********************/
DELIMITER //
CREATE PROCEDURE `insertarCtaCte` (IN tipo VARCHAR(9))
BEGIN
	INSERT INTO cuenta_corriente
    VALUES (null, 0, tipo);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarCliente` (IN DNI VARCHAR(8), IN Apellido VARCHAR (45), IN Nombre VARCHAR(45),
IN CUIL VARCHAR(11), IN Mail VARCHAR(60), IN Telefono VARCHAR(15), IN CodPostal INT, IN Provincia VARCHAR(45),
IN Localidad VARCHAR(45), IN Calle VARCHAR(45), IN Numero INT, IN Piso INT, IN Dpto INT)
    BEGIN
		CALL insertarCtaCte('cliente');
        SELECT @cta:= last_insert_id();
        
        INSERT INTO cliente
        VALUES (DNI, Apellido, Nombre, CUIL, Mail, Telefono,
        CodPostal, Provincia, Localidad, Calle, Numero, Dpto, Piso, @cta);
    END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarProveedor` (IN CUIT VARCHAR(15), IN rsocial VARCHAR(45), IN tipo VARCHAR(50), IN telefono VARCHAR(15), IN Mail VARCHAR(60), IN Provincia VARCHAR(45),
									  IN Localidad VARCHAR(45), IN Calle VARCHAR(45), IN Numero INT)
    BEGIN
		CALL insertarCtaCte('proveedor');
        SELECT @cta:= last_insert_id();
        
        INSERT INTO PROVEEDOR
        VALUES (CUIT, rsocial, tipo, telefono, Mail, Provincia,
        Localidad, Calle, Numero, @cta);
    END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarUsuario` (IN pass VARCHAR(45), IN tipo VARCHAR(20), IN dni VARCHAR(8))
	BEGIN
		INSERT INTO usuario
        VALUES (null, pass, tipo, dni);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarEmpleado`(IN DNI VARCHAR(8), IN apellido VARCHAR(45), IN nombre VARCHAR(45), IN CUIL VARCHAR(11),
									IN mail VARCHAR(60), IN telefono VARCHAR(15), IN rol VARCHAR(20),IN obraSocial VARCHAR(45),
                                    IN sueldo FLOAT, IN fechaIng DATE, IN localidad VARCHAR(45), IN calle VARCHAR(45),
                                    IN nroCalle INT, IN Piso INT, IN Dpto INT)
	BEGIN
		INSERT INTO empleado
		VALUES (DNI, NULL, apellido, nombre, CUIL, mail, telefono, rol,
		obraSocial, sueldo, fechaIng, localidad, calle, nroCalle, piso, Dpto);
	END // 
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarTurno`(IN idUser INT)
	BEGIN
		INSERT INTO TURNO
		VALUES (idUser, current_time(), current_date(), null);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarArticulo`(IN nombre VARCHAR(45), IN  marca VARCHAR(45), IN stockmin INT, IN descrip VARCHAR(200))
	BEGIN
		INSERT INTO ARTICULO
		VALUES (null, nombre, marca, 0, 0, 0, 0, stockmin, descrip);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarRubro`(IN nombre VARCHAR(50), IN descrip VARCHAR(200))
	BEGIN
		INSERT INTO RUBRO
		VALUES (null, nombre, descrip);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarTiene`(IN codArt INT, IN idRubro INT)
	BEGIN
		INSERT INTO TIENE
		VALUES (codArt, idRubro);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarLote`(IN codArt INT,IN fllegada DATE,IN vencimiento DATE)
	BEGIN
		INSERT INTO LOTE
		VALUES (null, codArt, fllegada, vencimiento);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarCompra`(IN fecha DATE, IN cuenta INT)
	BEGIN
		INSERT INTO COMPRA
		VALUES (null, 0, '', fecha, cuenta);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarIngresa`(IN codArt INT, IN idCompra INT, IN cantidad INT, IN costo FLOAT)
	BEGIN
		INSERT INTO INGRESA
		VALUES (codArt, idCompra, cantidad, costo);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarVenta`(IN fecha DATE, IN hora TIME)
	BEGIN
		INSERT INTO VENTA
		VALUES (null, fecha, hora, 0);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarArtVendido`(IN nroRecibo INT, IN codArt INT, IN cantidad INT)
	BEGIN
		INSERT INTO ART_VENDIDO
		VALUES (nroRecibo, codArt, cantidad, null);
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarLleva`(IN nroCuenta INT, IN nroRecibo INT)
	BEGIN
		INSERT INTO LLEVA
		VALUES (nroCuenta, nroRecibo);
	END //
DELIMITER ;
