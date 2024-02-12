# mapping-safe-drinking-water-use-LMICs

## Summary

Here we explore environmental and anthropogenic covariates driving the spatial variation in safely managed drinking water services (SMDWs), and generate a global map of subnational (GADM version 3.6) estimates of SMDWs use across 135 low- and middle-income countries. Further, we determine the subcomponents limiting use of SMDWs around the world.

This repository includes "1_Data" as well as code for "2_Data_cleaning", "3_Feature_selection", "4_Training", and "5_Predictions" of SMDWs and its constituent subcomponents. We provide processed versions of the Earth Observation (EO) data in "1_Data/EnvironmentalFeatures" and share the code for the process we used in 2_Data_cleaning/1_SamplingEnvironmentalFeatures/ and 2_Data_cleaning/2_EO_matching_names_and_combining_files/ for users to understand how we produced it. If you use the EO data from the data frame we provide you need to cite the data sources which are listed in Data S1 of the Auxiliary Supplemental Material of the Paper "Mapping Safely Managed Drinking Water in Low and Middle Income Countries".

## Where to start?

Once you have cloned the repository from Github, we recommend you open the project "MICS_SMDW.Rproj" and run "renv::restore()" to make sure you have all the packages installed which are needed. If you are a reviewer or other person who has been given access to the combined and cleaned survey data frame "df_MICS_SMDW_250222.csv" on our swithchdrive folder we suggest you go straight to "4_Training" to run the main models. If you have not been given access to the survey data but would like to reproduce our results you will need to download the MICS household survey data from the website cited below and compile the training and test data set yourself.The code for this can be found in "2_Data_cleaning/MICS_Preprocessing_Dataframes/1_Compiling_MICS_test_and_training_sets".

## Information about data sets used in this study:

1)  MICS household (HH) datasets were downloaded from <https://mics.unicef.org/surveys> between 16.09.2019 and 02.02.2023 as they became available. If you download these files we suggest renaming them as hh_Countryname to be compatable with our code.

2)  UN Population Division Names

Country Names and codes extracted from World Population Prospects Demographic Indicator file from 2022 ("WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.csv") downloaded from <https://population.un.org/wpp/Download/Standard/MostUsed/> on 13.03.2022

3)  Word Bank Country Income Groups

Downloaded on 10.02.2022 from <https://datahelpdesk.worldbank.org/knowledgebase/articles/906519-world-bank-country-and-lending-groups>

4)  JMP estimates for 2020

Downloaded from <https://washdata.org/data/downloads> on 11.07.2022.

5)  UNSD Methodology for Global Regions

Downloaded from <https://unstats.un.org/unsd/methodology/m49/overview/> on 14.07.2022
