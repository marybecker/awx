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
-- Temporary view structure for view `wqximp_fish`
--

DROP TABLE IF EXISTS `wqximp_fish`;
/*!50001 DROP VIEW IF EXISTS `wqximp_fish`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_fish` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `ActivityIdentifier`,
 1 AS `ActivityTypeCode`,
 1 AS `ActivityMediaName`,
 1 AS `ActivityStartDate`,
 1 AS `ActivityTime`,
 1 AS `ActivityTimeZoneCodetimezone`,
 1 AS `AssemblageSampledName`,
 1 AS `SampleCollectionMethodIdentifier`,
 1 AS `SampleCollectionEquipmentName`,
 1 AS `SampleCollectionEquipmentCommentText`,
 1 AS `CollectionDurationMeasureValue`,
 1 AS `CollectionDurationMeasureUnitCode`,
 1 AS `ReachLengthMeasureValue`,
 1 AS `ReachLengthMeasureUnitCode`,
 1 AS `ReachWidthMeasureValue`,
 1 AS `ReachWidthMeasureUnitCode`,
 1 AS `PassCount`,
 1 AS `CharacteristicName`,
 1 AS `ResultMeasureValue`,
 1 AS `ResultMeasureUnitCode`,
 1 AS `ResultValueTypeName`,
 1 AS `BiologicalIntentName`,
 1 AS `SubjectTaxonomicName`,
 1 AS `FrequencyClassDescriptorCode`,
 1 AS `FrequencyClassDescriptorUnitCode`,
 1 AS `LowerClassBoundValue`,
 1 AS `UpperClassBoundValue`,
 1 AS `ResultComment`,
 1 AS `ResultStatusIdentifier`,
 1 AS `ActivityConductingOrganizationText`,
 1 AS `ActivityCommentText`,
 1 AS `actLastUpdateDate`,
 1 AS `rstLastUpdateDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wqximp_meterverticalprofile_test`
--

DROP TABLE IF EXISTS `wqximp_meterverticalprofile_test`;
/*!50001 DROP VIEW IF EXISTS `wqximp_meterverticalprofile_test`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_meterverticalprofile_test` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `ActivityIdentifier`,
 1 AS `ActivityTypeCode`,
 1 AS `ActivityMediaName`,
 1 AS `ActivityStartDate`,
 1 AS `ActivityTime`,
 1 AS `ActivityTimeZoneCodetimezone`,
 1 AS `SampleCollectionMethodIdentifier`,
 1 AS `SampleCollectionEquipmentName`,
 1 AS `SampleCollectionEquipmentCommentText`,
 1 AS `ActivityConductingOrganizationText`,
 1 AS `CharacteristicName`,
 1 AS `ResultMeasureValue`,
 1 AS `ResultMeasureUnitCode`,
 1 AS `ResultValueTypeName`,
 1 AS `ActivityDepthMeasureValue`,
 1 AS `ActivityDepthMeasureUnitCode`,
 1 AS `ResultStatusIdentifier`,
 1 AS `lastUpdateDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wqximp_projects`
--

DROP TABLE IF EXISTS `wqximp_projects`;
/*!50001 DROP VIEW IF EXISTS `wqximp_projects`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_projects` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `ProjectName`,
 1 AS `ProjectDescriptionText`,
 1 AS `SamplingDesignTypeCode`,
 1 AS `QAPPApprovedIndicator`,
 1 AS `QAPPApprovalAgencyName`,
 1 AS `lastUpdateDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wqximp_stations`
--

DROP TABLE IF EXISTS `wqximp_stations`;
/*!50001 DROP VIEW IF EXISTS `wqximp_stations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_stations` AS SELECT 
 1 AS `staSeq`,
 1 AS `locationName`,
 1 AS `ylat`,
 1 AS `xlong`,
 1 AS `sourceMapScale`,
 1 AS `horizCollectMethod`,
 1 AS `horizRefDatum`,
 1 AS `locationType`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `wqximp_fish`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_fish`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_fish` AS select `activitybio`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitybio`.`staSeq` AS `staSeq`,`activitybio`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitybio`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitybio`.`ActivityMediaName` AS `ActivityMediaName`,`activitybio`.`ActivityStartDate` AS `ActivityStartDate`,`activitybio`.`ActivityTime` AS `ActivityTime`,`activitybio`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitybio`.`AssemblageSampledName` AS `AssemblageSampledName`,`activitybio`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitybio`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitybio`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitybio`.`CollectionDurationMeasureValue` AS `CollectionDurationMeasureValue`,`activitybio`.`CollectionDurationMeasureUnitCode` AS `CollectionDurationMeasureUnitCode`,`activitybio`.`ReachLengthMeasureValue` AS `ReachLengthMeasureValue`,`activitybio`.`ReachLengthMeasureUnitCode` AS `ReachLengthMeasureUnitCode`,`activitybio`.`ReachWidthMeasureValue` AS `ReachWidthMeasureValue`,`activitybio`.`ReachWidthMeasureUnitCode` AS `ReachWidthMeasureUnitCode`,`activitybio`.`PassCount` AS `PassCount`,`resultsfish`.`CharacteristicName` AS `CharacteristicName`,`resultsfish`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultsfish`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultsfish`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultsfish`.`BiologicalIntentName` AS `BiologicalIntentName`,`resultsfish`.`SubjectTaxonomicName` AS `SubjectTaxonomicName`,`resultsfish`.`FrequencyClassDescriptorCode` AS `FrequencyClassDescriptorCode`,`resultsfish`.`FrequencyClassDescriptorUnitCode` AS `FrequencyClassDescriptorUnitCode`,`resultsfish`.`LowerClassBoundValue` AS `LowerClassBoundValue`,`resultsfish`.`UpperClassBoundValue` AS `UpperClassBoundValue`,`resultsfish`.`ResultComment` AS `ResultComment`,`resultsfish`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`activitybio`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitybio`.`ActivityCommentText` AS `ActivityCommentText`,`activitybio`.`lastUpdateDate` AS `actLastUpdateDate`,`resultsfish`.`lastUpdateDate` AS `rstLastUpdateDate` from (`activitybio` join `resultsfish` on((`resultsfish`.`ActivityIdentifier` = `activitybio`.`ActivityIdentifier`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wqximp_meterverticalprofile_test`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_meterverticalprofile_test`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_meterverticalprofile_test` AS select `resultsmeter`.`ProjectIdentifier` AS `ProjectIdentifier`,`resultsmeter`.`staSeq` AS `staSeq`,`resultsmeter`.`ActivityIdentifier` AS `ActivityIdentifier`,`resultsmeter`.`ActivityTypeCode` AS `ActivityTypeCode`,`resultsmeter`.`ActivityMediaName` AS `ActivityMediaName`,`resultsmeter`.`ActivityStartDate` AS `ActivityStartDate`,`resultsmeter`.`ActivityTime` AS `ActivityTime`,`resultsmeter`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`resultsmeter`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`resultsmeter`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`resultsmeter`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`resultsmeter`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`resultsmeter`.`CharacteristicName` AS `CharacteristicName`,`resultsmeter`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultsmeter`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultsmeter`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultsmeter`.`ActivityDepthMeasureValue` AS `ActivityDepthMeasureValue`,`resultsmeter`.`ActivityDepthMeasureUnitCode` AS `ActivityDepthMeasureUnitCode`,`resultsmeter`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`resultsmeter`.`lastUpdateDate` AS `lastUpdateDate` from `resultsmeter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wqximp_projects`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_projects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_projects` AS select `projects`.`ProjectIdentifier` AS `ProjectIdentifier`,`projects`.`ProjectName` AS `ProjectName`,`projects`.`ProjectDescriptionText` AS `ProjectDescriptionText`,`projects`.`SamplingDesignTypeCode` AS `SamplingDesignTypeCode`,`projects`.`QAPPApprovedIndicator` AS `QAPPApprovedIndicator`,`projects`.`QAPPApprovalAgencyName` AS `QAPPApprovalAgencyName`,`projects`.`lastUpdateDate` AS `lastUpdateDate` from `projects` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wqximp_stations`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_stations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_stations` AS select `stations`.`staSeq` AS `staSeq`,`stations`.`locationName` AS `locationName`,`stations`.`ylat` AS `ylat`,`stations`.`xlong` AS `xlong`,`stations`.`sourceMapScale` AS `sourceMapScale`,`stations`.`horizCollectMethod` AS `horizCollectMethod`,`stations`.`horizRefDatum` AS `horizRefDatum`,`stations`.`locationType` AS `locationType` from `stations` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'awqx'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-29 11:05:26
