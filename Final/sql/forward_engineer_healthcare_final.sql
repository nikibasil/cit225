-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema healthcare
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `healthcare` ;

-- -----------------------------------------------------
-- Schema healthcare
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `healthcare` DEFAULT CHARACTER SET utf8 ;
USE `healthcare` ;

-- -----------------------------------------------------
-- Table `healthcare`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`address` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`address` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `address1` VARCHAR(45) NULL,
  `address2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zipcode` VARCHAR(45) NULL,
  PRIMARY KEY (`address_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`intake`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`intake` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`intake` (
  `intake_id` INT NOT NULL AUTO_INCREMENT,
  `intake_packet` TINYINT(1) NULL,
  `intake_date` DATE NULL,
  PRIMARY KEY (`intake_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`diagnosis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`diagnosis` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`diagnosis` (
  `dx_id` INT NOT NULL AUTO_INCREMENT,
  `dx_code` VARCHAR(45) NOT NULL,
  `dx_name` VARCHAR(45) NULL,
  PRIMARY KEY (`dx_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`insurance` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`insurance` (
  `insurance_id` INT NOT NULL AUTO_INCREMENT,
  `ins_name` VARCHAR(45) NOT NULL,
  `ins_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`insurance_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`client` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`client` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `birthdate` DATE NOT NULL,
  `ins_number` VARCHAR(45) NULL,
  `address_address_id` INT NOT NULL,
  `intake_intake_id` INT NOT NULL,
  `diagnosis_dx_id` INT NOT NULL,
  `insurance_insurance_id` INT NOT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_client_address1_idx` (`address_address_id` ASC) VISIBLE,
  INDEX `fk_client_intake1_idx` (`intake_intake_id` ASC) VISIBLE,
  INDEX `fk_client_diagnosis1_idx` (`diagnosis_dx_id` ASC) VISIBLE,
  INDEX `fk_client_insurance1_idx` (`insurance_insurance_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_address1`
    FOREIGN KEY (`address_address_id`)
    REFERENCES `healthcare`.`address` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_intake1`
    FOREIGN KEY (`intake_intake_id`)
    REFERENCES `healthcare`.`intake` (`intake_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_diagnosis1`
    FOREIGN KEY (`diagnosis_dx_id`)
    REFERENCES `healthcare`.`diagnosis` (`dx_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_insurance1`
    FOREIGN KEY (`insurance_insurance_id`)
    REFERENCES `healthcare`.`insurance` (`insurance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`service` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`service` (
  `service_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `service_dept` VARCHAR(45) NOT NULL,
  `service_code` VARCHAR(45) NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`dept`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`dept` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`dept` (
  `dept_id` INT NOT NULL AUTO_INCREMENT,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`dept_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`employee` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `initial` VARCHAR(10) NOT NULL,
  `dept_dept_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_employee_dept1_idx` (`dept_dept_id` ASC) VISIBLE,
  CONSTRAINT `fk_employee_dept1`
    FOREIGN KEY (`dept_dept_id`)
    REFERENCES `healthcare`.`dept` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`billing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`billing` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`billing` (
  `billing_id` INT NOT NULL AUTO_INCREMENT,
  `billing_date` DATE NULL,
  `trans_id` VARCHAR(45) NULL,
  `amount` DOUBLE NULL,
  `diagnosis_dx_id` INT NOT NULL,
  PRIMARY KEY (`billing_id`),
  INDEX `fk_billing_diagnosis1_idx` (`diagnosis_dx_id` ASC) VISIBLE,
  CONSTRAINT `fk_billing_diagnosis1`
    FOREIGN KEY (`diagnosis_dx_id`)
    REFERENCES `healthcare`.`diagnosis` (`dx_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`place_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`place_service` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`place_service` (
  `id_place_service` INT NOT NULL AUTO_INCREMENT,
  `place_name` VARCHAR(45) NOT NULL,
  `place_id` ENUM('11', '99', '12', '2') NOT NULL,
  PRIMARY KEY (`id_place_service`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`service_date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`service_date` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`service_date` (
  `service_date_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `service_start` TIME NOT NULL,
  `service_end` TIME NOT NULL,
  `total_hours` FLOAT NULL,
  `client_id_client` INT NOT NULL,
  `employee_employee_id` INT NOT NULL,
  `billing_billing_id` INT NOT NULL,
  `service_service_id` INT NOT NULL,
  `place_service_id_place_service` INT NOT NULL,
  PRIMARY KEY (`service_date_id`),
  INDEX `fk_service_date_client1_idx` (`client_id_client` ASC) VISIBLE,
  INDEX `fk_service_date_employee1_idx` (`employee_employee_id` ASC) VISIBLE,
  INDEX `fk_service_date_billing1_idx` (`billing_billing_id` ASC) VISIBLE,
  INDEX `fk_service_date_service1_idx` (`service_service_id` ASC) VISIBLE,
  INDEX `fk_service_date_place_service1_idx` (`place_service_id_place_service` ASC) VISIBLE,
  CONSTRAINT `fk_service_date_client1`
    FOREIGN KEY (`client_id_client`)
    REFERENCES `healthcare`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_date_employee1`
    FOREIGN KEY (`employee_employee_id`)
    REFERENCES `healthcare`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_date_billing1`
    FOREIGN KEY (`billing_billing_id`)
    REFERENCES `healthcare`.`billing` (`billing_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_date_service1`
    FOREIGN KEY (`service_service_id`)
    REFERENCES `healthcare`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_date_place_service1`
    FOREIGN KEY (`place_service_id_place_service`)
    REFERENCES `healthcare`.`place_service` (`id_place_service`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `healthcare`.`client_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `healthcare`.`client_service` ;

CREATE TABLE IF NOT EXISTS `healthcare`.`client_service` (
  `client_id_client` INT NOT NULL,
  `service_service_id` INT NOT NULL,
  PRIMARY KEY (`client_id_client`, `service_service_id`),
  INDEX `fk_client_has_service_service1_idx` (`service_service_id` ASC) VISIBLE,
  INDEX `fk_client_has_service_client_idx` (`client_id_client` ASC) VISIBLE,
  CONSTRAINT `fk_client_service_client`
    FOREIGN KEY (`client_id_client`)
    REFERENCES `healthcare`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_service_service1`
    FOREIGN KEY (`service_service_id`)
    REFERENCES `healthcare`.`service` (`service_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
