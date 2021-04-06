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
-- Table structure for table `activityrelativedepth`
--

DROP TABLE IF EXISTS `activityrelativedepth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityrelativedepth` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  `Abbreviation` text,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityrelativedepth`
--

LOCK TABLES `activityrelativedepth` WRITE;
/*!40000 ALTER TABLE `activityrelativedepth` DISABLE KEYS */;
INSERT INTO `activityrelativedepth` VALUES ('Relative Depth',34,'Above Euphotic','Sample layer is Above euphotic zone','2018-07-09 00:00:00','AE'),('Relative Depth',7,'Above Halocline','','2010-04-28 11:57:40','AH'),('Relative Depth',9,'AbovePycnocline','','2013-08-22 23:50:00','AP'),('Relative Depth',11,'AboveThermoclin','','2013-08-22 23:50:00','AT'),('Relative Depth',33,'Below Euphotic','Sample layer is Below euphotic zone','2018-07-09 00:00:00','BE'),('Relative Depth',6,'Below Halocline','','2010-04-28 11:57:35','BH'),('Relative Depth',93,'Below Surface','Sample Taken Below Surface-For Cmon/Dflo Only','2018-07-10 09:12:35','BS'),('Relative Depth',10,'BelowPycnocline','','2013-08-22 23:50:00','BP'),('Relative Depth',12,'BelowThermoclin','','2015-07-10 15:51:21','BT'),('Relative Depth',17,'BenthcNephaloid','','2015-12-21 14:40:47','BN'),('Relative Depth',1,'Bottom','Bottom-Measured From Surface Of Water. The distance from the top to the bottom of something.usually downward from an upper surface, horizontally inward from an outer surface, or from top to bottom of something regarded as one of several layers.','2006-08-11 23:50:00','B'),('Relative Depth',14,'Bottom of Core','','2015-12-21 14:40:47','BC'),('Relative Depth',16,'Bottom of Slice','','2015-12-21 14:40:47','BSL'),('Relative Depth',19,'Chemocline','','2015-12-21 14:40:47','C'),('Relative Depth',23,'Deep Chl Layer','','2016-02-12 12:34:13','DCL'),('Relative Depth',91,'Fixed Above Bot','Fixed Above Bottom','2018-07-10 09:05:56','AB'),('Relative Depth',21,'Halocline','','2015-12-21 14:40:47','H'),('Relative Depth',32,'Microlayer','Sample layer is Microlayer','2018-07-09 00:00:00','MI'),('Relative Depth',2,'Midwater',' the part of a body of water near neither the bottom nor the surface.','2006-08-11 23:50:00','M'),('Relative Depth',3,'Near Bottom','','2006-08-11 23:50:00','NB'),('Relative Depth',22,'Other','','2015-12-21 14:40:47','O'),('Relative Depth',8,'Photic zone','','2012-03-29 16:30:20','PZ'),('Relative Depth',20,'Pycnocline','','2015-12-21 14:40:47','P'),('Relative Depth',30,'Sediment','Sample layer is Sediment','2018-07-09 00:00:00','SE'),('Relative Depth',31,'Sediment Water','Sample layer is Sediment/water interface (0 - 1cm)','2018-07-09 00:00:00','SW'),('Relative Depth',4,'Subbottom','','2006-08-11 23:50:00','SB'),('Relative Depth',5,'Surface','','2006-08-11 23:50:00','S'),('Relative Depth',18,'Thermocline','','2015-12-21 14:40:47','T'),('Relative Depth',13,'Top of Core','','2015-12-21 14:40:47','TC'),('Relative Depth',15,'Top of Slice','','2015-12-21 14:40:47','TS'),('Relative Depth',95,'Vert/Horiz Port','Vert/Horiz Portion Of Stream Is Represented In 1 Avg Sample. NTN Program','2018-07-10 09:17:59','VH'),('Relative Depth',94,'VerticalPortion','Vert Portion Of Stream Depth Is Represented In 1 (Avg) Sample.Sampler Fills Down Then Up To Surface.','2018-07-10 09:15:28','I'),('Relative Depth',96,'VerticalProfile','Vertical Profile-Measuremts Taken At Fixed Depths By Meter. Separate Measurements Taken SWM Program.','2018-07-10 09:18:55','VP'),('Relative Depth',90,'Whole Column','Sample layer is Whole water column','2018-07-09 12:49:00','WC');
/*!40000 ALTER TABLE `activityrelativedepth` ENABLE KEYS */;
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
