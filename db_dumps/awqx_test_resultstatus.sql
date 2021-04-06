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
-- Table structure for table `resultstatus`
--

DROP TABLE IF EXISTS `resultstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultstatus` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(12) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultstatus`
--

LOCK TABLES `resultstatus` WRITE;
/*!40000 ALTER TABLE `resultstatus` DISABLE KEYS */;
INSERT INTO `resultstatus` VALUES ('Result Status(ResultStatusIdentifier)',1,'Accepted','Reported result has been accepted','2006-07-26 10:57:47'),('Result Status(ResultStatusIdentifier)',5,'Final','Publishable, released to public','2006-07-26 10:57:47'),('Result Status(ResultStatusIdentifier)',4,'Preliminary','internal use only, not released to public','2006-07-26 10:57:47'),('Result Status(ResultStatusIdentifier)',7,'Provisional','Reported result has not been verified, not undergone all QC procedures.','2016-05-20 14:19:19'),('Result Status(ResultStatusIdentifier)',8,'Raw','state of original collection, not undergone any QC procedures.','2016-06-22 12:11:27'),('Result Status(ResultStatusIdentifier)',3,'Rejected','Reported result has not been accepted','2006-07-26 10:57:47'),('Result Status(ResultStatusIdentifier)',71,'Supervised','Observe and direct the execution of tasks as project management staff','2018-10-29 09:40:45'),('Result Status(ResultStatusIdentifier)',6,'Unreviewed','Reported result has not been reviewed','2016-05-18 07:54:43'),('Result Status(ResultStatusIdentifier)',2,'Validated','Reported result has been verified and reviewed','2006-07-26 10:57:47');
/*!40000 ALTER TABLE `resultstatus` ENABLE KEYS */;
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
