
#title: "Compiling and Labeling Multiple Indicator Cluster Survey Data for Training Set"


setwd("C:\\Users\\Esther\\Documents\\GitHub\\MICS_SMDW\\Data_cleaning\\MICS_Preprocessing_Dataframes\\Compiling_MICS_test_and_training_sets")

library(foreign)
library(tidyr)
library(dplyr)
library(tidyverse)
library(haven)
library(surveytoolbox)

source("FunctionsForLabelingHHMICS.R")
source("FunctionsForExtractingVariablesFromMICS.R")

PATH_TO_SURVEYS_TRAINING <- "C:\\Users\\Esther\\Documents\\GitHub\\MICS_SMDW\\Data\\HH_MICS_training"
PATH_TO_SURVEYS_TESTING <- "C:\\Users\\Esther\\Documents\\GitHub\\MICS_SMDW\\Data\\HH_MICS_test"

loadSurveys(PATH_TO_SURVEYS_TRAINING)
loadSurveys(PATH_TO_SURVEYS_TESTING)

#first surveys available
hh_Algeria <- extractStandardSurveyVariables(hh_Algeria)
hh_CentralAfricanRepublic <- extractStandardSurveyVariables(hh_CentralAfricanRepublic)
hh_Chad <- extractStandardSurveyVariables(hh_Chad) 
hh_Gambia <- extractStandardSurveyVariables(hh_Gambia) 
hh_Georgia <- extractStandardSurveyVariables(hh_Georgia)
hh_Ghana <- extractStandardSurveyVariables(hh_Ghana)
hh_GuineaBissau <- extractStandardSurveyVariables(hh_GuineaBissau)
hh_Guyana <- extractStandardSurveyVariables(hh_Guyana)
hh_Iraq <- extractStandardSurveyVariables(hh_Iraq) 
hh_Kiribati <- extractStandardSurveyVariables(hh_Kiribati)
hh_Kosovo <- extractStandardSurveyVariables(hh_Kosovo)
hh_Lao <- extractStandardSurveyVariables(hh_Lao)
hh_Madagascar <- extractStandardSurveyVariables(hh_Madagascar)
hh_Mongolia <- extractStandardSurveyVariables(hh_Mongolia)
hh_PakistanPunjab <- extractStandardSurveyVariables(hh_PakistanPunjab)
hh_Palestine <- extractStandardSurveyVariables(hh_Palestine) 
hh_SaoTome <- extractStandardSurveyVariables(hh_SaoTome)
hh_SierraLeone <- extractStandardSurveyVariables(hh_SierraLeone)
hh_Suriname <- extractStandardSurveyVariables(hh_Suriname)
hh_Togo <- extractStandardSurveyVariables(hh_Togo) 
hh_Tonga <- extractStandardSurveyVariables(hh_Tonga)
hh_Tunisia <- extractStandardSurveyVariables(hh_Tunisia)
hh_Zimbabwe <- extractStandardSurveyVariables(hh_Zimbabwe)

#more recent surveys added at later stage of project
hh_DominicanRepublic <- extractStandardSurveyVariables(hh_DominicanRepublic)
hh_Honduras <- extractStandardSurveyVariables(hh_Honduras)
hh_Malawi <- extractStandardSurveyVariables(hh_Malawi)
hh_Nepal <- extractStandardSurveyVariables(hh_Nepal)
hh_PakistanAzadJammuKashmir <- extractStandardSurveyVariables(hh_PakistanAzadJammuKashmir)
hh_PakistanKhyberPakhtunkhwa <- extractStandardSurveyVariables(hh_PakistanKhyberPakhtunkhwa)
hh_Samoa <- extractStandardSurveyVariables(hh_Samoa)
hh_TurksCaicos <- extractStandardSurveyVariables(hh_TurksCaicos)
hh_VietNam <- extractStandardSurveyVariables(hh_VietNam)



#surveys with slightly different labeling from the others
hh_Bangladesh <- extractVariablesFromBangladesh(hh_Bangladesh)
hh_Lesotho <- extractVariablesFromLesotho(hh_Lesotho)
hh_Nigeria <- extractVariablesFromNigeria(hh_Nigeria)
hh_Paraguay <-extractVariablesFromParaguay(hh_Paraguay)
hh_Tuvalu <- extractVariablesFromTuvalu(hh_Tuvalu)

 
hh_Algeria$country <- "Algeria"
hh_Bangladesh$country <- "Bangladesh"
hh_CentralAfricanRepublic$country <- "Central African Republic"
hh_Chad$country <- "Chad"
hh_Gambia$country <- "Gambia"
hh_Georgia$country <- "Georgia"
hh_Ghana$country <- "Ghana"
hh_GuineaBissau$country <- "GuineaBissau"
hh_Guyana$country <- "Guyana"
hh_Iraq$country <- "Iraq"
hh_Kiribati$country <- "Kiribati"
hh_Kosovo$country <- "Kosovo"
hh_Lao$country <- "Lao"
hh_Lesotho$country <- "Lesotho"
hh_Madagascar$country <- "Madagascar"
hh_Mongolia$country <- "Mongolia"
hh_Nigeria$country <- "Nigeria"
hh_PakistanPunjab$country <- "PakistanPunjab"
hh_Palestine$country <- "Palestine"
hh_Paraguay$country <- "Paraguay"
hh_SaoTome$country <- "SÃ£o TomÃ© and PrÃncipe"
hh_SierraLeone$country <- "SierraLeone"
hh_Suriname$country <- "Suriname"
hh_Togo$country <- "Togo"
hh_Tonga$country <- "Tonga"
hh_Tunisia$country <- "Tunisia"
hh_Zimbabwe$country <- "Zimbabwe"

hh_DominicanRepublic$country <- "Dominican Republic"
hh_Honduras$country <- "Honduras"
hh_Malawi$country <- "Malawi"
hh_Nepal$country <- "Nepal"
hh_PakistanAzadJammuKashmir$country <- "Pakistan Azad Jammu & Kashmir"
hh_PakistanKhyberPakhtunkhwa$country <- "Pakistan Khyber Pakhtunkhwa"
hh_Samoa$country <- "Samoa"
hh_TurksCaicos$country <- "Turks & Caicos"
hh_Tuvalu$country <- "Tuvalu"
hh_VietNam$country <- "Vietnam"


hh_Algeria_HH7extract <- extractVariableLabelsfromHH7(hh_Algeria)
hh_Bangladesh_HH7extract <- extractVariableLabelsfromHH7(hh_Bangladesh)
hh_CentralAfricanRepublic_HH7extract <- extractVariableLabelsfromHH7(hh_CentralAfricanRepublic)
hh_Chad_HH7extract <- extractVariableLabelsfromHH7(hh_Chad)
hh_Gambia_HH7extract <- extractVariableLabelsfromHH7(hh_Gambia)
hh_Georgia_HH7extract <- extractVariableLabelsfromHH7(hh_Georgia)
hh_Ghana_HH7extract <- extractVariableLabelsfromHH7(hh_Ghana)
hh_GuineaBissau_HH7extract <- extractVariableLabelsfromHH7(hh_GuineaBissau)
hh_Guyana_HH7extract <- extractVariableLabelsfromHH7(hh_Guyana)
hh_Iraq_HH7extract <- extractVariableLabelsfromHH7(hh_Iraq)
hh_Kiribati_HH7extract <- extractVariableLabelsfromHH7(hh_Kiribati)
hh_Kosovo_HH7extract <- extractVariableLabelsfromHH7(hh_Kosovo)
hh_Lao_HH7extract <- extractVariableLabelsfromHH7(hh_Lao)
hh_Lesotho_HH7extract <- extractVariableLabelsfromHH7(hh_Lesotho)
hh_Madagascar_HH7extract <- extractVariableLabelsfromHH7(hh_Madagascar)
hh_Mongolia_HH7extract <- extractVariableLabelsfromHH7(hh_Mongolia)
hh_Nigeria_HH7extract <- extractVariableLabelsfromHH7(hh_Nigeria)
hh_PakistanPunjab_HH7extract <- extractVariableLabelsfromHH7(hh_PakistanPunjab)
hh_Palestine_HH7extract <- extractVariableLabelsfromHH7(hh_Palestine)
hh_Paraguay_HH7extract <- extractVariableLabelsfromHH7(hh_Paraguay)
hh_SaoTome_HH7extract <- extractVariableLabelsfromHH7(hh_Bangladesh)
hh_SierraLeone_HH7extract <- extractVariableLabelsfromHH7(hh_SierraLeone)
hh_Suriname_HH7extract <- extractVariableLabelsfromHH7(hh_Suriname)
hh_Togo_HH7extract <- extractVariableLabelsfromHH7(hh_Togo)
hh_Tonga_HH7extract <- extractVariableLabelsfromHH7(hh_Tonga)
hh_Tunisia_HH7extract <- extractVariableLabelsfromHH7(hh_Tunisia)
hh_Zimbabwe_HH7extract <- extractVariableLabelsfromHH7(hh_Zimbabwe)

hh_DominicanRepublic_HH7extract <- extractVariableLabelsfromHH7(hh_DominicanRepublic)
hh_Honduras_HH7extract <- extractVariableLabelsfromHH7(hh_Honduras)
hh_Malawi_HH7extract <- extractVariableLabelsfromHH7(hh_Malawi)
hh_Nepal_HH7extract <- extractVariableLabelsfromHH7(hh_Nepal)
hh_PakistanAzadJammuKashmir_HH7extract <- extractVariableLabelsfromHH7(hh_PakistanAzadJammuKashmir)
hh_PakistanKhyberPakhtunkhwa_HH7extract <- extractVariableLabelsfromHH7(hh_PakistanKhyberPakhtunkhwa)
hh_Samoa_HH7extract <- extractVariableLabelsfromHH7(hh_Samoa)
hh_TurksCaicos_HH7extract <- extractVariableLabelsfromHH7(hh_TurksCaicos)
hh_Tuvalu_HH7extract <- extractVariableLabelsfromHH7(hh_Tuvalu)
hh_VietNam_HH7extract <- extractVariableLabelsfromHH7(hh_VietNam)

hh_Algeria_HH7extract$id <- as.factor(hh_Algeria_HH7extract$id)
hh_Bangladesh_HH7extract$id <- as.factor(hh_Bangladesh_HH7extract$id)
hh_CentralAfricanRepublic_HH7extract$id <- as.factor(hh_CentralAfricanRepublic_HH7extract$id)
hh_Chad_HH7extract$id <- as.factor(hh_Chad_HH7extract$id)
hh_Gambia_HH7extract$id <- as.factor(hh_Gambia_HH7extract$id)
hh_Georgia_HH7extract$id <- as.factor(hh_Georgia_HH7extract$id)
hh_Ghana_HH7extract$id <- as.factor(hh_Ghana_HH7extract$id)
hh_GuineaBissau_HH7extract$id <- as.factor(hh_GuineaBissau_HH7extract$id)
hh_Guyana_HH7extract$id <- as.factor(hh_Guyana_HH7extract$id)
hh_Iraq_HH7extract$id <- as.factor(hh_Iraq_HH7extract$id)
hh_Kiribati_HH7extract$id <- as.factor(hh_Kiribati_HH7extract$id)
hh_Kosovo_HH7extract$id <- as.factor(hh_Kosovo_HH7extract$id)
hh_Lao_HH7extract$id <- as.factor(hh_Lao_HH7extract$id)
hh_Lesotho_HH7extract$id <- as.factor(hh_Lesotho_HH7extract$id)
hh_Madagascar_HH7extract$id <- as.factor(hh_Madagascar_HH7extract$id)
hh_Mongolia_HH7extract$id <- as.factor(hh_Mongolia_HH7extract$id)
hh_Nigeria_HH7extract$id <- as.factor(hh_Nigeria_HH7extract$id)
hh_PakistanPunjab_HH7extract$id <- as.factor(hh_PakistanPunjab_HH7extract$id)
hh_Palestine_HH7extract$id <- as.factor(hh_Palestine_HH7extract$id)
hh_Paraguay_HH7extract$id <- as.factor(hh_Paraguay_HH7extract$id)
hh_SaoTome_HH7extract$id <- as.factor(hh_SaoTome_HH7extract$id)
hh_SierraLeone_HH7extract$id <- as.factor(hh_SierraLeone_HH7extract$id)
hh_Suriname_HH7extract$id <- as.factor(hh_Suriname_HH7extract$id)
hh_Togo_HH7extract$id <- as.factor(hh_Togo_HH7extract$id)
hh_Tonga_HH7extract$id <- as.factor(hh_Tonga_HH7extract$id)
hh_Tunisia_HH7extract$id <- as.factor(hh_Tunisia_HH7extract$id)
hh_Zimbabwe_HH7extract$id <- as.factor(hh_Zimbabwe_HH7extract$id)

hh_DominicanRepublic_HH7extract$id <- as.factor(hh_DominicanRepublic_HH7extract$id)
hh_Honduras_HH7extract$id <- as.factor(hh_Honduras_HH7extract$id)
hh_Malawi_HH7extract$id <- as.factor(hh_Malawi_HH7extract$id)
hh_Nepal_HH7extract$id <- as.factor(hh_Nepal_HH7extract$id)
hh_PakistanAzadJammuKashmir_HH7extract$id <- as.factor(hh_PakistanAzadJammuKashmir_HH7extract$id)
hh_PakistanKhyberPakhtunkhwa_HH7extract$id <- as.factor(hh_PakistanKhyberPakhtunkhwa_HH7extract$id)
hh_Samoa_HH7extract$id <- as.factor(hh_Samoa_HH7extract$id)
hh_TurksCaicos_HH7extract$id <- as.factor(hh_TurksCaicos_HH7extract$id)
hh_Tuvalu_HH7extract$id <- as.factor(hh_Tuvalu_HH7extract$id)
hh_VietNam_HH7extract$id <- as.factor(hh_VietNam_HH7extract$id)


hh_Algeria <- replaceHH7LabelsWithRegionNames(hh_Algeria,hh_Algeria_HH7extract)
hh_Bangladesh <- replaceHH7LabelsWithRegionNames(hh_Bangladesh,hh_Bangladesh_HH7extract)
hh_CentralAfricanRepublic <- replaceHH7LabelsWithRegionNames(hh_CentralAfricanRepublic,hh_CentralAfricanRepublic_HH7extract)
hh_Chad <- replaceHH7LabelsWithRegionNames(hh_Chad,hh_Chad_HH7extract)
hh_Gambia <- replaceHH7LabelsWithRegionNames(hh_Gambia,hh_Gambia_HH7extract)
hh_Georgia <- replaceHH7LabelsWithRegionNames(hh_Georgia,hh_Georgia_HH7extract)
hh_Ghana <- replaceHH7LabelsWithRegionNames(hh_Ghana,hh_Ghana_HH7extract)
hh_GuineaBissau <- replaceHH7LabelsWithRegionNames(hh_GuineaBissau,hh_GuineaBissau_HH7extract)
hh_Guyana <- replaceHH7LabelsWithRegionNames(hh_Guyana,hh_Guyana_HH7extract)
hh_Iraq <- replaceHH7LabelsWithRegionNames(hh_Iraq,hh_Iraq_HH7extract)
hh_Kiribati <- replaceHH7LabelsWithRegionNames(hh_Kiribati,hh_Kiribati_HH7extract)
hh_Kosovo <- replaceHH7LabelsWithRegionNames(hh_Kosovo,hh_Kosovo_HH7extract)
hh_Lao <- replaceHH7LabelsWithRegionNames(hh_Lao,hh_Lao_HH7extract)
hh_Lesotho <- replaceHH7LabelsWithRegionNames(hh_Lesotho,hh_Lesotho_HH7extract)
hh_Madagascar <- replaceHH7LabelsWithRegionNames(hh_Madagascar,hh_Madagascar_HH7extract)
hh_Mongolia <- replaceHH7LabelsWithRegionNames(hh_Mongolia,hh_Mongolia_HH7extract)
hh_Nigeria <- replaceHH7LabelsWithRegionNames(hh_Nigeria,hh_Nigeria_HH7extract)
hh_PakistanPunjab <- replaceHH7LabelsWithRegionNames(hh_PakistanPunjab,hh_PakistanPunjab_HH7extract)
hh_Palestine <- replaceHH7LabelsWithRegionNames(hh_Palestine,hh_Palestine_HH7extract)
hh_Paraguay <- replaceHH7LabelsWithRegionNames(hh_Paraguay,hh_Paraguay_HH7extract)
hh_SaoTome <- replaceHH7LabelsWithRegionNames(hh_SaoTome,hh_SaoTome_HH7extract)
hh_SierraLeone <- replaceHH7LabelsWithRegionNames(hh_SierraLeone,hh_SierraLeone_HH7extract)
hh_Suriname <- replaceHH7LabelsWithRegionNames(hh_Suriname,hh_Suriname_HH7extract)
hh_Togo <- replaceHH7LabelsWithRegionNames(hh_Togo,hh_Togo_HH7extract)
hh_Tonga <- replaceHH7LabelsWithRegionNames(hh_Tonga,hh_Tonga_HH7extract)
hh_Tunisia <- replaceHH7LabelsWithRegionNames(hh_Tunisia,hh_Tunisia_HH7extract)
hh_Zimbabwe <- replaceHH7LabelsWithRegionNames(hh_Zimbabwe,hh_Zimbabwe_HH7extract)

hh_DominicanRepublic <- replaceHH7LabelsWithRegionNames(hh_DominicanRepublic,hh_DominicanRepublic_HH7extract)
hh_Honduras <- replaceHH7LabelsWithRegionNames(hh_Honduras,hh_Honduras_HH7extract)
hh_Malawi <- replaceHH7LabelsWithRegionNames(hh_Malawi,hh_Malawi_HH7extract)
hh_Nepal <- replaceHH7LabelsWithRegionNames(hh_Nepal,hh_Nepal_HH7extract)
hh_PakistanAzadJammuKashmir <- replaceHH7LabelsWithRegionNames(hh_PakistanAzadJammuKashmir,hh_PakistanAzadJammuKashmir_HH7extract)
hh_PakistanKhyberPakhtunkhwa <- replaceHH7LabelsWithRegionNames(hh_PakistanKhyberPakhtunkhwa,hh_PakistanKhyberPakhtunkhwa_HH7extract)
hh_Samoa <- replaceHH7LabelsWithRegionNames(hh_Samoa,hh_Samoa_HH7extract)
hh_TurksCaicos <- replaceHH7LabelsWithRegionNames(hh_TurksCaicos,hh_TurksCaicos_HH7extract)
hh_Tuvalu <- replaceHH7LabelsWithRegionNames(hh_Tuvalu,hh_Tuvalu_HH7extract)
hh_VietNam <- replaceHH7LabelsWithRegionNames(hh_VietNam,hh_VietNam_HH7extract)


df.MICS.SMDW_37_Surveys <- rbind(hh_Algeria, hh_Bangladesh, hh_Chad,hh_Gambia, 
                       hh_CentralAfricanRepublic, hh_Georgia, hh_Ghana, 
                       hh_GuineaBissau, hh_Guyana, hh_Iraq, hh_Kiribati, hh_Kosovo, 
                       hh_Lao, hh_Lesotho, hh_Madagascar, hh_Mongolia, 
                       hh_Nigeria, hh_PakistanPunjab,  hh_Palestine, 
                       hh_Paraguay, hh_SaoTome, hh_SierraLeone, hh_Suriname, 
                       hh_Togo,  hh_Tonga, hh_Tunisia, hh_Zimbabwe, hh_DominicanRepublic, 
                       hh_Honduras, hh_Malawi, hh_Nepal, hh_PakistanAzadJammuKashmir,
                       hh_PakistanKhyberPakhtunkhwa, hh_Samoa, hh_TurksCaicos,
                       hh_Tuvalu, hh_VietNam)
                        
                       
df.MICS.SMDW_37_Surveys$WS7 <- as.character(df.MICS.SMDW_37_Surveys$WS7)
df.MICS.SMDW_37_Surveys$WS8 <- as.character(df.MICS.SMDW_37_Surveys$WS8)

df.MICS.SMDW_37_SurveysLabeled <- relabelingSurveyQuestionResponses(df.MICS.SMDW_37_Surveys,WS1,WS2,WS3,WS4,WS7,WS8,WQ27)


write.csv(df.MICS.SMDW_37_SurveysLabeled, "df_MICS_SMDW_37_Surveys.csv", fileEncoding = "UTF-8", row.names = F)
