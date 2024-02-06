#### Preamble ####
# Purpose: Download and save data from the replication source
# Data: 5 February 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)

#### Read data ####
all_brate <- read_csv("input/data/data_from_source/fig_1.csv")
age_cohort_brate <- read_csv("input/data/data_from_source/figs_1_2_3.csv")
state_brate <- read_csv("input/data/data_from_source/numbirths_2001_2019.csv")

#### Save data ####
write_csv(all_brate, file = "input/data/raw_data/raw_brate.csv")
write_csv(age_cohort_brate, file = "input/data/raw_data/raw_brate_by_cohort.csv")
write_csv(state_brate, file = "input/data/raw_data/raw_brate_by_state.csv")