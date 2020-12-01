-- TFI: Maxikiosko
-- Grupo: QuVitSoft
-- Integrantes:
-- - Quevedo, Franco
-- - Vitian, Jorge Ivan

USE maxikiosco;

/*********************************************************************************/
/***************************** CONSULTAS OBLIGATORIAS ****************************/
/*********************************************************************************/

/* N°1 */
/* Listar las mercaderías con fecha de vencimiento próximas a diciembre */
DELIMITER //
CREATE PROCEDURE `vencimiento_proximo_a`(IN fecha DATE)
	BEGIN
		SELECT ARTICULO.CodigoArt AS 'Codigo', ARTICULO.Nombre, ARTICULO.Marca, 
			   LOTE.FechaIngreso AS 'Ingreso', LOTE.FECHAVENCIMIENTO AS 'Vencimiento'
		FROM ARTICULO JOIN LOTE USING(CodigoArt)
		WHERE fechaVencimiento 
		BETWEEN date_add(fecha, INTERVAL -14 DAY) AND date_add(fecha, INTERVAL 14 DAY)
		ORDER BY fechaVencimiento ASC;
	END //
DELIMITER ;

CALL vencimiento_proximo_a (current_date());

/* N°2 */
/* Listar las ventas realizadas en la última quincena de octubre */
SELECT * FROM VENTA
WHERE fecha BETWEEN '2020-10-15' AND '2020-10-31';

/* N°3 */
/* Listar los proveedores de bebidas energéticas */
SELECT PROVEEDOR.razonSocial, ARTICULO.nombre, ARTICULO.marca
FROM PROVEEDOR INNER JOIN (CUENTA_CORRIENTE INNER JOIN 
	(COMPRA INNER JOIN 
	(INGRESA INNER JOIN ARTICULO USING(codigoArt))
	USING(ID))
	USING(NroCuenta)) USING(NroCuenta)
WHERE ARTICULO.Descripcion LIKE '%Bebida Energetica%'
GROUP BY ARTICULO.Marca
ORDER BY PROVEEDOR.RazonSocial;

/* N°4 */
/* Listar los clientes que poseen cuenta corriente ordenándolos de mayor a menor monto total de compras realizadas en el mes de octubre */
SELECT CLIENTE.APELLIDO, CLIENTE.NOMBRE, CLIENTE.DNI, CUENTA_CORRIENTE.NROCUENTA, CUENTA_CORRIENTE.SALDO, count(LLEVA.NroCuenta) AS 'N° Compras', SUM(VENTA.TOTAL) AS 'Monto Total'
FROM CLIENTE INNER JOIN (CUENTA_CORRIENTE INNER JOIN (LLEVA INNER JOIN VENTA USING(NroRecibo)) USING(NROCUENTA)) USING(NROCUENTA)
WHERE VENTA.Fecha BETWEEN '2020-10-01' AND '2020-10-31' 
GROUP BY LLEVA.NROCUENTA
ORDER BY SUM(VENTA.TOTAL) DESC;

/* N°5 */
/* Listar los productos más vendidos en el mes de octubre de mayor a menor cantidad de ventas */
SELECT ARTICULO.codigoArt, ARTICULO.Nombre, ARTICULO.marca, ARTICULO.precio, sum(ART_VENDIDO.cantidad) AS Ventas
FROM ARTICULO INNER JOIN
	(ART_VENDIDO INNER JOIN VENTA USING(NroRecibo)) USING(codigoArt)
WHERE VENTA.Fecha BETWEEN '2020-10-01' AND '2020-10-31'
GROUP BY ART_VENDIDO.codigoArt
ORDER BY sum(ART_VENDIDO.cantidad) DESC LIMIT 10;


/*********************************************************************************/
/***************************** CONSULTAS ADICIONALES *****************************/
/*********************************************************************************/

/* N°1 */
/* Obtiene los datos que irán en el recibo de la venta */
DELIMITER //
CREATE PROCEDURE `reciboVenta` (IN recibo INT)
	BEGIN
		SELECT VENTA.NroRecibo, VENTA.Fecha, VENTA.Hora,
            ARTICULO.Nombre, ARTICULO.Precio, 
            ART_VENDIDO.Cantidad, ART_VENDIDO.Monto, 
            VENTA.Total
		FROM VENTA
			INNER JOIN (ART_VENDIDO
			INNER JOIN ARTICULO USING (CodigoArt))
			USING (NroRecibo)
		WHERE VENTA.NroRecibo = recibo;
    END //
DELIMITER ;

CALL reciboVenta('5');

/* N°2 */
/* Borrar y recuperar registros de los articulos de la base de datos */
DELETE FROM ARTICULO WHERE codigoArt = 12;

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

CALL recuperarArticulo (12);

/* N°3 */
/* Muestra los saldos de los clientes y de los proveedores */
DELIMITER //
CREATE VIEW `CUENTA_CLIENTE` AS
	SELECT CLIENTE.*, CUENTA_CORRIENTE.SALDO FROM CLIENTE INNER JOIN CUENTA_CORRIENTE USING(NroCuenta)
// DELIMITER ;

DELIMITER //
CREATE VIEW `CUENTA_PROVEEDOR` AS
	SELECT PROVEEDOR.*, CUENTA_CORRIENTE.SALDO FROM (CUENTA_CORRIENTE INNER JOIN PROVEEDOR USING(NroCuenta))
// DELIMITER ;

SELECT * FROM CUENTA_CLIENTE;
SELECT * FROM CUENTA_PROVEEDOR;

/* N°4 */
/* Registrar un pago, lo que disminuye el saldo de las cta cte. Puede ser un pago nuestro a los proveedores o uno de los clientes hacia nosotros */
DELIMITER //
CREATE PROCEDURE `CtaCtePago`(IN cuenta INT, IN monto FLOAT)
	BEGIN
		UPDATE CUENTA_CORRIENTE
        SET saldo = (saldo - monto)
        WHERE NroCuenta = cuenta;
	END //
DELIMITER ;

SELECT * FROM CUENTA_PROVEEDOR;
CALL CtaCtePago(3, 3500);
SELECT * FROM CUENTA_PROVEEDOR;

/* N°5 */
/* Muestra la deuda total que tenemos con los proveedores */
DELIMITER //
CREATE VIEW `DEUDAS` AS
	SELECT SUM(SALDO) AS 'Deuda Total' FROM CUENTA_CORRIENTE WHERE tipo = 'proveedor';
// DELIMITER ;

SELECT * FROM DEUDAS;

/* N°6 */
/* Muestra las ventas realizadas por todos los vendedores */
DELIMITER //
CREATE VIEW `VENTASDEUSUARIO` AS
	SELECT EMPLEADO.Apellido, EMPLEADO.Nombre, VENTA.Fecha, VENTA.Hora, VENTA.NroRecibo
    FROM VENTA INNER JOIN (REALIZA INNER JOIN (USUARIO INNER JOIN EMPLEADO USING(DNI)) USING (idUser)) USING(NroRecibo)
    ORDER BY VENTA.Fecha DESC;
// DELIMITER ;

SELECT * FROM VENTASDEUSUARIO;
