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
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `idTeam` INT NOT NULL,
  `TeamName` VARCHAR(45) NULL,
  PRIMARY KEY (`idTeam`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vehicle` (
  `idVehicle` INT NOT NULL AUTO_INCREMENT,
  `LicensePlate` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` VARCHAR(45) NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Team_idTeam` INT NOT NULL,
  PRIMARY KEY (`idVehicle`),
  INDEX `fk_Vehicle_Customer_idx` (`Customer_idCustomer` ASC) VISIBLE,
  INDEX `fk_Vehicle_Team1_idx` (`Team_idTeam` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Customer`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `mydb`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vehicle_Team1`
    FOREIGN KEY (`Team_idTeam`)
    REFERENCES `mydb`.`Team` (`idTeam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ServiceOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ServiceOrder` (
  `idServiceOrder` INT NOT NULL AUTO_INCREMENT,
  `IssueDate` DATE NULL,
  `TotalValue` FLOAT NULL,
  `Status` VARCHAR(45) NULL,
  `CompletionDate` DATE NULL,
  `Team_idTeam` INT NOT NULL,
  PRIMARY KEY (`idServiceOrder`),
  INDEX `fk_ServiceOrder_Team1_idx` (`Team_idTeam` ASC) VISIBLE,
  CONSTRAINT `fk_ServiceOrder_Team1`
    FOREIGN KEY (`Team_idTeam`)
    REFERENCES `mydb`.`Team` (`idTeam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mechanic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mechanic` (
  `idMechanic` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Specialty` VARCHAR(45) NULL,
  `Team_idTeam` INT NOT NULL,
  PRIMARY KEY (`idMechanic`),
  INDEX `fk_Mechanic_Team1_idx` (`Team_idTeam` ASC) VISIBLE,
  CONSTRAINT `fk_Mechanic_Team1`
    FOREIGN KEY (`Team_idTeam`)
    REFERENCES `mydb`.`Team` (`idTeam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LaborReference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LaborReference` (
  `idLaborReference` INT NOT NULL AUTO_INCREMENT,
  `ServiceDescription` VARCHAR(45) NULL,
  `LaborCost` FLOAT NULL,
  PRIMARY KEY (`idLaborReference`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Service` (
  `idService` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NULL,
  `LaborCost` VARCHAR(45) NULL,
  `LaborReference_idLaborReference` INT NOT NULL,
  PRIMARY KEY (`idService`),
  INDEX `fk_Service_LaborReference1_idx` (`LaborReference_idLaborReference` ASC) VISIBLE,
  CONSTRAINT `fk_Service_LaborReference1`
    FOREIGN KEY (`LaborReference_idLaborReference`)
    REFERENCES `mydb`.`LaborReference` (`idLaborReference`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Part`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Part` (
  `idPart` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NULL,
  `Price` VARCHAR(45) NULL,
  `Brand` VARCHAR(45) NULL,
  PRIMARY KEY (`idPart`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ServiceOrderPart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ServiceOrderPart` (
  `ServiceOrder_idServiceOrder` INT NOT NULL,
  `Part_idPart` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`ServiceOrder_idServiceOrder`, `Part_idPart`),
  INDEX `fk_ServiceOrder_has_Part_Part1_idx` (`Part_idPart` ASC) VISIBLE,
  INDEX `fk_ServiceOrder_has_Part_ServiceOrder1_idx` (`ServiceOrder_idServiceOrder` ASC) VISIBLE,
  CONSTRAINT `fk_ServiceOrder_has_Part_ServiceOrder1`
    FOREIGN KEY (`ServiceOrder_idServiceOrder`)
    REFERENCES `mydb`.`ServiceOrder` (`idServiceOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceOrder_has_Part_Part1`
    FOREIGN KEY (`Part_idPart`)
    REFERENCES `mydb`.`Part` (`idPart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ServiceOrderService`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ServiceOrderService` (
  `ServiceOrder_idServiceOrder` INT NOT NULL,
  `Service_idService` INT NOT NULL,
  INDEX `fk_ServiceOrder_has_Service_Service1_idx` (`Service_idService` ASC) VISIBLE,
  INDEX `fk_ServiceOrder_has_Service_ServiceOrder1_idx` (`ServiceOrder_idServiceOrder` ASC) VISIBLE,
  PRIMARY KEY (`Service_idService`, `ServiceOrder_idServiceOrder`),
  CONSTRAINT `fk_ServiceOrder_has_Service_ServiceOrder1`
    FOREIGN KEY (`ServiceOrder_idServiceOrder`)
    REFERENCES `mydb`.`ServiceOrder` (`idServiceOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServiceOrder_has_Service_Service1`
    FOREIGN KEY (`Service_idService`)
    REFERENCES `mydb`.`Service` (`idService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
