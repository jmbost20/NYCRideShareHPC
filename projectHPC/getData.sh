#!/bin/bash

n=$SLURM_ARRAY_TASK_ID


numid=$((2019+$n))

for i in 01 02 03 04 05 06 07 08 09 10 11 12
do
wget https://d37ci6vzurychx.cloudfront.net/trip-data/fhvhv_tripdata_$numid-$i.parquet
#fi
done
