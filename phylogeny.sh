#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 08:00:00
#SBATCH -J phylo

module load bioinfo-tools
module load phylophlan
module load python/2.7.15
module load FastTree
module load muscle
module load usearch/5.3.32

ln -s /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/*.tar.bz2 ~/Thrash/phylogeny/data
ln -s /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/*.txt ~/Thrash/phylogeny/data
ln -s /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/ppaalns/ppa.aln.tar.bz2 ~/Thrash/phylogeny/data/ppaalns
ln -s /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/taxcuration/* ~/Thrash/phylogeny/taxcuration
ln -s /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/phylophlan.py ~/Thrash/phylogeny

cd ~/Thrash/prokk

for bins in *.fa
do
ln -s $bins/*.faa ~/Thrash/phylogeny/input/metagenome
done

cd ~/Thrash/phylogeny
python phylogeny.py -i metagenome -d phylophlan
