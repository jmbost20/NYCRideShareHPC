#!/bin/bash

rm -rf out; mkdir out # Write desired output (by redirecting stdout) here.
rm -rf slurm_out; mkdir slurm_out # Let Slurm write stdout & stderr here.

jobId1=$(sbatch --array=1\
                --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                ./getData.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

jobId2=$(sbatch --array=1\
		--output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
		--dependency=afterok:$jobId1 \
                ./packageSetup.sh)

jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')
