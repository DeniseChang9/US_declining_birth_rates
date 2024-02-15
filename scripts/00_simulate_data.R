#### Preamble ####
# Purpose: Simulate data from the replication source
# Data: 15 February 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)

#### Start simulation ####
set.seed(302) #random seed

## Create simulated data for national birthrates
all_brate_sim <-
  tibble(
    year = 1980:1990,
    brate = sample(x = 40:60,
                   size = 11,
                   replace = TRUE)
  )

## Create simulated data for birthrates by age cohort
cohort_brate_sim <-
  tibble(
    year = 1980:1990, 
    cohort_1 = sample(x = 20:25,
                      size = 11,
                      replace = TRUE),
    cohort_2 = sample(x = 26:41,
                      size = 11,
                      replace = TRUE),
    cohort_3 = sample(x = 30:42,
                      size = 11,
                      replace = TRUE)
  )

#### Data Testing ####

# check that all years are unique
all_brate_sim$year |>
  unique() |>
  length() == 11

cohort_brate_sim$year |>
  unique() |>
  length() == 11

# check that each variable spans its range
all_brate_sim$brate |>
  min() >= 40

all_brate_sim$brate |>
  max() <= 60

cohort_brate_sim$cohort_1 |>
  min() >= 20

cohort_brate_sim$cohort_1 |>
  max() <= 25

cohort_brate_sim$cohort_2 |>
  min() >= 26

cohort_brate_sim$cohort_2 |>
  max() <= 41

cohort_brate_sim$cohort_3 |>
  min() >= 30

cohort_brate_sim$cohort_3 |>
  max() <= 42

  
  