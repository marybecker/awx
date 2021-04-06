-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: awqx_test
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `horizontalreferencedatum`
--

DROP TABLE IF EXISTS `horizontalreferencedatum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horizontalreferencedatum` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horizontalreferencedatum`
--

LOCK TABLES `horizontalreferencedatum` WRITE;
/*!40000 ALTER TABLE `horizontalreferencedatum` DISABLE KEYS */;
INSERT INTO `horizontalreferencedatum` VALUES ('Horizontal Reference Datum',5,'AMSMA','American Samoa Datum','2006-07-26 10:57:47'),('Horizontal Reference Datum',6,'ASTRO','Midway Astro 1961','2006-07-26 10:57:47'),('Horizontal Reference Datum',7,'GUAM','Guam 1963','2006-07-26 10:57:47'),('Horizontal Reference Datum',17,'HARN','High Accuracy Reference Network for NAD83','2015-02-03 08:14:46'),('Horizontal Reference Datum',8,'JHNSN','Johnson Island 1961','2006-07-26 10:57:47'),('Horizontal Reference Datum',1,'NAD27','North American Datum 1927','2006-07-26 10:57:47'),('Horizontal Reference Datum',2,'NAD83','North American Datum 1983','2006-07-26 10:57:47'),('Horizontal Reference Datum',9,'OLDHI','Old Hawaiian Datum','2006-07-26 10:57:47'),('Horizontal Reference Datum',3,'OTHER','Other','2006-07-26 10:57:47'),('Horizontal Reference Datum',10,'PR','Puerto Rico Datum','2006-07-26 10:57:47'),('Horizontal Reference Datum',11,'SGEOR','St. George Island Datum','2006-07-26 10:57:47'),('Horizontal Reference Datum',12,'SLAWR','St. Lawrence Island Datum','2006-07-26 10:57:47'),('Horizontal Reference Datum',13,'SPAUL','St. Paul Island Datum','2006-07-26 10:57:47'),('Horizontal Reference Datum',4,'UNKWN','Unknown','2006-07-26 10:57:47'),('Horizontal Reference Datum',14,'WAKE','Wake-Eniwetok 1960','2006-07-26 10:57:47'),('Horizontal Reference Datum',15,'WGS72','World Geodetic System 1972','2006-07-26 10:57:47'),('Horizontal Reference Datum',16,'WGS84','World Geodetic System 1984','2006-07-26 10:57:47');
/*!40000 ALTER TABLE `horizontalreferencedatum` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 10:12:33
