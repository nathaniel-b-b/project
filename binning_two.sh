#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J binningdos

module load bioinfo-tools
module load MetaBat

metabat -i Thrash/ass_of_meta_two/final.contigs.fa.gz -o binning_two -t 2 --unbinned
