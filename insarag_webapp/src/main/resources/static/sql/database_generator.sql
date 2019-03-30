-- MySQL Script generated by MySQL Workbench
-- Sat Mar 30 11:24:27 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema insarag
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema insarag
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `insarag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `insarag` ;

-- -----------------------------------------------------
-- Table `insarag`.`alerte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`alerte` ;

CREATE TABLE IF NOT EXISTS `insarag`.`alerte` (
  `idalerte` INT(11) NOT NULL AUTO_INCREMENT,
  `entete` VARCHAR(45) NULL DEFAULT NULL,
  `date_debut` DATE NULL DEFAULT NULL,
  `date_fin` DATE NULL DEFAULT NULL,
  `infos_supp` MEDIUMTEXT NULL DEFAULT NULL,
  `pays` VARCHAR(45) NULL DEFAULT NULL,
  `ville` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idalerte`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`grade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`grade` ;

CREATE TABLE IF NOT EXISTS `insarag`.`grade` (
  `idGrade` INT(11) NOT NULL,
  `libelle` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrade`),
  UNIQUE INDEX `libelle_UNIQUE` (`libelle` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`postes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`postes` ;

CREATE TABLE IF NOT EXISTS `insarag`.`postes` (
  `idPoste` INT(11) NOT NULL,
  `libelle` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPoste`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`users` ;

CREATE TABLE IF NOT EXISTS `insarag`.`users` (
  `idusers` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `telephone` VARCHAR(45) NULL DEFAULT NULL,
  `idGrade` INT(11) NOT NULL,
  `enMission` TINYINT(4) NULL DEFAULT '0',
  `idPoste` INT(11) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `userName_UNIQUE` (`email` ASC),
  INDEX `idGrade_idx` (`idGrade` ASC),
  INDEX `fk_poste_idx` (`idPoste` ASC),
  CONSTRAINT `fk_grade`
    FOREIGN KEY (`idGrade`)
    REFERENCES `insarag`.`grade` (`idGrade`),
  CONSTRAINT `fk_poste`
    FOREIGN KEY (`idPoste`)
    REFERENCES `insarag`.`postes` (`idPoste`))
ENGINE = InnoDB
AUTO_INCREMENT = 96
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`arepondu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`arepondu` ;

CREATE TABLE IF NOT EXISTS `insarag`.`arepondu` (
  `idAlerte` INT(11) NOT NULL,
  `idUser` INT(11) NOT NULL,
  INDEX `idalerte_idx` (`idAlerte` ASC),
  INDEX `iduser_idx` (`idUser` ASC),
  CONSTRAINT `idalerte`
    FOREIGN KEY (`idAlerte`)
    REFERENCES `insarag`.`alerte` (`idalerte`),
  CONSTRAINT `iduser`
    FOREIGN KEY (`idUser`)
    REFERENCES `insarag`.`users` (`idusers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`infomission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`infomission` ;

CREATE TABLE IF NOT EXISTS `insarag`.`infomission` (
  `idinfoMission` INT(11) NOT NULL AUTO_INCREMENT,
  `idMission` INT(11) NOT NULL,
  `detailMission` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idinfoMission`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`mission` ;

CREATE TABLE IF NOT EXISTS `insarag`.`mission` (
  `idmission` INT(11) NOT NULL AUTO_INCREMENT,
  `idalerte` INT(11) NOT NULL,
  PRIMARY KEY (`idmission`),
  INDEX `alert_idx` (`idalerte` ASC),
  CONSTRAINT `alert`
    FOREIGN KEY (`idalerte`)
    REFERENCES `insarag`.`alerte` (`idalerte`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`liensutiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`liensutiles` ;

CREATE TABLE IF NOT EXISTS `insarag`.`liensutiles` (
  `idliensutiles` INT(11) NOT NULL AUTO_INCREMENT,
  `intitule` VARCHAR(45) NULL DEFAULT NULL,
  `contenu` VARCHAR(90) NULL DEFAULT NULL,
  `date` DATE NULL DEFAULT NULL,
  `idMission` INT(11) NOT NULL,
  `isLink` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`idliensutiles`),
  INDEX `idmission_idx` (`idMission` ASC),
  CONSTRAINT `idmission`
    FOREIGN KEY (`idMission`)
    REFERENCES `insarag`.`mission` (`idmission`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`pays`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`pays` ;

CREATE TABLE IF NOT EXISTS `insarag`.`pays` (
  `idpays` INT(11) NOT NULL AUTO_INCREMENT,
  `nompays` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpays`),
  UNIQUE INDEX `nompays_UNIQUE` (`nompays` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`pois`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`pois` ;

CREATE TABLE IF NOT EXISTS `insarag`.`pois` (
  `idpois` INT(11) NOT NULL AUTO_INCREMENT,
  `lat` DOUBLE NOT NULL,
  `longi` DOUBLE NOT NULL,
  `info` VARCHAR(45) NOT NULL,
  `idMission` INT(11) NOT NULL,
  PRIMARY KEY (`idpois`),
  INDEX `idMission_idx` (`idMission` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`roles` ;

CREATE TABLE IF NOT EXISTS `insarag`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(45) NULL DEFAULT NULL,
  `user` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_UNIQUE` (`user` ASC),
  INDEX `fk_user_idx` (`user` ASC),
  CONSTRAINT `fk_user`
    FOREIGN KEY (`user`)
    REFERENCES `insarag`.`users` (`idusers`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `insarag`.`ville`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `insarag`.`ville` ;

CREATE TABLE IF NOT EXISTS `insarag`.`ville` (
  `idville` INT(11) NOT NULL AUTO_INCREMENT,
  `nomville` VARCHAR(45) NOT NULL,
  `idpays` INT(11) NOT NULL,
  PRIMARY KEY (`idville`),
  UNIQUE INDEX `nomville_UNIQUE` (`nomville` ASC),
  INDEX `idpays_idx` (`idpays` ASC),
  CONSTRAINT `idpays`
    FOREIGN KEY (`idpays`)
    REFERENCES `insarag`.`pays` (`idpays`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `insarag` ;

-- -----------------------------------------------------
-- procedure TaddUser
-- -----------------------------------------------------

USE `insarag`;
DROP procedure IF EXISTS `insarag`.`TaddUser`;

DELIMITER $$
USE `insarag`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TaddUser`(IN id int,
IN poste int)
BEGIN
  INSERT INTO users VALUES("jeandupont" || id,"pwd",poste,"Jean"||id,"Dupont"||id);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpUsers
-- -----------------------------------------------------

USE `insarag`;
DROP procedure IF EXISTS `insarag`.`UpUsers`;

DELIMITER $$
USE `insarag`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpUsers`()
BEGIN
	DECLARE total_count INT DEFAULT 19;
    WHILE total_count > 0 DO
		insert into roles(titre,user) values("USER",50+total_count);
		SET total_count := total_count - 1;
    END while;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpUsersB
-- -----------------------------------------------------

USE `insarag`;
DROP procedure IF EXISTS `insarag`.`UpUsersB`;

DELIMITER $$
USE `insarag`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpUsersB`()
BEGIN
	DECLARE total_count INT DEFAULT 19;
    WHILE total_count >= 0 DO
		insert into roles(titre,user) values("USER",70+total_count);
		SET total_count := total_count - 1;
    END while;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure addUser
-- -----------------------------------------------------

USE `insarag`;
DROP procedure IF EXISTS `insarag`.`addUser`;

DELIMITER $$
USE `insarag`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(IN id int,
IN poste int)
BEGIN
  INSERT INTO users(email,password,idGrade,idPoste,nom,prenom) VALUES(concat("jeandupont",CAST(id AS CHAR)),"pwd",2,poste,concat("Jean",CAST(id as CHAR)),concat("Dupont",CAST(id as CHAR)));
END$$

DELIMITER ;
USE `insarag`;

DELIMITER $$

USE `insarag`$$
DROP TRIGGER IF EXISTS `insarag`.`add_mission_when_alerte_is_created` $$
USE `insarag`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `insarag`.`add_mission_when_alerte_is_created`
AFTER INSERT ON `insarag`.`alerte`
FOR EACH ROW
BEGIN
	insert into mission set 
		idalerte=NEW.idAlerte,
        idmission=NEW.idAlerte;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
