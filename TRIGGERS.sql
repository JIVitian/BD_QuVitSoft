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
CREATE TRIGGER `insercionEmpleado`
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
	IF isnull(NEW.legajo) AND isnull(SELECT MAX(legajo) FROM EMPLEADO)
    THEN
		SET NEW.legajo = 1;
	ELSE
		SET NEW.legajo = (SELECT MAX(legajo) FROM EMPLEADO) OR NEW.legajo = 1;
	END IF ;
END$$ 
DELIMITER ;