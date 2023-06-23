
#title: "Compiling and Labeling Multiple Indicator Cluster Survey Data for Training Set"


setwd("~\\GitHub\\mapping-safe-drinking-water-use-LMICs\\Data_cleaning\\MICS_Preprocessing_Dataframes\\Compiling_MICS_test_and_training_sets")

library(foreign)
library(tidyr)
library(dplyr)

source("FunctionsForLabelingHHMICS.R")
source("FunctionsForExtractingVariablesFromMICS.R")

PATH_TO_SURVEYS_TRAINING <- "~\\GitHub\\mapping-safe-drinking-water-use-LMICs\\Data\\HH_MICS_training"
PATH_TO_NEWEST_SURVEYS_TRAINING <- "~\\GitHub\\mapping-safe-drinking-water-use-LMICs\\Data\\HH_MICS_new_training"
loadSurveys(PATH_TO_SURVEYS_TRAINING)
loadSurveys(PATH_TO_NEWEST_SURVEYS_TRAINING)

#Creating Variable with Country name
hh_Algeria$country <- "Algeria"
hh_Bangladesh$country <- "Bangladesh"
hh_CentralAfricanRepublic$country <- "Central African Republic"
hh_Chad$country <- "Chad"
hh_Gambia$country <- "Gambia"
hh_Georgia$country <- "Georgia"
hh_Ghana$country <- "Ghana"
hh_GuineaBissau$country <- "Guinea Bissau"
hh_Guyana$country <- "Guyana"
hh_Iraq$country <- "Iraq"
hh_Kiribati$country <- "Kiribati"
hh_Kosovo$country <- "Kosovo"
hh_Lao$country <- "Lao"
hh_Lesotho$country <- "Lesotho"
hh_Madagascar$country <- "Madagascar"
hh_Mongolia$country <- "Mongolia"
hh_Nigeria$country <- "Nigeria"
hh_PakistanPunjab$country <- "Pakistan"
hh_Palestine$country <- "Palestine"
hh_Paraguay$country <- "Paraguay"
hh_SaoTome$country <- "Sao Tome and Principe"
hh_SierraLeone$country <- "Sierra Leone"
hh_Suriname$country <- "Suriname"
hh_Togo$country <- "Togo"
hh_Tonga$country <- "Tonga"
hh_Tunisia$country <- "Tunisia"
hh_Zimbabwe$country <- "Zimbabwe"

hh_DominicanRepublic$country <- "Dominican Republic"
hh_Honduras$country <- "Honduras"
hh_Malawi$country <- "Malawi"
hh_Nepal$country <- "Nepal"
hh_PakistanAzadJammuKashmir$country <- "Pakistan"
hh_PakistanKhyberPakhtunkhwa$country <- "Pakistan"
hh_Samoa$country <- "Samoa"
hh_TurksCaicos$country <- "Turks & Caicos"
hh_Tuvalu$country <- "Tuvalu"
hh_VietNam$country <- "Vietnam"

#first surveys available
hh_Algeria_SMDW <- extractStandardSurveyVariables(hh_Algeria)
hh_CentralAfricanRepublic_SMDW <- extractStandardSurveyVariables(hh_CentralAfricanRepublic)
hh_Chad_SMDW <- extractStandardSurveyVariables(hh_Chad) 
hh_Gambia_SMDW <- extractStandardSurveyVariables(hh_Gambia) 
hh_Georgia_SMDW <- extractStandardSurveyVariables(hh_Georgia)
hh_Ghana_SMDW <- extractStandardSurveyVariables(hh_Ghana)
hh_GuineaBissau_SMDW <- extractStandardSurveyVariables(hh_GuineaBissau)
hh_Guyana_SMDW <- extractStandardSurveyVariables(hh_Guyana)
hh_Iraq_SMDW <- extractStandardSurveyVariables(hh_Iraq) 
hh_Kiribati_SMDW <- extractStandardSurveyVariables(hh_Kiribati)
hh_Kosovo_SMDW <- extractStandardSurveyVariables(hh_Kosovo)
hh_Lao_SMDW <- extractStandardSurveyVariables(hh_Lao)
hh_Madagascar_SMDW <- extractStandardSurveyVariables(hh_Madagascar)
hh_Mongolia_SMDW <- extractStandardSurveyVariables(hh_Mongolia)
hh_PakistanPunjab_SMDW <- extractStandardSurveyVariables(hh_PakistanPunjab)
hh_Palestine_SMDW <- extractStandardSurveyVariables(hh_Palestine) 
hh_SaoTome_SMDW <- extractStandardSurveyVariables(hh_SaoTome)
hh_SierraLeone_SMDW <- extractStandardSurveyVariables(hh_SierraLeone)
hh_Suriname_SMDW <- extractStandardSurveyVariables(hh_Suriname)
hh_Togo_SMDW <- extractStandardSurveyVariables(hh_Togo) 
hh_Tonga_SMDW <- extractStandardSurveyVariables(hh_Tonga)
hh_Tunisia_SMDW <- extractStandardSurveyVariables(hh_Tunisia)
hh_Zimbabwe_SMDW <- extractStandardSurveyVariables(hh_Zimbabwe)

#first surveys available with some different variable naming
hh_Bangladesh_SMDW <- extractVariablesFromBangladesh(hh_Bangladesh)
hh_Lesotho_SMDW <- extractVariablesFromLesotho(hh_Lesotho)
hh_Nigeria_SMDW <- extractVariablesFromNigeria(hh_Nigeria)
hh_Paraguay_SMDW <-extractVariablesFromParaguay(hh_Paraguay)

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

#more recent surveys added at later stage of project with some different variable naming
hh_Tuvalu <- extractVariablesFromTuvalu(hh_Tuvalu)


df_first_MICS <- rbind( hh_Algeria, hh_Bangladesh, hh_Chad,hh_Gambia, 
                       hh_CentralAfricanRepublic, hh_Georgia, hh_Ghana, 
                       hh_GuineaBissau, hh_Guyana, hh_Iraq, hh_Kiribati, hh_Kosovo, 
                       hh_Lao, hh_Lesotho, hh_Madagascar, hh_Mongolia, 
                       hh_Nigeria, hh_PakistanPunjab, hh_Palestine, 
                       hh_Paraguay, hh_SaoTome, hh_SierraLeone, hh_Suriname, 
                       hh_Togo, hh_Tonga, hh_Tunisia, hh_Zimbabwe)

df_later_MICS <- rbind(hh_DominicanRepublic, 
                           hh_Honduras, hh_Malawi, hh_Nepal, hh_PakistanAzadJammuKashmir,
                           hh_PakistanKhyberPakhtunkhwa, hh_Samoa, hh_TurksCaicos,
                           hh_Tuvalu, hh_VietNam)

df_first_MICS <- allVariablesAsCharacter(df.first.MICS)
df_first_MICSLabeled <-labelingSurveyVariableResponses(df.first.MICS)

df_later_MICS$WS7 <- as.character(df.later.MICS$WS7)
df_later_MICS$WS8 <- as.character(df.later.MICS$WS8)

df_later_MICSLabeled <- relabelingSurveyQuestionResponses(df.MICS.SMDW_test,WS1,WS2,WS3,WS4,WS7,WS8,WQ27)




write.csv(df.MICS.SMDW, "df_MICS_SMDW.csv", fileEncoding = "UTF-8", row.names = F)
