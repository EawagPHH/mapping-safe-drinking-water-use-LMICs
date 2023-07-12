#title: "Compiling and Labeling Multiple Indicator Cluster Survey Data for Testing Set"

setwd("~GitHub\\mapping-safe-drinking-water-use-LMICs\\Data_cleaning\\MICS_Preprocessing_Dataframes\\Compiling_MICS_test_and_training_sets")

library(foreign)
library(tidyr)
library(dplyr)
library(tidyverse)
library(haven)
library(surveytoolbox)


source("FunctionsForLabelingHHMICS.R")
source("FunctionsForExtractingVariablesFromMICS.R")

PATH_TO_SURVEYS_TESTING <- "~/GitHub/mapping-safe-drinking-water-use-LMICs/Data/HH_MICS_test"

loadSurveys(PATH_TO_SURVEYS_TESTING)

hh_Congo$country <- "Congo"
hh_DominicanRepublic$country <- "Dominican Republic"
hh_Fiji$country <- "Fiji"
hh_Malawi$country <- "Malawi"
hh_Nepal$country <- "Nepal"
hh_Samoa$country <- "Samoa" 
hh_VietNam$country <- "Vietnam"

#hh_Cote_dIvoire$country <- "Cote d'Ivoire"# left out because too old (MICS5- 2016)
#hh_Honduras$country <- "Honduras" #left out because brings the test set out of balance regarding UN region and Income Group Distribution
#hh_PakistanKhyberPakhtunkhwa$country <- "Pakistan Khyber Pakhtunkhwa" #was hard to match at GADM level 1
#hh_PakistanBalochistan$country <- "Pakistan Balochistan" #was hard to match at GADM level 1
#hh_Tuvalu$country <- "Tuvalu" #left out because brings the test set out of balance regarding UN region and Income Group Distribution


hh_DominicanRepublic <- extractStandardSurveyVariables(hh_DominicanRepublic)
hh_Fiji <- extractStandardSurveyVariables(hh_Fiji)
#hh_Honduras <- extractStandardSurveyVariables(hh_Honduras)
hh_Malawi <- extractStandardSurveyVariables(hh_Malawi)
hh_Nepal <- extractStandardSurveyVariables(hh_Nepal)
#hh_PakistanKhyberPakhtunkhwa <- extractStandardSurveyVariables(hh_PakistanKhyberPakhtunkhwa)
#hh_PakistanBalochistan <- extractStandardSurveyVariables(hh_PakistanBalochistan)
hh_Samoa <- extractStandardSurveyVariables(hh_Samoa)
#hh_Tuvalu <- extractVariablesFromTuvalu(hh_Tuvalu)
hh_VietNam <- extractStandardSurveyVariables(hh_VietNam)

hh_Congo <- extractVariablesFromCongo(hh_Congo)#no data on water availability
#hh_Cote_dIvoire <- extractVariablesFromCote_dIvoire(hh_Cote_dIvoire)#no data on water availability

#extracting region names from survey data
hh_Congo_HH7extract <- extractVariableLabelsfromHH7(hh_Congo)
hh_DominicanRepublic_HH7extract <- extractVariableLabelsfromHH7(hh_DominicanRepublic)
hh_Fiji_HH7extract <- extractVariableLabelsfromHH7(hh_Fiji)
#hh_Honduras_HH7extract <- extractVariableLabelsfromHH7(hh_Honduras)
hh_Malawi_HH7extract <- extractVariableLabelsfromHH7(hh_Malawi)
hh_Nepal_HH7extract <- extractVariableLabelsfromHH7(hh_Nepal)
#hh_PakistanBalochistan_HH7extract <- extractVariableLabelsfromHH7(hh_PakistanBalochistan)
#hh_PakistanKhyberPakhtunkhwa_HH7extract <- extractVariableLabelsfromHH7(hh_PakistanKhyberPakhtunkhwa)
hh_Samoa_HH7extract <- extractVariableLabelsfromHH7(hh_Samoa)
#hh_Tuvalu_HH7extract <- extractVariableLabelsfromHH7(hh_Tuvalu)
hh_VietNam_HH7extract <- extractVariableLabelsfromHH7(hh_VietNam)

#hh_Cote_dIvoire_HH7extract <- extractVariableLabelsfromHH7(hh_Cote_dIvoire)

#checking for any new labels in WS1. These should correspond with those described in "FunctionsForLabelingHHMICS.R"
hh_DominicanRepublic_WS1extract <- extractVariableLabelsfromWS1(hh_DominicanRepublic)
hh_Fiji_WS1extract <- extractVariableLabelsfromWS1(hh_Fiji)
#hh_Honduras_WS1extract <- extractVariableLabelsfromWS1(hh_Honduras)
hh_Malawi_WS1extract <- extractVariableLabelsfromWS1(hh_Malawi)
hh_Nepal_WS1extract <- extractVariableLabelsfromWS1(hh_Nepal)
#hh_PakistanBalochistan_WS1extract <- extractVariableLabelsfromWS1(hh_PakistanBalochistan)
#hh_PakistanKhyberPakhtunkhwa_WS1extract <- extractVariableLabelsfromWS1(hh_PakistanKhyberPakhtunkhwa)
hh_Samoa_WS1extract <- extractVariableLabelsfromWS1(hh_Samoa)
#hh_Tuvalu_WS1extract <- extractVariableLabelsfromWS1(hh_Tuvalu)
hh_VietNam_WS1extract <- extractVariableLabelsfromWS1(hh_VietNam)


hh_Congo_HH7extract$id <- as.factor(hh_Congo_HH7extract$id)
#hh_Cote_dIvoire_HH7extract$id <- as.factor(hh_Cote_dIvoire_HH7extract$id)
hh_DominicanRepublic_HH7extract$id <- as.factor(hh_DominicanRepublic_HH7extract$id)
hh_Fiji_HH7extract$id <- as.factor(hh_Fiji_HH7extract$id)
#hh_Honduras_HH7extract$id <- as.factor(hh_Honduras_HH7extract$id)
hh_Malawi_HH7extract$id <- as.factor(hh_Malawi_HH7extract$id)
hh_Nepal_HH7extract$id <- as.factor(hh_Nepal_HH7extract$id)
#hh_PakistanBalochistan_HH7extract$id <- as.factor(hh_PakistanBalochistan_HH7extract$id)
#hh_PakistanKhyberPakhtunkhwa_HH7extract$id <- as.factor(hh_PakistanKhyberPakhtunkhwa_HH7extract$id)
hh_Samoa_HH7extract$id <- as.factor(hh_Samoa_HH7extract$id)
#hh_Tuvalu_HH7extract$id <- as.factor(hh_Tuvalu_HH7extract$id)
hh_VietNam_HH7extract$id <- as.factor(hh_VietNam_HH7extract$id)

hh_Congo <- replaceHH7LabelsWithRegionNames(hh_Congo,hh_Congo_HH7extract)
#hh_Cote_dIvoire <- replaceHH7LabelsWithRegionNames(hh_Cote_dIvoire,hh_Cote_dIvoire_HH7extract)
hh_DominicanRepublic <- replaceHH7LabelsWithRegionNames(hh_DominicanRepublic,hh_DominicanRepublic_HH7extract)
hh_Fiji <- replaceHH7LabelsWithRegionNames(hh_Fiji,hh_Fiji_HH7extract)
#hh_Honduras <- replaceHH7LabelsWithRegionNames(hh_Honduras,hh_Honduras_HH7extract)
hh_Malawi <- replaceHH7LabelsWithRegionNames(hh_Malawi,hh_Malawi_HH7extract)
hh_Nepal <- replaceHH7LabelsWithRegionNames(hh_Nepal,hh_Nepal_HH7extract)
#hh_PakistanBalochistan <- replaceHH7LabelsWithRegionNames(hh_PakistanBalochistan,hh_Balochistan_HH7extract)
#hh_PakistanKhyberPakhtunkhwa <- replaceHH7LabelsWithRegionNames(hh_PakistanKhyberPakhtunkhwa,hh_PakistanKhyberPakhtunkhwa_HH7extract)
hh_Samoa <- replaceHH7LabelsWithRegionNames(hh_Samoa,hh_Samoa_HH7extract)
#hh_Tuvalu <- replaceHH7LabelsWithRegionNames(hh_Tuvalu,hh_Tuvalu_HH7extract)
hh_VietNam <- replaceHH7LabelsWithRegionNames(hh_VietNam,hh_VietNam_HH7extract)

hh_Congo <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Congo)
#hh_Cote_dIvoire <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Cote_dIvoire)
hh_DominicanRepublic <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_DominicanRepublic)
hh_Fiji <- VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Fiji)
#hh_Honduras <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Honduras)
hh_Malawi <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Malawi)
hh_Nepal <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Nepal)
#hh_PakistanBalochistan <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_PakistanBalochistan)
#hh_PakistanKhyberPakhtunkhwa <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_PakistanKhyberPakhtunkhwa)
hh_Samoa <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Samoa)
#hh_Tuvalu <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_Tuvalu)
hh_VietNam <-VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(hh_VietNam)


df.MICS.SMDW_test <- rbind(hh_Congo, hh_DominicanRepublic, hh_Fiji, 
                            hh_Malawi, hh_Nepal, hh_Samoa, hh_VietNam)

df.MICS.SMDW_test$WS7 <- as.character(df.MICS.SMDW_test$WS7)
df.MICS.SMDW_test$WS8 <- as.character(df.MICS.SMDW_test$WS8)

df.MICS.SMDW_testLabeled <- relabelingSurveyQuestionResponses(df.MICS.SMDW_test,WS1,WS2,WS3,WS4,WS7,WS8,WQ27)

write.csv(df.MICS.SMDW_testLabeled, "df_SMDW_test_final.csv", fileEncoding = "UTF-8", row.names = F)

