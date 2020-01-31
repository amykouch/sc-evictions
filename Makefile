# Search path
VPATH = data data-raw eda reports scripts

# Processed data files
DATA = evictions.rds boundaries.rds evictions_boundaries.rds

# EDA studies
EDA = evictions_boundaries.md evictions_boundaries.Rmd

# All targets
all : $(DATA) $(EDA)

# Data dependencies

evictions_boundaries.rds : evictions.rds boundaries.rds

# EDA study and report dependencies

evictions_boundaries.md : evictions.rds boundaries.rds evictions_boundaries.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
