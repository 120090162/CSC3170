SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `as3` ;
CREATE SCHEMA IF NOT EXISTS `as3` DEFAULT CHARACTER SET utf8 ;
USE `as3` ;

-- -----------------------------------------------------
-- Create below: Table `as3`.`regions`
-- -----------------------------------------------------
CREATE TABLE `regions` (
	`REGION_ID` DECIMAL(5,0) NOT NULL,
    `REGION_NAME` VARCHAR(25) NOT NULL,
    PRIMARY KEY (`REGION_ID`)
    );

-- -----------------------------------------------------
-- Create below: Table `as3`.`countries`
-- -----------------------------------------------------
CREATE TABLE `countries` (
	`COUNTRY_ID` VARCHAR(2) NOT NULL,
    `COUNTRY_NAME` VARCHAR(50) NOT NULL,
    `REGION_ID` DECIMAL(5,0) NOT NULL,
    PRIMARY KEY (`COUNTRY_ID`)
    );

-- -----------------------------------------------------
-- Create below: Table `as3`.`locations`
-- -----------------------------------------------------
CREATE TABLE `locations` (
	`LOCATION_ID` DECIMAL(4,0) NOT NULL,
    `STREET_ADDRESS` VARCHAR(40),
    `POSTAL_CODE` VARCHAR(12),
    `CITY` VARCHAR(30) NOT NULL,
    `STATE_PROVINCE` VARCHAR(25),
    `COUNTRY_ID` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`LOCATION_ID`)
    );

-- -----------------------------------------------------
-- Create below: Table `as3`.`jobs`
-- -----------------------------------------------------
CREATE TABLE `jobs` (
	`JOB_ID` VARCHAR(10) NOT NULL,
    `JOB_TITLE` VARCHAR(35) NOT NULL,
    `MIN_SALARY` DECIMAL(6,0),
    `MAX_SALARY` DECIMAL(6,0),
    PRIMARY KEY (`JOB_ID`)
    );

-- -----------------------------------------------------
-- Create below: Table `as3`.`employees`
-- -----------------------------------------------------
CREATE TABLE `employees` (
    `EMPLOYEE_ID` DECIMAL(6 , 0 ) NOT NULL,
    `FIRST_NAME` VARCHAR(20),
    `LAST_NAME` VARCHAR(25) NOT NULL,
    `EMAIL` VARCHAR(50) NOT NULL,
    `PHONE_NUMBER` VARCHAR(20),
    `HIRE_DATE` VARCHAR(50),
    `JOB_ID` VARCHAR(10),
    `SALARY` DECIMAL(8 , 2 ),
    `COMMISSION_PCT` DECIMAL(3 , 2 ),
    `MANAGER_ID` DECIMAL(6 , 0 ) NOT NULL,
    `DEPARTMENT_ID` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`EMPLOYEE_ID`)
);

-- -----------------------------------------------------
-- Create below: Table `as3`.`departments`
-- -----------------------------------------------------
CREATE TABLE `departments` (
	`DEPARTMENT_ID` VARCHAR(50) NOT NULL,
    `DEPARTMENT_NAME` VARCHAR(50) NOT NULL,
    `MANAGER_ID` DECIMAL(6,0),
    `LOCATION_ID` DECIMAL(4,0),
    PRIMARY KEY (`DEPARTMENT_ID`)
    );

-- -----------------------------------------------------
-- Create below: Table `as3`.`job_history`
-- -----------------------------------------------------
CREATE TABLE `job_history` (
	`EMPLOYEE_ID` DECIMAL(6,0) NOT NULL,
    `START_DATE` VARCHAR(50) NOT NULL,
    `END_DATE` VARCHAR(50) NOT NULL,
    `JOB_ID` VARCHAR(10) NOT NULL,
    `DEPARTMENT_ID` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`EMPLOYEE_ID`, `START_DATE`)
    );
    
alter table employees add foreign key (JOB_ID) references jobs(JOB_ID);
alter table departments add foreign key (MANAGER_ID) references employees(EMPLOYEE_ID);
alter table departments add foreign key (LOCATION_ID) references locations(LOCATION_ID);
alter table locations add foreign key (COUNTRY_ID) references countries(COUNTRY_ID);
alter table countries add foreign key (REGION_ID) references regions(REGION_ID);
alter table job_history add foreign key (EMPLOYEE_ID) references employees(EMPLOYEE_ID);
alter table job_history add foreign key (JOB_ID) references jobs(JOB_ID);
alter table job_history add foreign key (DEPARTMENT_ID) references departments(DEPARTMENT_ID);

-- -----------------------------------------------------
-- End of coding
-- -----------------------------------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
