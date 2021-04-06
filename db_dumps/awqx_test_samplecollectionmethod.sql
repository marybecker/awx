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
-- Table structure for table `samplecollectionmethod`
--

DROP TABLE IF EXISTS `samplecollectionmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samplecollectionmethod` (
  `UID` int DEFAULT NULL,
  `ID` varchar(35) NOT NULL,
  `Context` text,
  `Name` text,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  `Qualifier Type` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samplecollectionmethod`
--

LOCK TABLES `samplecollectionmethod` WRITE;
/*!40000 ALTER TABLE `samplecollectionmethod` DISABLE KEYS */;
INSERT INTO `samplecollectionmethod` VALUES (46528,'algaeRockScrapes','CT DEEP','Benthic algae samples','Benthic algae samples collected from rock scrapes typically analyzed for diatoms community composition','2020-09-17 18:33:24',''),(NULL,'discreteChlorA','CT DEEP','Grab Sample for Chlor a',NULL,'2021-03-31 11:56:00',NULL),(46520,'fish1passAllSp','CT DEEP','Single Pass All Species Fish Sample','Single pass all species length frequency','2020-09-17 17:07:42',''),(46521,'fishMultipassAllSp','CT DEEP','Multiple Pass All Species Fish Sample','Multiple pass all species length frequency','2020-09-17 17:08:10',''),(NULL,'grabSampleDiscreteChemistry','CT DEEP','Grab Sample at a Discrete Depth for Chemical Parameters',NULL,'2021-03-31 11:56:00',NULL),(2020,'grabSampleSurfaceBacti','CT DEEP','Grab Sample for Bacteria Analysis','','2020-09-17 09:57:10',''),(46522,'grabSampleSurfaceChemistry','CT DEEP','Grab Sample for Chemical Parameters','','2020-09-17 15:21:21',''),(46523,'macroInvertHighGradient','CT DEEP','Macroinvertebrate High Gradient Sample','Macroinvertebrate sampling in high gradient habitat (riffles)','2020-09-17 17:07:27',''),(46524,'macroInvertLowGradient','CT DEEP','Macroinvertebrate Low Gradient Sample','','2020-09-17 17:09:17',''),(46527,'macroInvertNqkick','CT DEEP','Macroinvertebrate Non-Quantitative Sample','Macroinvertebrate non-quantitative sample usually taken when all kicks cannot be completed or exploratory','2020-09-17 18:03:29',''),(46519,'meterDeploy','CT DEEP','Continuous Field Meter Deployment','Field Meter deployed for continuous monitoring','2020-09-17 17:22:21',''),(46525,'meterHorzProfile','CT DEEP','Field Meter grab sample','Field meter grab sample','2020-09-17 17:33:35',''),(46526,'meterVertProfile','CT DEEP','Field meter water column sample','Field meter reading taken as part of a series of water column samples, such as during lakes or LIS sampling','2020-09-17 17:37:19',''),(46545,'NetHorzTow','CT DEEP','Net horizontal tow plankton sample','Net horizontal tow plankton sample','2020-09-18 08:45:52',''),(46546,'NetVertTow','CT DEEP','Net vertical tow plankton sample','Net vertical tow plankton sample','2020-09-18 08:45:52',''),(2664,'Unknown','CT DEEP','Unknown','Unknown','2020-09-18 08:36:46','');
/*!40000 ALTER TABLE `samplecollectionmethod` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-06 10:12:37
