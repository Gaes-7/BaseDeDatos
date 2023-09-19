-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema topografia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema topografia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `topografia` DEFAULT CHARACTER SET utf8mb4 ;
USE `topografia` ;

-- -----------------------------------------------------
-- Table `topografia`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`usuarios` (
  `idUsuarios` INT(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idAdministrador` INT(50) NULL,
  `idCliente` INT(50) NULL DEFAULT NULL,
  `idEmpleado` INT(50) NULL DEFAULT NULL,
  `idRecHumanos` INT(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`administrador` (
  `idAdministrador` INT(50) UNSIGNED NOT NULL,
  `nomAdministrador` VARCHAR(50) NULL DEFAULT NULL,
  `apeAdministrador` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` DOUBLE NULL DEFAULT NULL,
  `correo` VARCHAR(50) NULL DEFAULT NULL,
  `usuarios_idUsuarios` INT(50) UNSIGNED NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  INDEX `fk_administrador_usuarios1_idx` (`usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_administrador_usuarios1`
    FOREIGN KEY (`usuarios_idUsuarios`)
    REFERENCES `topografia`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`cargo` (
  `Id_Cargo` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NomCargo` VARCHAR(50) NULL DEFAULT NULL,
  `idEmpleado` INT(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Cargo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`ciudad` (
  `Id_Ciudad` INT(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `NomCiudad` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Ciudad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`cliente` (
  `idCliente` INT(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomCliente` VARCHAR(50) NULL DEFAULT NULL,
  `apeCliente` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `correo` VARCHAR(50) NULL DEFAULT NULL,
  `usuarios_idUsuarios` INT(50) UNSIGNED NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_usuarios1_idx` (`usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_usuarios1`
    FOREIGN KEY (`usuarios_idUsuarios`)
    REFERENCES `topografia`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`eps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`eps` (
  `Id_eps` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idEmpleado` VARCHAR(50) NULL DEFAULT NULL,
  `Tipo_Eps` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_eps`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`empleado` (
  `idEmpleado` INT(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomEmpleado` VARCHAR(50) NULL DEFAULT NULL,
  `apeEmpleado` VARCHAR(50) NULL DEFAULT NULL,
  `incapacidades` INT(50) NULL DEFAULT NULL,
  `permisos` INT(50) NULL DEFAULT NULL,
  `edad` INT(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `eps_Id_eps` INT(10) UNSIGNED NOT NULL,
  `ciudad_Id_Ciudad` INT(50) UNSIGNED NOT NULL,
  `cargo_Id_Cargo` INT(10) UNSIGNED NOT NULL,
  `usuarios_idUsuarios` INT(50) UNSIGNED NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_empleado_eps1_idx` (`eps_Id_eps` ASC) VISIBLE,
  INDEX `fk_empleado_ciudad1_idx` (`ciudad_Id_Ciudad` ASC) VISIBLE,
  INDEX `fk_empleado_cargo1_idx` (`cargo_Id_Cargo` ASC) VISIBLE,
  INDEX `fk_empleado_usuarios1_idx` (`usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_eps1`
    FOREIGN KEY (`eps_Id_eps`)
    REFERENCES `topografia`.`eps` (`Id_eps`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_ciudad1`
    FOREIGN KEY (`ciudad_Id_Ciudad`)
    REFERENCES `topografia`.`ciudad` (`Id_Ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_cargo1`
    FOREIGN KEY (`cargo_Id_Cargo`)
    REFERENCES `topografia`.`cargo` (`Id_Cargo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empleado_usuarios1`
    FOREIGN KEY (`usuarios_idUsuarios`)
    REFERENCES `topografia`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`gerenterechumanos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`gerenterechumanos` (
  `idRecHumanos` INT(50) UNSIGNED NOT NULL,
  `nomGerenteRec` VARCHAR(50) NULL DEFAULT NULL,
  `apeGerenteRec` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `correo` VARCHAR(50) NULL DEFAULT NULL,
  `usuarios_idUsuarios` INT(50) UNSIGNED NOT NULL,
  PRIMARY KEY (`idRecHumanos`),
  INDEX `fk_gerenterechumanos_usuarios1_idx` (`usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_gerenterechumanos_usuarios1`
    FOREIGN KEY (`usuarios_idUsuarios`)
    REFERENCES `topografia`.`usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`contratoempleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`contratoempleados` (
  `idContratoEmp` INT(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idEmpleado` INT(50) UNSIGNED NULL DEFAULT NULL,
  `idAdministrador` INT(50) UNSIGNED NULL DEFAULT NULL,
  `idRecHumanos` INT(50) UNSIGNED NULL DEFAULT NULL,
  `tipoContrato` VARCHAR(50) NULL DEFAULT NULL,
  `FechaInicioContrato` DATE NULL DEFAULT NULL,
  `FechaFinContrato` DATE NULL DEFAULT NULL,
  `salario` INT(50) NULL DEFAULT NULL,
  `bancoEmp` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idContratoEmp`),
  INDEX `idEmpleado` (`idEmpleado` ASC) VISIBLE,
  INDEX `idAdministrador` (`idAdministrador` ASC) VISIBLE,
  INDEX `idRecHumanos` (`idRecHumanos` ASC) VISIBLE,
  CONSTRAINT `contratoempleados_ibfk_1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `topografia`.`empleado` (`idEmpleado`),
  CONSTRAINT `contratoempleados_ibfk_2`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `topografia`.`administrador` (`idAdministrador`),
  CONSTRAINT `contratoempleados_ibfk_3`
    FOREIGN KEY (`idRecHumanos`)
    REFERENCES `topografia`.`gerenterechumanos` (`idRecHumanos`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `topografia`.`contratoproyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `topografia`.`contratoproyectos` (
  `idContProyectos` INT(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idEmpleado` INT(50) UNSIGNED NULL DEFAULT NULL,
  `idAdministrador` INT(50) UNSIGNED NULL DEFAULT NULL,
  `idCliente` INT(50) UNSIGNED NULL DEFAULT NULL,
  `FechaInicioContrato` DATE NULL DEFAULT NULL,
  `FechaFinContrato` DATE NULL DEFAULT NULL,
  `ValorProyecto` INT(50) NULL DEFAULT NULL,
  `clausula` VARCHAR(50) NULL DEFAULT NULL,
  `tipoProyecto` VARCHAR(50) NULL DEFAULT NULL,
  `idRecHumanos` INT(50) UNSIGNED NULL DEFAULT NULL,
  `Id_Ciudad` INT(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idContProyectos`),
  INDEX `idEmpleado` (`idEmpleado` ASC) VISIBLE,
  INDEX `idRecHumanos` (`idRecHumanos` ASC) VISIBLE,
  INDEX `idAdministrador` (`idAdministrador` ASC) VISIBLE,
  INDEX `idCliente` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `contratoproyectos_ibfk_1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `topografia`.`empleado` (`idEmpleado`),
  CONSTRAINT `contratoproyectos_ibfk_2`
    FOREIGN KEY (`idRecHumanos`)
    REFERENCES `topografia`.`gerenterechumanos` (`idRecHumanos`),
  CONSTRAINT `contratoproyectos_ibfk_3`
    FOREIGN KEY (`idAdministrador`)
    REFERENCES `topografia`.`administrador` (`idAdministrador`),
  CONSTRAINT `contratoproyectos_ibfk_4`
    FOREIGN KEY (`idCliente`)
    REFERENCES `topografia`.`cliente` (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4;

USE `topografia` ;

-- -----------------------------------------------------
-- procedure pagos_clientes
-- -----------------------------------------------------

DELIMITER $$
USE `topografia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pagos_clientes`()
select nomCliente, sum(ValorProyecto) as Total_pagos from contratoproyectos inner join cliente on cliente.idCliente=contratoproyectos.idCliente group by nomCliente$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure pagos_empleado
-- -----------------------------------------------------

DELIMITER $$
USE `topografia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pagos_empleado`()
select nomEmpleado, sum(salario) as Total_de_pagos from contratoempleados inner join empleado on empleado.idEmpleado=contratoempleados.idEmpleado group by nomEmpleado$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
