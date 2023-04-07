#!/bin/bash

n=$SLURM_ARRAY_TASK_ID


numid=$((2018+$n))

for i in 01 02 03 04 05 06 07 08 09 10 11 12
do
#if ($i <= 9)
#then
#wget https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_$numid-0$i.parquet
#else
wget https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_$numid-$i.parquet
#fi
done
