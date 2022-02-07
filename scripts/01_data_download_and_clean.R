#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Ziyao Han
# Data: 6 February 2022
# Contact: frank.han@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Data Download ####
# From https://open.toronto.ca/dataset/toronto-shelter-system-flow/


# get all resources for this package
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")

# loading data from resource
monthly_shelter_usage_raw <-
  resources %>%
  get_resource()

# Saving raw data for reproducibility
write.csv(monthly_shelter_usage_raw, "inputs/data/shelter_flow_raw_data.csv")

#### Data Cleaning ####
# Removing ID
clean_data <- monthly_shelter_usage_raw[-c(1)]

# Removing age demographic variables
clean_data <- clean_data[-c(9:13)]

#### Save Data ####
write.csv(clean_data, "inputs/data/shelter_flow_data.csv")
         