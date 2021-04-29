#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J binning

module load bioinfo-tools
module load MetaBat

metabat -i Thrash/ass_of_meta/final.contigs.fa.gz -o binning -t 2 --unbinned
