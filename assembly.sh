#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 18:00:00
#SBATCH -J assemblyofmeta

module load bioinfo-tools
module load megahit

srun megahit -1 Thrash/raw/SRR4342129_1.paired.trimmed.fastq.gz -2 Thrash/raw/SRR4342129_2.paired.trimmed.fastq.gz --kmin-1pass -o ass_of_meta
