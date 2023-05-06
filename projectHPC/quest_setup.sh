#!/bin/bash

module load R/R-3.6.1 # tell execute computer where to find R software

RpackagesDir="R/library" # the R script will install packages here
mkdir --parents "$RpackagesDir" # make directory & parents; no error if exists


#awk '(NR == 1) || (FNR > 1)' fhvhv_tripdata_*.csv > fhvhv_merged.csv

Rscript q1.R $RpackagesDir merged_taxi.parquet

Rscript q3.R merged_taxi.parquet

#Rscript q4.R merged_taxi.parquet

#rm -f merged_taxi.parquet
