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
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `ProjectIdentifier` varchar(50) NOT NULL,
  `ProjectName` varchar(512) NOT NULL,
  `ProjectDescriptionText` varchar(4000) NOT NULL,
  `SamplingDesignTypeCode` varchar(20) DEFAULT NULL,
  `QAPPApprovedIndicator` tinyint(1) DEFAULT NULL,
  `QAPPApprovalAgencyName` varchar(50) DEFAULT NULL,
  `QAPPlink` varchar(500) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProjectIdentifier`),
  KEY `SamplingDesignTypeCode` (`SamplingDesignTypeCode`),
  KEY `projects_ibfk_2` (`createUser`),
  KEY `projects_ibfk_3` (`lastUpdateUser`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`SamplingDesignTypeCode`) REFERENCES `samplingdesigntype` (`Code`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT,
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`lastUpdateUser`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES ('BACT_BEACH','Ambient Bacteria Grab','Ambient Bacteria Testing at State Beaches','Targeted',1,'EPA',NULL,'2021-01-22 08:22:00','BeckerM',NULL,NULL),('benthicAlgABM','Ambient Benthic Algae River Sampling','Ambient Benthic Algae River Sampling','Targeted',1,'EPA','https://portal.ct.gov/DEEP/Water/Inland-Water-Monitoring/Water-Quality-Monitoring-Program','2020-11-30 18:40:43','BeckerM',NULL,NULL),('fishABM','Ambient Fish Sampling - Monitoring','Ambient Fish Sampling - Monitoring','Targeted',1,'EPA','https://portal.ct.gov/DEEP/Water/Inland-Water-Monitoring/Water-Quality-Monitoring-Program','2020-11-30 18:40:43','BeckerM',NULL,NULL),('fishIFD','Ambient Fish Sampling - Fisheries','Ambient Fish Sampling - Fisheries','Targeted',0,'','','2020-11-30 18:40:43','BeckerM',NULL,NULL),('lakesABM','Ambient Lakes Sampling','Ambient Lakes Sampling','Targeted',0,'','https://portal.ct.gov/DEEP/Water/Inland-Water-Monitoring/Water-Quality-Monitoring-Program','2020-11-30 18:40:43','BeckerM',NULL,NULL),('lakesNLA','National Lakes Assessment','Additional data collected by CT DEEP Monitoring and Assessment Program during the National Lakes Assessment','Targeted',1,'EPA','','2020-11-30 18:40:43','BeckerM',NULL,NULL),('LIS','Ambient Long Island Sound Sampling','Ambient Long Island Sound Sampling','Targeted',1,'EPA','https://portal.ct.gov/DEEP/Water/Inland-Water-Monitoring/Water-Quality-Monitoring-Program','2020-11-30 18:40:43','BeckerM',NULL,NULL),('macroInvertABM','Ambient Macroinvertebrate Sampling','Ambient Macroinvertebrate Sampling','Targeted',1,'EPA','https://portal.ct.gov/DEEP/Water/Inland-Water-Monitoring/Water-Quality-Monitoring-Program','2020-11-30 18:40:43','BeckerM',NULL,NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 10:12:36
