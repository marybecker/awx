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
-- Table structure for table `resultschem`
--

DROP TABLE IF EXISTS `resultschem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultschem` (
  `ActivityIdentifier` varchar(55) NOT NULL,
  `LabAccession` varchar(55) NOT NULL,
  `CharacteristicName` varchar(255) NOT NULL,
  `ResultMeasureValue` varchar(60) DEFAULT NULL,
  `ResultMeasureUnitCode` varchar(12) DEFAULT NULL,
  `ResultValueTypeName` varchar(20) NOT NULL,
  `AnalysisStartDate` date DEFAULT NULL,
  `ResultStatusIdentifier` varchar(12) NOT NULL,
  `ResultComment` varchar(4000) DEFAULT NULL,
  `MethodSpeciationName` varchar(20) DEFAULT NULL,
  `ResultDetectionConditionText` varchar(35) DEFAULT NULL,
  `ResultSampleFractionText` varchar(25) DEFAULT NULL,
  `ResultAnalyticalMethodIdentifier` varchar(35) NOT NULL,
  `ResultAnalyticalMethodName` varchar(250) DEFAULT NULL,
  `ResultAnalyticalMethodContext` varchar(120) DEFAULT NULL,
  `DetectionQuantitationTypeName` varchar(35) DEFAULT NULL,
  `DetectionQuantitationLimitMeasureValue` varchar(60) DEFAULT NULL,
  `DetectionLimitMeasureUnitCode` varchar(12) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ActivityIdentifier`,`CharacteristicName`,`ResultAnalyticalMethodIdentifier`,`LabAccession`),
  KEY `CharacteristicName` (`CharacteristicName`),
  KEY `ResultMeasureUnitCode` (`ResultMeasureUnitCode`),
  KEY `ResultValueTypeName` (`ResultValueTypeName`),
  KEY `ResultStatusIdentifier` (`ResultStatusIdentifier`),
  KEY `MethodSpeciationName` (`MethodSpeciationName`),
  KEY `ResultSampleFractionText` (`ResultSampleFractionText`),
  KEY `ResultAnalyticalMethodContext` (`ResultAnalyticalMethodContext`),
  KEY `DetectionQuantitationTypeName` (`DetectionQuantitationTypeName`),
  KEY `DetectionLimitMeasureUnitCode` (`DetectionLimitMeasureUnitCode`),
  KEY `ResultDetectionConditionText` (`ResultDetectionConditionText`),
  CONSTRAINT `resultschem_ibfk_1` FOREIGN KEY (`CharacteristicName`) REFERENCES `characteristic` (`Name`),
  CONSTRAINT `resultschem_ibfk_10` FOREIGN KEY (`ResultDetectionConditionText`) REFERENCES `resultdetectioncondition` (`Name`),
  CONSTRAINT `resultschem_ibfk_2` FOREIGN KEY (`ResultMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `resultschem_ibfk_3` FOREIGN KEY (`ResultValueTypeName`) REFERENCES `resultvaluetype` (`Name`),
  CONSTRAINT `resultschem_ibfk_4` FOREIGN KEY (`ResultStatusIdentifier`) REFERENCES `resultstatus` (`Name`),
  CONSTRAINT `resultschem_ibfk_5` FOREIGN KEY (`MethodSpeciationName`) REFERENCES `methodspeciation` (`Name`),
  CONSTRAINT `resultschem_ibfk_6` FOREIGN KEY (`ResultSampleFractionText`) REFERENCES `samplefraction` (`Name`),
  CONSTRAINT `resultschem_ibfk_7` FOREIGN KEY (`ResultAnalyticalMethodContext`) REFERENCES `analyticalmethodcontext` (`Code`),
  CONSTRAINT `resultschem_ibfk_8` FOREIGN KEY (`DetectionQuantitationTypeName`) REFERENCES `quantitationlimittype` (`Name`),
  CONSTRAINT `resultschem_ibfk_9` FOREIGN KEY (`DetectionLimitMeasureUnitCode`) REFERENCES `measurementunit` (`Code`)
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

-- Dump completed on 2022-06-27 12:01:11
