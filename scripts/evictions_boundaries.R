# Description
# Joining cities evictions and boundaries data in South Carolina

# Author: Amy Kouch
# Version: 2020-01-30

# Libraries
library(tidyverse)
library(vroom)
library(utils)
library(sf)

# Parameters

# Input files from data
file_evictions <- here::here("data/evictions.rds")
file_boundaries <- here::here("data/boundaries.rds")

# Output files from data
file_aggregate_rds <- here::here("data/evictions_boundaries.rds")

#===============================================================================

evictions <- read_rds(file_evictions)
boundaries <- read_rds(file_boundaries)

evictions %>%
  left_join(boundaries, by = c("geoid" = "city_id")) %>%
  select(geoid, year, name, evictions, geometry) %>%
  write_rds(file_aggregate_rds, compress = "gz")

