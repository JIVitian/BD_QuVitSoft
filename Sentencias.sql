USE maxikiosco;

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
IN Localidad VARCHAR(45), IN Calle VARCHAR(45), IN Numero INT, IN Piso INT, IN Dpto INT, IN NCuenta INT)
    BEGIN
        INSERT INTO cliente
        VALUES (DNI, Apellido, Nombre, CUIL, Mail, Telefono,
        CodPostal, Provincia, Localidad, Calle, Numero, Piso, Dpto, NCuenta);
    END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarProveedor` (IN DNI VARCHAR(8), IN Apellido VARCHAR (45), IN Nombre VARCHAR(45),
IN CUIL VARCHAR(11), IN Mail VARCHAR(60), IN Telefono VARCHAR(15), IN CodPostal INT, IN Provincia VARCHAR(45),
IN Localidad VARCHAR(45), IN Calle VARCHAR(45), IN Numero INT, IN Piso INT, IN Dpto INT)
    BEGIN
        INSERT INTO cliente
        VALUES (DNI, Apellido, Nombre, CUIL, Mail, Telefono,
        CodPostal, Provincia, Localidad, Calle, Numero, Piso, Dpto);
    END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertar` ()
	BEGIN
		INSERT ;
	END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `insertarEmpleado`()
BEGIN
	INSERT empleado
    VALUES ();
END // DELIMITER ;