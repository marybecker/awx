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
-- Table structure for table `activitybio`
--

DROP TABLE IF EXISTS `activitybio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitybio` (
  `LabAccession` varchar(50) NOT NULL,
  `ProjectIdentifier` varchar(50) NOT NULL,
  `staSeq` int NOT NULL,
  `ActivityIdentifier` varchar(55) NOT NULL,
  `ActivityTypeCode` varchar(70) NOT NULL,
  `ActivityMediaName` varchar(20) NOT NULL,
  `ActivityStartDate` date NOT NULL,
  `ActivityTime` time NOT NULL,
  `ActivityTimeZoneCodetimezone` varchar(4) DEFAULT NULL,
  `SampleCollectionMethodIdentifier` varchar(35) NOT NULL,
  `SampleCollectionEquipmentName` varchar(60) DEFAULT NULL,
  `SampleCollectionEquipmentCommentText` varchar(4000) DEFAULT NULL,
  `ActivityConductingOrganizationText` varchar(120) DEFAULT NULL,
  `ActivityCommentText` varchar(4000) DEFAULT NULL,
  `ActContactLead` varchar(50) NOT NULL,
  `ActFieldCrew` varchar(4000) DEFAULT NULL,
  `AssemblageSampledName` varchar(50) NOT NULL,
  `CollectionAreaMeasureValue` decimal(5,2) DEFAULT NULL,
  `CollectionAreaMeasureUnitCode` varchar(12) DEFAULT NULL,
  `HabitatSelectionMethod` varchar(35) NOT NULL DEFAULT 'Targeted',
  `CollectionDurationMeasureValue` varchar(60) DEFAULT NULL,
  `CollectionDurationMeasureUnitCode` varchar(12) DEFAULT NULL,
  `ReachLengthMeasureValue` decimal(5,2) DEFAULT NULL,
  `ReachLengthMeasureUnitCode` varchar(12) DEFAULT NULL,
  `ReachWidthMeasureValue` decimal(5,2) DEFAULT NULL,
  `ReachWidthMeasureUnitCode` varchar(12) DEFAULT NULL,
  `NetMeshSizeMeasureValue` varchar(60) DEFAULT NULL,
  `NetMeshSizeMeasureUnitCode` varchar(12) DEFAULT NULL,
  `PassCount` int NOT NULL,
  `Pass` int NOT NULL,
  `ZoneCount` int NOT NULL,
  `Zone` int NOT NULL,
  `Amps` varchar(12) DEFAULT NULL,
  `Pulses` varchar(12) DEFAULT NULL,
  `CollectionEfficiencyEst` varchar(12) DEFAULT NULL,
  `TotalEnergizedMeasure` varchar(12) DEFAULT NULL,
  `TotalEnergizedMeasureUnit` varchar(12) DEFAULT NULL,
  `Volts` varchar(12) DEFAULT NULL,
  `DutyCycle` varchar(12) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`staSeq`,`ActivityTypeCode`,`ActivityStartDate`,`ActivityTime`,`SampleCollectionMethodIdentifier`,`Pass`,`Zone`),
  UNIQUE KEY `ActivityIdentifier_UNIQUE` (`ActivityIdentifier`),
  UNIQUE KEY `LabAccession_UNIQUE` (`LabAccession`),
  KEY `ProjectIdentifier` (`ProjectIdentifier`),
  KEY `ActivityTypeCode` (`ActivityTypeCode`),
  KEY `ActivityMediaName` (`ActivityMediaName`),
  KEY `ActivityTimeZoneCodetimezone` (`ActivityTimeZoneCodetimezone`),
  KEY `SampleCollectionMethodIdentifier` (`SampleCollectionMethodIdentifier`),
  KEY `SampleCollectionEquipmentName` (`SampleCollectionEquipmentName`),
  KEY `ActContactLead` (`ActContactLead`),
  KEY `AssemblageSampledName` (`AssemblageSampledName`),
  KEY `CollectionAreaMeasureUnitCode` (`CollectionAreaMeasureUnitCode`),
  KEY `CollectionDurationMeasureUnitCode` (`CollectionDurationMeasureUnitCode`),
  KEY `ReachLengthMeasureUnitCode` (`ReachLengthMeasureUnitCode`),
  KEY `ReachWidthMeasureUnitCode` (`ReachWidthMeasureUnitCode`),
  KEY `NetMeshSizeMeasureUnitCode` (`NetMeshSizeMeasureUnitCode`),
  KEY `createUser` (`createUser`),
  KEY `lastUpdateUser` (`lastUpdateUser`),
  KEY `activitybio_ibfk_11` (`HabitatSelectionMethod`),
  CONSTRAINT `activitybio_ibfk_1` FOREIGN KEY (`ProjectIdentifier`) REFERENCES `projects` (`ProjectIdentifier`),
  CONSTRAINT `activitybio_ibfk_10` FOREIGN KEY (`CollectionAreaMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_11` FOREIGN KEY (`HabitatSelectionMethod`) REFERENCES `habitatselectionmethod` (`Name`),
  CONSTRAINT `activitybio_ibfk_12` FOREIGN KEY (`CollectionDurationMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_13` FOREIGN KEY (`ReachLengthMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_14` FOREIGN KEY (`ReachWidthMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_15` FOREIGN KEY (`NetMeshSizeMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_16` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `activitybio_ibfk_17` FOREIGN KEY (`lastUpdateUser`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `activitybio_ibfk_2` FOREIGN KEY (`staSeq`) REFERENCES `stations` (`staSeq`),
  CONSTRAINT `activitybio_ibfk_3` FOREIGN KEY (`ActivityTypeCode`) REFERENCES `activitytype` (`Code`),
  CONSTRAINT `activitybio_ibfk_4` FOREIGN KEY (`ActivityMediaName`) REFERENCES `activitymedia` (`Name`),
  CONSTRAINT `activitybio_ibfk_5` FOREIGN KEY (`ActivityTimeZoneCodetimezone`) REFERENCES `timezone` (`Code`),
  CONSTRAINT `activitybio_ibfk_6` FOREIGN KEY (`SampleCollectionMethodIdentifier`) REFERENCES `samplecollectionmethod` (`ID`),
  CONSTRAINT `activitybio_ibfk_7` FOREIGN KEY (`SampleCollectionEquipmentName`) REFERENCES `samplecollectionequipment` (`Name`),
  CONSTRAINT `activitybio_ibfk_8` FOREIGN KEY (`ActContactLead`) REFERENCES `contacts` (`ContactID`),
  CONSTRAINT `activitybio_ibfk_9` FOREIGN KEY (`AssemblageSampledName`) REFERENCES `assemblage` (`Name`)
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
