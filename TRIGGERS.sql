USE maxikiosco;

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

DELIMITER //
CREATE TRIGGER `venta_articulo`
BEFORE INSERT ON ART_VENDIDO
FOR EACH ROW
	BEGIN
		SELECT precio INTO @precio
		FROM ARTICULO
		WHERE codigoArt = NEW.codigoArt;
        SELECT stockActual INTO @stock 
        FROM ARTICULO 
        WHERE codigoArt = NEW.codigoArt;
        
        IF (NEW.cantidad > @stock)
        THEN
			SET NEW.cantidad = @stock;
		END IF;
        
        UPDATE ARTICULO
        SET stockActual = (@stock - NEW.cantidad)
        WHERE codigoArt = NEW.codigoArt;
        
		SET NEW.monto = (NEW.cantidad * @precio);
        
        UPDATE VENTA
        SET total = (total + NEW.monto)
        WHERE nroRecibo = NEW.nroRecibo;
	END // 
DELIMITER ;

DELIMITER //
CREATE TRIGGER `producto_ingresa`
BEFORE INSERT ON INGRESA
FOR EACH ROW
	BEGIN
		SELECT stockActual INTO @stock
		FROM ARTICULO
		WHERE codigoArt = NEW.codigoArt;

		UPDATE ARTICULO
		SET stockActual = (@stock + NEW.cantidad),
			costo = (NEW.costo / NEW.cantidad),
			IVA = (NEW.costo / NEW.cantidad)*0.21
		WHERE codigoArt = NEW.codigoArt;
	END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER `borrado_articulo`
BEFORE DELETE ON ARTICULO
FOR EACH ROW 
	BEGIN
		INSERT INTO ARTICULO_HISTORIAL
        SELECT * FROM ARTICULO;
        
        UPDATE ARTICULO_HISTORIAL
        SET fecha = CURDATE(), hora = CURTIME(), operacion = 'Borrado', usuario = USER()
		WHERE NroModificación = last_insert_id();
	END //
DELIMITER ;
