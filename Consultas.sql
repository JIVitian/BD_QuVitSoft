/*CONSULTA OBLIGARTORIA N°1*/
DELIMITER //
#no sabia que tan proximo deberia ser el vencimiento, así que todos los que estan a 1 mes de distancia
CREATE PROCEDURE `vencimiento_proximo_a`(IN fecha DATE)
	BEGIN
		SELECT *
		FROM ARTICULO JOIN LOTE USING(CodigoArt)
		WHERE fechaVencimiento 
		BETWEEN date_add(fecha, INTERVAL -1 MONTH) AND date_add(fecha, INTERVAL 1 MONTH)
		ORDER BY fechaVencimiento ASC;
	END //
DELIMITER ;

CALL vencimiento_proximo_a (current_date());

/*CONSULTA OBLIGARTORIA N°2*/
SELECT *
FROM VENTA
WHERE fecha BETWEEN '2020-10-15' AND '2020-10-31';

/*CONSULTA OBLIGARTORIA N°3*/
SELECT PROVEEDOR.razonSocial, ARTICULO.nombre, ARTICULO.marca
FROM PROVEEDOR INNER JOIN (CUENTA_CORRIENTE INNER JOIN 
	(COMPRA INNER JOIN 
	(INGRESA INNER JOIN ARTICULO USING(codigoArt))
	USING(ID))
	USING(NroCuenta)) USING(NroCuenta)
WHERE ARTICULO.Descripcion LIKE '%Bebida Energetica%'
GROUP BY ARTICULO.Marca
ORDER BY PROVEEDOR.RazonSocial;

/*CONSULTA OBLIGARTORIA N°4*/
SELECT CLIENTE.APELLIDO, CLIENTE.NOMBRE, CLIENTE.DNI, CUENTA_CORRIENTE.NROCUENTA, CUENTA_CORRIENTE.SALDO, count(LLEVA.NroCuenta) AS 'N° Compras', SUM(VENTA.TOTAL) AS 'Monto Total'
FROM CLIENTE INNER JOIN (CUENTA_CORRIENTE INNER JOIN (LLEVA INNER JOIN VENTA USING(NroRecibo)) USING(NROCUENTA)) USING(NROCUENTA)
WHERE VENTA.Fecha BETWEEN '2020-10-01' AND '2020-10-31' 
GROUP BY LLEVA.NROCUENTA
ORDER BY SUM(VENTA.TOTAL) DESC;

/*CONSULTA OBLIGARTORIA N°5*/
SELECT ARTICULO.codigoArt, ARTICULO.Nombre, ARTICULO.marca, ARTICULO.precio, sum(ART_VENDIDO.cantidad) AS Ventas
FROM ARTICULO INNER JOIN
	(ART_VENDIDO INNER JOIN VENTA USING(NroRecibo)) USING(codigoArt)
WHERE VENTA.Fecha BETWEEN '2020-10-01' AND '2020-10-31'
GROUP BY ART_VENDIDO.codigoArt
ORDER BY sum(ART_VENDIDO.cantidad) DESC;

/*********************CONSULTAS ADICIONALES*********************/
/*CONSULTA N°1*/


/*CONSULTA N°2*/


/*CONSULTA N°3*/


/*CONSULTA N°4*/
DELIMITER //
CREATE PROCEDURE `recuperarArticulo` (IN id INT)
BEGIN
	INSERT INTO ARTICULO
    (SELECT codigoArt, nombre, marca, costo, iva, precio, stockactual, stockminimo, descripcion
    FROM ARTICULO_HISTORIAL
    WHERE codigoArt = id);
    
    DELETE FROM ARTICULO_HISTORIAL WHERE codigoArt = id;
END //
DELIMITER ;

CALL recuperarArticulo (5);

/*CONSULTA N°5*/
DELIMITER //
CREATE VIEW `SALDO_CLIENTE` AS
	SELECT CLIENTE.*, CUENTA_CORRIENTE.SALDO FROM CLIENTE INNER JOIN CUENTA_CORRIENTE USING(NroCuenta)
// DELIMITER ;

DELIMITER //
CREATE VIEW `SALDO_PROVEEDOR` AS
	SELECT PROVEEDOR.*, CUENTA_CORRIENTE.SALDO FROM (CUENTA_CORRIENTE INNER JOIN PROVEEDOR USING(NroCuenta))
// DELIMITER ;

SELECT * FROM SALDO_CLIENTE;
SELECT * FROM SALDO_PROVEEDOR;