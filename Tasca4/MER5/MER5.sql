-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Municipi` VARCHAR(45) NULL,
  `Telefon` INT(9) NULL,
  `email` VARCHAR(100) NULL,
  `user` VARCHAR(45) NULL,
  `pwd` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `MER5`.`tipus_vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`tipus_vehicles` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(100) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Vehicle` (
  `numero_bastidor` VARCHAR(10) NOT NULL,
  `model` VARCHAR(45) NULL,
  `marla` VARCHAR(45) NULL,
  `any_matriculacio` VARCHAR(45) NULL,
  `tipus_vehicles_ID` INT NOT NULL,
  PRIMARY KEY (`numero_bastidor`),
  INDEX `fk_Vehicle_tipus_vehicles1_idx` (`tipus_vehicles_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_tipus_vehicles1`
    FOREIGN KEY (`tipus_vehicles_ID`)
    REFERENCES `MER5`.`tipus_vehicles` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `MER5`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`cita` (
  `ID` INT NOT NULL,
  `Data` DATE NULL,
  `Lloc` VARCHAR(100) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER5`.`client_vehicles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`client_vehicles` (
  `any_compra` VARCHAR(20) NULL,
  `any_venta` VARCHAR(45) NULL,
  `data_darrera_revisio` VARCHAR(45) NULL,
  `ID` INT NOT NULL,
  `client_DNI1` VARCHAR(9) NOT NULL,
  `Vehicle_numero_bastidor` VARCHAR(10) NOT NULL,
  `cita_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_client_vehicles_client_idx` (`client_DNI1` ASC) VISIBLE,
  INDEX `fk_client_vehicles_Vehicle1_idx` (`Vehicle_numero_bastidor` ASC) VISIBLE,
  INDEX `fk_client_vehicles_cita1_idx` (`cita_ID` ASC) VISIBLE,
  CONSTRAINT `fk_client_vehicles_client`
    FOREIGN KEY (`client_DNI1`)
    REFERENCES `MER5`.`client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_vehicles_Vehicle1`
    FOREIGN KEY (`Vehicle_numero_bastidor`)
    REFERENCES `MER5`.`Vehicle` (`numero_bastidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_vehicles_cita1`
    FOREIGN KEY (`cita_ID`)
    REFERENCES `MER5`.`cita` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
