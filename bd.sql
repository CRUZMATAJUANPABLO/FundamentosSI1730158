-- MySQL Script generated by MySQL Workbench
-- Thu May 31 15:35:39 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes` (
  `id-Cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`id-Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pedidos` (
  `id-Pedidos` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `id-Cliente` INT NULL,
  `id-Producto` INT NULL,
  `cantidad` INT NULL,
  `Clientes_id-Cliente` INT NOT NULL,
  PRIMARY KEY (`id-Pedidos`, `Clientes_id-Cliente`),
  INDEX `fk_Pedidos_Clientes_idx` (`Clientes_id-Cliente` ASC),
  CONSTRAINT `fk_Pedidos_Clientes`
    FOREIGN KEY (`Clientes_id-Cliente`)
    REFERENCES `Clientes` (`id-Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Productos` (
  `id-Producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `Pedidos_id-Pedidos` INT NOT NULL,
  `Pedidos_Clientes_id-Cliente` INT NOT NULL,
  PRIMARY KEY (`id-Producto`, `Pedidos_id-Pedidos`, `Pedidos_Clientes_id-Cliente`),
  INDEX `fk_Productos_Pedidos1_idx` (`Pedidos_id-Pedidos` ASC, `Pedidos_Clientes_id-Cliente` ASC),
  CONSTRAINT `fk_Productos_Pedidos1`
    FOREIGN KEY (`Pedidos_id-Pedidos` , `Pedidos_Clientes_id-Cliente`)
    REFERENCES `Pedidos` (`id-Pedidos` , `Clientes_id-Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
