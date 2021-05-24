#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 04:00:00
#SBATCH -J expr

cd ~/Thrash

module load bioinfo-tools
module load htseq

htseq-count mapping/maps1.sam prokk/binning11.fa/binning11.fa.gff -o exprseq

#Does not work
