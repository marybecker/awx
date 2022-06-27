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
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `staSeq` int NOT NULL,
  `locationName` varchar(255) NOT NULL,
  `locationDescription` varchar(255) DEFAULT NULL,
  `locationType` varchar(45) NOT NULL,
  `ylat` decimal(8,6) NOT NULL,
  `xlong` decimal(9,6) NOT NULL,
  `sourceMapScale` int NOT NULL,
  `horizCollectMethod` varchar(70) NOT NULL,
  `horizRefDatum` varchar(6) NOT NULL,
  `stateCd` varchar(4) NOT NULL,
  `munName` varchar(50) NOT NULL,
  `subBasin` int NOT NULL,
  `adbSegID` varchar(30) DEFAULT NULL,
  `hydroID` varchar(9) DEFAULT NULL,
  `stationsCommentTxt` varchar(4000) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `createUser` varchar(50) NOT NULL,
  `lastUpdateDate` datetime DEFAULT NULL,
  `lastUpdateUser` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ylat`,`xlong`),
  UNIQUE KEY `staSeq` (`staSeq`),
  KEY `locType` (`locationType`),
  KEY `horizCollectMeth` (`horizCollectMethod`),
  KEY `horizRefDatum` (`horizRefDatum`),
  KEY `stateCd` (`stateCd`),
  KEY `munName` (`munName`),
  KEY `subBasin` (`subBasin`),
  KEY `stations_ibfk_5` (`createUser`),
  KEY `stations_ibfk_6` (`lastUpdateUser`),
  CONSTRAINT `horizCollectMeth` FOREIGN KEY (`horizCollectMethod`) REFERENCES `horizontalcollectionmethod` (`Name`),
  CONSTRAINT `locType` FOREIGN KEY (`locationType`) REFERENCES `monitoringlocationtype` (`Name`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`horizRefDatum`) REFERENCES `horizontalreferencedatum` (`Name`),
  CONSTRAINT `stations_ibfk_2` FOREIGN KEY (`stateCd`) REFERENCES `state` (`Code`),
  CONSTRAINT `stations_ibfk_3` FOREIGN KEY (`munName`) REFERENCES `municipalities` (`Name`),
  CONSTRAINT `stations_ibfk_4` FOREIGN KEY (`subBasin`) REFERENCES `subbasin` (`SubBasin`),
  CONSTRAINT `stations_ibfk_5` FOREIGN KEY (`createUser`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT,
  CONSTRAINT `stations_ibfk_6` FOREIGN KEY (`lastUpdateUser`) REFERENCES `contacts` (`ContactID`) ON UPDATE RESTRICT,
  CONSTRAINT `xlong_outOfBounds` CHECK (((`xlong` >= -(73.8)) and (`xlong` < -(71.78)))),
  CONSTRAINT `ylat_outOfBounds` CHECK (((`ylat` >= 40.8) and (`ylat` < 42.3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 12:01:13
