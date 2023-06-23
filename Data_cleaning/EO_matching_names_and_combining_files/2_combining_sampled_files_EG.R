library(data.table)
library(plyr)
library(tidyverse)

# Set working directory
setwd("~/GitHub/MICS_SMDW/EO_matching_names_and_combining_files")

matched_names <- fread("matched_names_EG_2021.02.04.csv") %>% 
  select(-name_orig) %>%
  filter(accepted == 1) %>% mutate(matched_name1 = coalesce(NAME_1_matched, NAME_1_matched_fuzz)) %>% 
  mutate(matched_name2 = coalesce(NAME_2_matched, NAME_2_matched_fuzz)) %>% 
  mutate(matched_name3 = coalesce(NAME_3_matched, NAME_3_matched_fuzz))

unmatched_names <- fread("unmatched_names_afterF.csv") %>% 
  select(-name_orig) %>%
  filter(accepted == 1) %>% mutate(matched_name1 = coalesce(NAME_1_matched, NAME_1_matched_fuzz)) %>% 
  mutate(matched_name2 = coalesce(NAME_2_matched, NAME_2_matched_fuzz)) %>% 
  mutate(matched_name3 = coalesce(NAME_3_matched, NAME_3_matched_fuzz))

all_names_MICS <- rbind(matched_names,unmatched_names)

 
head(all_names_MICS)

NAME_1_sampled <- fread("~/GitHub/MICS_SMDW/EO_matching_names_and_combining_files/NAME_1_sampled.csv")
NAME_2_sampled <- fread("~/GitHub/MICS_SMDW/EO_matching_names_and_combining_files/NAME_2_sampled.csv")
NAME_3_sampled <- fread("~/GitHub/MICS_SMDW/EO_matching_names_and_combining_files/NAME_3_sampled.csv")


NAME_1_combined <- left_join(all_names_MICS, NAME_1_sampled, by = c("matched_name1" = "NAME_1")) %>% 
  filter(!is.na(NAME_1_matched) | !is.na(NAME_1_matched_fuzz))
NAME_2_combined <- left_join(all_names_MICS, NAME_2_sampled, by = c("matched_name2" = "NAME_2"))%>% 
  filter(!is.na(NAME_2_matched) | !is.na(NAME_2_matched_fuzz))
NAME_3_combined <- left_join(all_names_MICS, NAME_3_sampled, by = c("matched_name3" = "NAME_3"))%>% 
  filter(!is.na(NAME_3_matched) | !is.na(NAME_3_matched_fuzz))
#NAME_4_combined <- left_join(matched_names, NAME_4_sampled, by = c("NAME_4_matched" = "NAME_4_matched", "NAME_4_matched_fuzz" = "NAME_4_matched_fuzz"))%>% 
  #filter(!is.na(NAME_4_matched) | !is.na(NAME_4_matched_fuzz))

all_name_sampled <- plyr::rbind.fill(NAME_1_combined, NAME_2_combined, NAME_3_combined)

rm(list=setdiff(ls(), "all_name_sampled"))

fwrite(all_name_sampled, "MICS_env_sampled_.csv")




