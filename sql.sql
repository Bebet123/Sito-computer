-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.4.32-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dump della struttura del database sito
CREATE DATABASE IF NOT EXISTS `sito` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sito`;

-- Dump della struttura di tabella sito.computer
CREATE TABLE IF NOT EXISTS `computer` (
  `IDProdotto` int(11) NOT NULL,
  `Descrizione` text DEFAULT NULL,
  `Prezzo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`IDProdotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella sito.indirizzo
CREATE TABLE IF NOT EXISTS `indirizzo` (
  `IDIndirizzo` int(11) NOT NULL,
  `Via` varchar(255) DEFAULT NULL,
  `NumeroCivico` varchar(10) DEFAULT NULL,
  `Citta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDIndirizzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella sito.ordine
CREATE TABLE IF NOT EXISTS `ordine` (
  `ID` int(11) NOT NULL,
  `Stato` varchar(50) DEFAULT NULL,
  `Totale` decimal(10,2) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `IDSpedizione` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDSpedizione` (`IDSpedizione`),
  CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`IDSpedizione`) REFERENCES `indirizzo` (`IDIndirizzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella sito.recensione
CREATE TABLE IF NOT EXISTS `recensione` (
  `IDRecensione` int(11) NOT NULL,
  `Punteggio` int(11) DEFAULT NULL CHECK (`Punteggio` between 1 and 5),
  `Descrizione` text DEFAULT NULL,
  `IDUtente` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDRecensione`),
  KEY `IDUtente` (`IDUtente`),
  CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`IDUtente`) REFERENCES `utente` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- L’esportazione dei dati non era selezionata.

-- Dump della struttura di tabella sito.utente
CREATE TABLE IF NOT EXISTS `utente` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `IDIndirizzo` int(11) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `banned` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IDIndirizzo` (`IDIndirizzo`),
  CONSTRAINT `utente_ibfk_1` FOREIGN KEY (`IDIndirizzo`) REFERENCES `indirizzo` (`IDIndirizzo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- L’esportazione dei dati non era selezionata.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
