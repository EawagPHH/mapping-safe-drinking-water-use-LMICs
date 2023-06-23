
title: "Tables with country survey characteristics"

library(data.table)
library(tidyverse)
library(dplyr)
library("xlsx")
library(here)

source("~/GitHub/MICS_SMDW/Data_cleaning/MICS_Preprocessing_Dataframes/Compiling_MICS_test_and_training_sets/FunctionsForExtractingVariablesFromMICS.R", encoding = 'UTF-8')
source("~/GitHub/MICS_SMDW/Data_cleaning/MICS_Preprocessing_Dataframes/CreatingSMDWIndicator.R")
source("~/GitHub/MICS_SMDW/Data_cleaning/MICS_Preprocessing_Dataframes/Compiling_MICS_test_and_training_sets/functionsForJoiningAndStructuringDataframes.R")

#training set

df.MICS_train <- readHouseHoldSurveyData()
#df.MICS_train <- renameVariables(df.MICS_train)
SMDW_FullTrainingSet <- creatingSMDWIndicators(df.MICS_train)
SMDWRegionalProportionTrain <-createIndicatorForRegionalSMDWCoverage(SMDW_FullTrainingSet)
SMDWNumberOfRegionByCountryTrain <- count_regionsByCountry(SMDWRegionalProportionTrain)

#test set

df.MICS_test <- readHouseHoldSurveyDataForTestSet()
df.MICS_test <- replaceHH7_regionNameWithCorrespondingGADMNAme(df.MICS_test)
df.MICS_SMDW_FullTestSet <- creatingSMDWIndicators_forTestSet(df.MICS_test)
SMDW_test_HH7 <- createIndicatorForRegionalSMDWCoverage_forTestSet(df.MICS_SMDW_FullTestSet)
SMDW_test_country <- createIndicatorForCountrySMDWCoverage(df.MICS_SMDW_FullTestSet)


Ecoli_TestSet <- createDataFrameWithEcoliIndicator(df.MICS_test)
EcoliFreeRegionalProportion <-createIndicatorForRegionalProportionFreeOfEcoli(Ecoli_TestSet)
EcoliFreeCountryProportion <-createIndicatorForCountryProportionFreeOfEcoli(Ecoli_TestSet)


Accessibility_TestSet <- createDataFrameWithAccessibilityIndicator(df.MICS_test)
AccessRegionalProportion <- createIndicatorForRegionalWaterAccessibility(Accessibility_TestSet)
AccessCountryProportion <- createIndicatorForCountryWaterAccessibility(Accessibility_TestSet)


Availability_TestSet <- createDataFrameWithAvailabilty(df.MICS_test)
AvailableRegionalProportion <- createIndicatorForRegionalAvailability(Availability_TestSet)
AvailableCountryProportion <- createIndicatorForCountryAvailability(Availability_TestSet)


MainSourceType_TestSet <- createDataFrameWithmainWaterSourceType(df.MICS_test)
ImprovedWaterSourceRegionalProportion <- createIndicatorForRegionalWaterSourceType(MainSourceType_TestSet)
ImprovedWaterSourceCountryProportion <- createIndicatorForCountryWaterSourceType(MainSourceType_TestSet)



#plot SMDW test set
ggplot(SMDW_FullTestSet,
       aes(x=country,
           fill=factor(SMDW,
                       levels=c("0", "1"),
                       labels=c("No SMDW", "SMDW"))))+
  geom_bar(position="fill")+
  scale_y_continuous(label= scales::percent) +
  scale_fill_brewer(palette="BuPu") +
  labs(y="Percent of population",
       x="Country",
       title="Access to SMDW by country (MICS data)") +
  guides(fill=guide_legend(title="Service access")) +
  theme(axis.text.x=element_text(angle=45, 
                                 hjust=1))+
  theme(plot.title = element_text(face="bold"))


# tables
write.xlsx(as.data.frame(SMDW_test_country), file="Coverage_SMDW_Test.xlsx", sheetName="SMDW", row.names=FALSE)
write.xlsx(as.data.frame(EcoliFreeCountryProportion), file="Coverage_SMDW_Test.xlsx", sheetName="Ecoli", append=TRUE, row.names=FALSE)
write.xlsx(as.data.frame(AccessCountryProportion), file="Coverage_SMDW_Test.xlsx", sheetName="Access", append=TRUE, row.names=FALSE)
write.xlsx(as.data.frame(AvailableCountryProportion), file="Coverage_SMDW_Test.xlsx", sheetName="Available", append=TRUE, row.names=FALSE)
write.xlsx(as.data.frame(ImprovedWaterSourceCountryProportion), file="Coverage_SMDW_Test.xlsx", sheetName="Improved", append=TRUE, row.names=FALSE)


