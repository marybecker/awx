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
-- Table structure for table `timezone`
--

DROP TABLE IF EXISTS `timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezone` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Code` varchar(4) NOT NULL,
  `Name` text,
  `Offset` int DEFAULT NULL,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezone`
--

LOCK TABLES `timezone` WRITE;
/*!40000 ALTER TABLE `timezone` DISABLE KEYS */;
INSERT INTO `timezone` VALUES ('Time Zone',5,'ADT','Atlantic Daylight Time',-3,'2006-08-11 10:57:50'),('Time Zone',3,'AHST','Alaska-Hawaii Standard Time (*retired: >1983 use AKST)',-10,'2006-08-11 10:57:50'),('Time Zone',1,'AKDT','Alaska Daylight Time',-8,'2006-08-11 10:57:50'),('Time Zone',2,'AKST','Alaska Standard Time',-9,'2006-08-11 10:57:50'),('Time Zone',6,'AST','Atlantic Standard Time',-4,'2006-08-11 10:57:50'),('Time Zone',7,'BST','Bering Standard Time (*retired: >1983 use HAST)',-11,'2006-08-11 10:57:50'),('Time Zone',8,'CDT','Central Daylight Time',-5,'2006-08-11 10:57:50'),('Time Zone',25,'CEST','Sweden Daylight Time or Central European Standard Time',2,'2016-07-12 09:39:33'),('Time Zone',24,'CET','Stockholm Sweden Time or Central European Time',1,'2016-07-12 09:39:33'),('Time Zone',9,'CST','Central Standard Time',-6,'2006-08-11 10:57:50'),('Time Zone',10,'EDT','Eastern Daylight Time',-4,'2006-08-11 10:57:50'),('Time Zone',11,'EST','Eastern Standard Time',-5,'2006-08-11 10:57:50'),('Time Zone',23,'GMT','Greenwich Mean Time ',0,'2009-06-19 11:19:08'),('Time Zone',12,'GST','Guam Standard Time Zone (also Chamorro Standard Time)',10,'2006-08-11 10:57:50'),('Time Zone',13,'HADT','Hawaii-Aleutian Daylight Time',-9,'2006-08-11 10:57:50'),('Time Zone',14,'HAST','Hawaii-Aleutian Standard Time',-10,'2006-08-11 10:57:50'),('Time Zone',26,'KST','Korea Standard Time',9,'2016-07-12 09:39:33'),('Time Zone',15,'MDT','Mountain Daylight Time',-6,'2006-08-11 10:57:50'),('Time Zone',16,'MST','Mountain Standard Time',-7,'2006-08-11 10:57:50'),('Time Zone',17,'NDT','Newfoundland Daylight Time',-3,'2006-08-11 10:57:50'),('Time Zone',18,'NST','Newfoundland Standard Time',-4,'2006-08-11 10:57:50'),('Time Zone',19,'PDT','Pacific Daylight Time',-7,'2006-08-11 10:57:50'),('Time Zone',20,'PST','Pacific Standard Time',-8,'2006-08-11 10:57:50'),('Time Zone',4,'SST','American Samoa Standard Time',-11,'2006-08-11 10:57:50'),('Time Zone',22,'UTC','Coordinated Universal Time',0,'2010-01-15 13:10:00'),('Time Zone',21,'YST','Yukon Standard Time: U.S.-Yukatat (*retired: >1983 use AKST)',-9,'2006-08-11 10:57:50');
/*!40000 ALTER TABLE `timezone` ENABLE KEYS */;
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
