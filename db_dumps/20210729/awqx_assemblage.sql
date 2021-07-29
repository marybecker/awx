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
-- Table structure for table `assemblage`
--

DROP TABLE IF EXISTS `assemblage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assemblage` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assemblage`
--

LOCK TABLES `assemblage` WRITE;
/*!40000 ALTER TABLE `assemblage` DISABLE KEYS */;
INSERT INTO `assemblage` VALUES ('Assemblage',8,'Amphibians','Amphibian community.  Frogs, toads, etc.','2008-07-18 11:57:03'),('Assemblage',1,'Aquatic Vegetation','Plants normally found growing in the water column, either partially or totally submerged.','2008-07-18 11:56:58'),('Assemblage',10,'Bacteria/Virus','Microbiological pathogens.','2008-07-18 11:57:05'),('Assemblage',4,'Benthic Macroinvertebrates','Invertebrate animals inhabiting the bottom of a water body.','2008-07-18 11:57:00'),('Assemblage',6,'Birds','Birds.','2008-07-18 11:57:02'),('Assemblage',3,'Corals','Corals','2008-07-18 11:56:59'),('Assemblage',14,'Fish/Nekton','Fish or other animals inhabiting the water column between the surface and the bottom.','2008-07-18 11:57:08'),('Assemblage',9,'Fungi','Fungi','2008-07-18 11:57:04'),('Assemblage',13,'Ichthyoplankton','Fish-like animals of near-microscopic dimensions.','2018-05-07 11:57:17'),('Assemblage',15,'Invertebrates','Invertebrate animals is without a vertebral column or lacking backbone/spinal column','2009-11-12 15:37:30'),('Assemblage',5,'Mammals','Warm-blooded hairy milk-producing animals.','2008-07-18 11:57:01'),('Assemblage',11,'Periphyton','Near-microscopic plant material found attached to solid surfaces submerged in the aquatic environment.','2008-07-18 11:57:06'),('Assemblage',12,'Phytoplankton/Zooplankton','Near-microscopic plants and animals found in the water column between the surface and the bottom.','2008-07-18 11:57:07'),('Assemblage',7,'Reptiles','Snakes, lizards, turtles, etc.','2008-07-18 11:57:03'),('Assemblage',2,'Terrestrial Vegetation','Plants normally found growing out of water.  Trees, shrubs, grasses, etc.','2008-07-18 11:56:59');
/*!40000 ALTER TABLE `assemblage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 11:05:26
