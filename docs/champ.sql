SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `champ` ;
CREATE SCHEMA IF NOT EXISTS `champ` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `champ` ;

-- -----------------------------------------------------
-- Table `champ`.`CEP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`CEP` ;

CREATE TABLE IF NOT EXISTS `champ`.`CEP` (
  `CodCep` VARCHAR(10) NOT NULL,
  `LogCep` VARCHAR(45) NOT NULL,
  `BaiCep` VARCHAR(30) NOT NULL,
  `UfCep0` VARCHAR(2) NOT NULL,
  `CidCep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodCep`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Endereco` ;

CREATE TABLE IF NOT EXISTS `champ`.`Endereco` (
  `CodEnd` INT NOT NULL AUTO_INCREMENT,
  `NumEnd` INT NOT NULL,
  `ComEnd` VARCHAR(20) NULL,
  `CodCep` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CodEnd`),
  INDEX `fk_Endereço_CEP1_idx` (`CodCep` ASC),
  CONSTRAINT `fk_Endereço_CEP1`
    FOREIGN KEY (`CodCep`)
    REFERENCES `champ`.`CEP` (`CodCep`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Parente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Parente` ;

CREATE TABLE IF NOT EXISTS `champ`.`Parente` (
  `CodPar` INT NOT NULL AUTO_INCREMENT,
  `NomPar` VARCHAR(45) NOT NULL,
  `EmaPar` VARCHAR(45) NULL,
  `CpfPar` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`CodPar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Pessoa` ;

CREATE TABLE IF NOT EXISTS `champ`.`Pessoa` (
  `CodPes` INT NOT NULL AUTO_INCREMENT,
  `NomPes` VARCHAR(45) NOT NULL,
  `DatNas` DATE NOT NULL,
  `SexPes` VARCHAR(1) NOT NULL,
  `PsoPes` INT NULL,
  `RgPes0` VARCHAR(14) NULL,
  `EmaPes` VARCHAR(45) NULL,
  `FotPes` VARCHAR(45) NULL,
  `TokuiPes` VARCHAR(25) NULL,
  `CodEnd` INT NOT NULL,
  `CodParPes` INT NULL,
  PRIMARY KEY (`CodPes`),
  INDEX `fk_Pessoa_Endereço1_idx` (`CodEnd` ASC),
  INDEX `fk_Pessoa_Parente1_idx` (`CodParPes` ASC),
  CONSTRAINT `fk_Pessoa_Endereço1`
    FOREIGN KEY (`CodEnd`)
    REFERENCES `champ`.`Endereco` (`CodEnd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Parente1`
    FOREIGN KEY (`CodParPes`)
    REFERENCES `champ`.`Parente` (`CodPar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`AtividadeEsportiva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`AtividadeEsportiva` ;

CREATE TABLE IF NOT EXISTS `champ`.`AtividadeEsportiva` (
  `CodAtvEsp` INT NOT NULL AUTO_INCREMENT,
  `NomAtvEsp` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`CodAtvEsp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Evento` ;

CREATE TABLE IF NOT EXISTS `champ`.`Evento` (
  `CodEve` INT NOT NULL AUTO_INCREMENT,
  `NomEve` VARCHAR(55) NOT NULL,
  `LocEve` VARCHAR(35) NOT NULL,
  `DatEve` DATE NOT NULL,
  `CodAtvEsp` INT NOT NULL,
  PRIMARY KEY (`CodEve`),
  INDEX `fk_Evento_AtividadeEsportiva1_idx` (`CodAtvEsp` ASC),
  CONSTRAINT `fk_Evento_AtividadeEsportiva1`
    FOREIGN KEY (`CodAtvEsp`)
    REFERENCES `champ`.`AtividadeEsportiva` (`CodAtvEsp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Graduacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Graduacao` ;

CREATE TABLE IF NOT EXISTS `champ`.`Graduacao` (
  `CodGra` INT NOT NULL AUTO_INCREMENT,
  `NomGra` VARCHAR(20) NOT NULL,
  `CodAtvEsp` INT NOT NULL,
  PRIMARY KEY (`CodGra`),
  INDEX `fk_Graduacao_AtividadeEsportiva1_idx` (`CodAtvEsp` ASC),
  CONSTRAINT `fk_Graduacao_AtividadeEsportiva1`
    FOREIGN KEY (`CodAtvEsp`)
    REFERENCES `champ`.`AtividadeEsportiva` (`CodAtvEsp`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`TipoTelefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`TipoTelefone` ;

CREATE TABLE IF NOT EXISTS `champ`.`TipoTelefone` (
  `TipTel` VARCHAR(1) NOT NULL,
  `DesTipTel` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`TipTel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Telefone` ;

CREATE TABLE IF NOT EXISTS `champ`.`Telefone` (
  `CodTel` INT NOT NULL AUTO_INCREMENT,
  `DddTel` VARCHAR(3) NOT NULL,
  `NumTel` VARCHAR(10) NOT NULL,
  `TipTel` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`CodTel`),
  INDEX `fk_Telefone_TipoTelefone1_idx` (`TipTel` ASC),
  CONSTRAINT `fk_Telefone_TipoTelefone1`
    FOREIGN KEY (`TipTel`)
    REFERENCES `champ`.`TipoTelefone` (`TipTel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`TelefonePessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`TelefonePessoa` ;

CREATE TABLE IF NOT EXISTS `champ`.`TelefonePessoa` (
  `CodPes` INT NOT NULL,
  `CodTel` INT NOT NULL,
  `CodMov` INT NULL,
  PRIMARY KEY (`CodPes`, `CodTel`),
  INDEX `fk_Pessoa_has_Telefone_Telefone1_idx` (`CodTel` ASC),
  INDEX `fk_Pessoa_has_Telefone_Pessoa1_idx` (`CodPes` ASC),
  CONSTRAINT `fk_Pessoa_has_Telefone_Pessoa1`
    FOREIGN KEY (`CodPes`)
    REFERENCES `champ`.`Pessoa` (`CodPes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_has_Telefone_Telefone1`
    FOREIGN KEY (`CodTel`)
    REFERENCES `champ`.`Telefone` (`CodTel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`TelefoneParente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`TelefoneParente` ;

CREATE TABLE IF NOT EXISTS `champ`.`TelefoneParente` (
  `CodPar` INT NOT NULL,
  `CodTel` INT NOT NULL,
  PRIMARY KEY (`CodPar`, `CodTel`),
  INDEX `fk_Parente_has_Telefone_Telefone1_idx` (`CodTel` ASC),
  INDEX `fk_Parente_has_Telefone_Parente1_idx` (`CodPar` ASC),
  CONSTRAINT `fk_Parente_has_Telefone_Parente1`
    FOREIGN KEY (`CodPar`)
    REFERENCES `champ`.`Parente` (`CodPar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Parente_has_Telefone_Telefone1`
    FOREIGN KEY (`CodTel`)
    REFERENCES `champ`.`Telefone` (`CodTel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Saude`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Saude` ;

CREATE TABLE IF NOT EXISTS `champ`.`Saude` (
  `CodPes` INT NOT NULL,
  `Alergia` VARCHAR(80) NOT NULL,
  `Medicamento` VARCHAR(80) NOT NULL,
  `Cirurgia` VARCHAR(80) NOT NULL,
  INDEX `fk_Fisico_Pessoa1_idx` (`CodPes` ASC),
  PRIMARY KEY (`CodPes`),
  CONSTRAINT `fk_Fisico_Pessoa1`
    FOREIGN KEY (`CodPes`)
    REFERENCES `champ`.`Pessoa` (`CodPes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Matricula` ;

CREATE TABLE IF NOT EXISTS `champ`.`Matricula` (
  `CodMat` INT NOT NULL AUTO_INCREMENT,
  `CodPes` INT NOT NULL,
  `CodGra` INT NOT NULL,
  PRIMARY KEY (`CodMat`),
  INDEX `fk_Pessoa_has_Turma_Pessoa1_idx` (`CodPes` ASC),
  INDEX `fk_Matricula_Graduacao1_idx` (`CodGra` ASC),
  CONSTRAINT `fk_Matricula_Pessoa1`
    FOREIGN KEY (`CodPes`)
    REFERENCES `champ`.`Pessoa` (`CodPes`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Graduacao1`
    FOREIGN KEY (`CodGra`)
    REFERENCES `champ`.`Graduacao` (`CodGra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Rendimento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Rendimento` ;

CREATE TABLE IF NOT EXISTS `champ`.`Rendimento` (
  `CodRen` INT NOT NULL AUTO_INCREMENT,
  `CodMat` INT NOT NULL,
  `CodEve` INT NOT NULL,
  `CodLut` INT NOT NULL,
  `NomAdv` VARCHAR(25) NULL,
  `EntAdv` VARCHAR(25) NULL,
  `GraAdv` VARCHAR(20) NULL,
  `EntEfe` INT NULL,
  `EntNotEfe` INT NULL,
  `TokEfe` INT NULL,
  `TokNotEfe` INT NULL,
  PRIMARY KEY (`CodRen`, `CodMat`, `CodEve`),
  INDEX `fk_Rendimento_Evento1_idx` (`CodEve` ASC),
  INDEX `fk_Rendimento_Matricula1_idx` (`CodMat` ASC),
  UNIQUE INDEX `EntEfe_UNIQUE` (`EntEfe` ASC),
  CONSTRAINT `fk_Rendimento_Evento1`
    FOREIGN KEY (`CodEve`)
    REFERENCES `champ`.`Evento` (`CodEve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rendimento_Matricula1`
    FOREIGN KEY (`CodMat`)
    REFERENCES `champ`.`Matricula` (`CodMat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `champ`.`Pontuacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `champ`.`Pontuacao` ;

CREATE TABLE IF NOT EXISTS `champ`.`Pontuacao` (
  `CodPon` INT NOT NULL AUTO_INCREMENT,
  `CodMat` INT NOT NULL,
  `CodEve` INT NOT NULL,
  `CodLut` INT NOT NULL,
  `Shido` INT NULL,
  `ShidoAdv` INT NULL,
  `Hansoku` INT NULL,
  `HansokuAdv` INT NULL,
  `Yuko` INT NULL,
  `YukoAdv` INT NULL,
  `Wazari` INT NULL,
  `WazariAdv` INT NULL,
  `Ippon` INT NULL,
  `IpponAdv` INT NULL,
  PRIMARY KEY (`CodPon`, `CodMat`, `CodEve`),
  INDEX `fk_Pontuacao_Matricula1_idx` (`CodMat` ASC),
  INDEX `fk_Pontuacao_Evento1_idx` (`CodEve` ASC),
  CONSTRAINT `fk_Pontuacao_Matricula1`
    FOREIGN KEY (`CodMat`)
    REFERENCES `champ`.`Matricula` (`CodMat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pontuacao_Evento1`
    FOREIGN KEY (`CodEve`)
    REFERENCES `champ`.`Evento` (`CodEve`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `champ`.`TipoTelefone`
-- -----------------------------------------------------
START TRANSACTION;
USE `champ`;
INSERT INTO `champ`.`TipoTelefone` (`TipTel`, `DesTipTel`) VALUES ('F', 'Fixo');
INSERT INTO `champ`.`TipoTelefone` (`TipTel`, `DesTipTel`) VALUES ('M', 'Movel');

COMMIT;


--
-- Dumping data for table `AtividadeEsportiva`
--

INSERT INTO `AtividadeEsportiva` (`CodAtvEsp`, `NomAtvEsp`) VALUES
(1, 'Judo');

--
-- Dumping data for table `CEP`
--

INSERT INTO `CEP` (`CodCep`, `LogCep`, `BaiCep`, `UfCep0`, `CidCep`) VALUES
('30730-230', 'Rua Padre Nóbrega', 'Minas Brasil', 'MG', 'Belo Horizonte');

--
-- Dumping data for table `Endereco`
--

INSERT INTO `Endereco` (`CodEnd`, `NumEnd`, `ComEnd`, `CodCep`) VALUES
(1, 201, 'Apto 502', '30730-230');

--
-- Dumping data for table `Evento`
--

INSERT INTO `Evento` (`CodEve`, `NomEve`, `LocEve`, `DatEve`, `CodAtvEsp`) VALUES
(1, 'I Etapa Campeonato Mineiro', 'Clube Dos Oficiais', '2015-03-28', 1);

--
-- Dumping data for table `Graduacao`
--

INSERT INTO `Graduacao` (`CodGra`, `NomGra`, `CodAtvEsp`) VALUES
(1, 'Branca', 1),
(2, 'Cinza', 1),
(3, 'Azul Claro', 1),
(4, 'Azul Escuro', 1),
(5, 'Amarela', 1),
(6, 'Laranja', 1),
(7, 'Verde', 1),
(8, 'Roxa', 1),
(9, 'Marrom', 1),
(10, 'Preta', 1);


--
-- Dumping data for table `Parente`
--

INSERT INTO `Parente` (`CodPar`, `NomPar`, `EmaPar`, `CpfPar`) VALUES
(1, 'Maria De Lourdes Guimarães', 'lourdinha@yahoo.com.br', '025.377.626-06');

--
-- Dumping data for table `Pessoa`
--

INSERT INTO `Pessoa` (`CodPes`, `NomPes`, `DatNas`, `SexPes`, `PsoPes`, `RgPes0`, `EmaPes`, `FotPes`, `CodEnd`, `CodParPes`) VALUES
(1, 'Gustavo Guimarães', '1986-02-19', 'M', 54, '10982525', 'guguima@gmail.com', 'efdab23e92e44e777d34763d77e687f1.jpg', 1, 1);

--
-- Dumping data for table `Saude`
--

INSERT INTO `Saude` (`CodPes`, `Alergia`, `Medicamento`, `Cirurgia`) VALUES
(1, 'Não', 'Não', 'Não');

--
-- Dumping data for table `Matricula`
--

INSERT INTO `Matricula` (`CodMat`, `CodPes`, `CodGra`) VALUES
(1, 1, 8);

--
-- Dumping data for table `Telefone`
--

INSERT INTO `Telefone` (`CodTel`, `DddTel`, `NumTel`, `TipTel`) VALUES
(1, '31', '98914632', 'M'),
(3, '31', '30406825', 'F'),
(4, '31', '96000176', 'M');

--
-- Dumping data for table `TelefoneParente`
--

INSERT INTO `TelefoneParente` (`CodPar`, `CodTel`) VALUES
(1, 1);

--
-- Dumping data for table `TelefonePessoa`
--

INSERT INTO `TelefonePessoa` (`CodPes`, `CodTel`, `CodMov`) VALUES
(1, 3, 4);
