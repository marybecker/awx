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
-- Table structure for table `resultdetectioncondition`
--

DROP TABLE IF EXISTS `resultdetectioncondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultdetectioncondition` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(35) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultdetectioncondition`
--

LOCK TABLES `resultdetectioncondition` WRITE;
/*!40000 ALTER TABLE `resultdetectioncondition` DISABLE KEYS */;
INSERT INTO `resultdetectioncondition` VALUES ('Result Detection Condition(ResultDetectionConditionText)',15,'Above Operating Range','','2016-04-26 04:04:04'),('Result Detection Condition(ResultDetectionConditionText)',13,'Below Daily Detection Limit','data that was found less than defined daily detection limits','2016-04-26 04:04:54'),('Result Detection Condition(ResultDetectionConditionText)',12,'Below Detection Limit','data that was found less than defined detection limits','2016-04-26 04:04:49'),('Result Detection Condition(ResultDetectionConditionText)',14,'Below Long-term Blank-basd Dt Limit','data that was found less than defined long-term blank based detection limits','2016-04-26 04:04:59'),('Result Detection Condition(ResultDetectionConditionText)',20,'Below Method Detection Limit','data that was found less than defined laboratory method detection limits','2016-04-26 04:04:25'),('Result Detection Condition(ResultDetectionConditionText)',16,'Below Reporting Limit','data that was found less than defined laboratory reporting limits','2016-04-26 04:04:10'),('Result Detection Condition(ResultDetectionConditionText)',17,'Below Sample-specific Detect Limit','data that was found less than defined sample specific detection limits','2016-04-26 04:04:15'),('Result Detection Condition(ResultDetectionConditionText)',18,'Below System Detection Limit','data that was found less than defined system detection limits','2016-04-26 04:04:21'),('Result Detection Condition(ResultDetectionConditionText)',11,'Between Inst Detect and Quant Limit','','2016-04-26 04:04:44'),('Result Detection Condition(ResultDetectionConditionText)',1,'Detected Not Quantified','data that was found and not quanitified within defined laboratory reporting limits or method detection limits','2006-07-26 07:07:47'),('Result Detection Condition(ResultDetectionConditionText)',21,'High Moisture','','2016-02-03 02:02:48'),('Result Detection Condition(ResultDetectionConditionText)',4,'Not Detected','data was looked for but was not observed/detected within defined laboratory reporting limits or method detection limits','2006-07-26 07:07:47'),('Result Detection Condition(ResultDetectionConditionText)',106,'Not Detected at Detection Limit','Not Detected at Detection Limit','2018-11-06 11:11:33'),('Result Detection Condition(ResultDetectionConditionText)',107,'Not Detected at Reporting Limit','Not Detected at Reporting Limit','2018-11-06 11:11:48'),('Result Detection Condition(ResultDetectionConditionText)',86,'Not Present','data that was looked for but not found and without laboratory reporting limits or method detection limits http://www.abcwua.org/Substances_Not_Found.aspx','2017-11-30 11:11:18'),('Result Detection Condition(ResultDetectionConditionText)',2,'Not Reported','data was collected but not analyzed. (data has not been quantified)','2006-07-26 07:07:47'),('Result Detection Condition(ResultDetectionConditionText)',3,'Present Above Quantification Limit','data was found greater than defined laboratory reporting limits or method detection limits. typically for colony count and rare occasions where value is above highest calibration curve point concentration.','2006-07-26 07:07:47'),('Result Detection Condition(ResultDetectionConditionText)',5,'Present Below Quantification Limit','data was found less than defined laboratory reporting limits or method detection limits','2006-07-26 07:07:47'),('Result Detection Condition(ResultDetectionConditionText)',10,'Reported in Raw Data (attached)','','2015-06-26 06:06:40'),('Result Detection Condition(ResultDetectionConditionText)',6,'Trace','','2015-08-05 08:08:11'),('Result Detection Condition(ResultDetectionConditionText)',19,'Value Decensored','','2015-12-21 12:12:30');
/*!40000 ALTER TABLE `resultdetectioncondition` ENABLE KEYS */;
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
