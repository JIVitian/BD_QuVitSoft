-- MySQL Workbench Synchronization
-- Generated: 2020-11-25 22:08
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: danie

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `maxikiosco` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`ARTICULO` (
  `CodigoArt` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `IVA` FLOAT(11) NOT NULL,
  `Precio` FLOAT(11) NOT NULL,
  `StockActual` INT(11) NULL DEFAULT NULL,
  `StockMinimo` INT(11) NULL DEFAULT NULL,
  `Descripción` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`CodigoArt`),
  UNIQUE INDEX `CodigoArt_UNIQUE` (`CodigoArt` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`CLIENTE` (
  `DNI` VARCHAR(8) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `CUIL/CUIT` VARCHAR(15) NOT NULL,
  `Mail` VARCHAR(60) NULL DEFAULT NULL,
  `Telefono` VARCHAR(20) NULL DEFAULT NULL,
  `CodPostal` INT(11) NULL DEFAULT NULL,
  `Provincia` VARCHAR(45) NULL DEFAULT NULL,
  `Localidad` VARCHAR(60) NULL DEFAULT NULL,
  `Calle` VARCHAR(60) NULL DEFAULT NULL,
  `Número` INT(11) NULL DEFAULT NULL,
  `Dpto` VARCHAR(10) NULL DEFAULT NULL,
  `Piso` INT(11) NULL DEFAULT NULL,
  `NroCuenta` INT(11) NOT NULL,
  UNIQUE INDEX `CUIL_UNIQUE` (`CUIL/CUIT` ASC),
  INDEX `fk_CLIENTE_CUENTA_CORRIENTE1_idx` (`NroCuenta` ASC),
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC),
  CONSTRAINT `fk_CLIENTE_CUENTA_CORRIENTE1`
    FOREIGN KEY (`NroCuenta`)
    REFERENCES `maxikiosco`.`CUENTA_CORRIENTE` (`NroCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`PROVEEDOR` (
  `CUIL/CUIT` VARCHAR(15) NOT NULL,
  `RazónSocial` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(50) NOT NULL,
  `Telefono` VARCHAR(15) NULL DEFAULT NULL,
  `Mail` VARCHAR(60) NULL DEFAULT NULL,
  `Provincia` VARCHAR(45) NULL DEFAULT NULL,
  `Localidad` VARCHAR(45) NULL DEFAULT NULL,
  `Calle` VARCHAR(45) NULL DEFAULT NULL,
  `Número` INT(11) NULL DEFAULT NULL,
  `NroCuenta` INT(11) NOT NULL,
  INDEX `fk_PROVEEDOR_CUENTA_CORRIENTE1_idx` (`NroCuenta` ASC),
  PRIMARY KEY (`CUIL/CUIT`),
  UNIQUE INDEX `CUIL/CUIT_UNIQUE` (`CUIL/CUIT` ASC),
  CONSTRAINT `fk_PROVEEDOR_CUENTA_CORRIENTE1`
    FOREIGN KEY (`NroCuenta`)
    REFERENCES `maxikiosco`.`CUENTA_CORRIENTE` (`NroCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`EMPLEADO` (
  `DNI` VARCHAR(8) NOT NULL,
  `Legajo` INT(11) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `CUIL` VARCHAR(11) NOT NULL,
  `Mail` VARCHAR(60) NULL DEFAULT NULL,
  `Telefono` VARCHAR(15) NOT NULL,
  `Rol` VARCHAR(20) NULL DEFAULT NULL,
  `ObraSocial` VARCHAR(45) NULL DEFAULT NULL,
  `Sueldo` FLOAT(11) NULL DEFAULT NULL,
  `FechaIngreso` VARCHAR(45) NULL DEFAULT NULL,
  `Localidad` VARCHAR(45) NOT NULL,
  `Calle` VARCHAR(45) NOT NULL,
  `NroCalle` INT(11) NOT NULL,
  `Departamento` INT(11) NULL DEFAULT NULL,
  `Piso` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC),
  UNIQUE INDEX `CUIL_UNIQUE` (`CUIL` ASC),
  UNIQUE INDEX `Telefono_UNIQUE` (`Telefono` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`LOTE` (
  `CodigoArt` INT(11) NOT NULL,
  `Lote` INT(11) NOT NULL AUTO_INCREMENT,
  `FechaVencimiento` DATE NOT NULL,
  PRIMARY KEY (`CodigoArt`),
  UNIQUE INDEX `Lote_UNIQUE` (`Lote` ASC),
  CONSTRAINT `fk_table1_ARTICULO`
    FOREIGN KEY (`CodigoArt`)
    REFERENCES `maxikiosco`.`ARTICULO` (`CodigoArt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`RUBRO` (
  `IdRubro` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripcion` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`IdRubro`),
  UNIQUE INDEX `IdRubro_UNIQUE` (`IdRubro` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`TIENE` (
  `CodigoArt` INT(11) NOT NULL,
  `IdRubro` INT(11) NOT NULL,
  PRIMARY KEY (`CodigoArt`, `IdRubro`),
  INDEX `fk_ARTICULO_has_RUBRO_RUBRO1_idx` (`IdRubro` ASC),
  INDEX `fk_ARTICULO_has_RUBRO_ARTICULO1_idx` (`CodigoArt` ASC),
  CONSTRAINT `fk_ARTICULO_has_RUBRO_ARTICULO1`
    FOREIGN KEY (`CodigoArt`)
    REFERENCES `maxikiosco`.`ARTICULO` (`CodigoArt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARTICULO_has_RUBRO_RUBRO1`
    FOREIGN KEY (`IdRubro`)
    REFERENCES `maxikiosco`.`RUBRO` (`IdRubro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`CUENTA_CORRIENTE` (
  `NroCuenta` INT(11) NOT NULL AUTO_INCREMENT,
  `Saldo` FLOAT(11) NOT NULL,
  `Tipo` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`NroCuenta`),
  UNIQUE INDEX `NroCuenta_UNIQUE` (`NroCuenta` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`VENTA` (
  `NroRecibo` INT(11) NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Total` FLOAT(11) NOT NULL,
  PRIMARY KEY (`NroRecibo`),
  UNIQUE INDEX `NroRecibo_UNIQUE` (`NroRecibo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`LLEVA` (
  `NroCuenta` INT(11) NOT NULL,
  `NroRecibo` INT(11) NOT NULL,
  PRIMARY KEY (`NroCuenta`, `NroRecibo`),
  INDEX `fk_CUENTA_CORRIENTE_has_VENTA_VENTA1_idx` (`NroRecibo` ASC),
  INDEX `fk_CUENTA_CORRIENTE_has_VENTA_CUENTA_CORRIENTE1_idx` (`NroCuenta` ASC),
  CONSTRAINT `fk_CUENTA_CORRIENTE_has_VENTA_CUENTA_CORRIENTE1`
    FOREIGN KEY (`NroCuenta`)
    REFERENCES `maxikiosco`.`CUENTA_CORRIENTE` (`NroCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CUENTA_CORRIENTE_has_VENTA_VENTA1`
    FOREIGN KEY (`NroRecibo`)
    REFERENCES `maxikiosco`.`VENTA` (`NroRecibo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`INGRESA` (
  `CodigoArt` INT(11) NOT NULL,
  `ID` INT(11) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  `Costo` FLOAT(11) NOT NULL,
  PRIMARY KEY (`CodigoArt`, `ID`),
  INDEX `fk_ARTICULO_has_PROVEEDOR_ARTICULO1_idx` (`CodigoArt` ASC),
  INDEX `fk_INGRESA_ABASTECIMIENTO1_idx` (`ID` ASC),
  CONSTRAINT `fk_ARTICULO_has_PROVEEDOR_ARTICULO1`
    FOREIGN KEY (`CodigoArt`)
    REFERENCES `maxikiosco`.`ARTICULO` (`CodigoArt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INGRESA_ABASTECIMIENTO1`
    FOREIGN KEY (`ID`)
    REFERENCES `maxikiosco`.`COMPRA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`USUARIO` (
  `IdUser` INT(11) NOT NULL AUTO_INCREMENT,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(20) NOT NULL,
  `DNI` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`IdUser`),
  UNIQUE INDEX `idUSUARIO_UNIQUE` (`IdUser` ASC),
  INDEX `fk_USUARIO_EMPLEADO1_idx` (`DNI` ASC),
  CONSTRAINT `fk_USUARIO_EMPLEADO1`
    FOREIGN KEY (`DNI`)
    REFERENCES `maxikiosco`.`EMPLEADO` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`REALIZA` (
  `NroRecibo` INT(11) NOT NULL,
  `IdUser` INT(11) NOT NULL,
  PRIMARY KEY (`NroRecibo`, `IdUser`),
  INDEX `fk_VENTA_has_USUARIO_USUARIO1_idx` (`IdUser` ASC),
  INDEX `fk_VENTA_has_USUARIO_VENTA1_idx` (`NroRecibo` ASC),
  CONSTRAINT `fk_VENTA_has_USUARIO_VENTA1`
    FOREIGN KEY (`NroRecibo`)
    REFERENCES `maxikiosco`.`VENTA` (`NroRecibo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_has_USUARIO_USUARIO1`
    FOREIGN KEY (`IdUser`)
    REFERENCES `maxikiosco`.`USUARIO` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`TURNO` (
  `USUARIO` INT(11) NOT NULL,
  `Horario` CHAR NOT NULL,
  `Fecha` DATE NOT NULL,
  `Asistencia` TINYINT(4) NOT NULL,
  PRIMARY KEY (`USUARIO`),
  CONSTRAINT `fk_TURNO_USUARIO1`
    FOREIGN KEY (`USUARIO`)
    REFERENCES `maxikiosco`.`USUARIO` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`COMPRA` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `TotalCompra` FLOAT(11) NOT NULL,
  `Remito` VARCHAR(100) NOT NULL,
  `Fecha` DATE NOT NULL,
  `NroCuenta` INT(11) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ABASTECIMIENTO_CUENTA_CORRIENTE1_idx` (`NroCuenta` ASC),
  CONSTRAINT `fk_ABASTECIMIENTO_CUENTA_CORRIENTE1`
    FOREIGN KEY (`NroCuenta`)
    REFERENCES `maxikiosco`.`CUENTA_CORRIENTE` (`NroCuenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `maxikiosco`.`ART_VENDIDO` (
  `NroRecibo` INT(11) NOT NULL,
  `CodigoArt` INT(11) NOT NULL,
  `Cantidad` INT(11) NOT NULL,
  `Monto` FLOAT(11) NOT NULL,
  PRIMARY KEY (`NroRecibo`, `CodigoArt`),
  INDEX `fk_VENTA_has_ARTICULO_ARTICULO1_idx` (`CodigoArt` ASC),
  INDEX `fk_VENTA_has_ARTICULO_VENTA1_idx` (`NroRecibo` ASC),
  CONSTRAINT `fk_VENTA_has_ARTICULO_VENTA1`
    FOREIGN KEY (`NroRecibo`)
    REFERENCES `maxikiosco`.`VENTA` (`NroRecibo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_has_ARTICULO_ARTICULO1`
    FOREIGN KEY (`CodigoArt`)
    REFERENCES `maxikiosco`.`ARTICULO` (`CodigoArt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;