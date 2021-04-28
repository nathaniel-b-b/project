#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J checkem

module load bioinfo-tools
module load CheckM

checkm lineage_wf -t 2 --reduced_tree -x fa ~/Thrash/binning/bins_1 ~/Thrash/binning/checkem_1
