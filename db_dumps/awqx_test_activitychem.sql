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
-- Table structure for table `activitychem`
--

DROP TABLE IF EXISTS `activitychem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitychem` (
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
  `ActivityConductingOrganizationText` varchar(120) DEFAULT NULL,
  `ActivityCommentText` varchar(4000) DEFAULT NULL,
  `ActContactLead` varchar(50) NOT NULL,
  `ActFieldCrew` varchar(4000) DEFAULT NULL,
  `SamplePreparationMethodIdentifier` varchar(35) DEFAULT NULL,
  `ActivityRelativeDepthName` varchar(30) DEFAULT NULL,
  `ActivityTopDepthMeasureValue` decimal(5,2) DEFAULT NULL,
  `ActivityTopDepthMeasureUnitCode` varchar(12) DEFAULT NULL,
  `ActivityBottomDepthMeasureValue` decimal(5,2) DEFAULT NULL,
  `ActivityBottomDepthMeasureUnitCode` varchar(12) DEFAULT NULL,
  `InstreamLocation` int DEFAULT NULL,
  `LabAccession` varchar(50) NOT NULL,
  `LaboratoryName` varchar(60) NOT NULL,
  `ActivityYlat` decimal(8,6) DEFAULT NULL,
  `ActivityXlong` decimal(9,6) DEFAULT NULL,
  `ActivityhorizCollectMethod` varchar(70) DEFAULT NULL,
  `ActivityhorizRefDatum` varchar(6) DEFAULT NULL,
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
  KEY `ActivityRelativeDepthName` (`ActivityRelativeDepthName`),
  KEY `InstreamLocation` (`InstreamLocation`),
  KEY `activitychem_ibfk_10` (`createUser`),
  KEY `activitychem_ibfk_11` (`lastUpdateUser`),
  KEY `activitychem_ibfk_9` (`ActContactLead`),
  KEY `ActivityDepthMeasureUnitCode` (`ActivityTopDepthMeasureUnitCode`,`ActivityBottomDepthMeasureUnitCode`),
  KEY `FK_ActBDepthMUnit` (`ActivityBottomDepthMeasureUnitCode`),
  KEY `FK_ActHorizMethod` (`ActivityhorizCollectMethod`),
  KEY `FK_ActHorizDatum` (`ActivityhorizRefDatum`),
  CONSTRAINT `activitychem_ibfk_1` FOREIGN KEY (`ProjectIdentifier`) REFERENCES `projects` (`ProjectIdentifier`),
  CONSTRAINT `activitychem_ibfk_10` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT,
  CONSTRAINT `activitychem_ibfk_11` FOREIGN KEY (`lastUpdateUser`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT,
  CONSTRAINT `activitychem_ibfk_12` FOREIGN KEY (`ActivityRelativeDepthName`) REFERENCES `activityrelativedepth` (`Name`),
  CONSTRAINT `activitychem_ibfk_14` FOREIGN KEY (`InstreamLocation`) REFERENCES `instreamlocation` (`N`),
  CONSTRAINT `activitychem_ibfk_2` FOREIGN KEY (`staSeq`) REFERENCES `stations` (`staSeq`),
  CONSTRAINT `activitychem_ibfk_3` FOREIGN KEY (`ActivityTypeCode`) REFERENCES `activitytype` (`Code`),
  CONSTRAINT `activitychem_ibfk_4` FOREIGN KEY (`ActivityMediaName`) REFERENCES `activitymedia` (`Name`),
  CONSTRAINT `activitychem_ibfk_5` FOREIGN KEY (`ActivityMediaSubdivisionName`) REFERENCES `activitymediasubdivision` (`Name`),
  CONSTRAINT `activitychem_ibfk_6` FOREIGN KEY (`ActivityTimeZoneCodetimezone`) REFERENCES `timezone` (`Code`),
  CONSTRAINT `activitychem_ibfk_7` FOREIGN KEY (`SampleCollectionMethodIdentifier`) REFERENCES `samplecollectionmethod` (`ID`),
  CONSTRAINT `activitychem_ibfk_8` FOREIGN KEY (`SampleCollectionEquipmentName`) REFERENCES `samplecollectionequipment` (`Name`),
  CONSTRAINT `activitychem_ibfk_9` FOREIGN KEY (`ActContactLead`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT,
  CONSTRAINT `FK_ActBDepthMUnit` FOREIGN KEY (`ActivityBottomDepthMeasureUnitCode`) REFERENCES `measurementunit` (`Code`),
  CONSTRAINT `FK_ActHorizDatum` FOREIGN KEY (`ActivityhorizRefDatum`) REFERENCES `horizontalreferencedatum` (`Name`),
  CONSTRAINT `FK_ActHorizMethod` FOREIGN KEY (`ActivityhorizCollectMethod`) REFERENCES `horizontalcollectionmethod` (`Name`),
  CONSTRAINT `FK_ActTDepthMUnit` FOREIGN KEY (`ActivityTopDepthMeasureUnitCode`) REFERENCES `measurementunit` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitychem`
--

LOCK TABLES `activitychem` WRITE;
/*!40000 ALTER TABLE `activitychem` DISABLE KEYS */;
INSERT INTO `activitychem` VALUES ('BACT_BEACH',14302,'14302-QCFB-20190701-071200-CHEM-0.0m','Quality Control Sample-Field Blank','Water','Surface Water','2019-07-01','07:12:00','EDT','grabSampleSurfaceBacti','Water Bottle','Nalgene Bottle','ctdeepWplrAbm','','AarrestadA','','','Other',0.00,'m',0.00,'m',0,'861331001.0','ctdphMicro',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:19:32','BeckerM','2021-03-31 15:19:32','BeckerM'),('fishABM',14316,'14316-SR-20190801-082700-CHEM-0.1m','Sample-Routine','Water','Surface Water','2019-08-01','08:27:00','EDT','grabSampleSurfaceChemistry','Water Bottle','','ctdeepWplrAbm','','LallyMe','AA','','Surface',0.10,'m',0.10,'m',3,'190283-001','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:19:32','BeckerM','2021-03-31 15:19:32','BeckerM'),('BACT_BEACH',15894,'15894-SR-20190701-092000-CHEM-0.3m','Sample-Routine','Water','Surface Water','2019-07-01','09:20:00','EDT','grabSampleSurfaceBacti','Water Bottle','','ctdeepWplrAbm','','AarrestadA','','','Surface',0.30,'m',0.30,'m',1,'861327032.0','ctdphMicro',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:19:32','BeckerM','2021-03-31 15:19:32','BeckerM'),('lakesABM',16012,'16012-SR-20190507-090000-CHEM-10.0m','Sample-Routine','Water','Surface Water','2019-05-07','09:00:00','EDT','grabSampleDiscreteChemistry','Water Bottle','','ctdeepWplrAbm','','AarrestadA','AF','','Near Bottom',10.00,'m',10.00,'m',0,'190182-003','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:19:32','BeckerM','2021-03-31 15:19:32','BeckerM'),('lakesABM',16012,'16012-SR-20190507-112500-CHEM-0.0m','Sample-Routine','Water','Surface Water','2019-05-07','11:25:00','EDT','discreteChlorA','Water Bottle','','ctdeepWplrAbm','','LizotteT','AA','','Surface',0.00,'m',2.00,'m',0,'190185-002','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:29:32','BeckerM','2021-03-31 15:29:32','BeckerM'),('benthicAlgABM',16788,'16788-SR-20101110-190000-CHEM-0.1m','Sample-Routine','Water','Surface Water','2010-11-10','19:00:00','EST','grabSampleSurfaceChemistry','Water Bottle','','ctdeepWplrBioM','','TokarzW','WT','','Surface',0.10,'m',0.10,'m',3,'10001-TEST','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-18 20:00:01','BeckerM','2021-03-18 20:00:01','BeckerM'),('benthicAlgABM',16788,'16788-QCFR-20210201-190001-CHEM-0.1m','Quality Control Sample-Field Replicate','Water','Surface Water','2021-02-01','19:00:01','EST','grabSampleSurfaceChemistry','Water Bottle','','ctdeepWplrBioM','','TokarzW','WT','','Surface',0.10,'m',0.10,'m',3,'10000-TEST','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-18 20:00:01','BeckerM','2021-03-18 20:00:01','BeckerM'),('LIS',17252,'17252-SR-20200109-100600-CHEM-2.0m','Sample-Routine','Water','Surface Water','2020-01-09','10:06:00','EST','grabSampleSurfaceChemistry','Water Bottle','Plastic Bottle','ctdeepWplrAbm','','LymanM','KO','','Surface',2.00,'m',2.00,'m',0,'190001-019','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:19:32','BeckerM','2021-03-31 15:19:32','BeckerM'),('LIS',17253,'17253-SR-20190103-095400-CHEM-28.3m','Sample-Routine','Water','Surface Water','2019-01-03','09:54:00','EST','grabSampleDiscreteChemistry','Water Bottle','','ctdeepWplrAbm','','OBrienClaytonKa','ML','','Bottom',28.30,'m',28.30,'m',0,'190001-020','CESE',0.000000,0.000000,'GPS-Unspecified','NAD83','2021-03-31 15:19:32','BeckerM','2021-03-31 15:19:32','BeckerM');
/*!40000 ALTER TABLE `activitychem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 10:12:34
