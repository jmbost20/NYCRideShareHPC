#!/bin/bash

module load R/R-3.6.1 # tell execute computer where to find R software

RpackagesDir="R/library" # the R script will install packages here
mkdir --parents "$RpackagesDir" # make directory & parents; no error if exists

#n=$SLURM_ARRAY_TASK_ID


#numid=$((2018+$n))

#for i in 01 02 03 04 05 06 07 08 09 10 11 12
#do
Rscript mergePar.R "$RpackagesDir" #fhvhv_tripdata_$numid-$i.parquet
Rscript test.R "$RpackagesDir" merged_taxi.parquet
#done

#rm -f *.parquet
