-- MySQL dump 10.16  Distrib 10.1.32-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: medical_app_db
-- ------------------------------------------------------
-- Server version	10.1.32-MariaDB

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
-- Table structure for table `gabinety`
--

DROP TABLE IF EXISTS `gabinety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gabinety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adres` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gabinety`
--

LOCK TABLES `gabinety` WRITE;
/*!40000 ALTER TABLE `gabinety` DISABLE KEYS */;
INSERT INTO `gabinety` VALUES (1,'Gdansk ul. Brzozowa 1 80-100'),(2,'Sopot ul. Szpitalna 3/4 79-999'),(3,'Gdynia ul. Kosciuszki 69 10-692');
/*!40000 ALTER TABLE `gabinety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacjenci`
--

DROP TABLE IF EXISTS `pacjenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pacjenci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_terapeuty` int(11) NOT NULL,
  `Imie_i_Nazwisko` varchar(25) DEFAULT NULL,
  `diagnoza` varchar(150) DEFAULT NULL,
  `Historia Choroby` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_terapeuty` (`id_terapeuty`),
  CONSTRAINT `pacjenci_ibfk_1` FOREIGN KEY (`id_terapeuty`) REFERENCES `terapeuci` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacjenci`
--

LOCK TABLES `pacjenci` WRITE;
/*!40000 ALTER TABLE `pacjenci` DISABLE KEYS */;
INSERT INTO `pacjenci` VALUES (1,1,'Kornel Korzym','Schizofrenia paranoidalna','Pacjent agresywny, reakcja czesto niedostosowana do norm spolecznych, stwierdzona osobowosc aspoleczna. Zle reaguje na lek xxx.'),(2,3,'Bogdan Swir','CHAD- Choroba afektywna dwubiegunowa','Zespol niespokojnych nog, biegunka, sklonnosci do hazardu, narcyzm.'),(3,1,'Amadeusz Witkacy','umiarkowana depresja','Proby samobójcze - niestwierdzono. Dobrze reaguje na terapie szumem morza, stwierdzono uspokojenie mysli.'),(4,3,'Sebastian Jarzyna','Zespol Touretta','Niekontrolowane szczekosciski po spozyciu alkoholu. Dobrze reaguje na mmorfine. ');
/*!40000 ALTER TABLE `pacjenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pomiary_eeg_w_turze`
--

DROP TABLE IF EXISTS `pomiary_eeg_w_turze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pomiary_eeg_w_turze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tury` int(11) NOT NULL,
  `Fala_Mozgowa_(ENUM_delta/teta/low/mid)` enum('delta','teta','low','mid') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tury` (`id_tury`),
  CONSTRAINT `pomiary_eeg_w_turze_ibfk_1` FOREIGN KEY (`id_tury`) REFERENCES `tury w sesji` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pomiary_eeg_w_turze`
--

LOCK TABLES `pomiary_eeg_w_turze` WRITE;
/*!40000 ALTER TABLE `pomiary_eeg_w_turze` DISABLE KEYS */;
INSERT INTO `pomiary_eeg_w_turze` VALUES (1,1,'delta'),(2,1,'teta'),(3,1,'low'),(4,1,'delta'),(5,1,'mid'),(6,2,'mid'),(7,2,'mid'),(8,2,'low'),(9,2,'teta');
/*!40000 ALTER TABLE `pomiary_eeg_w_turze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenariusze`
--

DROP TABLE IF EXISTS `scenariusze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenariusze` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenariusze`
--

LOCK TABLES `scenariusze` WRITE;
/*!40000 ALTER TABLE `scenariusze` DISABLE KEYS */;
INSERT INTO `scenariusze` VALUES (1,'las'),(2,'morze'),(3,'polanka'),(4,'jeziorko');
/*!40000 ALTER TABLE `scenariusze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesje`
--

DROP TABLE IF EXISTS `sesje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pacjenta` int(11) NOT NULL,
  `Data_i_Czas` datetime NOT NULL,
  `notatka` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pacjenta` (`id_pacjenta`),
  CONSTRAINT `sesje_ibfk_1` FOREIGN KEY (`id_pacjenta`) REFERENCES `pacjenci` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesje`
--

LOCK TABLES `sesje` WRITE;
/*!40000 ALTER TABLE `sesje` DISABLE KEYS */;
INSERT INTO `sesje` VALUES (1,1,'2018-06-15 12:20:32','Pacjent obrazal prowadzacego sesje'),(2,1,'2018-06-15 12:21:46','Brak wyraznych zastrzezen'),(3,4,'2018-06-15 12:22:57','Nadmierna potliwosc'),(4,3,'2011-03-11 00:00:00','Obnizona temperatura'),(5,2,'2011-03-11 00:00:00','Drgawki na nogach');
/*!40000 ALTER TABLE `sesje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terapeuci`
--

DROP TABLE IF EXISTS `terapeuci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terapeuci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_gabinetu` int(11) NOT NULL,
  `Imie i Nazwisko` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_gabinetu` (`id_gabinetu`),
  CONSTRAINT `terapeuci_ibfk_1` FOREIGN KEY (`id_gabinetu`) REFERENCES `gabinety` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terapeuci`
--

LOCK TABLES `terapeuci` WRITE;
/*!40000 ALTER TABLE `terapeuci` DISABLE KEYS */;
INSERT INTO `terapeuci` VALUES (1,1,'dr Grzegorz Brzeczyszczykiewic'),(2,2,'dr Mariusz Pudzianowski'),(3,3,'dr Dollitle');
/*!40000 ALTER TABLE `terapeuci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tury w sesji`
--

DROP TABLE IF EXISTS `tury w sesji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tury w sesji` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesji` int(11) NOT NULL,
  `id_scenariusza` int(11) NOT NULL,
  `Temperatura_Ciala` float DEFAULT NULL,
  `Pomiar_Potliwosci_Skory` float DEFAULT NULL,
  `Puls` int(11) DEFAULT NULL,
  `Czas_w_Sekundach` int(11) DEFAULT NULL,
  `Skupienie_1_do_100` int(11) DEFAULT NULL,
  `Wskaznik Medytacji_1_do_100` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sesji` (`id_sesji`),
  KEY `id_scenariusza` (`id_scenariusza`),
  CONSTRAINT `tury w sesji_ibfk_1` FOREIGN KEY (`id_sesji`) REFERENCES `sesje` (`id`),
  CONSTRAINT `tury w sesji_ibfk_2` FOREIGN KEY (`id_scenariusza`) REFERENCES `scenariusze` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tury w sesji`
--

LOCK TABLES `tury w sesji` WRITE;
/*!40000 ALTER TABLE `tury w sesji` DISABLE KEYS */;
INSERT INTO `tury w sesji` VALUES (1,1,1,37.6,80.8,130,15,99,69),(2,1,1,37.9,89.1,133,14,89,63),(3,1,4,36.6,49.9,145,15,90,65),(4,2,1,36.6,75.5,141,13,33,27),(5,2,3,40.1,80.3,95,14,41,40);
/*!40000 ALTER TABLE `tury w sesji` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-15 13:39:34
