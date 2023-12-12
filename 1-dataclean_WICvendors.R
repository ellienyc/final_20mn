#script #1: cleaning up 'WIC vendors' state data set

library(tidyverse)
library(janitor)
library(stringr) #load libraries up top

WIC_vendors <- read_csv("WIC vendors.csv") %>% #read in the csv
  clean_names() %>% 
  mutate(lat = str_extract(location,  "(?<=\\().*?(?=,)")) %>% #getting lat and long from the "location" column which has all the data together
  mutate(long = str_extract(location, "-[^)]+(?=[)])")) #code from chatGPT https://chat.openai.com/share/2d5b9f60-0c01-4c67-8530-5eaa3b120c9e
  
grocery_WIC <- WIC_vendors %>% #the vendors list has grocery, pharmacy, and both, so looking for the ones that are not pharmacy here
  filter (type != "Pharmacy Only")

# write_csv(grocery_WIC, "grocery_WIC.csv")

pharmacy_WIC <- WIC_vendors %>% #^^and the ones that aren't grocery here
  filter(type != "Grocery")

# write_csv(pharmacy_WIC, "pharmacy_WIC.csv")


