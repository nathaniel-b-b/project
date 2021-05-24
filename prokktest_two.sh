#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 07:00:00
#SBATCH -J proto

module load bioinfo-tools
module load prokka

cd ~/Thrash/binning/bins_2

for bins in *
do
prokka --outdir ../../prokktwo/$bins --prefix $bins $bins
done
