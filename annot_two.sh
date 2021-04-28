#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 04:00:00
#SBATCH -J protwo

module load bioinfo-tools
module load prokka

prokka --outdir prokk --prefix ann_two binning/bins_2/*.fa
