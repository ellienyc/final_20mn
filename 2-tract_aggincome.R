#script #2: since totally different data set= aggregate income data by census tract
# 1: downloaded aggregate income at census tract level, 2021 ACS 5yr estimates, all 5 NYC counties
# 2: open in Excel to get rid of unwanted data and rename columns
# 3: here in R= extract tract label to match shapefile

library(tidyverse)
library(janitor)
library(stringr) #load in packages up top

agg_household_income <- read_csv("agg_household_income.csv")

NYC_tracts_aggincome <- agg_household_income %>% 
  mutate(geoidshort = str_extract(geoid, "(?<=US)\\d+")) #to shorten GEOID to what matches shapefile
                                  # code from ChatGPT https://chat.openai.com/share/9692d4c6-7956-44c4-9e9f-d8bfa91773eb
                                
# write_csv(NYC_tracts_aggincome, "NYC_tracts_aggincome.csv")
  #saving csv to add to shapefile in QGIS