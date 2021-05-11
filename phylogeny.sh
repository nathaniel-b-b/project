#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 08:00:00
#SBATCH -J phylo

module purge

module load bioinfo-tools
module load python/2.7.11
module load phylophlan
module load FastTree
module load muscle
module load usearch/5.2.32
module list


ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/*.tar.bz2 ~/Thrash/phylogeny/data
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/*.txt ~/Thrash/phylogeny/data
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/ppaalns/ppa.aln.tar.bz2 ~/Thrash/phylogeny/data/ppaalns
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/phylophlan.py ~/Thrash/phylogeny

cd ~/Thrash/prokk

for bins in *.fa
do
cp $bins/*.faa ~/Thrash/phylogeny/input/metagenome
done

cd ~/Thrash/phylogeny
phylophlan.py -i metagenome
