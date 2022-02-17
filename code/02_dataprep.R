##############################################################
# Data preparation
##############################################################

# SETUP -------------------------------------------------------------------

# Load packages
library(tidyverse)
library(here) #easy file referencing, root is set at project root

#  OECD: Foreign-born population ------------------------------------------------------------

#Load Data on foreign born population
x = read_csv(here("input","foreign_born_OECD.csv"))
  # In this case, the variable names are sufficiently clear and no additional explanation is required
  # However, we only have country codes at the iso-alpha 3 level, not full names, so we should get these

#Add ISO-3 classification
y = read_csv(here("input","country_codes.csv"))
y = y %>%
  rename(LOCATION = `alpha-3`, country = name)

x = x %>%
  left_join(y=y,by=c("LOCATION"))
rm(y)

#Save the intermediate dataset 
saveRDS(x,file=here("output","foreign_born.RDS"))
