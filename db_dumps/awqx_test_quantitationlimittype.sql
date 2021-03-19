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
-- Table structure for table `quantitationlimittype`
--

DROP TABLE IF EXISTS `quantitationlimittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantitationlimittype` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(35) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantitationlimittype`
--

LOCK TABLES `quantitationlimittype` WRITE;
/*!40000 ALTER TABLE `quantitationlimittype` DISABLE KEYS */;
INSERT INTO `quantitationlimittype` VALUES ('Detection/Quantitation Limit Type',22,'Blank-adjusted method detect limit','Blank-adjusted method detect limit','2015-12-21 12:14:18'),('Detection/Quantitation Limit Type',31,'Contract Detection Limit','Minimum level of detection acceptable under the contract Statement of Work (SOW). However, laboratory-derived IDLs (adjusted for sample size, dilution and moisture) are used for reporting limits','2016-06-16 06:10:16'),('Detection/Quantitation Limit Type',19,'Contract Quantitation Limit','- Minimum level of reliable quantitation acceptable under the contract Statement of Work (SOW).','2015-12-21 12:14:18'),('Detection/Quantitation Limit Type',20,'Daily detection limit','Daily detection limit','2015-12-21 12:14:18'),('Detection/Quantitation Limit Type',7,'Drinking Water Maximum','Maximum Contaminant Levels (MCLs) is the legal threshold limit on the amount of a substance that is allowed in public water systems under the Safe Drinking Water Act.','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',3,'Estimated Detection Level','Estimated Detection Level -- Minimum concentration required to produce a specified signal-to-noise (S/N) ratio.','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',30,'Estimated Quantitation Limit','Lowest concentration that can be reliably achieved within specified limits of precision and accuracy during routine lab operations. EQLs normally are arbitrarily set rather than explicitly determined.','2016-06-16 06:08:57'),('Detection/Quantitation Limit Type',27,'Field Holding Time Limit','Performed in field. Samples are only representative of the area they were taken from for a specific length of time before sample preparation or analysis must begin. This is defined as \"holding time.\"\"\"','2016-04-04 04:15:18'),('Detection/Quantitation Limit Type',1,'Instrument Detection Level','Instrument Detection Level(IDL)--Lowest concentration that can be detected by an instrument without correction for the effects of sample matrix or method-specific parameters such as sample preparation','2010-01-26 01:12:18'),('Detection/Quantitation Limit Type',13,'Interim Reporting Level','Interim Reporting Level - a temporary reporting level used for new or custom schedules when a LRL has not yet been established','2014-09-10 09:00:00'),('Detection/Quantitation Limit Type',26,'Laboratory Holding Time Limit','Performed in Lab. Samples are only representative of the area they were taken from for a specific length of time before sample preparation or analysis must begin. This is defined as  \"holding time.\"\"\"','2016-04-04 04:14:33'),('Detection/Quantitation Limit Type',14,'Laboratory Reporting Level','Laboratory Reporting Level - formerly referred to as Non-Detection Value','2014-11-03 11:00:00'),('Detection/Quantitation Limit Type',6,'Long Term Method Detection Level','is a modification of the defintion of the method detection limit (MDL). It includes a more thorough capture of laboratory variability, and is calculated using three different possible data assessments','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',21,'Lower limit of detection','#NAME?','2015-12-21 12:14:18'),('Detection/Quantitation Limit Type',5,'Lower Quantitation Limit','Lower Limit of Quantitation(LLQ) Generally the same as EQL. ','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',10,'Lower Reporting Limit','Lower Reporting Limit','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',16,'Measurement Uncertainty','A quantitative expression of error that results from incomplete knowledge or information about a parameter or value','2015-12-09 12:07:00'),('Detection/Quantitation Limit Type',2,'Method Detection Level','Synonymous with Method Detection Limit (MDL), is the minimum concentration of a substance that can be measured and reported with a 99% confidence that the analyte concentration is greater than zero.','2017-01-24 01:16:33'),('Detection/Quantitation Limit Type',15,'Minimum Reporting Level','Minimum Reporting Level is the smallest measured concentration of a constituent that can be reliably measured using a given analytical method','2014-11-03 11:00:00'),('Detection/Quantitation Limit Type',12,'Practical Quantitation Limit','Practical Quantitation Limit (PQL)','2010-01-26 01:12:18'),('Detection/Quantitation Limit Type',23,'Reporting limit','Reporting limit','2015-12-21 12:14:18'),('Detection/Quantitation Limit Type',73,'Required detection limit','New term from the Federal Register ... to be investigated','2018-07-19 07:08:17'),('Detection/Quantitation Limit Type',29,'Sample Detection Limit','Sample Detection Limit (SDL) - The MDL adjusted to reflect sample-specific actions such as dilution or use of smaller aliquot sizes, or to report results on a dry-weight basis.','2016-06-16 06:08:43'),('Detection/Quantitation Limit Type',11,'Sample-specific min detect conc','Sample-specific min detect concentration','2009-10-29 10:12:39'),('Detection/Quantitation Limit Type',24,'Sample-Specific Quantitation Limit','#NAME?','2015-12-21 12:14:18'),('Detection/Quantitation Limit Type',25,'Specified in workplan','Specified in workplan... requested by GLENDA','2016-03-29 03:15:29'),('Detection/Quantitation Limit Type',17,'Statistical Uncertainty','That component of uncertainty which arises from imprecision. www.iaea.org/OurWork/ST/NE/NEFW/WTS-Networks/IDN/idnfiles/Wkp_on_Development_WM,WasteCharacterization_Clearance/Day3/12.Statistics_GREY.pdf','2015-12-09 12:07:38'),('Detection/Quantitation Limit Type',18,'Systematic Uncertainty','That component of uncertainty which arises from biases. www.iaea.org/OurWork/ST/NE/NEFW/WTS-Networks/IDN/idnfiles/Wkp_on_Development_WM,WasteCharacterization_Clearance/Day3/12.Statistics_GREY.pdf','2015-12-09 12:07:38'),('Detection/Quantitation Limit Type',28,'Taxanomic Loss Threshold','Taxanomic Loss Threshold','2016-05-31 05:14:03'),('Detection/Quantitation Limit Type',32,'Upper Calibration Limit','Upper Calibration Limit(UCL) - Highest concentration that can be reliably measured. The highest calibration standard in the lab\'s initial calibration curve adjusted for initial sample volume or weight','2016-06-16 06:10:57'),('Detection/Quantitation Limit Type',4,'Upper Quantitation Limit','Upper Quantitation Limit - The largest concentration that an instrument can reliably detect.','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',9,'Upper Reporting Limit','Upper Reporting Limit','2006-08-12 08:00:53'),('Detection/Quantitation Limit Type',8,'Water Quality Standard or Criteria','Water Quality Standard or Criteria','2006-08-12 08:00:53');
/*!40000 ALTER TABLE `quantitationlimittype` ENABLE KEYS */;
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
