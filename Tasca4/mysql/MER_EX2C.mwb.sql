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
-- Table `mydb`.`alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`alumnos` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` INT(10) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `Edat` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departamento` (
  `ID` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`profesor` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Titulacio` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `departamento_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_profesor_departamento1_idx` (`departamento_ID` ASC) VISIBLE,
  CONSTRAINT `fk_profesor_departamento1`
    FOREIGN KEY (`departamento_ID`)
    REFERENCES `mydb`.`departamento` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asignaturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asignaturas` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Creditos` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `profesor` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `ID` INT NOT NULL,
  `Nivell` VARCHAR(45) NULL,
  `Curs` VARCHAR(45) NULL,
  `Data` VARCHAR(45) NULL,
  `alumnos_ID` INT NOT NULL,
  `Grup` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`, `alumnos_ID`),
  INDEX `fk_Matricula_alumnos1_idx` (`alumnos_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_alumnos1`
    FOREIGN KEY (`alumnos_ID`)
    REFERENCES `mydb`.`alumnos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`asignatura_matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`asignatura_matricula` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Aula` VARCHAR(45) NULL,
  `Calendari` VARCHAR(45) NULL,
  `Matricula_ID` INT NOT NULL,
  `Matricula_alumnos_ID` INT NOT NULL,
  `profesor_ID` INT NOT NULL,
  `asignaturas_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_asignatura_matricula_Matricula1_idx` (`Matricula_ID` ASC, `Matricula_alumnos_ID` ASC) VISIBLE,
  INDEX `fk_asignatura_matricula_profesor1_idx` (`profesor_ID` ASC) VISIBLE,
  INDEX `fk_asignatura_matricula_asignaturas1_idx` (`asignaturas_ID` ASC) VISIBLE,
  CONSTRAINT `fk_asignatura_matricula_Matricula1`
    FOREIGN KEY (`Matricula_ID` , `Matricula_alumnos_ID`)
    REFERENCES `mydb`.`Matricula` (`ID` , `alumnos_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_matricula_profesor1`
    FOREIGN KEY (`profesor_ID`)
    REFERENCES `mydb`.`profesor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignatura_matricula_asignaturas1`
    FOREIGN KEY (`asignaturas_ID`)
    REFERENCES `mydb`.`asignaturas` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
