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
-- Table structure for table `samplefraction`
--

DROP TABLE IF EXISTS `samplefraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samplefraction` (
  `Domain` text,
  `Unique Identifier` int DEFAULT NULL,
  `Name` varchar(25) NOT NULL,
  `Description` text,
  `Last Change Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samplefraction`
--

LOCK TABLES `samplefraction` WRITE;
/*!40000 ALTER TABLE `samplefraction` DISABLE KEYS */;
INSERT INTO `samplefraction` VALUES ('Sample Fraction(ResultSampleFractionText)',10,'Acid Soluble','That portion of the analyte which becomes dissolved within the sample following treatment with an appropriate acid.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',26,'Bed Sediment','','2014-09-10 09:00:00'),('Sample Fraction(ResultSampleFractionText)',27,'Bedload','','2014-09-10 09:00:00'),('Sample Fraction(ResultSampleFractionText)',19,'Bioavailable','The extent to which a substance is / becomes available or absorbed by a specific tissue or organ.','2010-03-05 03:10:48'),('Sample Fraction(ResultSampleFractionText)',15,'Comb Available','The Concentration of a analyte or other analyte derivatives in a water which is combined with other derivatives yet is still available to oxidize organic matter.','2012-10-15 10:10:48'),('Sample Fraction(ResultSampleFractionText)',2,'Dissolved','That portion of the analyte found in the liquid medium.  Cannot be removed by filtration.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',22,'Extractable','An analyte that can be removed from a mixture using a specific method or technique','2010-12-20 12:10:41'),('Sample Fraction(ResultSampleFractionText)',115,'Field','','2019-06-10 06:09:37'),('Sample Fraction(ResultSampleFractionText)',6,'Filterable','That portion of the analyte which is in or absorbed to material which passes through the filter during sample filtration.','2012-04-30 04:10:48'),('Sample Fraction(ResultSampleFractionText)',28,'Filtered, field','Performed in field. +/ Pertains to constituents in a water sample passed through a filter membrane of specified pore diameter, 0.45 µm or less for inorganic analytes and 0.7 µm for organic analytes.','2015-12-02 12:11:16'),('Sample Fraction(ResultSampleFractionText)',30,'Filtered, lab','Performed in lab. +/ Pertains to constituents in a water sample passed through a filter membrane of specified pore diameter, 0.45 µm or less for inorganic analytes and 0.7 µm for organic analytes.','2016-01-29 01:10:27'),('Sample Fraction(ResultSampleFractionText)',13,'Fixed','That portion of the analyte found in the liquid layer above a precipitate produced from the sample.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',17,'Free Available','The concentration of residual substance present as dissolved gas, and not combined with any substance or in other less readily available form.','2012-10-15 10:10:48'),('Sample Fraction(ResultSampleFractionText)',21,'Inorganic','Inorganic content of sample','2010-11-29 11:17:39'),('Sample Fraction(ResultSampleFractionText)',135,'Leachable','An analyte capable of being removed from a substance by a percolating liquid.','2019-07-22 07:15:42'),('Sample Fraction(ResultSampleFractionText)',7,'Non-Filterable (Particle)','That portion of the analyte which is extracted from the liquid medium by filtration.','2012-04-30 04:10:48'),('Sample Fraction(ResultSampleFractionText)',5,'Non-settleable','That portion of the analyte which is in or absorbed to particles remaining in suspension in the sample container after a settling process.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',9,'Non-volatile','That portion of the analyte which is in a liquid or solid state under normal temperature and pressure.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',31,'None','None or Not Applicable','2016-03-08 03:09:08'),('Sample Fraction(ResultSampleFractionText)',20,'Organic','Organic content of a sample','2010-12-30 12:10:50'),('Sample Fraction(ResultSampleFractionText)',18,'Pot. Dissolved','Potentially Dissolved is the portion of a constituent measured from the filtrate of a water and suspended sediment sample that was treated with nitric acid prior to sample filtration.','2012-10-15 10:10:48'),('Sample Fraction(ResultSampleFractionText)',32,'Semivolatile','The portion of the analyte which semi-easily enter the air as gases from some solids or liquids.','2016-03-08 03:15:39'),('Sample Fraction(ResultSampleFractionText)',4,'Settleable','That portion of the analyte which is found in or absorbed to that part of the sample which has settled (fallen out of suspension) to the bottom of the sample container.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',24,'Strong Acid Diss','Strong Acid Dissociable, analyte that is released from analyte containing compounds under highly acidic conditions.','2012-10-15 10:15:00'),('Sample Fraction(ResultSampleFractionText)',12,'Supernate','That portion of the analyte found in the liquid layer above a precipitate produced from the sample.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',3,'Suspended','That portion of the analyte which is suspended in the sampled medium, either as, or adsorbed to, particles which are more or less uniformly dispersed within the medium.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',1,'Total','The total of all fractions of the analyte.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',14,'Total Recoverable','The analyte concentration available for analysis in an unfiltered sample following solubilization.','2012-10-15 10:10:48'),('Sample Fraction(ResultSampleFractionText)',16,'Total Residual','The amount of available analyte remaining after a given contact time. The sum of the combined available residual analyte and the free available residual analyte.','2012-10-15 10:10:48'),('Sample Fraction(ResultSampleFractionText)',25,'Total Soluble','The total of all fractions of the analyte / The sum of all of the different forms of the analyte present which becomes dissolved within the sample.','2013-02-27 02:10:48'),('Sample Fraction(ResultSampleFractionText)',29,'Unfiltered','Pertains to the constituents in a representative water-suspended-solids sample. (whole)','2015-12-02 12:11:16'),('Sample Fraction(ResultSampleFractionText)',33,'Unfiltered, field','Performed in field. +/ Pertains to the constituents in a representative water-suspended-solids sample. (whole)','2015-12-02 12:00:00'),('Sample Fraction(ResultSampleFractionText)',11,'Vapor','That portion of the analyte which exists in a gaseous state and that under ordinary conditions is liquid or solid.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',8,'Volatile','That portion of the analyte which evaporates readily at normal temperature and pressure.','2006-07-26 07:10:48'),('Sample Fraction(ResultSampleFractionText)',23,'Weak Acid Diss','Weak Acid Dissociable, analyte that is readily released from analyte containing compounds when the pH is lowered.','2012-01-11 01:16:28');
/*!40000 ALTER TABLE `samplefraction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 20:28:11
