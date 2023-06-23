
library(data.table)
library(plyr)
library(fuzzyjoin)
library(stringdist)
library(tidyverse)

# Define custom operator
`%notin%` <- Negate(`%in%`)

# Set working directory
setwd("~/GitHub/mapping-safe-drinking-water-use-LMICs/Data_cleaning/EO_matching_names_and_combining_files")


# Load unicef database
unicef <- fread("~/GitHub/mapping-safe-drinking-water-use-LMICs/Data_cleaning/EO_matching_names_and_combining_files/MICS_householdsurveys_regionNames.csv", encoding = "UTF-8") %>% 
  rowid_to_column(var = "ID") 


df <- unicef %>% 
  select(HH7_region, place) %>% 
  separate(place, into = c("name", "country"),sep =",") %>% 
  mutate(name = str_to_title(name)) %>% 
  mutate(country = trimws(country)) %>% 
  unique() %>% 
  mutate(country = replace(country, country ==  "Congo", "Republic of Congo"))

head(df)
table_country_MICS <- (table(df$country,useNA = c("always")))

#checking places in dataset
table_Bangladesh_df <- table( df[ df$country == "Bangladesh" , c("name")] )

# GADM database of region/district polygons is used for sampling;
# Check whether names match
GADM_regions <- fread("all_regions_GADM.csv", encoding = "UTF-8")
head(GADM_regions)

matched_names_lvl4 <- inner_join(df, (GADM_regions %>% mutate(NAME_4_matched = NAME_4, country_matched = NAME_0)), 
                                 by = c("country" = "NAME_0",
                                        "name" = "NAME_4")) %>% 
  select(HH7_region, country, name, country_matched, NAME_4_matched) %>% 
  unique()
head(matched_names_lvl4)

matched_names_lvl3 <- inner_join(df, (GADM_regions %>% mutate(NAME_3_matched = NAME_3, country_matched = NAME_0)),
 #matched_names_lvl3 <- inner_join((df %>% filter(name %notin% matched_names_lvl4)), (GADM_regions %>% mutate(NAME_3_matched = NAME_3, country_matched = NAME_0)), 

                                 by = c("country" = "NAME_0",
                                        "name" = "NAME_3")) %>% 
  select(HH7_region, country, name, country_matched, NAME_3_matched) %>% 
  unique()
head(matched_names_lvl3)

matched_names_lvl2<- inner_join(df, (GADM_regions %>% mutate(NAME_2_matched = NAME_2, country_matched = NAME_0)),
# matched_names_lvl2 <- inner_join((df %>% filter(name %notin% matched_names_lvl3)), (GADM_regions %>% mutate(NAME_2_matched = NAME_2, country_matched = NAME_0)), 
                            by = c("country" = "NAME_0",
                                   "name" = "NAME_2")) %>% 
  select(HH7_region, country, name, country_matched, NAME_2_matched) %>% 
  unique()
head(matched_names_lvl2)

matched_names_lvl1 <- inner_join(df, (GADM_regions %>% mutate(NAME_1_matched = NAME_1, country_matched = NAME_0)),
# matched_names_lvl1 <- inner_join((df %>% filter(name %notin% matched_names_lvl2)), (GADM_regions %>% mutate(NAME_1_matched = NAME_1, country_matched = NAME_0)), 
                                 by = c("country" = "NAME_0",
                                        "name" = "NAME_1")) %>% 
  select(HH7_region, country, name, country_matched, NAME_1_matched) %>% 
  unique()

head(matched_names_lvl1)

matched_names <- rbind.fill(matched_names_lvl1, matched_names_lvl2, matched_names_lvl3, matched_names_lvl4)
rm(matched_names_lvl1, matched_names_lvl2, matched_names_lvl3, matched_names_lvl4)

table_country_matched_names <-(table(matched_names$country,useNA = c("always")))

unmatched_names <- df %>% filter(name %notin% matched_names$name) %>% 
  mutate(name = str_replace_all(name, "[^[:alnum:]]", " ")) 
  
head(unmatched_names)
table(unmatched_names)

matched_names_fuzz <- list()

countries_to_match <- unique(unmatched_names$country)


for(j in c(1,2,3,4)){

for(i in countries_to_match){

GADM_to_match <- GADM_regions %>%
  filter(NAME_0 == i) %>% 
  select(NAME_0, paste0("NAME_", j)) %>% 
  unique()

unmatched_names_sub <- unmatched_names %>% filter(country == i)

matched_names_fuzz[[i]][[j]] <- stringdist_join(unmatched_names_sub, GADM_to_match, 
                                 by = c(#"country" = "NAME_0",
                                        "name" = paste0("NAME_", j)),
                                 mode = "left",
                                 ignore_case = FALSE, 
                                 method = "jw", 
                                 max_dist = 99, 
                                 distance_col = "dist") %>%
  group_by(name) %>%
  top_n(1, -dist)

}
}

matched_names_fuzz_df <- do.call(rbind, do.call(rbind, matched_names_fuzz)) %>% 
  select(-dist) %>% 
  rename(country_matched = NAME_0,
         NAME_1_matched_fuzz = NAME_1,
         NAME_2_matched_fuzz = NAME_2,
         NAME_3_matched_fuzz = NAME_3,
         NAME_4_matched_fuzz = NAME_4) %>% 
  na_if("") %>% 
  filter_at(vars(NAME_1_matched_fuzz, NAME_2_matched_fuzz, NAME_3_matched_fuzz, NAME_4_matched_fuzz), any_vars(!is.na(.)))

rm(matched_names_fuzz)
head(matched_names_fuzz_df)

matched_names_wF <- rbind.fill(matched_names, matched_names_fuzz_df) %>% 
  rename("country_orig" = "country", "name_orig" = "name")%>% 
  mutate(HH7_region = str_replace_all(HH7_region, "[^[:alnum:]]", " ")) 

rm(matched_names_fuzz_df, matched_names, unmatched_names_sub
   )

unmatched_names_afterF <- unmatched_names %>% filter(name %notin% matched_names_wF$name) 
nrow(unmatched_names_afterF)

write.csv(matched_names_wF, "matched_names.csv", fileEncoding = "UTF-8", row.names = F)

write.csv(unmatched_names_afterF, "unmatched_names_afterF_date.csv", fileEncoding = "UTF-8", row.names = F)


