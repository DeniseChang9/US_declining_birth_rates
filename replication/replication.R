#### Preamble ####
# Purpose: Replicate Figure 1, Figure 2A and Figure 2B of the original paper
# Data: 15 February 2024
# Contact: dede.chang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01_download_data.R

#### Workspace setup ####
library(tidyverse)
library(knitr)
library(here)


# Read in data
all_brate <- read_csv(here::here("input/data/raw_data/raw_brate.csv"))
brate_by_cohort <- read_csv(here::here("input/data/raw_data/raw_brate_by_cohort.csv"))


#### Replication of Figure 1 ####

all_brate |>
  ggplot(aes(x = year, y = brate_all)) +
  geom_line(colour = "blue") +
  theme_classic() +
  labs(x = "Year",
       y = "Births per 1,000 women aged 15-44") +
  # adds vertical line at 2007
  geom_vline(xintercept = 2007, linetype = "dashed", colour = "grey") +
  annotate("text", x = 2007, y = max(75), label = "2007") +
  geom_vline(xintercept = 1990, linetype = "dashed", colour = "grey") +
  annotate("text", x = 1990, y = max(75), label = "1990") +
  ylim(50,80) +
  # stylistic adjustments
  theme(panel.grid.major.y = element_line(color = "lightgrey"),
        axis.title = element_text(colour = "black"))


#### Replication of Figure 2A ####

# change format to long format 
long_brate_by_cohort <- 
  brate_by_cohort |>
  select(year,brate_1519,brate_2024,brate_2529,brate_3034,brate_3539,brate_4044) |>
  pivot_longer(cols = -year, names_to = "age_cohort", values_to = "birth_rate")

# rename the age cohorts
long_brate_by_cohort$age_cohort <- 
  factor(long_brate_by_cohort$age_cohort,
         levels = c("brate_1519", "brate_2024", "brate_2529", "brate_3034", "brate_3539", "brate_4044"),
         labels = c("15-19 years old", "20-24 years old", "25-29 years old", "30-34 years old", "35-39 years old", "40-44 years old"))

# plot the graph
long_brate_by_cohort |>
  ggplot(aes(x = year, y = birth_rate, color = age_cohort)) +
  geom_line() +
  theme_classic() +
  labs(x = "Year",
       y = "Births per 1,000 women in relevant subgroups") +
  scale_color_discrete(name = "Age Cohort") + 
  geom_vline(xintercept = 2007, linetype = "dashed", colour = "grey") +
  annotate("text", x = 2007, y = max(125), label = "2007") + 
  geom_vline(xintercept = 1990, linetype = "dashed", colour = "grey") +
  annotate("text", x = 1990, y = max(125), label = "1990") +
  # stylistic adjustments
  theme(panel.grid.major.y = element_line(color = "lightgrey"),
        axis.title = element_text(colour = "black"))


#### Replication of Figure 2E ####
long_brate_by_marry <- 
  brate_by_cohort |>
  select(year,brate_married, brate_unmarried) |>
  pivot_longer(cols = -year, names_to = "marital_status", values_to = "birth_rate")

# rename the age cohorts
long_brate_by_marry$marital_status <- 
  factor(long_brate_by_marry$marital_status,
         levels = c("brate_married", "brate_unmarried"),
         labels = c("Married", "Unmarried"))
head(long_brate_by_marry)

# plot the graph
long_brate_by_marry |>
  ggplot(aes(x = year, y = birth_rate, color = marital_status)) +
  geom_line() +
  theme_classic() +
  labs(x = "Year",
       y = "Births per 1,000 women in relevant subgroups") +
  scale_color_discrete(name = "Age Cohort") + 
  geom_vline(xintercept = 2007, linetype = "dashed", colour = "grey") +
  annotate("text", x = 2007, y = max(125), label = "2007") + 
  geom_vline(xintercept = 1990, linetype = "dashed", colour = "grey") +
  annotate("text", x = 1990, y = max(125), label = "1990") +
  # stylistic adjustments
  theme(panel.grid.major.y = element_line(color = "lightgrey"),
        axis.title = element_text(colour = "black"))



