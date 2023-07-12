# mapping-safe-drinking-water-use-LMICs

Here we explore environmental and anthropogenic covariates driving the spatial variation in safely managed drinking water services (SMDWs), and generate a global map of subnational (GADM version 3.6) estimates of SMDWs use across 135 low- and middle-income countries. Further, we determine the subcomponents limiting use of SMDWs around the world. 

This repository includes "1_Data" as well as code for "2_Data_cleaning", "3_Feature_Selection", "4_Training", and "5_Prediction" of SMDWs and its constituent subcomponents. Names of files describe their contents. We suggest you follow the order of the file and document numbering starting at "2_Data_cleaning/3_MICS_Preprocessing/Dataframes" as we provide a data frame with all the processed environmental features in "1_Data/EnvironmentalFeatures". 


 In order to reproduce our results you will need to download the following data (we have added the date we downloaded the data incase there have been changes since):


1) MICS household data

MICS household (HH) datasets were downloaded from https://mics.unicef.org/surveys between 16.09.2019 and 02.02.2023 as they became available. We suggest renaming the files you use as hh_Countryname to be compatable with our code.

2) UN Population Division Names

Country Names and codes extracted from World Population Prospects Demographic Indicator file from 2022 ("WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.csv") downloaded from https://population.un.org/wpp/Download/Standard/MostUsed/ on 13.03.2022

3) Word Bank Country Income Groups

Downloaded on 10.02.2022 from https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups 

4) JMP estimates for 2020

Downloaded from https://washdata.org/data/downloads on 11.07.2022.

5) UNSD Methodology for Global Regions

Downloaded from https://unstats.un.org/unsd/methodology/m49/overview/ on 14.07.2022

