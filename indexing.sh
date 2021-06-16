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

for bins in binning/bins_1/*.fa
do
bwa index $bins 
done
