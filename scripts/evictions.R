# Description
# Cities eviction data in South Carolina

# Author: Amy Kouch
# Version: 2020-01-29

# Libraries
library(tidyverse)

# Parameters

# Libraries
library(tidyverse)
library(vroom)
library(utils)

# Parameters
# URL for raw aggregate data
url_aggregate <-
  "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

# Variable types
vars_types <-
  cols_only(
    `GEOID` = col_character(),
    `year` = col_double(),
    `name` = col_character(),
    `evictions` = col_double(),
  )

# New variable names
vars_rename <- c(geoid = "GEOID")

# Output file with aggregate data in RDS format
file_aggregate_rds <- here::here("data/evictions.rds")

# Output file with raw data
file_aggregate_cvs <- here::here("data-raw/evictions.csv")

#===============================================================================

url_aggregate %>%
  vroom(col_types = vars_types) %>%
  rename(!!! vars_rename) %>%
  filter(year == 2016) %>%
  write_rds(file_aggregate_rds, compress = "gz")

url_aggregate %>%
  download.file(file_aggregate_cvs)
