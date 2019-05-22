-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exam20190522
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exam20190522
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exam20190522` DEFAULT CHARACTER SET utf8 ;
USE `exam20190522` ;

-- -----------------------------------------------------
-- Table `exam20190522`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam20190522`.`Mutation` (
  `mutation_id` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `start` INT NULL,
  `end` INT NULL,
  `chromosome` VARCHAR(45) NULL,
  `description` TEXT(100) NULL DEFAULT NULL,
  PRIMARY KEY (`mutation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam20190522`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam20190522`.`patient` (
  `patient_id` INT NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `patient_age_diagnostic` INT NULL,
  `patient_sex` ENUM('F', 'M') NULL,
  `mutation_id` INT NOT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `Mutation_idx` (`mutation_id` ASC),
  CONSTRAINT `Mutation`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `exam20190522`.`Mutation` (`mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exam20190522`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam20190522`.`Syndrome` (
  `Syndrome_id` INT NOT NULL,
  `Syndrome_name` VARCHAR(45) NULL,
  `patient_id` INT NOT NULL,
  `Syndrome_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`Syndrome_id`),
  INDEX `Syndrome_idx` (`patient_id` ASC),
  CONSTRAINT `Syndrome`
    FOREIGN KEY (`patient_id`)
    REFERENCES `exam20190522`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
