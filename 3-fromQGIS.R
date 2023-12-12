#script #3: the CSVs made from analyzed spatial data

library(tidyverse)
library(janitor) #load in packages up top

at_least_1_raw <- read_csv("at-least-1_raw.csv")%>% 
  select(CTLabel, CT2020, BoroName, NTAName, Shape_Area, pop, agg_income, agg_inco_1)
  #reading in .csv, filtering to just the data I want

at_least_1_wide <- at_least_1_raw %>% 
  pivot_wider( #I got this file by doing a merge so I had duplicates (there's probably a nicer way to do this?)
    names_from = BoroName,
    values_from = NTAName, 
    values_fn = list
  ) %>%
  select(- Manhattan, -Bronx, -Brooklyn, -Queens, -(name= "Staten Island"))
  #instead, creating columns then deselecting them gets me what I need
  
sum(at_least_1_wide$pop) #getting stats to copy into DataWrapper
sum(at_least_1_wide$agg_income, na.rm = TRUE)

alltracts <- read_csv("alltracts.csv") #data for all census tracts

sum(alltracts$pop)  #getting stats to copy into DataWrapper
sum(alltracts$agg_income, na.rm = TRUE)

complete_tracts <- read_csv("complete-all-4.csv") #data for the "complete" census tracts

sum(complete_tracts$pop)
sum(complete_tracts$agg_income, na.rm = TRUE) #getting stats to copy into DataWrapper

