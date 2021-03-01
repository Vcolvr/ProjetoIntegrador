-- MySQL Script generated by MySQL Workbench
-- Tue Feb 16 11:33:36 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_projeto_integrador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_projeto_integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_projeto_integrador` DEFAULT CHARACTER SET utf8 ;
USE `db_projeto_integrador` ;

-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`Categoria` (
  `id_Categoria` INT NOT NULL,
  `Departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`Usuario` (
  `id_Usuario` INT NOT NULL,
  `Nome_completo` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `Senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`Produto` (
  `id_Produto` INT NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Nome_do_produto` VARCHAR(45) NOT NULL,
  `Preço` DOUBLE NOT NULL,
  `Descricao_do_produto` VARCHAR(100) NOT NULL,
  `Categoria_id_Categoria` INT NOT NULL,
  `Usuario_id_Usuario` INT NOT NULL,
  PRIMARY KEY (`id_Produto`, `Categoria_id_Categoria`, `Usuario_id_Usuario`),
  INDEX `fk_Produto_Categoria_idx` (`Categoria_id_Categoria` ASC) VISIBLE,
  INDEX `fk_Produto_Usuario1_idx` (`Usuario_id_Usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_Categoria`
    FOREIGN KEY (`Categoria_id_Categoria`)
    REFERENCES `db_projeto_integrador`.`Categoria` (`id_Categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_Usuario1`
    FOREIGN KEY (`Usuario_id_Usuario`)
    REFERENCES `db_projeto_integrador`.`Usuario` (`id_Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
