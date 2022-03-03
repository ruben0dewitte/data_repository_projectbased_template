##############################################################
# Template MASTER file for data repository
# Ruben Dewitte
# Feburary 2022
##############################################################


# SETUP -------------------------------------------------------------------

# Load libraries
library(here) #easy file referencing, root is set at project root

# Setup - Define global variables -------------------------------------------------------------------

source(here("code","01_setup.R"))

# Dataprep - Prepare the data ----------------------------------------------------------------

source(here("code","02_dataprep.R"))

# Analysis - Analyse the data ----------------------------------------------------------------

source(here("code","03_analysis.R"))





