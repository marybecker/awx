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
-- Table structure for table `resultschem`
--

DROP TABLE IF EXISTS `resultschem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultschem` (
  `ActivityIdentifier` varchar(55) NOT NULL,
  `LabAccession` varchar(55) NOT NULL,
  `CharacteristicName` varchar(255) NOT NULL,
  `ResultMeasureValue` varchar(60) NOT NULL,
  `ResultMeasureUnitCode` varchar(12) NOT NULL,
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
  PRIMARY KEY (`ActivityIdentifier`,`CharacteristicName`,`ResultAnalyticalMethodIdentifier`),
  KEY `CharacteristicName` (`CharacteristicName`),
  KEY `ResultMeasureUnitCode` (`ResultMeasureUnitCode`),
  KEY `ResultValueTypeName` (`ResultValueTypeName`),
  KEY `ResultStatusIdentifier` (`ResultStatusIdentifier`),
  KEY `MethodSpeciationName` (`MethodSpeciationName`),
  KEY `ResultSampleFractionText` (`ResultSampleFractionText`),
  KEY `ResultAnalyticalMethodContext` (`ResultAnalyticalMethodContext`),
  KEY `DetectionQuantitationTypeName` (`DetectionQuantitationTypeName`),
  KEY `DetectionLimitMeasureUnitCode` (`DetectionLimitMeasureUnitCode`),
  CONSTRAINT `resultschem_ibfk_1` FOREIGN KEY (`CharacteristicName`) REFERENCES `characteristic` (`Name`),
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

--
-- Dumping data for table `resultschem`
--

LOCK TABLES `resultschem` WRITE;
/*!40000 ALTER TABLE `resultschem` DISABLE KEYS */;
INSERT INTO `resultschem` VALUES ('14392-QCFR-20190719-084500-CHEM-0.1m','190273-003','Alkalinity','37.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('14392-SR-20190719-084500-CHEM-0.1m','190273-002','Alkalinity','39.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('15274-SR-20190723-104500-CHEM-0.1m','190273-004','Alkalinity','13.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('15294-SR-20190705-130000-CHEM-0.1m','190219-010','Alkalinity','85.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('16649-SR-20190726-153000-CHEM-0.1m','190273-012','Alkalinity','23.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-04 13:42:14','MBecker','2021-01-04 13:42:14','MBecker'),('16788-SR-20190705-130000-CHEM-0.1m','190219-009','Alkalinity','82.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('16873-QCFR-20190618-130000-CHEM-0.1m','190219-004','Alkalinity','16.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('16873-SR-20190618-130000-CHEM-0.1m','190219-003','Alkalinity','16.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('17324-SR-20190619-120000-CHEM-0.1m','190219-006','Alkalinity','9.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('18447-SR-20190723-122000-CHEM-0.1m','190273-005','Alkalinity','24.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('18921-SR-20190726-131500-CHEM-0.1m','190273-011','Alkalinity','34.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19931-SR-20190618-102100-CHEM-0.1m','190219-001','Alkalinity','9.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19933-SR-20190619-103000-CHEM-0.1m','190219-005','Alkalinity','14.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19938-SR-20190619-144000-CHEM-0.1m','190219-008','Alkalinity','9.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19940-SR-20190726-101500-CHEM-0.1m','190273-009','Alkalinity','66.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19955-SR-20190705-140000-CHEM-0.1m','190219-011','Alkalinity','50.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19956-SR-20190705-144500-CHEM-0.1m','190219-012','Alkalinity','103.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('19957-SR-20190726-113000-CHEM-0.1m','190273-010','Alkalinity','65.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('20122-SR-20190724-120000-CHEM-0.1m','190273-006','Alkalinity','83.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('20123-SR-20190618-114500-CHEM-0.1m','190219-002','Alkalinity','11.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('20124-SR-20190724-154500-CHEM-0.1m','190273-008','Alkalinity','20.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('20127-SR-20190719-074500-CHEM-0.1m','190273-001','Alkalinity','22.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('20128-SR-20190619-131500-CHEM-0.1m','190219-007','Alkalinity','36.0','ppm','Actual','2019-07-12','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker'),('20129-SR-20190724-141500-CHEM-0.1m','190273-007','Alkalinity','31.0','ppm','Actual','2019-08-02','Preliminary','','None','','None','310.1',NULL,'USEPA','Method Detection Level','2.0','ppm','2021-01-06 18:08:26','MBecker','2021-01-06 18:08:26','MBecker');
/*!40000 ALTER TABLE `resultschem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 10:12:35
