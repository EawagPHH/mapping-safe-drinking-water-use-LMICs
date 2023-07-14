
#title: "Compiling and Labeling Multiple Indicator Cluster Survey Data for Training Set"

library(foreign)
library(tidyr)
library(dplyr)

source("./2_Data_cleaning/3_MICS_Preprocessing_Dataframes/1_Compiling_MICS_test_and_training_sets/FunctionsForLabelingHHMICS.R")
source("./2_Data_cleaning/3_MICS_Preprocessing_Dataframes/1_Compiling_MICS_test_and_training_sets/FunctionsForExtractingVariablesFromMICS.R")

PATH_TO_SURVEYS_TRAINING <- "~/switchdrive/PHD-2020-2024/SMDWs submission/Data_for_reviewers/HH_MICS_training"
loadSurveys(PATH_TO_SURVEYS_TRAINING)

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
hh_PakistanAzadJammuKashmir$country <- "Pakistan"


#surveys available
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


df.first_MICS <- rbind( hh_Algeria_SMDW, hh_Bangladesh_SMDW, hh_Chad_SMDW,hh_Gambia_SMDW, 
                       hh_CentralAfricanRepublic_SMDW, hh_Georgia_SMDW, hh_Ghana_SMDW, 
                       hh_GuineaBissau_SMDW, hh_Guyana_SMDW, hh_Iraq_SMDW, hh_Kiribati_SMDW, hh_Kosovo_SMDW, 
                       hh_Lao_SMDW, hh_Lesotho_SMDW, hh_Madagascar_SMDW, hh_Mongolia_SMDW, 
                       hh_Nigeria_SMDW, hh_PakistanPunjab_SMDW, hh_Palestine_SMDW, 
                       hh_Paraguay_SMDW, hh_SaoTome_SMDW, hh_SierraLeone_SMDW, hh_Suriname_SMDW, 
                       hh_Togo_SMDW, hh_Tonga_SMDW, hh_Tunisia_SMDW, hh_Zimbabwe_SMDW)

df.first_MICS <- as.data.frame(do.call(cbind, df.first_MICS))

df.first_MICS <- VariablesWhichWereFactorsAsCharacterToAvoidGenerationOfNA(df.first_MICS)
df.first_MICSLabeled <-labelingSurveyVariableResponses(as.data.frame(df.first_MICS))


#write.csv(df.first_MICSLabeled, "df_MICS_SMDW.csv", fileEncoding = "UTF-8", row.names = F)
