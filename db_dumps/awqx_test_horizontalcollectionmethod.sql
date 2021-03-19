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
-- Table structure for table `horizontalcollectionmethod`
--

DROP TABLE IF EXISTS `horizontalcollectionmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horizontalcollectionmethod` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horizontalcollectionmethod`
--

LOCK TABLES `horizontalcollectionmethod` WRITE;
/*!40000 ALTER TABLE `horizontalcollectionmethod` DISABLE KEYS */;
INSERT INTO `horizontalcollectionmethod` VALUES ('Horizontal Collection Method',2,'Address Matching-Block Face','The geographic coordinate determination method based on address matching-block face','2006-08-12 00:29:23'),('Horizontal Collection Method',6,'Address Matching-Digitized','The geographic coordinate determination method based on address matching-digitized','2006-08-12 00:29:23'),('Horizontal Collection Method',1,'Address Matching-House Number','The geographic coordinate determination method based on address matching-house number','2006-08-12 00:29:23'),('Horizontal Collection Method',4,'Address Matching-Nearest Intersection','The geographic coordinate determination method based on address matching-nearest intersection','2006-08-12 00:29:23'),('Horizontal Collection Method',7,'Address Matching-Other','The geographic coordinate determination method based on address matching-other','2006-08-12 00:29:23'),('Horizontal Collection Method',5,'Address Matching-Primary Name','The geographic coordinate determination method based on address matching-primary name','2006-08-12 00:29:23'),('Horizontal Collection Method',3,'Address Matching-Street Centerline','The geographic coordinate determination method based on address matching-street centerline','2006-08-12 00:29:23'),('Horizontal Collection Method',8,'Census Block-1990-Centroid','The geographic coordinate determination method based on census block-1990-centroid','2006-08-12 00:29:23'),('Horizontal Collection Method',9,'Census Block/Group-1990-Centroid','The geographic coordinate determination method based on census/group-1990-centroid','2006-08-12 00:29:23'),('Horizontal Collection Method',10,'Census Block/Tract-1990-Centroid','The geographic coordinate determination method based on census/tract-1990-centroid','2006-08-12 00:29:23'),('Horizontal Collection Method',11,'Census-Other','The geographic coordinate determination method based on census-other','2006-08-12 00:29:23'),('Horizontal Collection Method',25,'Classical Surveying Techniques','The geographic coordinate determination method based on classical surveying techniques','2006-08-12 00:29:23'),('Horizontal Collection Method',13,'GPS Carrier Phase Kinematic Relative Position','The geographic coordinate determination method based on GPS carrier phase kinematic relative positioning technique','2006-08-12 00:29:23'),('Horizontal Collection Method',12,'GPS Carrier Phase Static Relative Position','The geographic coordinate determination method based on GPS carrier phase static relative positioning technique','2006-08-12 00:29:23'),('Horizontal Collection Method',14,'GPS Code (Pseudo Range) Differential','The geographic coordinate determination method based on GPS code measurements (pseudo range) differential (DGPS)','2006-08-12 00:29:23'),('Horizontal Collection Method',15,'GPS Code (Pseudo Range) Precise Position','The geographic coordinate determination method based on GPS code measurements (pseudo range) precise positioning service','2006-08-12 00:29:23'),('Horizontal Collection Method',16,'GPS Code (Pseudo Range) Standard Position (SA Off)','The geographic coordinate determination method based on GPS code measurements (pseudo range) standard positioning service (SA Off)','2006-08-12 00:29:23'),('Horizontal Collection Method',17,'GPS Code (Pseudo Range) Standard Position (SA On)','The geographic coordinate determination method based on GPS code measurements (pseudo range) standard positioning service (SA On)','2006-08-12 00:29:23'),('Horizontal Collection Method',104,'GPS with Wide Area Augmentation System','An air navigation aid developed by the Federal Aviation Administration to augment the Global Positioning System (GPS),','2018-01-10 14:24:30'),('Horizontal Collection Method',28,'GPS-Unspecified','Global Positioning Method, with unspecified parameters','2006-08-12 00:29:23'),('Horizontal Collection Method',29,'GPS, With Canadian Active Control System','GPS Code Measurements (pseudo  range) Standard Positioning Service Corrected using Canadian Active Control System','2006-08-12 00:29:23'),('Horizontal Collection Method',39,'Interpolation-Digital Map Source','The geographic coordinate determination method based on interpolation-Digital Map Source','2015-08-27 00:00:00'),('Horizontal Collection Method',30,'Interpolation-Digital Map Source (Tiger)','The geographic coordinate determination method is based on a digital map source (TIGER)','2016-08-08 00:00:00'),('Horizontal Collection Method',18,'Interpolation-Map','The geographic coordinate determination method based on interpolation-map','2006-08-12 00:29:23'),('Horizontal Collection Method',32,'Interpolation-MSS','The geographic coordinate determination method is based on the use of a Multi-Spectral Scanner (MSS)','2006-08-12 00:29:23'),('Horizontal Collection Method',21,'Interpolation-Other','The geographic coordinate determination method based on interpolation-other','2006-08-12 00:29:23'),('Horizontal Collection Method',19,'Interpolation-Photo','The geographic coordinate determination method based on interpolation-photo','2006-08-12 00:29:23'),('Horizontal Collection Method',20,'Interpolation-Satellite','The geographic coordinate determination method based on interpolation-satellite','2006-08-12 00:29:23'),('Horizontal Collection Method',31,'Interpolation-Spot','The geographic coordinate determination method uses SPOT (Systeme Probatoire d\'Observation de la Terre), a French-owned satellite launched in 1984','2006-08-12 00:29:23'),('Horizontal Collection Method',33,'Interpolation-TM','The geographic coordinate determination method is based on the use of a Thematic Mapper (TM)','2006-08-12 00:29:23'),('Horizontal Collection Method',22,'Loran C','The geographic coordinate determination method based on Loran C','2006-08-12 00:29:23'),('Horizontal Collection Method',34,'Public Land Survey-Eighth Section','The geographic coordinate determination method is based on a public land survey, an eighth of a section','2006-08-12 00:29:23'),('Horizontal Collection Method',36,'Public Land Survey-Footing','The geographic coordinate determination method is based on a public land survey footing','2006-08-12 00:29:23'),('Horizontal Collection Method',23,'Public Land Survey-Quarter Section','The geographic coordinate determination method based on public land survey quarter of a section','2006-08-12 00:29:23'),('Horizontal Collection Method',24,'Public Land Survey-Section','The geographic coordinate determination method based on public land survey section','2006-08-12 00:29:23'),('Horizontal Collection Method',35,'Public Land Survey-Sixteenth Section','The geographic coordinate determination method is based on a public land survey, a sixteenth of a section','2006-08-12 00:29:23'),('Horizontal Collection Method',27,'Unknown','The information is not known','2006-08-12 00:29:23'),('Horizontal Collection Method',26,'Zip Code-Centroid','The geographic coordinate determination method based on zipcode-centroid','2006-08-12 00:29:23'),('Horizontal Collection Method',38,'Zip+2 Centroid','The center of an area defined by the 5-digit ZIP code and its 2-digit geographic segment extension','2006-08-12 00:29:23'),('Horizontal Collection Method',37,'Zip+4 Centroid','The center of an area defined by the 5-digit  ZIP code and its 4-digit geographic segment extension','2006-08-12 00:29:23');
/*!40000 ALTER TABLE `horizontalcollectionmethod` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 20:28:14
