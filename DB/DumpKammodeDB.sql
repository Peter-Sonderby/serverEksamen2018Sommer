-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: kammodedb
-- ------------------------------------------------------
-- Server version	5.6.38-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bruger`
--

DROP TABLE IF EXISTS `bruger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bruger` (
  `bruger_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `forsendelses_informationer_forsendelses_informationer_id` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`bruger_id`,`forsendelses_informationer_forsendelses_informationer_id`),
  KEY `fk_bruger_forsendelses_informationer_idx` (`forsendelses_informationer_forsendelses_informationer_id`),
  CONSTRAINT `fk_bruger_forsendelses_informationer` FOREIGN KEY (`forsendelses_informationer_forsendelses_informationer_id`) REFERENCES `forsendelses_informationer` (`forsendelses_informationer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bruger`
--

LOCK TABLES `bruger` WRITE;
/*!40000 ALTER TABLE `bruger` DISABLE KEYS */;
/*!40000 ALTER TABLE `bruger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forsendelses_informationer`
--

DROP TABLE IF EXISTS `forsendelses_informationer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forsendelses_informationer` (
  `forsendelses_informationer_id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(45) DEFAULT NULL,
  `postnummer` varchar(45) DEFAULT NULL,
  `by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`forsendelses_informationer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forsendelses_informationer`
--

LOCK TABLES `forsendelses_informationer` WRITE;
/*!40000 ALTER TABLE `forsendelses_informationer` DISABLE KEYS */;
/*!40000 ALTER TABLE `forsendelses_informationer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sælger`
--

DROP TABLE IF EXISTS `sælger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sælger` (
  `sælger_id` int(11) NOT NULL AUTO_INCREMENT,
  `firma_navn` varchar(45) NOT NULL,
  `cvr` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `nummer` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`sælger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sælger`
--

LOCK TABLES `sælger` WRITE;
/*!40000 ALTER TABLE `sælger` DISABLE KEYS */;
/*!40000 ALTER TABLE `sælger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaktioner`
--

DROP TABLE IF EXISTS `transaktioner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaktioner` (
  `bruger_bruger_id` int(11) NOT NULL,
  `bruger_forsendelses_informationer_forsendelses_informationer_id` int(11) NOT NULL,
  `vare_vare_id` int(11) NOT NULL,
  `vare_sælger_sælger_id` int(11) NOT NULL,
  PRIMARY KEY (`bruger_bruger_id`,`bruger_forsendelses_informationer_forsendelses_informationer_id`,`vare_vare_id`,`vare_sælger_sælger_id`),
  KEY `fk_bruger_has_vare_vare1_idx` (`vare_vare_id`,`vare_sælger_sælger_id`),
  KEY `fk_bruger_has_vare_bruger1_idx` (`bruger_bruger_id`,`bruger_forsendelses_informationer_forsendelses_informationer_id`),
  CONSTRAINT `fk_bruger_has_vare_bruger1` FOREIGN KEY (`bruger_bruger_id`, `bruger_forsendelses_informationer_forsendelses_informationer_id`) REFERENCES `bruger` (`bruger_id`, `forsendelses_informationer_forsendelses_informationer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bruger_has_vare_vare1` FOREIGN KEY (`vare_vare_id`, `vare_sælger_sælger_id`) REFERENCES `vare` (`vare_id`, `sælger_sælger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaktioner`
--

LOCK TABLES `transaktioner` WRITE;
/*!40000 ALTER TABLE `transaktioner` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaktioner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vare`
--

DROP TABLE IF EXISTS `vare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vare` (
  `vare_id` int(11) NOT NULL AUTO_INCREMENT,
  `vare_beskrivelse` varchar(45) NOT NULL,
  `antal` varchar(45) DEFAULT NULL,
  `sælger_sælger_id` int(11) NOT NULL,
  `pris` varchar(45) NOT NULL,
  `variant_1` varchar(45) NOT NULL,
  PRIMARY KEY (`vare_id`,`sælger_sælger_id`),
  KEY `fk_vare_sælger1_idx` (`sælger_sælger_id`),
  CONSTRAINT `fk_vare_sælger1` FOREIGN KEY (`sælger_sælger_id`) REFERENCES `sælger` (`sælger_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vare`
--

LOCK TABLES `vare` WRITE;
/*!40000 ALTER TABLE `vare` DISABLE KEYS */;
/*!40000 ALTER TABLE `vare` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-09 13:20:09
