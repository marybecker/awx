-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: awqx
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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `ProjectIdentifier` varchar(50) NOT NULL,
  `staSeq` int NOT NULL,
  `ActivityIdentifier` varchar(55) NOT NULL,
  `ActivityTypeCode` varchar(70) NOT NULL,
  `ActivityMediaName` varchar(20) NOT NULL,
  `ActivityMediaSubdivisionName` varchar(60) DEFAULT NULL,
  `ActivityStartDate` date NOT NULL,
  `ActivityTime` time NOT NULL,
  `ActivityTimeZoneCodetimezone` varchar(4) DEFAULT NULL,
  `SampleCollectionMethodIdentifier` varchar(35) NOT NULL,
  `SampleCollectionEquipmentName` varchar(60) DEFAULT NULL,
  `SampleCollectionEquipmentCommentText` varchar(4000) DEFAULT NULL,
  `LaboratoryName` varchar(60) DEFAULT NULL,
  `ActivityConductingOrganizationText` varchar(120) DEFAULT NULL,
  `ActivityCommentText` varchar(4000) DEFAULT NULL,
  `ActContactLead` varchar(50) NOT NULL,
  `ActFieldCrew` varchar(4000) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`staSeq`,`ActivityStartDate`,`ActivityTime`,`ActivityTypeCode`,`SampleCollectionMethodIdentifier`),
  KEY `ProjectIdentifier` (`ProjectIdentifier`),
  KEY `ActivityTypeCode` (`ActivityTypeCode`),
  KEY `ActivityMediaName` (`ActivityMediaName`),
  KEY `ActivityMediaSubdivisionName` (`ActivityMediaSubdivisionName`),
  KEY `ActivityTimeZoneCodetimezone` (`ActivityTimeZoneCodetimezone`),
  KEY `SampleCollectionMethodIdentifier` (`SampleCollectionMethodIdentifier`),
  KEY `SampleCollectionEquipmentName` (`SampleCollectionEquipmentName`),
  KEY `ActContactLead` (`ActContactLead`),
  KEY `createUser` (`createUser`),
  KEY `lastUpdateUser` (`lastUpdateUser`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`ProjectIdentifier`) REFERENCES `projects` (`ProjectIdentifier`),
  CONSTRAINT `activity_ibfk_10` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `activity_ibfk_11` FOREIGN KEY (`lastUpdateUser`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `activity_ibfk_2` FOREIGN KEY (`staSeq`) REFERENCES `stations` (`staSeq`),
  CONSTRAINT `activity_ibfk_3` FOREIGN KEY (`ActivityTypeCode`) REFERENCES `activitytype` (`Code`),
  CONSTRAINT `activity_ibfk_4` FOREIGN KEY (`ActivityMediaName`) REFERENCES `activitymedia` (`Name`),
  CONSTRAINT `activity_ibfk_5` FOREIGN KEY (`ActivityMediaSubdivisionName`) REFERENCES `activitymediasubdivision` (`Name`),
  CONSTRAINT `activity_ibfk_6` FOREIGN KEY (`ActivityTimeZoneCodetimezone`) REFERENCES `timezone` (`Code`),
  CONSTRAINT `activity_ibfk_7` FOREIGN KEY (`SampleCollectionMethodIdentifier`) REFERENCES `samplecollectionmethod` (`ID`),
  CONSTRAINT `activity_ibfk_8` FOREIGN KEY (`SampleCollectionEquipmentName`) REFERENCES `samplecollectionequipment` (`Name`),
  CONSTRAINT `activity_ibfk_9` FOREIGN KEY (`ActContactLead`) REFERENCES `contacts` (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 12:01:12
