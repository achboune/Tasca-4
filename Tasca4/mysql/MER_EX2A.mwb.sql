-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER_EX2.A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER_EX2.A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER_EX2.A` ;
USE `MER_EX2.A` ;

-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Paciente` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Telefono` INT(9) NULL,
  `Dirección` VARCHAR(200) NULL,
  `Num_SS` INT(9) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Paciente` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Telefono` INT(9) NULL,
  `Dirección` VARCHAR(200) NULL,
  `Num_SS` INT(9) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Medico` (
  `ID` INT NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Nom` VARCHAR(20) NOT NULL,
  `Telefono` INT(10) NULL,
  `DNI` VARCHAR(45) NULL,
  `Especialidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Consulta` (
  `ID` INT NOT NULL,
  `Data_Inicial` VARCHAR(45) NOT NULL,
  `Ubicación` VARCHAR(200) NOT NULL,
  `Planta` VARCHAR(45) NULL,
  `Edificio` VARCHAR(45) NULL,
  `Diagnostico` VARCHAR(200) NULL,
  `Paciente_ID` INT NOT NULL,
  `Data_Final` DATE NOT NULL,
  `Medico_ID1` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Consulta_Paciente_idx` (`Paciente_ID` ASC) VISIBLE,
  INDEX `fk_Consulta_Medico1_idx` (`Medico_ID1` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Paciente`
    FOREIGN KEY (`Paciente_ID`)
    REFERENCES `MER_EX2.A`.`Paciente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Medico1`
    FOREIGN KEY (`Medico_ID1`)
    REFERENCES `MER_EX2.A`.`Medico` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
