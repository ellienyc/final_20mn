#script #2: since totally different data set= aggregate income data by census tract
# 1: downloaded aggregate income at census tract level, 2021 ACS 5yr estimates, all 5 NYC counties
# 2: open in Excel to get rid of unwanted data and rename columns
# 3: here in R= extract tract label to match shapefile

library(tidyverse)
library(janitor)
library(stringr) #load in packages up top

agg_household_income <- read_csv("agg_household_income.csv")

NYC_tracts_aggincome <- agg_household_income %>% 
  mutate(ctlabel = str_extract(ctname, "(?<=Tract )(.*?)(?=,)")) #to extract just the census tract number, to join with the shapefile
                                      #code from ChatGPT: https://chat.openai.com/share/b3584f71-7185-47c7-bea8-419c7093e027

# write_csv(NYC_tracts_aggincome, "NYC_tracts_aggincome.csv")
  #saving csv to add to shapefile in QGIS