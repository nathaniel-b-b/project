#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 1:00:00
#SBATCH -J indexing

cd ~/Thrash

module load bioinfo-tools
module load bwa

for bins in binning/bins_2/*.fa
bwa index binning/bins_2/$bins
