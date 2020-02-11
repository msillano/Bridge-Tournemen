-- phpMyAdmin SQL Dump
-- version 4.1.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2020 at 06:21 PM
-- Server version: 5.1.67-andiunpam
-- PHP Version: 5.6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bridge`
--
CREATE DATABASE IF NOT EXISTS `bridge` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bridge`;

-- --------------------------------------------------------

--
-- Table structure for table `allegati`
--

CREATE TABLE IF NOT EXISTS `allegati` (
  `idpart` int(5) NOT NULL,
  `ordine` int(2) NOT NULL,
  `reference` char(100) NOT NULL,
  `nome` char(40) NOT NULL,
  `adds` char(46) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ordine`,`idpart`,`nome`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gioca`
--

CREATE TABLE IF NOT EXISTS `gioca` (
  `ID_gio` int(11) NOT NULL,
  `ID_par` int(11) NOT NULL,
  `posizione` char(1) DEFAULT NULL,
  `RMP` int(3) DEFAULT NULL,
  `DS` int(3) DEFAULT NULL,
  `IMP` int(3) DEFAULT NULL,
  `GBP` int(3) DEFAULT NULL,
  `EMP` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID_par`,`ID_gio`),
  KEY `FKgio_gio_IND` (`ID_gio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `giocatore`
--

CREATE TABLE IF NOT EXISTS `giocatore` (
  `ID_gio` int(11) NOT NULL AUTO_INCREMENT,
  `nome` char(60) NOT NULL,
  `nickname` char(7) NOT NULL,
  `email` char(60) DEFAULT NULL,
  PRIMARY KEY (`ID_gio`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `giornata`
--

CREATE TABLE IF NOT EXISTS `giornata` (
  `ID_day` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `done` int(2) DEFAULT NULL,
  `ID_tor` int(11) NOT NULL,
  PRIMARY KEY (`ID_day`),
  KEY `FKsvolge_IND` (`ID_tor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=127 ;

-- --------------------------------------------------------

--
-- Table structure for table `iniziale`
--

CREATE TABLE IF NOT EXISTS `iniziale` (
  `ID_gio` int(11) NOT NULL,
  `ID_tor` int(11) NOT NULL,
  `punti` decimal(10,0) DEFAULT NULL,
  `presenze` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_gio`,`ID_tor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mano`
--

CREATE TABLE IF NOT EXISTS `mano` (
  `ordine` int(2) NOT NULL,
  `ns_vul` enum('1','2','3') NOT NULL,
  `eo_vul` enum('1','2') NOT NULL,
  `mazziere` int(2) NOT NULL,
  `dichiarante` char(1) DEFAULT NULL,
  `contratto` char(4) DEFAULT NULL,
  `insult` enum('','!','!!') NOT NULL,
  `fit` enum('10MAJOR','9MAJOR','8MAJOR','nofit','8minor','9minor','10minor') NOT NULL DEFAULT 'nofit',
  `prese` int(3) DEFAULT NULL,
  `decl_HCP` int(3) DEFAULT NULL,
  `DS` int(4) DEFAULT NULL,
  `ID_par` int(11) NOT NULL,
  PRIMARY KEY (`ordine`,`ID_par`),
  KEY `FKcomposta_IND` (`ID_par`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `partita`
--

CREATE TABLE IF NOT EXISTS `partita` (
  `ID_par` int(11) NOT NULL AUTO_INCREMENT,
  `progressivo` int(11) NOT NULL,
  `ID_day` int(11) NOT NULL,
  PRIMARY KEY (`ID_par`),
  KEY `FKchicago_IND` (`ID_day`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=545 ;

-- --------------------------------------------------------

--
-- Table structure for table `presente`
--

CREATE TABLE IF NOT EXISTS `presente` (
  `ID_gio` int(11) NOT NULL,
  `ID_day` int(11) NOT NULL,
  `rank` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID_day`,`ID_gio`),
  KEY `FKpre_gio_IND` (`ID_gio`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `torneo`
--

CREATE TABLE IF NOT EXISTS `torneo` (
  `ID_tor` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` char(60) NOT NULL,
  `use_HP` enum('HCP','ZHP','BP') NOT NULL DEFAULT 'HCP',
  `use_MP` enum('DS','IMP','RMP','EMP','GBP') NOT NULL DEFAULT 'GBP',
  `use_rank` enum('F1','IR','MP','NO') NOT NULL DEFAULT 'F1',
  `use_TOT` enum('AVG','TOT') NOT NULL DEFAULT 'AVG',
  PRIMARY KEY (`ID_tor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE IF NOT EXISTS `utenti` (
  `page` text,
  `ip` char(46) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
