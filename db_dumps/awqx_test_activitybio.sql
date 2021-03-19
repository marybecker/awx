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
-- Table structure for table `activitybio`
--

DROP TABLE IF EXISTS `activitybio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitybio` (
  `ActivityIdentifier` varchar(55) NOT NULL,
  `AssemblageSampledName` varchar(50) NOT NULL,
  `CollectionAreaMeasureValue` decimal(5,2) DEFAULT NULL,
  `CollectionAreaMeasureUnitCode` varchar(12) DEFAULT NULL,
  `HabitatSelectionMethod` varchar(35) NOT NULL,
  `CollectionDurationMeasureValue` decimal(5,2) DEFAULT NULL,
  `CollectionDurationMeasureUnitCode` varchar(12) DEFAULT NULL,
  `ReachLengthMeasureValue` decimal(5,2) DEFAULT NULL,
  `ReachLengthMeasureUnitCode` varchar(12) DEFAULT NULL,
  `ReachWidthMeasureValue` decimal(5,2) DEFAULT NULL,
  `ReachWidthMeasureUnitCode` varchar(12) DEFAULT NULL,
  `NetMeshSizeMeasureValue` varchar(60) DEFAULT NULL,
  `NetMeshSizeMeasureUnitCode` varchar(12) DEFAULT NULL,
  `PassCount` int DEFAULT NULL,
  `Amps` float DEFAULT NULL,
  `Pulses` float DEFAULT NULL,
  `CollectionEfficiencyEst` float DEFAULT NULL,
  `TotalEnergizedMeasure` float DEFAULT NULL,
  `TotalEnergizedMeasureUnit` decimal(5,2) DEFAULT NULL,
  `GearUsed` varchar(30) DEFAULT NULL,
  `Volts` float DEFAULT NULL,
  `DutyCycle` float DEFAULT NULL,
  PRIMARY KEY (`ActivityIdentifier`),
  KEY `AssemblageSampledName` (`AssemblageSampledName`),
  KEY `CollectionAreaMeasureUnitCode` (`CollectionAreaMeasureUnitCode`),
  KEY `HabitatSelectionMethod` (`HabitatSelectionMethod`),
  KEY `CollectionDurationMeasureUnitCode` (`CollectionDurationMeasureUnitCode`),
  KEY `ReachLengthMeasureUnitCode` (`ReachLengthMeasureUnitCode`),
  KEY `ReachWidthMeasureUnitCode` (`ReachWidthMeasureUnitCode`),
  KEY `NetMeshSizeMeasureUnitCode` (`NetMeshSizeMeasureUnitCode`),
  CONSTRAINT `activitybio_ibfk_1` FOREIGN KEY (`AssemblageSampledName`) REFERENCES `assemblage` (`Name`),
  CONSTRAINT `activitybio_ibfk_2` FOREIGN KEY (`CollectionAreaMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_3` FOREIGN KEY (`HabitatSelectionMethod`) REFERENCES `habitatselectionmethod` (`Name`),
  CONSTRAINT `activitybio_ibfk_4` FOREIGN KEY (`CollectionDurationMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_5` FOREIGN KEY (`ReachLengthMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_6` FOREIGN KEY (`ReachWidthMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `activitybio_ibfk_7` FOREIGN KEY (`NetMeshSizeMeasureUnitCode`) REFERENCES `measurementunit` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitybio`
--

LOCK TABLES `activitybio` WRITE;
/*!40000 ALTER TABLE `activitybio` DISABLE KEYS */;
/*!40000 ALTER TABLE `activitybio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 20:28:17
