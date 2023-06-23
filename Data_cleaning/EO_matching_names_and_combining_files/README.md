
# Summary-Joining household survey and Earth observation data
We used combined methods to match all GADM names (GADM version 3.6) with the region names reported in the household survey (variable: HH7) in order to join the household survey data with Earth observation data.
First we used a the fuzzyjoin R package (version 0.1.6) to match the household survey region names with names at GADM level 1, 2, or 3 and then reviewed and corrected false matches manually. For names which did not find a close match with fuzzyjoin we used Wikipedia and the online GADM database to identify equivalent names of survey place. If a survey place name has an equivalent GADM name at more than one level then select the level based on the trend within the country.

Here is a more detailed description of how to combine the code in this file:
## 1)	Matching HH7 and GADM names
1a) Replace the MICS_householdsurveys_regionNames.csv file with a file including all the country names and regions of the MICS surveys which you would like to include in your analysis. Limiting criteria is that data on all four SMDWs subcomponents should be available.
1b) Run 1_matching_names_EG.R file to match GADM region names with survey place names and write "matched_names.csv".
Open "matched_names.csv" and check that all names which have been fuzzy matched make sense. For names which do not find a close match use Wikipedia and the online GADM database to identify equivalent names of survey places ("name_orig") which are in the all_regions_GADM.csv. Substitute the fuzzy matched names in the "matched_names.csv" with the correct equivalent GADM region name. (Comment: this does not need to be done for scratch for all new regions. Check and use names from previous matched_names_EG.csv files). If no suitable GADM region name can be matched insert a 1 in the column "accepted". If a survey place name has an equivalent GADM name at more than one level then select the level based on the trend within the country. (Most country survey place names are all from the same level). In case of doubt put a 1 in the "accepted" column and add the place name to the file "Missing_regions". Rename "matched_names.csv" to include the date it was last edited.
This code also writes the file "unmatched_names_afterF.csv" which includes all the regions which were not matched or fuzzy matched. 

## 2)	Combining revised matched_names.csv file with Name_X_sampled.csv which includes EO data.

2a) Run the file 2_combining_sampled_files_EG.csv which writes the "MICS_env_sampled_XX.XX.XX.csv" file. Open the written excel file and check for observations (matched names) which were not successfully combined with environmental data and document these in missing_regions.csv.


 ## 3) Updating the MICS_env_sampled.csv file as new survey come in

 New MICS surveys appear fairly irregually. We therefore just added and matched the new regions with the corresponding GADM region manually into the most recent MICS_env_sampled.csv dataframe.