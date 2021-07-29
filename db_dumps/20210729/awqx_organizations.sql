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
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `Org_ID` varchar(50) NOT NULL,
  `EPA_Org_ID` text,
  `Org_Name` text,
  `Description` text,
  `Last_Change_Date` datetime DEFAULT NULL,
  `Inactive` int DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Org_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES ('ANSP','','The Academy of Natural Sciences of Drexel University','Phycology Section, Patrick Center for Environmental Research.  Analytical Lab for Freshwater Algae, particularly Diatoms','2014-01-22 15:13:00',0,'2014-01-22 15:12:00'),('ARC','','ARC','macroinvertebrates','2009-03-24 14:50:00',1,'2009-03-24 14:50:00'),('Axys','','Axys Analytical Services Ltd','2045 Mills Road West\nSidney, British Columbia Canada V8L 5X2\n(250) 655-5800\nContact Name: Nicholas Corso\n\nUsed by CTDPH ','2018-09-17 11:39:00',0,'2018-09-17 11:38:00'),('CESE','','CESE','','2011-06-27 12:33:00',0,'2011-06-27 12:33:00'),('connCollege','','Connecticut College','http://www.conncoll.edu/','2009-04-21 11:36:00',1,'2009-04-21 11:36:00'),('CTDEEP','CT_DEP01_WQX','Connecticut Department of Energy and Environmental Protection','This is the central agency for all water quality data in this system','2011-06-23 09:35:00',0,'2011-06-23 09:35:00'),('ctdeepFish','','CT DEEP Fisheries Division','','2018-09-28 11:52:00',0,'2009-12-02 14:03:00'),('ctdeepTMDL','','WPLR-TMDL and Aquatic Toxicity','','2013-08-08 13:24:00',0,'2012-10-15 10:29:00'),('ctdeepWplrAbm','','WPLR-Ambient Monitoring and Assessment','','2013-07-12 15:12:00',0,'2013-07-12 15:10:00'),('ctdeepWplrBioM','','CT DEEP WPLR biological monitoring','','2012-02-15 12:47:00',0,'2009-11-13 13:12:00'),('ctdphChem','','CT DPH Inorganic Chemistry','','2009-11-13 13:15:00',0,'2009-11-13 13:15:00'),('ctdphMicro','','CT DPH Microbiology','','2011-06-03 14:21:00',0,'2011-06-03 14:21:00'),('ctRiverwatch','','Connecticut Riverwatch','bacteria','2009-01-06 09:34:00',1,'2009-01-06 09:34:00'),('EcoAna','','EcoAnalysts','http://www.ecoanalysts.com/','2013-04-08 16:49:00',0,'2009-01-06 09:34:00'),('EPA','','U.S. Environmental Protection Agency (EPA)','','2016-04-06 14:54:00',0,'2010-11-23 11:40:00'),('epaCorvallis','','US EPA LAB, Corvallis, Oregon','Lab used for NLA2012 analysis of Chl-a, Nutrients, Water chemistry, and sediment mercury.\nSent \nAttn: Phil Monaco, Dynam','2013-04-30 13:50:00',0,'2013-04-30 13:20:00'),('epaReg1','','U.S. EPA New England Regional Laboratory','11 Technology  Drive\nNorth Chelmsford, MA 01863-2431\n\nContact: Dave McDonald','2018-09-17 16:10:00',0,'2018-09-17 16:10:00'),('Fairfield','','Town of Fairfield','bacteria','2009-01-06 09:34:00',1,'2009-01-06 09:34:00'),('fairfieldU','','Fairfield University','http://www.fairfield.edu/','2009-01-06 09:34:00',1,'2009-01-06 09:34:00'),('FRWA','','Farmington River Watershed Association','bacteria','2009-01-06 09:34:00',1,'2009-01-06 09:34:00'),('GLEC','','GLEC (Great Lakes Environmental Center), Traverse City, Michigan','Lab used for NLA2012 to submit all samples not sent to Corvallis (see list)\nSent to\nGLEC\n739 Hastings Street\nTraverse Ci','2013-04-30 13:47:00',0,'2013-04-30 13:47:00'),('GZA','','GZA GeoEnvironmental, Inc','','2018-11-05 15:48:00',0,'2018-11-05 15:47:00'),('Lotic','','Lotic Inc.','macroinvertebrates','2014-01-13 11:52:00',1,'2009-03-24 09:59:00'),('MWBioInst','','Midwest Biodiversity Institute','','2016-04-06 13:35:00',0,'2016-04-06 13:33:00'),('NCEA','','Nature Center for Environmental Activities','bacteria','2009-03-23 09:57:00',1,'2009-03-23 09:57:00'),('neDDH','','Northeast District Department of Health','bacteria','2009-01-06 09:34:00',1,'2009-01-06 09:34:00'),('phoenix','','Phoenix','chemistry','2009-11-13 13:15:00',1,'2009-11-13 13:15:00'),('rhithron','','Rhithron Associates, Inc.','','2015-10-21 16:04:00',0,'2014-01-22 15:13:00'),('USGS','','United States Geologic Survey-East Hartford Office','http://ct.water.usgs.gov/','2017-04-19 11:31:00',0,'2009-01-06 09:34:00'),('WAA','','Watershed Assessment Associates (WAA)','Watershed Assessment Associates (WAA).  Analytical laboratory contractor for diatoms and macroinvertebrates.','2018-07-30 14:08:00',0,'2014-01-22 15:06:00'),('WestonWestportHD','','Weston/Westport Health District','bacteria','2009-03-24 08:49:00',0,'2009-03-24 08:49:00'),('WHBloomfieldHD','','West Hartford/Bloomfield Health District','bacteria','2009-03-19 08:45:00',1,'2009-03-19 08:45:00'),('YSI',NULL,'YSI','Company that developed data sondes used to collect chemical and physical parameters','2021-04-17 19:23:00',0,'2021-04-17 19:23:00');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 11:05:25
