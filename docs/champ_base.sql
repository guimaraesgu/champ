-- phpMyAdmin SQL Dump
-- version 4.1.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 26, 2015 at 03:12 PM
-- Server version: 5.6.21
-- PHP Version: 5.5.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `champ`
--
CREATE DATABASE IF NOT EXISTS `champ` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `champ`;

-- --------------------------------------------------------

--
-- Table structure for table `AtividadeEsportiva`
--

CREATE TABLE IF NOT EXISTS `AtividadeEsportiva` (
  `CodAtvEsp` int(11) NOT NULL AUTO_INCREMENT,
  `NomAtvEsp` varchar(20) NOT NULL,
  PRIMARY KEY (`CodAtvEsp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `AtividadeEsportiva`
--

INSERT INTO `AtividadeEsportiva` (`CodAtvEsp`, `NomAtvEsp`) VALUES
(1, 'Judo');

-- --------------------------------------------------------

--
-- Table structure for table `CEP`
--

CREATE TABLE IF NOT EXISTS `CEP` (
  `CodCep` varchar(10) NOT NULL,
  `LogCep` varchar(45) NOT NULL,
  `BaiCep` varchar(30) NOT NULL,
  `UfCep0` varchar(2) NOT NULL,
  `CidCep` varchar(45) NOT NULL,
  PRIMARY KEY (`CodCep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CEP`
--

INSERT INTO `CEP` (`CodCep`, `LogCep`, `BaiCep`, `UfCep0`, `CidCep`) VALUES
('30730-230', 'Rua Padre Nóbrega', 'Minas Brasil', 'MG', 'Belo Horizonte');

-- --------------------------------------------------------

--
-- Table structure for table `Endereco`
--

CREATE TABLE IF NOT EXISTS `Endereco` (
  `CodEnd` int(11) NOT NULL AUTO_INCREMENT,
  `NumEnd` int(11) NOT NULL,
  `ComEnd` varchar(20) DEFAULT NULL,
  `CodCep` varchar(10) NOT NULL,
  PRIMARY KEY (`CodEnd`),
  KEY `fk_Endereço_CEP1_idx` (`CodCep`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Endereco`
--

INSERT INTO `Endereco` (`CodEnd`, `NumEnd`, `ComEnd`, `CodCep`) VALUES
(1, 201, 'Apto 502', '30730-230');

-- --------------------------------------------------------

--
-- Table structure for table `Evento`
--

CREATE TABLE IF NOT EXISTS `Evento` (
  `CodEve` int(11) NOT NULL AUTO_INCREMENT,
  `NomEve` varchar(55) NOT NULL,
  `LocEve` varchar(35) NOT NULL,
  `DatEve` date NOT NULL,
  `CodAtvEsp` int(11) NOT NULL,
  PRIMARY KEY (`CodEve`),
  KEY `fk_Evento_AtividadeEsportiva1_idx` (`CodAtvEsp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Evento`
--

INSERT INTO `Evento` (`CodEve`, `NomEve`, `LocEve`, `DatEve`, `CodAtvEsp`) VALUES
(1, 'I Etapa Campeonato Mineiro', 'Clube Dos Oficiais', '2015-03-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Graduacao`
--

CREATE TABLE IF NOT EXISTS `Graduacao` (
  `CodGra` int(11) NOT NULL AUTO_INCREMENT,
  `NomGra` varchar(20) NOT NULL,
  `CodAtvEsp` int(11) NOT NULL,
  PRIMARY KEY (`CodGra`),
  KEY `fk_Graduacao_AtividadeEsportiva1_idx` (`CodAtvEsp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `HistoricoEvento`
--

CREATE TABLE IF NOT EXISTS `HistoricoEvento` (
  `CodEve` int(11) NOT NULL,
  `CodMat` int(11) NOT NULL,
  `Resultado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`CodEve`,`CodMat`),
  KEY `fk_Evento_has_Pessoa_Evento1_idx` (`CodEve`),
  KEY `fk_HistoricoEvento_Matricula1_idx` (`CodMat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Matricula`
--

CREATE TABLE IF NOT EXISTS `Matricula` (
  `CodMat` int(11) NOT NULL AUTO_INCREMENT,
  `CodPes` int(11) NOT NULL,
  `CodGra` int(11) NOT NULL,
  PRIMARY KEY (`CodMat`),
  KEY `fk_Pessoa_has_Turma_Pessoa1_idx` (`CodPes`),
  KEY `fk_Matricula_Graduacao1_idx` (`CodGra`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Matricula`
--

INSERT INTO `Matricula` (`CodMat`, `CodPes`, `CodGra`) VALUES
(1, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Parente`
--

CREATE TABLE IF NOT EXISTS `Parente` (
  `CodPar` int(11) NOT NULL AUTO_INCREMENT,
  `NomPar` varchar(45) NOT NULL,
  `EmaPar` varchar(45) DEFAULT NULL,
  `CpfPar` varchar(14) NOT NULL,
  PRIMARY KEY (`CodPar`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Parente`
--

INSERT INTO `Parente` (`CodPar`, `NomPar`, `EmaPar`, `CpfPar`) VALUES
(1, 'Maria De Lourdes Guimarães', 'lourdinha@yahoo.com.br', '025.377.626-06');

-- --------------------------------------------------------

--
-- Table structure for table `Pessoa`
--

CREATE TABLE IF NOT EXISTS `Pessoa` (
  `CodPes` int(11) NOT NULL AUTO_INCREMENT,
  `NomPes` varchar(45) NOT NULL,
  `DatNas` date NOT NULL,
  `SexPes` varchar(1) NOT NULL,
  `PsoPes` int(11) DEFAULT NULL,
  `RgPes0` varchar(14) DEFAULT NULL,
  `EmaPes` varchar(45) DEFAULT NULL,
  `FotPes` varchar(45) DEFAULT NULL,
  `CodEnd` int(11) NOT NULL,
  `CodParPes` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodPes`),
  KEY `fk_Pessoa_Endereço1_idx` (`CodEnd`),
  KEY `fk_Pessoa_Parente1_idx` (`CodParPes`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Pessoa`
--

INSERT INTO `Pessoa` (`CodPes`, `NomPes`, `DatNas`, `SexPes`, `PsoPes`, `RgPes0`, `EmaPes`, `FotPes`, `CodEnd`, `CodParPes`) VALUES
(1, 'Gustavo Guimarães', '1986-02-19', 'M', 54, '10982525', 'guguima@gmail.com', 'efdab23e92e44e777d34763d77e687f1.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Saude`
--

CREATE TABLE IF NOT EXISTS `Saude` (
  `CodPes` int(11) NOT NULL,
  `Alergia` varchar(80) NOT NULL,
  `Medicamento` varchar(80) NOT NULL,
  `Cirurgia` varchar(80) NOT NULL,
  PRIMARY KEY (`CodPes`),
  KEY `fk_Fisico_Pessoa1_idx` (`CodPes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Saude`
--

INSERT INTO `Saude` (`CodPes`, `Alergia`, `Medicamento`, `Cirurgia`) VALUES
(1, 'Não', 'Não', 'Não');

-- --------------------------------------------------------

--
-- Table structure for table `Telefone`
--

CREATE TABLE IF NOT EXISTS `Telefone` (
  `CodTel` int(11) NOT NULL AUTO_INCREMENT,
  `DddTel` varchar(3) NOT NULL,
  `NumTel` varchar(10) NOT NULL,
  `TipTel` varchar(1) NOT NULL,
  PRIMARY KEY (`CodTel`),
  KEY `fk_Telefone_TipoTelefone1_idx` (`TipTel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Telefone`
--

INSERT INTO `Telefone` (`CodTel`, `DddTel`, `NumTel`, `TipTel`) VALUES
(1, '31', '98914632', 'M'),
(3, '31', '30406825', 'F'),
(4, '31', '96000176', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `TelefoneParente`
--

CREATE TABLE IF NOT EXISTS `TelefoneParente` (
  `CodPar` int(11) NOT NULL,
  `CodTel` int(11) NOT NULL,
  PRIMARY KEY (`CodPar`,`CodTel`),
  KEY `fk_Parente_has_Telefone_Telefone1_idx` (`CodTel`),
  KEY `fk_Parente_has_Telefone_Parente1_idx` (`CodPar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TelefoneParente`
--

INSERT INTO `TelefoneParente` (`CodPar`, `CodTel`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TelefonePessoa`
--

CREATE TABLE IF NOT EXISTS `TelefonePessoa` (
  `CodPes` int(11) NOT NULL,
  `CodTel` int(11) NOT NULL,
  `CodMov` int(11) DEFAULT NULL,
  PRIMARY KEY (`CodPes`,`CodTel`),
  KEY `fk_Pessoa_has_Telefone_Telefone1_idx` (`CodTel`),
  KEY `fk_Pessoa_has_Telefone_Pessoa1_idx` (`CodPes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TelefonePessoa`
--

INSERT INTO `TelefonePessoa` (`CodPes`, `CodTel`, `CodMov`) VALUES
(1, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `TipoTelefone`
--

CREATE TABLE IF NOT EXISTS `TipoTelefone` (
  `TipTel` varchar(1) NOT NULL,
  `DesTipTel` varchar(25) NOT NULL,
  PRIMARY KEY (`TipTel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TipoTelefone`
--

INSERT INTO `TipoTelefone` (`TipTel`, `DesTipTel`) VALUES
('F', 'Fixo'),
('M', 'Movel');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Endereco`
--
ALTER TABLE `Endereco`
  ADD CONSTRAINT `fk_Endereço_CEP1` FOREIGN KEY (`CodCep`) REFERENCES `CEP` (`CodCep`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Evento`
--
ALTER TABLE `Evento`
  ADD CONSTRAINT `fk_Evento_AtividadeEsportiva1` FOREIGN KEY (`CodAtvEsp`) REFERENCES `AtividadeEsportiva` (`CodAtvEsp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Graduacao`
--
ALTER TABLE `Graduacao`
  ADD CONSTRAINT `fk_Graduacao_AtividadeEsportiva1` FOREIGN KEY (`CodAtvEsp`) REFERENCES `AtividadeEsportiva` (`CodAtvEsp`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `HistoricoEvento`
--
ALTER TABLE `HistoricoEvento`
  ADD CONSTRAINT `fk_Evento_has_Pessoa_Evento1` FOREIGN KEY (`CodEve`) REFERENCES `Evento` (`CodEve`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_HistoricoEvento_Matricula1` FOREIGN KEY (`CodMat`) REFERENCES `Matricula` (`CodMat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Matricula`
--
ALTER TABLE `Matricula`
  ADD CONSTRAINT `fk_Matricula_Graduacao1` FOREIGN KEY (`CodGra`) REFERENCES `Graduacao` (`CodGra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Matricula_Pessoa1` FOREIGN KEY (`CodPes`) REFERENCES `Pessoa` (`CodPes`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `Pessoa`
--
ALTER TABLE `Pessoa`
  ADD CONSTRAINT `fk_Pessoa_Endereço1` FOREIGN KEY (`CodEnd`) REFERENCES `Endereco` (`CodEnd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pessoa_Parente1` FOREIGN KEY (`CodParPes`) REFERENCES `Parente` (`CodPar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Saude`
--
ALTER TABLE `Saude`
  ADD CONSTRAINT `fk_Fisico_Pessoa1` FOREIGN KEY (`CodPes`) REFERENCES `Pessoa` (`CodPes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Telefone`
--
ALTER TABLE `Telefone`
  ADD CONSTRAINT `fk_Telefone_TipoTelefone1` FOREIGN KEY (`TipTel`) REFERENCES `TipoTelefone` (`TipTel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `TelefoneParente`
--
ALTER TABLE `TelefoneParente`
  ADD CONSTRAINT `fk_Parente_has_Telefone_Parente1` FOREIGN KEY (`CodPar`) REFERENCES `Parente` (`CodPar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Parente_has_Telefone_Telefone1` FOREIGN KEY (`CodTel`) REFERENCES `Telefone` (`CodTel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `TelefonePessoa`
--
ALTER TABLE `TelefonePessoa`
  ADD CONSTRAINT `fk_Pessoa_has_Telefone_Pessoa1` FOREIGN KEY (`CodPes`) REFERENCES `Pessoa` (`CodPes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pessoa_has_Telefone_Telefone1` FOREIGN KEY (`CodTel`) REFERENCES `Telefone` (`CodTel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
