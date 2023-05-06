#!/bin/bash

#RUN dataRetrMerge.sh First, unless merged_taxi.parquet already exists.


rm -rf out; mkdir out # Write desired output (by redirecting stdout) here.
rm -rf slurm_out; mkdir slurm_out # Let Slurm write stdout & stderr here.

jobId1=$(sbatch --array=1\
                --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
		./quest_setup.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')
