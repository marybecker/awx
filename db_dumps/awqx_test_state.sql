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
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Code` varchar(2) NOT NULL,
  `Name` text,
  `Last Change Date` datetime DEFAULT NULL,
  `Country Code` text,
  `Fips Code` int DEFAULT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('State',69,'1','Aguascalientes','2006-08-12 00:56:50','MX',1),('State',78,'10','Durango','2006-08-12 00:56:50','MX',10),('State',79,'11','Guanajuato','2006-08-12 00:56:50','MX',11),('State',80,'12','Guerrero','2006-08-12 00:56:50','MX',12),('State',81,'13','Hidalgo','2006-08-12 00:56:50','MX',13),('State',82,'14','Jalisco','2006-08-12 00:56:50','MX',14),('State',83,'15','Mexico','2006-08-12 00:56:50','MX',15),('State',84,'16','Michoacan de Ocampo','2006-08-12 00:56:50','MX',16),('State',85,'17','Morelos','2006-08-12 00:56:50','MX',17),('State',86,'18','Nayarit','2006-08-12 00:56:50','MX',18),('State',87,'19','Nuevo Leon','2006-08-12 00:56:50','MX',19),('State',70,'2','Baja California','2006-08-12 00:56:50','MX',2),('State',88,'20','Oaxaca','2006-08-12 00:56:50','MX',20),('State',89,'21','Puebla','2006-08-12 00:56:50','MX',21),('State',90,'22','Queretaro de Arteaga','2006-08-12 00:56:50','MX',22),('State',91,'23','Quintana Roo','2006-08-12 00:56:50','MX',23),('State',92,'24','San Luis Potosi','2006-08-12 00:56:50','MX',24),('State',93,'25','Sinaloa','2006-08-12 00:56:50','MX',25),('State',94,'26','Sonora','2006-08-12 00:56:50','MX',26),('State',95,'27','Tabasco','2006-08-12 00:56:50','MX',27),('State',96,'28','Tamaulipas','2006-08-12 00:56:50','MX',28),('State',97,'29','Tlaxcala','2006-08-12 00:56:50','MX',29),('State',71,'3','Baja California Sur','2006-08-12 00:56:50','MX',3),('State',98,'30','Veracruz-Llave','2006-08-12 00:56:50','MX',30),('State',99,'31','Yucatan','2006-08-12 00:56:50','MX',31),('State',100,'32','Zacatecas','2006-08-12 00:56:50','MX',32),('State',72,'4','Campeche','2006-08-12 00:56:50','MX',4),('State',73,'5','Chiapas','2006-08-12 00:56:50','MX',5),('State',74,'6','Chihuahua','2006-08-12 00:56:50','MX',6),('State',55,'67','Johnston Atoll','2006-08-12 00:56:50','US',67),('State',75,'7','Coahuila de Zaragoza','2006-08-12 00:56:50','MX',7),('State',59,'71','Midway Islands','2006-08-12 00:56:50','US',71),('State',61,'76','Navassa Island','2006-08-12 00:56:50','US',76),('State',63,'79','Wake Island','2006-08-12 00:56:50','US',79),('State',76,'8','Colima','2006-08-12 00:56:50','MX',8),('State',64,'81','Baker Island','2006-08-12 00:56:50','US',81),('State',65,'84','Howland Island','2006-08-12 00:56:50','US',84),('State',66,'86','Jarvis Island','2006-08-12 00:56:50','US',86),('State',67,'89','Kingman Reef','2006-08-12 00:56:50','US',89),('State',77,'9','Distrito Federal','2006-08-12 00:56:50','MX',9),('State',68,'95','Palmyra Atoll','2006-08-12 00:56:50','US',95),('State',101,'AB','Alberta','2006-08-12 00:56:50','CA',1),('State',2,'AK','Alaska','2006-08-12 00:56:50','US',2),('State',1,'AL','Alabama','2014-02-24 16:16:50','US',1),('State',4,'AR','Arkansas','2006-08-12 00:56:50','US',5),('State',52,'AS','American Samoa','2006-08-12 00:56:50','US',60),('State',3,'AZ','Arizona','2006-08-12 00:56:50','US',4),('State',102,'BC','British Columbia','2006-08-12 00:56:50','CA',2),('State',5,'CA','California','2006-08-12 00:56:50','US',6),('State',6,'CO','Colorado','2006-08-12 00:56:50','US',8),('State',7,'CT','Connecticut','2006-08-12 00:56:50','US',9),('State',9,'DC','District of Columbia','2006-08-12 00:56:50','US',11),('State',8,'DE','Delaware','2006-08-12 00:56:50','US',10),('State',10,'FL','Florida','2006-08-12 00:56:50','US',12),('State',53,'FM','Micronesia','2006-08-12 00:56:50','US',64),('State',11,'GA','Georgia','2006-08-12 00:56:50','US',13),('State',54,'GU','Guam','2006-08-12 00:56:50','US',66),('State',12,'HI','Hawaii','2006-08-12 00:56:50','US',15),('State',16,'IA','Iowa','2006-08-12 00:56:50','US',19),('State',13,'ID','Idaho','2006-08-12 00:56:50','US',16),('State',14,'IL','Illinois','2006-08-12 00:56:50','US',17),('State',15,'IN','Indiana','2006-08-12 00:56:50','US',18),('State',17,'KS','Kansas','2006-08-12 00:56:50','US',20),('State',18,'KY','Kentucky','2006-08-12 00:56:50','US',21),('State',19,'LA','Louisiana','2006-08-12 00:56:50','US',22),('State',22,'MA','Massachusetts','2006-08-12 00:56:50','US',25),('State',103,'MB','Manitoba','2006-08-12 00:56:50','CA',3),('State',21,'MD','Maryland','2006-08-12 00:56:50','US',24),('State',20,'ME','Maine','2006-08-12 00:56:50','US',23),('State',56,'MH','Marshall Islands','2006-08-12 00:56:50','US',68),('State',23,'MI','Michigan','2006-08-12 00:56:50','US',26),('State',24,'MN','Minnesota','2006-08-12 00:56:50','US',27),('State',26,'MO','Missouri','2006-08-12 00:56:50','US',29),('State',57,'MP','N. Mariana Islands','2006-08-12 00:56:50','US',69),('State',25,'MS','Mississippi','2006-08-12 00:56:50','US',28),('State',27,'MT','Montana','2006-08-12 00:56:50','US',30),('State',106,'N9','Northwest Territorie (Pre 1999)','2006-08-12 00:56:50','CA',6),('State',104,'NB','New Brunswick','2006-08-12 00:56:50','CA',4),('State',34,'NC','North Carolina','2006-08-12 00:56:50','US',37),('State',35,'ND','North Dakota','2006-08-12 00:56:50','US',38),('State',28,'NE','Nebraska','2006-08-12 00:56:50','US',31),('State',105,'NF','Newfoundland','2006-08-12 00:56:50','CA',5),('State',30,'NH','New Hampshire','2006-08-12 00:56:50','US',33),('State',31,'NJ','New Jersey','2006-08-12 00:56:50','US',34),('State',32,'NM','New Mexico','2006-08-12 00:56:50','US',35),('State',107,'NS','Nova Scotia','2006-08-12 00:56:50','CA',7),('State',113,'NT','Northwest Territorie','2014-03-04 12:00:00','CA',13),('State',114,'NU','Nunavut','2014-03-04 12:00:00','CA',14),('State',29,'NV','Nevada','2006-08-12 00:56:50','US',32),('State',33,'NY','New York','2006-08-12 00:56:50','US',36),('State',36,'OH','Ohio','2006-08-12 00:56:50','US',39),('State',37,'OK','Oklahoma','2006-08-12 00:56:50','US',40),('State',108,'ON','Ontario','2006-08-12 00:56:50','CA',8),('State',38,'OR','Oregon','2006-08-12 00:56:50','US',41),('State',39,'PA','Pennsylvania','2006-08-12 00:56:50','US',42),('State',109,'PE','Prince Edward Island','2006-08-12 00:56:50','CA',9),('State',60,'PR','Puerto Rico','2006-08-12 00:56:50','US',72),('State',58,'PW','Palau','2006-08-12 00:56:50','US',70),('State',110,'QC','Quebec','2006-08-12 00:56:50','CA',10),('State',40,'RI','Rhode Island','2006-08-12 00:56:50','US',44),('State',41,'SC','South Carolina','2006-08-12 00:56:50','US',45),('State',42,'SD','South Dakota','2006-08-12 00:56:50','US',46),('State',111,'SK','Saskatchewan','2006-08-12 00:56:50','CA',11),('State',43,'TN','Tennessee','2006-08-12 00:56:50','US',47),('State',44,'TX','Texas','2006-08-12 00:56:50','US',48),('State',45,'UT','Utah','2006-08-12 00:56:50','US',49),('State',47,'VA','Virginia','2006-08-12 00:56:50','US',51),('State',62,'VI','Virgin Islands','2006-08-12 00:56:50','US',78),('State',46,'VT','Vermont','2006-08-12 00:56:50','US',50),('State',48,'WA','Washington','2006-08-12 00:56:50','US',53),('State',50,'WI','Wisconsin','2006-08-12 00:56:50','US',55),('State',49,'WV','West Virginia','2006-08-12 00:56:50','US',54),('State',51,'WY','Wyoming','2006-08-12 00:56:50','US',56),('State',112,'YT','Yukon Territory','2006-08-12 00:56:50','CA',12);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 20:28:13
