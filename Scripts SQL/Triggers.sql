-- TFI: Maxikiosko
-- Grupo: QuVitSoft
-- Integrantes:
-- - Quevedo, Franco
-- - Vitian, Jorge Ivan

USE maxikiosco;

/* N°1 */
/* Listar las mercaderías con fecha de vencimiento próximas a diciembre */
DELIMITER //
CREATE TRIGGER `insercionEmpleado`
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
	BEGIN
		SET @antLegajo := (SELECT MAX(legajo) FROM EMPLEADO);
		IF isnull(NEW.legajo) AND isnull(@antLegajo)
		THEN
			SET NEW.legajo = 1;
		ELSEIF isnull(NEW.legajo) AND NOT isnull(@antLegajo)
		THEN
			SET NEW.legajo = (@antLegajo) + 1;
		END IF ;
	END //
DELIMITER ;

/* N°2 */
/* Listar las mercaderías con fecha de vencimiento próximas a diciembre */
DELIMITER //
CREATE TRIGGER `venta_articulo`
BEFORE INSERT ON ART_VENDIDO
FOR EACH ROW
	BEGIN
		SELECT precio INTO @precio
		FROM ARTICULO
		WHERE codigoArt = NEW.codigoArt;
        SELECT stockActual INTO @stock FROM ARTICULO 
        WHERE codigoArt = NEW.codigoArt;
        
		SET NEW.monto = (NEW.cantidad * @precio);
        
        IF (NEW.cantidad > @stock)
        THEN
			SET NEW.cantidad = @stock;
		END IF;
        
        UPDATE ARTICULO
        SET stockActual = (@stock - NEW.cantidad)
        WHERE codigoArt = NEW.codigoArt;
        
        UPDATE VENTA
        SET total = (total + NEW.monto)
        WHERE nroRecibo = NEW.nroRecibo;
		
	END //
DELIMITER ;

/* N°3 */
/* Listar las mercaderías con fecha de vencimiento próximas a diciembre */
DELIMITER //
CREATE TRIGGER `insercionLleva`
AFTER INSERT ON LLEVA
FOR EACH ROW
	BEGIN
		SELECT total into @total
        FROM VENTA
        WHERE NroRecibo = NEW.NroRecibo;
        
		UPDATE CUENTA_CORRIENTE
        SET saldo = (saldo + @total)
        WHERE NroCuenta = NEW.NroCuenta AND tipo = 'cliente'; # La segunda parte es para que salte un error si la cuenta no es de un cliente
	END //
DELIMITER ;

# DROP TRIGGER insercionLleva;

/* N°4 */
/* Listar las mercaderías con fecha de vencimiento próximas a diciembre */
DELIMITER //
CREATE TRIGGER `producto_ingresa`
BEFORE INSERT ON INGRESA
FOR EACH ROW
	BEGIN
		SET @costoInd = NEW.costo / NEW.cantidad;
		SELECT stockActual, CONCAT(nombre, ' ', marca) INTO @stock, @producto
		FROM ARTICULO
		WHERE codigoArt = NEW.codigoArt;
        SELECT NroCuenta INTO @Cta
        FROM COMPRA
        WHERE ID = NEW.ID;

		UPDATE ARTICULO
		SET stockActual = (@stock + NEW.cantidad),
			costo = (@costoInd),
			IVA = (@costoInd*0.21),
            precio = round(@costoInd * 1.5)
		WHERE codigoArt = NEW.codigoArt;
        
        UPDATE COMPRA
        SET totalCompra = totalCompra + NEW.costo,
			remito = CONCAT(remito, @producto, 'x', NEW.cantidad, ' a ', NEW.costo, ', ')
        WHERE ID = NEW.ID;
        
        UPDATE CUENTA_CORRIENTE
        SET Saldo = (Saldo + NEW.costo)
		WHERE NroCuenta = @Cta AND tipo = 'proveedor';
	END //
DELIMITER ;

#DROP TRIGGER producto_ingresa;

/* N°5 */
/* Listar las mercaderías con fecha de vencimiento próximas a diciembre */
DELIMITER //
CREATE TRIGGER `borrado_articulo`
BEFORE DELETE ON ARTICULO
FOR EACH ROW 
	BEGIN
		INSERT INTO ARTICULO_HISTORIAL 
        VALUE (NULL, OLD.codigoArt, OLD.nombre, OLD.marca, OLD.costo,
        OLD.iva, OLD.precio, OLD.stockActual, OLD.stockMinimo,
        OLD.descripcion, CURDATE(), CURTIME(), USER());
	END //
DELIMITER ;
