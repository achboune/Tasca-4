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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `ID client` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `correu` VARCHAR(45) NULL,
  PRIMARY KEY (`ID client`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipus_polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipus_polissa` (
  `ID tipus_polissa` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID tipus_polissa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `ID vendedor` INT NOT NULL,
  `identificador` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Polissa` (
  `ID polissa` INT NOT NULL,
  `Num_polissa` VARCHAR(45) NULL,
  `tipus_polissa` VARCHAR(45) NULL,
  `client_ID client` INT NOT NULL,
  `Vendedor_ID vendedor` INT NOT NULL,
  `tipus_polissa_ID tipus_polissa` INT NOT NULL,
  PRIMARY KEY (`ID polissa`),
  INDEX `fk_Polissa_client_idx` (`client_ID client` ASC) VISIBLE,
  INDEX `fk_Polissa_Vendedor1_idx` (`Vendedor_ID vendedor` ASC) VISIBLE,
  INDEX `fk_Polissa_tipus_polissa1_idx` (`tipus_polissa_ID tipus_polissa` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_client`
    FOREIGN KEY (`client_ID client`)
    REFERENCES `mydb`.`client` (`ID client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Vendedor1`
    FOREIGN KEY (`Vendedor_ID vendedor`)
    REFERENCES `mydb`.`Vendedor` (`ID vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_tipus_polissa1`
    FOREIGN KEY (`tipus_polissa_ID tipus_polissa`)
    REFERENCES `mydb`.`tipus_polissa` (`ID tipus_polissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
