#!/bin/bash


awk '(NR == 1) || (FNR > 1)' fhvhv_tripdata_*.csv > fhvhv_merged.csv

Rscript q3.R fhvhv_merged.csv

#Rscript q4.R fhvhv_merged.csv

rm -f fhvhv_merged.csv
