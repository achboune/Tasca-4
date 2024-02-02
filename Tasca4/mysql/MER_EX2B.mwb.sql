-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `Nif` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Ubicacion` VARCHAR(45) NULL,
  `N_Sales` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Poblacion` VARCHAR(45) NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peliculas` (
  `ISBN` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor_Secundario` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proyecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proyecciones` (
  `Sala INT` INT NOT NULL,
  `Hora_de_inicio` VARCHAR(45) NULL,
  `Hora_final` VARCHAR(45) NULL,
  `Cine_Nif` INT NOT NULL,
  `Peliculas_ISBN` INT NOT NULL,
  `Tarifa_ID` INT NOT NULL,
  PRIMARY KEY (`Sala INT`),
  INDEX `fk_Proyecciones_Cine_idx` (`Cine_Nif` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Peliculas1_idx` (`Peliculas_ISBN` ASC) VISIBLE,
  INDEX `fk_Proyecciones_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecciones_Cine`
    FOREIGN KEY (`Cine_Nif`)
    REFERENCES `mydb`.`Cine` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Peliculas1`
    FOREIGN KEY (`Peliculas_ISBN`)
    REFERENCES `mydb`.`Peliculas` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecciones_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `mydb`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
