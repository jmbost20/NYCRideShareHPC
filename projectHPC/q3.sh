#!/bin/bash

RpackagesDir="R/library" # the R script will install packages here
mkdir --parents "$RpackagesDir" # make directory & parents; no error if exists


#awk '(NR == 1) || (FNR > 1)' fhvhv_tripdata_*.csv > fhvhv_merged.csv

#Rscript q1.R taxi_merged.parquet

Rscript q3.R taxi_merged.parquet

#Rscript q4.R taxi_merged.parquet

#rm -f fhvhv_merged.csv
