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
-- Temporary view structure for view `wqximp_grab_chem`
--

DROP TABLE IF EXISTS `wqximp_grab_chem`;
/*!50001 DROP VIEW IF EXISTS `wqximp_grab_chem`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_grab_chem` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `ActivityIdentifier`,
 1 AS `ActivityTypeCode`,
 1 AS `ActivityMediaName`,
 1 AS `ActivityMediaSubdivisionName`,
 1 AS `ActivityStartDate`,
 1 AS `ActivityTime`,
 1 AS `ActivityTimeZoneCodetimezone`,
 1 AS `ActivityRelativeDepthName`,
 1 AS `ActivityTopDepthMeasureValue`,
 1 AS `ActivityTopDepthMeasureUnitCode`,
 1 AS `ActivityBottomDepthMeasureValue`,
 1 AS `ActivityBottomDepthMeasureUnitCode`,
 1 AS `SampleCollectionMethodIdentifier`,
 1 AS `SampleCollectionEquipmentName`,
 1 AS `SampleCollectionEquipmentCommentText`,
 1 AS `ActivityConductingOrganizationText`,
 1 AS `ActivityCommentText`,
 1 AS `LaboratoryName`,
 1 AS `ActivityYlat`,
 1 AS `ActivityXlong`,
 1 AS `ActivityhorizCollectMethod`,
 1 AS `ActivityhorizRefDatum`,
 1 AS `LabAccession`,
 1 AS `CharacteristicName`,
 1 AS `MethodSpeciationName`,
 1 AS `ResultDetectionConditionText`,
 1 AS `ResultMeasureValue`,
 1 AS `ResultMeasureUnitCode`,
 1 AS `ResultValueTypeName`,
 1 AS `ResultSampleFractionText`,
 1 AS `ResultStatusIdentifier`,
 1 AS `ResultAnalyticalMethodIdentifier`,
 1 AS `ResultAnalyticalMethodContext`,
 1 AS `AnalysisStartDate`,
 1 AS `DetectionQuantitationTypeName`,
 1 AS `DetectionQuantitationLimitMeasureValue`,
 1 AS `DetectionLimitMeasureUnitCode`,
 1 AS `ResultComment`,
 1 AS `actLastUpdateDate`,
 1 AS `rstLastUpdateDate`,
 1 AS `importType`*/;
SET character_set_client = @saved_cs_client;

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
 1 AS `rstLastUpdateDate`,
 1 AS `importType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_chem_activities`
--

DROP TABLE IF EXISTS `get_chem_activities`;
/*!50001 DROP VIEW IF EXISTS `get_chem_activities`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_chem_activities` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `locationName`,
 1 AS `ActivityIdentifier`,
 1 AS `ActivityTypeCode`,
 1 AS `ActivityMediaName`,
 1 AS `ActivityMediaSubdivisionName`,
 1 AS `ActivityStartDate`,
 1 AS `ActivityTime`,
 1 AS `ActivityTimeZoneCodetimezone`,
 1 AS `SampleCollectionMethodIdentifier`,
 1 AS `SampleCollectionEquipmentName`,
 1 AS `SampleCollectionEquipmentCommentText`,
 1 AS `ActivityConductingOrganizationText`,
 1 AS `ActivityCommentText`,
 1 AS `ActContactLead`,
 1 AS `ActFieldCrew`,
 1 AS `SamplePreparationMethodIdentifier`,
 1 AS `ActivityRelativeDepthName`,
 1 AS `ActivityTopDepthMeasureValue`,
 1 AS `ActivityTopDepthMeasureUnitCode`,
 1 AS `ActivityBottomDepthMeasureValue`,
 1 AS `ActivityBottomDepthMeasureUnitCode`,
 1 AS `InstreamLocation`,
 1 AS `LabAccession`,
 1 AS `LaboratoryName`,
 1 AS `ActivityYlat`,
 1 AS `ActivityXlong`,
 1 AS `ActivityhorizCollectMethod`,
 1 AS `ActivityhorizRefDatum`,
 1 AS `createDate`,
 1 AS `createUser`,
 1 AS `lastUpdateDate`,
 1 AS `lastUpdateUser`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wqximp_last_import`
--

DROP TABLE IF EXISTS `wqximp_last_import`;
/*!50001 DROP VIEW IF EXISTS `wqximp_last_import`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_last_import` AS SELECT 
 1 AS `importType`,
 1 AS `lastImportDate`*/;
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
 1 AS `lastUpdateDate`,
 1 AS `importType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_fish_results`
--

DROP TABLE IF EXISTS `get_fish_results`;
/*!50001 DROP VIEW IF EXISTS `get_fish_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_fish_results` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `locationName`,
 1 AS `LabAccession`,
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
 1 AS `Pass`,
 1 AS `ZoneCount`,
 1 AS `Zone`,
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
 1 AS `locationType`,
 1 AS `stateCd`,
 1 AS `lastUpdateDate`,
 1 AS `importType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_chem_results`
--

DROP TABLE IF EXISTS `get_chem_results`;
/*!50001 DROP VIEW IF EXISTS `get_chem_results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_chem_results` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `locationName`,
 1 AS `ActivityIdentifier`,
 1 AS `ActivityTypeCode`,
 1 AS `ActivityMediaName`,
 1 AS `ActivityMediaSubdivisionName`,
 1 AS `ActivityStartDate`,
 1 AS `ActivityTime`,
 1 AS `ActivityTimeZoneCodetimezone`,
 1 AS `ActivityRelativeDepthName`,
 1 AS `ActivityTopDepthMeasureValue`,
 1 AS `ActivityTopDepthMeasureUnitCode`,
 1 AS `ActivityBottomDepthMeasureValue`,
 1 AS `ActivityBottomDepthMeasureUnitCode`,
 1 AS `SampleCollectionMethodIdentifier`,
 1 AS `SampleCollectionEquipmentName`,
 1 AS `SampleCollectionEquipmentCommentText`,
 1 AS `ActivityConductingOrganizationText`,
 1 AS `ActivityCommentText`,
 1 AS `LaboratoryName`,
 1 AS `ActivityYlat`,
 1 AS `ActivityXlong`,
 1 AS `ActivityhorizCollectMethod`,
 1 AS `ActivityhorizRefDatum`,
 1 AS `LabAccession`,
 1 AS `CharacteristicName`,
 1 AS `MethodSpeciationName`,
 1 AS `ResultDetectionConditionText`,
 1 AS `ResultMeasureValue`,
 1 AS `ResultMeasureUnitCode`,
 1 AS `ResultValueTypeName`,
 1 AS `ResultSampleFractionText`,
 1 AS `ResultStatusIdentifier`,
 1 AS `ResultAnalyticalMethodIdentifier`,
 1 AS `ResultAnalyticalMethodContext`,
 1 AS `AnalysisStartDate`,
 1 AS `DetectionQuantitationTypeName`,
 1 AS `DetectionQuantitationLimitMeasureValue`,
 1 AS `DetectionLimitMeasureUnitCode`,
 1 AS `ResultComment`,
 1 AS `actLastUpdateDate`,
 1 AS `rstLastUpdateDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wqximp_meter`
--

DROP TABLE IF EXISTS `wqximp_meter`;
/*!50001 DROP VIEW IF EXISTS `wqximp_meter`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wqximp_meter` AS SELECT 
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `ActivityIdentifier`,
 1 AS `ActivityTypeCode`,
 1 AS `ActivityMediaName`,
 1 AS `ActivityStartDate`,
 1 AS `ActivityTime`,
 1 AS `ActivityTimeZoneCodetimezone`,
 1 AS `ActivityDepthMeasureValue`,
 1 AS `ActivityDepthMeasureUnitCode`,
 1 AS `SampleCollectionMethodIdentifier`,
 1 AS `SampleCollectionEquipmentName`,
 1 AS `SampleCollectionEquipmentCommentText`,
 1 AS `ActivityConductingOrganizationText`,
 1 AS `ActivityCommentText`,
 1 AS `ActivityYlat`,
 1 AS `ActivityXlong`,
 1 AS `ActivityhorizCollectMethod`,
 1 AS `ActivityhorizRefDatum`,
 1 AS `CharacteristicName`,
 1 AS `ResultMeasureValue`,
 1 AS `ResultMeasureUnitCode`,
 1 AS `ResultValueTypeName`,
 1 AS `ResultStatusIdentifier`,
 1 AS `ResultComment`,
 1 AS `lastUpdateDate`,
 1 AS `importType`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_fish_activities`
--

DROP TABLE IF EXISTS `get_fish_activities`;
/*!50001 DROP VIEW IF EXISTS `get_fish_activities`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_fish_activities` AS SELECT 
 1 AS `LabAccession`,
 1 AS `ProjectIdentifier`,
 1 AS `staSeq`,
 1 AS `locationName`,
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
 1 AS `ActivityCommentText`,
 1 AS `ActContactLead`,
 1 AS `ActFieldCrew`,
 1 AS `AssemblageSampledName`,
 1 AS `CollectionAreaMeasureValue`,
 1 AS `CollectionAreaMeasureUnitCode`,
 1 AS `HabitatSelectionMethod`,
 1 AS `CollectionDurationMeasureValue`,
 1 AS `CollectionDurationMeasureUnitCode`,
 1 AS `ReachLengthMeasureValue`,
 1 AS `ReachLengthMeasureUnitCode`,
 1 AS `ReachWidthMeasureValue`,
 1 AS `ReachWidthMeasureUnitCode`,
 1 AS `NetMeshSizeMeasureValue`,
 1 AS `NetMeshSizeMeasureUnitCode`,
 1 AS `PassCount`,
 1 AS `Pass`,
 1 AS `ZoneCount`,
 1 AS `Zone`,
 1 AS `Amps`,
 1 AS `Pulses`,
 1 AS `CollectionEfficiencyEst`,
 1 AS `TotalEnergizedMeasure`,
 1 AS `TotalEnergizedMeasureUnit`,
 1 AS `Volts`,
 1 AS `DutyCycle`,
 1 AS `createDate`,
 1 AS `createUser`,
 1 AS `lastUpdateDate`,
 1 AS `lastUpdateUser`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `wqximp_grab_chem`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_grab_chem`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_grab_chem` AS select `activitychem`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitychem`.`staSeq` AS `staSeq`,`activitychem`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitychem`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitychem`.`ActivityMediaName` AS `ActivityMediaName`,`activitychem`.`ActivityMediaSubdivisionName` AS `ActivityMediaSubdivisionName`,`activitychem`.`ActivityStartDate` AS `ActivityStartDate`,`activitychem`.`ActivityTime` AS `ActivityTime`,`activitychem`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitychem`.`ActivityRelativeDepthName` AS `ActivityRelativeDepthName`,`activitychem`.`ActivityTopDepthMeasureValue` AS `ActivityTopDepthMeasureValue`,`activitychem`.`ActivityTopDepthMeasureUnitCode` AS `ActivityTopDepthMeasureUnitCode`,`activitychem`.`ActivityBottomDepthMeasureValue` AS `ActivityBottomDepthMeasureValue`,`activitychem`.`ActivityBottomDepthMeasureUnitCode` AS `ActivityBottomDepthMeasureUnitCode`,`activitychem`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitychem`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitychem`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitychem`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitychem`.`ActivityCommentText` AS `ActivityCommentText`,`activitychem`.`LaboratoryName` AS `LaboratoryName`,`activitychem`.`ActivityYlat` AS `ActivityYlat`,`activitychem`.`ActivityXlong` AS `ActivityXlong`,`activitychem`.`ActivityhorizCollectMethod` AS `ActivityhorizCollectMethod`,`activitychem`.`ActivityhorizRefDatum` AS `ActivityhorizRefDatum`,`resultschem`.`LabAccession` AS `LabAccession`,`resultschem`.`CharacteristicName` AS `CharacteristicName`,`resultschem`.`MethodSpeciationName` AS `MethodSpeciationName`,`resultschem`.`ResultDetectionConditionText` AS `ResultDetectionConditionText`,`resultschem`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultschem`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultschem`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultschem`.`ResultSampleFractionText` AS `ResultSampleFractionText`,`resultschem`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`resultschem`.`ResultAnalyticalMethodIdentifier` AS `ResultAnalyticalMethodIdentifier`,`resultschem`.`ResultAnalyticalMethodContext` AS `ResultAnalyticalMethodContext`,`resultschem`.`AnalysisStartDate` AS `AnalysisStartDate`,`resultschem`.`DetectionQuantitationTypeName` AS `DetectionQuantitationTypeName`,`resultschem`.`DetectionQuantitationLimitMeasureValue` AS `DetectionQuantitationLimitMeasureValue`,`resultschem`.`DetectionLimitMeasureUnitCode` AS `DetectionLimitMeasureUnitCode`,`resultschem`.`ResultComment` AS `ResultComment`,`resultschem`.`lastUpdateDate` AS `actLastUpdateDate`,`activitychem`.`lastUpdateDate` AS `rstLastUpdateDate`,'wqximp_grab_chem' AS `importType` from (`activitychem` join `resultschem` on((`resultschem`.`LabAccession` = `activitychem`.`LabAccession`))) where (`resultschem`.`ResultStatusIdentifier` = 'Final') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `wqximp_fish` AS select `activitybio`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitybio`.`staSeq` AS `staSeq`,`activitybio`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitybio`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitybio`.`ActivityMediaName` AS `ActivityMediaName`,`activitybio`.`ActivityStartDate` AS `ActivityStartDate`,`activitybio`.`ActivityTime` AS `ActivityTime`,`activitybio`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitybio`.`AssemblageSampledName` AS `AssemblageSampledName`,`activitybio`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitybio`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitybio`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitybio`.`CollectionDurationMeasureValue` AS `CollectionDurationMeasureValue`,`activitybio`.`CollectionDurationMeasureUnitCode` AS `CollectionDurationMeasureUnitCode`,`activitybio`.`ReachLengthMeasureValue` AS `ReachLengthMeasureValue`,`activitybio`.`ReachLengthMeasureUnitCode` AS `ReachLengthMeasureUnitCode`,`activitybio`.`ReachWidthMeasureValue` AS `ReachWidthMeasureValue`,`activitybio`.`ReachWidthMeasureUnitCode` AS `ReachWidthMeasureUnitCode`,`activitybio`.`PassCount` AS `PassCount`,`resultsfish`.`CharacteristicName` AS `CharacteristicName`,`resultsfish`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultsfish`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultsfish`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultsfish`.`BiologicalIntentName` AS `BiologicalIntentName`,`resultsfish`.`SubjectTaxonomicName` AS `SubjectTaxonomicName`,`resultsfish`.`FrequencyClassDescriptorCode` AS `FrequencyClassDescriptorCode`,`resultsfish`.`FrequencyClassDescriptorUnitCode` AS `FrequencyClassDescriptorUnitCode`,`resultsfish`.`LowerClassBoundValue` AS `LowerClassBoundValue`,`resultsfish`.`UpperClassBoundValue` AS `UpperClassBoundValue`,`resultsfish`.`ResultComment` AS `ResultComment`,`resultsfish`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`activitybio`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitybio`.`ActivityCommentText` AS `ActivityCommentText`,`activitybio`.`lastUpdateDate` AS `actLastUpdateDate`,`resultsfish`.`lastUpdateDate` AS `rstLastUpdateDate`,'wqximp_fish' AS `importType` from (`activitybio` join `resultsfish` on((`resultsfish`.`LabAccession` = `activitybio`.`LabAccession`))) where (`resultsfish`.`ResultStatusIdentifier` = 'Final') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_chem_activities`
--

/*!50001 DROP VIEW IF EXISTS `get_chem_activities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_chem_activities` AS select `activitychem`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitychem`.`staSeq` AS `staSeq`,`stations`.`locationName` AS `locationName`,`activitychem`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitychem`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitychem`.`ActivityMediaName` AS `ActivityMediaName`,`activitychem`.`ActivityMediaSubdivisionName` AS `ActivityMediaSubdivisionName`,`activitychem`.`ActivityStartDate` AS `ActivityStartDate`,`activitychem`.`ActivityTime` AS `ActivityTime`,`activitychem`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitychem`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitychem`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitychem`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitychem`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitychem`.`ActivityCommentText` AS `ActivityCommentText`,`activitychem`.`ActContactLead` AS `ActContactLead`,`activitychem`.`ActFieldCrew` AS `ActFieldCrew`,`activitychem`.`SamplePreparationMethodIdentifier` AS `SamplePreparationMethodIdentifier`,`activitychem`.`ActivityRelativeDepthName` AS `ActivityRelativeDepthName`,`activitychem`.`ActivityTopDepthMeasureValue` AS `ActivityTopDepthMeasureValue`,`activitychem`.`ActivityTopDepthMeasureUnitCode` AS `ActivityTopDepthMeasureUnitCode`,`activitychem`.`ActivityBottomDepthMeasureValue` AS `ActivityBottomDepthMeasureValue`,`activitychem`.`ActivityBottomDepthMeasureUnitCode` AS `ActivityBottomDepthMeasureUnitCode`,`activitychem`.`InstreamLocation` AS `InstreamLocation`,`activitychem`.`LabAccession` AS `LabAccession`,`activitychem`.`LaboratoryName` AS `LaboratoryName`,`activitychem`.`ActivityYlat` AS `ActivityYlat`,`activitychem`.`ActivityXlong` AS `ActivityXlong`,`activitychem`.`ActivityhorizCollectMethod` AS `ActivityhorizCollectMethod`,`activitychem`.`ActivityhorizRefDatum` AS `ActivityhorizRefDatum`,`activitychem`.`createDate` AS `createDate`,`activitychem`.`createUser` AS `createUser`,`activitychem`.`lastUpdateDate` AS `lastUpdateDate`,`activitychem`.`lastUpdateUser` AS `lastUpdateUser` from (`activitychem` join `stations` on((`stations`.`staSeq` = `activitychem`.`staSeq`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wqximp_last_import`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_last_import`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_last_import` AS select `wqxlog`.`importType` AS `importType`,max(`wqxlog`.`importDate`) AS `lastImportDate` from `wqxlog` group by `wqxlog`.`importType` */;
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
/*!50001 VIEW `wqximp_projects` AS select `projects`.`ProjectIdentifier` AS `ProjectIdentifier`,`projects`.`ProjectName` AS `ProjectName`,`projects`.`ProjectDescriptionText` AS `ProjectDescriptionText`,`projects`.`SamplingDesignTypeCode` AS `SamplingDesignTypeCode`,`projects`.`QAPPApprovedIndicator` AS `QAPPApprovedIndicator`,`projects`.`QAPPApprovalAgencyName` AS `QAPPApprovalAgencyName`,`projects`.`lastUpdateDate` AS `lastUpdateDate`,'wqximp_projects' AS `importType` from `projects` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_fish_results`
--

/*!50001 DROP VIEW IF EXISTS `get_fish_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_fish_results` AS select `activitybio`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitybio`.`staSeq` AS `staSeq`,`stations`.`locationName` AS `locationName`,`activitybio`.`LabAccession` AS `LabAccession`,`activitybio`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitybio`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitybio`.`ActivityMediaName` AS `ActivityMediaName`,`activitybio`.`ActivityStartDate` AS `ActivityStartDate`,`activitybio`.`ActivityTime` AS `ActivityTime`,`activitybio`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitybio`.`AssemblageSampledName` AS `AssemblageSampledName`,`activitybio`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitybio`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitybio`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitybio`.`CollectionDurationMeasureValue` AS `CollectionDurationMeasureValue`,`activitybio`.`CollectionDurationMeasureUnitCode` AS `CollectionDurationMeasureUnitCode`,`activitybio`.`ReachLengthMeasureValue` AS `ReachLengthMeasureValue`,`activitybio`.`ReachLengthMeasureUnitCode` AS `ReachLengthMeasureUnitCode`,`activitybio`.`ReachWidthMeasureValue` AS `ReachWidthMeasureValue`,`activitybio`.`ReachWidthMeasureUnitCode` AS `ReachWidthMeasureUnitCode`,`activitybio`.`PassCount` AS `PassCount`,`activitybio`.`Pass` AS `Pass`,`activitybio`.`ZoneCount` AS `ZoneCount`,`activitybio`.`Zone` AS `Zone`,`resultsfish`.`CharacteristicName` AS `CharacteristicName`,`resultsfish`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultsfish`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultsfish`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultsfish`.`BiologicalIntentName` AS `BiologicalIntentName`,`resultsfish`.`SubjectTaxonomicName` AS `SubjectTaxonomicName`,`resultsfish`.`FrequencyClassDescriptorCode` AS `FrequencyClassDescriptorCode`,`resultsfish`.`FrequencyClassDescriptorUnitCode` AS `FrequencyClassDescriptorUnitCode`,`resultsfish`.`LowerClassBoundValue` AS `LowerClassBoundValue`,`resultsfish`.`UpperClassBoundValue` AS `UpperClassBoundValue`,`resultsfish`.`ResultComment` AS `ResultComment`,`resultsfish`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`activitybio`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitybio`.`ActivityCommentText` AS `ActivityCommentText`,`activitybio`.`lastUpdateDate` AS `actLastUpdateDate`,`resultsfish`.`lastUpdateDate` AS `rstLastUpdateDate` from ((`activitybio` join `resultsfish` on((`resultsfish`.`LabAccession` = `activitybio`.`LabAccession`))) join `stations` on((`stations`.`staSeq` = `activitybio`.`staSeq`))) */;
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
/*!50001 VIEW `wqximp_stations` AS select `stations`.`staSeq` AS `staSeq`,`stations`.`locationName` AS `locationName`,`stations`.`ylat` AS `ylat`,`stations`.`xlong` AS `xlong`,`stations`.`sourceMapScale` AS `sourceMapScale`,`stations`.`horizCollectMethod` AS `horizCollectMethod`,`stations`.`horizRefDatum` AS `horizRefDatum`,`stations`.`locationType` AS `locationType`,`stations`.`stateCd` AS `stateCd`,`stations`.`lastUpdateDate` AS `lastUpdateDate`,'wqximp_stations' AS `importType` from `stations` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_chem_results`
--

/*!50001 DROP VIEW IF EXISTS `get_chem_results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_chem_results` AS select `activitychem`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitychem`.`staSeq` AS `staSeq`,`stations`.`locationName` AS `locationName`,`activitychem`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitychem`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitychem`.`ActivityMediaName` AS `ActivityMediaName`,`activitychem`.`ActivityMediaSubdivisionName` AS `ActivityMediaSubdivisionName`,`activitychem`.`ActivityStartDate` AS `ActivityStartDate`,`activitychem`.`ActivityTime` AS `ActivityTime`,`activitychem`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitychem`.`ActivityRelativeDepthName` AS `ActivityRelativeDepthName`,`activitychem`.`ActivityTopDepthMeasureValue` AS `ActivityTopDepthMeasureValue`,`activitychem`.`ActivityTopDepthMeasureUnitCode` AS `ActivityTopDepthMeasureUnitCode`,`activitychem`.`ActivityBottomDepthMeasureValue` AS `ActivityBottomDepthMeasureValue`,`activitychem`.`ActivityBottomDepthMeasureUnitCode` AS `ActivityBottomDepthMeasureUnitCode`,`activitychem`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitychem`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitychem`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitychem`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitychem`.`ActivityCommentText` AS `ActivityCommentText`,`activitychem`.`LaboratoryName` AS `LaboratoryName`,`activitychem`.`ActivityYlat` AS `ActivityYlat`,`activitychem`.`ActivityXlong` AS `ActivityXlong`,`activitychem`.`ActivityhorizCollectMethod` AS `ActivityhorizCollectMethod`,`activitychem`.`ActivityhorizRefDatum` AS `ActivityhorizRefDatum`,`resultschem`.`LabAccession` AS `LabAccession`,`resultschem`.`CharacteristicName` AS `CharacteristicName`,`resultschem`.`MethodSpeciationName` AS `MethodSpeciationName`,`resultschem`.`ResultDetectionConditionText` AS `ResultDetectionConditionText`,`resultschem`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultschem`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultschem`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultschem`.`ResultSampleFractionText` AS `ResultSampleFractionText`,`resultschem`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`resultschem`.`ResultAnalyticalMethodIdentifier` AS `ResultAnalyticalMethodIdentifier`,`resultschem`.`ResultAnalyticalMethodContext` AS `ResultAnalyticalMethodContext`,`resultschem`.`AnalysisStartDate` AS `AnalysisStartDate`,`resultschem`.`DetectionQuantitationTypeName` AS `DetectionQuantitationTypeName`,`resultschem`.`DetectionQuantitationLimitMeasureValue` AS `DetectionQuantitationLimitMeasureValue`,`resultschem`.`DetectionLimitMeasureUnitCode` AS `DetectionLimitMeasureUnitCode`,`resultschem`.`ResultComment` AS `ResultComment`,`resultschem`.`lastUpdateDate` AS `actLastUpdateDate`,`activitychem`.`lastUpdateDate` AS `rstLastUpdateDate` from ((`activitychem` join `resultschem` on((`resultschem`.`LabAccession` = `activitychem`.`LabAccession`))) join `stations` on((`activitychem`.`staSeq` = `stations`.`staSeq`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wqximp_meter`
--

/*!50001 DROP VIEW IF EXISTS `wqximp_meter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `wqximp_meter` AS select `resultsmeter`.`ProjectIdentifier` AS `ProjectIdentifier`,`resultsmeter`.`staSeq` AS `staSeq`,`resultsmeter`.`ActivityIdentifier` AS `ActivityIdentifier`,`resultsmeter`.`ActivityTypeCode` AS `ActivityTypeCode`,`resultsmeter`.`ActivityMediaName` AS `ActivityMediaName`,`resultsmeter`.`ActivityStartDate` AS `ActivityStartDate`,`resultsmeter`.`ActivityTime` AS `ActivityTime`,`resultsmeter`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`resultsmeter`.`ActivityDepthMeasureValue` AS `ActivityDepthMeasureValue`,`resultsmeter`.`ActivityDepthMeasureUnitCode` AS `ActivityDepthMeasureUnitCode`,`resultsmeter`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`resultsmeter`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`resultsmeter`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`resultsmeter`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`resultsmeter`.`ActivityCommentText` AS `ActivityCommentText`,`resultsmeter`.`ActivityYlat` AS `ActivityYlat`,`resultsmeter`.`ActivityXlong` AS `ActivityXlong`,`resultsmeter`.`ActivityhorizCollectMethod` AS `ActivityhorizCollectMethod`,`resultsmeter`.`ActivityhorizRefDatum` AS `ActivityhorizRefDatum`,`resultsmeter`.`CharacteristicName` AS `CharacteristicName`,`resultsmeter`.`ResultMeasureValue` AS `ResultMeasureValue`,`resultsmeter`.`ResultMeasureUnitCode` AS `ResultMeasureUnitCode`,`resultsmeter`.`ResultValueTypeName` AS `ResultValueTypeName`,`resultsmeter`.`ResultStatusIdentifier` AS `ResultStatusIdentifier`,`resultsmeter`.`ResultComment` AS `ResultComment`,`resultsmeter`.`lastUpdateDate` AS `lastUpdateDate`,'wqximp_meter' AS `importType` from `resultsmeter` where (`resultsmeter`.`ResultStatusIdentifier` = 'Final') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_fish_activities`
--

/*!50001 DROP VIEW IF EXISTS `get_fish_activities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`beckerm`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `get_fish_activities` AS select `activitybio`.`LabAccession` AS `LabAccession`,`activitybio`.`ProjectIdentifier` AS `ProjectIdentifier`,`activitybio`.`staSeq` AS `staSeq`,`stations`.`locationName` AS `locationName`,`activitybio`.`ActivityIdentifier` AS `ActivityIdentifier`,`activitybio`.`ActivityTypeCode` AS `ActivityTypeCode`,`activitybio`.`ActivityMediaName` AS `ActivityMediaName`,`activitybio`.`ActivityStartDate` AS `ActivityStartDate`,`activitybio`.`ActivityTime` AS `ActivityTime`,`activitybio`.`ActivityTimeZoneCodetimezone` AS `ActivityTimeZoneCodetimezone`,`activitybio`.`SampleCollectionMethodIdentifier` AS `SampleCollectionMethodIdentifier`,`activitybio`.`SampleCollectionEquipmentName` AS `SampleCollectionEquipmentName`,`activitybio`.`SampleCollectionEquipmentCommentText` AS `SampleCollectionEquipmentCommentText`,`activitybio`.`ActivityConductingOrganizationText` AS `ActivityConductingOrganizationText`,`activitybio`.`ActivityCommentText` AS `ActivityCommentText`,`activitybio`.`ActContactLead` AS `ActContactLead`,`activitybio`.`ActFieldCrew` AS `ActFieldCrew`,`activitybio`.`AssemblageSampledName` AS `AssemblageSampledName`,`activitybio`.`CollectionAreaMeasureValue` AS `CollectionAreaMeasureValue`,`activitybio`.`CollectionAreaMeasureUnitCode` AS `CollectionAreaMeasureUnitCode`,`activitybio`.`HabitatSelectionMethod` AS `HabitatSelectionMethod`,`activitybio`.`CollectionDurationMeasureValue` AS `CollectionDurationMeasureValue`,`activitybio`.`CollectionDurationMeasureUnitCode` AS `CollectionDurationMeasureUnitCode`,`activitybio`.`ReachLengthMeasureValue` AS `ReachLengthMeasureValue`,`activitybio`.`ReachLengthMeasureUnitCode` AS `ReachLengthMeasureUnitCode`,`activitybio`.`ReachWidthMeasureValue` AS `ReachWidthMeasureValue`,`activitybio`.`ReachWidthMeasureUnitCode` AS `ReachWidthMeasureUnitCode`,`activitybio`.`NetMeshSizeMeasureValue` AS `NetMeshSizeMeasureValue`,`activitybio`.`NetMeshSizeMeasureUnitCode` AS `NetMeshSizeMeasureUnitCode`,`activitybio`.`PassCount` AS `PassCount`,`activitybio`.`Pass` AS `Pass`,`activitybio`.`ZoneCount` AS `ZoneCount`,`activitybio`.`Zone` AS `Zone`,`activitybio`.`Amps` AS `Amps`,`activitybio`.`Pulses` AS `Pulses`,`activitybio`.`CollectionEfficiencyEst` AS `CollectionEfficiencyEst`,`activitybio`.`TotalEnergizedMeasure` AS `TotalEnergizedMeasure`,`activitybio`.`TotalEnergizedMeasureUnit` AS `TotalEnergizedMeasureUnit`,`activitybio`.`Volts` AS `Volts`,`activitybio`.`DutyCycle` AS `DutyCycle`,`activitybio`.`createDate` AS `createDate`,`activitybio`.`createUser` AS `createUser`,`activitybio`.`lastUpdateDate` AS `lastUpdateDate`,`activitybio`.`lastUpdateUser` AS `lastUpdateUser` from (`activitybio` join `stations` on((`stations`.`staSeq` = `activitybio`.`staSeq`))) where (`activitybio`.`AssemblageSampledName` = 'Fish/Nekton') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 12:01:13
