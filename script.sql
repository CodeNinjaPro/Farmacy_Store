-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema online_store_isp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema online_store_isp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `online_store_isp` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema farmacy_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema farmacy_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `farmacy_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `online_store_isp` ;

-- -----------------------------------------------------
-- Table `online_store_isp`.`attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`attendance` (
  `attendance_id` INT NOT NULL AUTO_INCREMENT,
  `emp_id` INT NULL DEFAULT NULL,
  `month` VARCHAR(45) NULL DEFAULT NULL,
  `no_of_days` DOUBLE NULL DEFAULT NULL,
  `no_of_ot` DOUBLE NULL DEFAULT NULL,
  `advance` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`attendance_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `contact_no` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`delivary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`delivary` (
  `delivary_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_id` INT NULL DEFAULT NULL,
  `emp_id` INT NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `cus_contact` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`delivary_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`employee` (
  `emp_id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `contact_number` VARCHAR(45) NULL DEFAULT NULL,
  `designation` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`grn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`grn` (
  `grn_id` INT NOT NULL AUTO_INCREMENT,
  `supplier_id` INT NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`grn_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`grn_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`grn_details` (
  `grn_details` INT NOT NULL AUTO_INCREMENT,
  `grn_id` INT NULL DEFAULT NULL,
  `item_registration_id` INT NULL DEFAULT NULL,
  `qty` DOUBLE NULL DEFAULT NULL,
  `unit_price` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`grn_details`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `offer_amount` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`invoice_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`invoice_details` (
  `invoice_details_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_id` INT NULL DEFAULT NULL,
  `item_registration_id` INT NULL DEFAULT NULL,
  `qty` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_details_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`item_registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`item_registration` (
  `item_registration_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `unit_price` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`item_registration_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`salary_shedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`salary_shedule` (
  `salary_shedule_id` INT NOT NULL AUTO_INCREMENT,
  `emp_id` INT NULL DEFAULT NULL,
  `basic_salary` DOUBLE NULL DEFAULT NULL,
  `ot_rate` DOUBLE NULL DEFAULT NULL,
  `bonus` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`salary_shedule_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`stock` (
  `stock_id` INT NOT NULL AUTO_INCREMENT,
  `item_registration_id` INT NULL DEFAULT NULL,
  `qty` DOUBLE NULL DEFAULT NULL,
  `offer_presentage` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`stock_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`supplier` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `online_store_isp`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `online_store_isp`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `emp_id` INT NULL DEFAULT NULL,
  `user_type` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

USE `farmacy_store` ;

-- -----------------------------------------------------
-- Table `farmacy_store`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `contact_no` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`grn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`grn` (
  `grn_id` INT NOT NULL AUTO_INCREMENT,
  `supplier_id` INT NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`grn_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`grn_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`grn_details` (
  `grn_details` INT NOT NULL AUTO_INCREMENT,
  `grn_id` INT NULL DEFAULT NULL,
  `item_registration_id` INT NULL DEFAULT NULL,
  `qty` DOUBLE NULL DEFAULT NULL,
  `unit_price` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`grn_details`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `offer_amount` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`invoice_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`invoice_details` (
  `invoice_details_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_id` INT NULL DEFAULT NULL,
  `item_registration_id` INT NULL DEFAULT NULL,
  `qty` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_details_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`item_registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`item_registration` (
  `item_registration_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `unit_price` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`item_registration_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`stock` (
  `stock_id` INT NOT NULL AUTO_INCREMENT,
  `item_registration_id` INT NULL DEFAULT NULL,
  `qty` DOUBLE NULL DEFAULT NULL,
  `offer_presentage` DOUBLE NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`stock_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`supplier` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `farmacy_store`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `farmacy_store`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NULL DEFAULT NULL,
  `user_type` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `date_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
