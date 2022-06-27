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
-- Table structure for table `resultsfish`
--

DROP TABLE IF EXISTS `resultsfish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultsfish` (
  `LabAccession` varchar(55) NOT NULL,
  `CharacteristicName` varchar(255) NOT NULL,
  `ResultMeasureValue` varchar(60) NOT NULL,
  `ResultMeasureUnitCode` varchar(12) NOT NULL,
  `ResultValueTypeName` varchar(20) NOT NULL,
  `SubjectTaxonomicName` varchar(255) NOT NULL,
  `BiologicalIntentName` varchar(35) NOT NULL,
  `FrequencyClassDescriptorCode` varchar(255) NOT NULL,
  `FrequencyClassDescriptorUnitCode` varchar(12) NOT NULL,
  `LowerClassBoundValue` varchar(60) NOT NULL,
  `UpperClassBoundValue` varchar(60) NOT NULL,
  `ResultComment` varchar(4000) DEFAULT NULL,
  `ResultStatusIdentifier` varchar(12) NOT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  `IsStocked` tinyint NOT NULL,
  PRIMARY KEY (`LabAccession`,`IsStocked`,`SubjectTaxonomicName`,`FrequencyClassDescriptorCode`,`FrequencyClassDescriptorUnitCode`,`LowerClassBoundValue`,`UpperClassBoundValue`),
  KEY `CharacteristicName` (`CharacteristicName`),
  KEY `ResultMeasureUnitCode` (`ResultMeasureUnitCode`),
  KEY `ResultValueTypeName` (`ResultValueTypeName`),
  KEY `SubjectTaxonomicName` (`SubjectTaxonomicName`),
  KEY `FrequencyClassDescriptorCode` (`FrequencyClassDescriptorCode`),
  KEY `FrequencyClassDescriptorUnitCode` (`FrequencyClassDescriptorUnitCode`),
  KEY `ResultStatusIdentifier` (`ResultStatusIdentifier`),
  KEY `createUser` (`createUser`),
  KEY `lastUpdateUser` (`lastUpdateUser`),
  CONSTRAINT `resultsfish_ibfk_1` FOREIGN KEY (`LabAccession`) REFERENCES `activitybio` (`LabAccession`),
  CONSTRAINT `resultsfish_ibfk_10` FOREIGN KEY (`lastUpdateUser`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `resultsfish_ibfk_2` FOREIGN KEY (`CharacteristicName`) REFERENCES `characteristic` (`Name`),
  CONSTRAINT `resultsfish_ibfk_3` FOREIGN KEY (`ResultMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `resultsfish_ibfk_4` FOREIGN KEY (`ResultValueTypeName`) REFERENCES `resultvaluetype` (`Name`),
  CONSTRAINT `resultsfish_ibfk_5` FOREIGN KEY (`SubjectTaxonomicName`) REFERENCES `taxon` (`name`),
  CONSTRAINT `resultsfish_ibfk_6` FOREIGN KEY (`FrequencyClassDescriptorCode`) REFERENCES `frequencyclassdescriptor` (`name`),
  CONSTRAINT `resultsfish_ibfk_7` FOREIGN KEY (`FrequencyClassDescriptorUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `resultsfish_ibfk_8` FOREIGN KEY (`ResultStatusIdentifier`) REFERENCES `resultstatus` (`Name`),
  CONSTRAINT `resultsfish_ibfk_9` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `IsStocked_OutOfBounds` CHECK ((`IsStocked` <= 1))
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
