setwd("C:/Users/deepuser/Desktop/DPH_BacteriaData_031422")

### function to update data ####################################################
# df = dataframe of DPH bacteria data 
# coln = column name to check / query for update 
# colu = column to update
# cval = value to check / query for update
# uval = updated value

update_data <-  function(df,coln,colu,cval,uval){
  df[grep(cval,df[,coln]),colu] <- uval
  return(df)
}

### read in data ###############################################################

bact <- read.csv("Bacteria_Results_2020.csv", header = TRUE)
# import direct from DB when on the network - update code here
actv <- read.csv("activitychem_bacteria_2020.csv", header = TRUE)
actv <- unique(actv[c("ActivityIdentifier","LabAccession")])
colnames(actv)[2] <- "lab_accession"

### checks #####################################################################

unique(bact$characterisitic_name) # should include Enterococcus & E. coli only

bdet <- bact[grep("<",bact$value),c("value","result_detection_condition")]
unique(bdet$result_detection_condition)

adet <- bact[grep(">",bact$value),c("value","result_detection_condition")]
unique(adet$result_detection_condition)

unique(bact$UOM)


### run updates ################################################################

bact <- update_data(bact,"characterisitic_name","characterisitic_name",
                    "E. coli","Escherichia coli")

# make sure to update these first before values
bact <- update_data(bact,"value","result_detection_condition",
                    ">","Present Above Quantification Limit")
bact <- update_data(bact,"value","result_detection_condition",
                    "<","Not Detected")

bact <- update_data(bact,"value","value",
                    "<","")
bact <- update_data(bact,"value","value",
                    ">","")

bact$method_number <- ifelse(bact$characterisitic_name == "Enterococcus",
                             "ENTEROLERT","COLILERT")

### merge and add in needed values for WQX #####################################
bact <- merge(bact,actv, by = "lab_accession")

bact$resultvaluetype  <- "Actual"
bact$Rslt_status      <- "Final"
bact$method_context   <- "IDEXX"
bact$UOM              <- "MPN/100ml"
bact$DetectionQuantitationTypeName <- "Practical Quantitation Limit"
bact$MDL <- 10
bact$DetectionQuantitationTypeNameUOM <- "MPN/100ml"
bact$methodSpeciationName <- ""
bact$analysis_start_date <- as.character(bact$analysis_start_date)

### reorder cols and rename then export for awX upload #########################

bact <- bact[,c(16,1:4,17,7,18,8,21,9,12,6,5,19,11,20)]

colnames(bact) <- c("ActivityIdentifier",	
                    "lab_accession",	
                      "characteristic_name",	
                      "value",	
                      "UOM",	
                      "resultvaluetype",	
                      "analysis_start_date",	
                      "Rslt_status",	
                      "comment",	
                      "methodSpeciationName",	
                      "result_detection_condition",	
                      "sample_fraction",	
                      "method_number",	
                      "method_context",	
                      "DetectionQuantitationTypeName",	
                      "MDL",	
                      "DetectionQuantitationTypeNameUOM")

write.csv(bact,"ChemResults_DPH_Bacteria_2020.csv",row.names=FALSE)









