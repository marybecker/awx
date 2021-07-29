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
-- Table structure for table `parameter_lookup`
--

DROP TABLE IF EXISTS `parameter_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_lookup` (
  `ProbeLabName` varchar(255) NOT NULL,
  `LaboratoryName` varchar(60) NOT NULL,
  `Probe` varchar(60) DEFAULT NULL,
  `CharacteristicName` varchar(255) NOT NULL,
  `ResultMeasureUnitCode` varchar(12) NOT NULL,
  `ResultValueTypeName` varchar(20) NOT NULL,
  `SampleCollectionEquipmentCommentText` varchar(4000) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProbeLabName`,`LaboratoryName`),
  KEY `CharacteristicName` (`CharacteristicName`),
  KEY `LaboratoryName` (`LaboratoryName`),
  KEY `ResultMeasureUnitCode` (`ResultMeasureUnitCode`),
  KEY `ResultValueTypeName` (`ResultValueTypeName`),
  KEY `createUser` (`createUser`),
  CONSTRAINT `parameter_lookup_ibfk_1` FOREIGN KEY (`CharacteristicName`) REFERENCES `characteristic` (`Name`),
  CONSTRAINT `parameter_lookup_ibfk_2` FOREIGN KEY (`LaboratoryName`) REFERENCES `organizations` (`Org_ID`),
  CONSTRAINT `parameter_lookup_ibfk_3` FOREIGN KEY (`ResultMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `parameter_lookup_ibfk_4` FOREIGN KEY (`ResultValueTypeName`) REFERENCES `resultvaluetype` (`Name`),
  CONSTRAINT `parameter_lookup_ibfk_5` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_lookup`
--

LOCK TABLES `parameter_lookup` WRITE;
/*!40000 ALTER TABLE `parameter_lookup` DISABLE KEYS */;
INSERT INTO `parameter_lookup` VALUES ('Baro mmHg','YSI','YSI','Barometric pressure','mmHg','Actual','YSI - Barometer mmHg','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Barometer mmHg','YSI','YSI','Barometric pressure','mmHg','Actual','YSI - Barometer mmHg','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('BGA PC RFU','YSI','YSI','Phycocyanin (probe)','RFU','Actual','YSI - BGA PC RFU','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('BGA PC ug/L','YSI','YSI','Phycocyanin (probe)','ug/L','Estimated','YSI - BGA PC ug/L','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Chlorophyll RFU','YSI','YSI','Chlorophyll a (probe)','RFU','Actual','YSI - Chlorophyll RFU','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Chlorophyll ug/L','YSI','YSI','Chlorophyll a (probe)','ug/L','Estimated','YSI - Chlorophyll ug/L','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Cond µS/cm','YSI','YSI','Conductivity','uS/cm','Actual','YSI - Cond µS/cm','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Depth m','YSI','YSI','Depth','m','Calculated','YSI - Depth m','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('nLF Cond µS/cm','YSI','YSI','Conductivity','uS/cm','Control Adjusted','YSI - nLF Cond µS/cm','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('ODO % local','YSI','YSI','Dissolved oxygen saturation','% saturatn','Control Adjusted','YSI - ODO % local','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('ODO % sat','YSI','YSI','Dissolved oxygen saturation','% saturatn','Control Adjusted','YSI - ODO % sat','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('ODO mg/L','YSI','YSI','Dissolved oxygen (DO)','mg/l','Actual','YSI - ODO mg/L','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('ORP mV','YSI','YSI','Oxidation reduction potential (ORP)','mV','Actual','YSI - ORP mV','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('pH','YSI','YSI','pH','None','Actual','YSI - pH','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Press psi a','YSI','YSI','Pressure','psi','Actual','YSI - Pressure psi a','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Pressure psi a','YSI','YSI','Pressure','psi','Actual','YSI - Pressure psi a','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Sal psu','YSI','YSI','Salinity','PSU','Calculated','YSI - Sal psu','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('SpCond µS/cm','YSI','YSI','Specific conductivity','uS/cm','Control Adjusted','YSI - SpCond µS/cm','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('TDS mg/L','YSI','YSI','Total dissolved solids','mg/l','Calculated','YSI - TDS mg/L','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM'),('Temp °C','YSI','YSI','Temperature','deg C','Actual','YSI - Temp °C','2021-04-17 19:20:00','BeckerM','2021-04-17 19:20:00','BeckerM');
/*!40000 ALTER TABLE `parameter_lookup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 11:05:24
