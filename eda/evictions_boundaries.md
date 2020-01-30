EDA of SC Evictions Data
================
Amy Kouch
2020-01-30

``` r
# Libraries
library(tidyverse)

# Parameters

evictions <- 
  here::here("data/evictions.rds")

#===============================================================================

# Reading in evictions data

evictions <- 
  evictions %>%
  read_rds() 

# Identifying SC city with most evictions
evictions %>%
  arrange(desc(evictions)) %>%
  top_n(1, wt = evictions)
```

    ## # A tibble: 1 x 4
    ##   geoid    year name             evictions
    ##   <chr>   <dbl> <chr>                <dbl>
    ## 1 4550875  2016 North Charleston     3660.
