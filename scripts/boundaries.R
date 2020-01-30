# Description
# Cities boundaries data in South Carolina

# Author: Amy Kouch
# Version: 2020-01-30

# Libraries
library(tidyverse)
library(vroom)
library(utils)
library(sf)

# Parameters
# URL for raw aggregate data
url_aggregate <-
  "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

# New variable names
vars_rename <- c(
  city_id = "GEOID",
  city_name = "n"
  )

# Output file with aggregate data in RDS format
file_aggregate_rds <- here::here("data/boundaries.rds")

# Output file with raw data
file_aggregate_cvs <- here::here("data-raw/boundaries.csv")

#===============================================================================

url_aggregate %>%
  read_sf(as_tibble = TRUE) %>%
  rename(!!! vars_rename) %>%
  select(city_id, city_name, geometry) %>%
  write_rds(file_aggregate_rds, compress = "gz")

url_aggregate %>%
  download.file(file_aggregate_cvs)
