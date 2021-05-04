#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 08:00:00
#SBATCH -J phylo

module purge

module load bioinfo-tools
module load phylophlan
module load biopython
module load FastTree
module load muscle
module load usearch
module list

ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/*.tar.bz2 ~/Thrash/phylogeny/data
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/*.txt ~/Thrash/phylogeny/data
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/data/ppaalns/ppa.aln.tar.bz2 ~/Thrash/phylogeny/data/ppaalns
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/taxcuration/* ~/Thrash/phylogeny/taxcuration
ln -sf /sw/apps/bioinfo/phylophlan/0.99/snowy/bin/phylophlan.py ~/Thrash/phylogeny

cd ~/Thrash/prokk

for bins in *.fa
do
ln -sf $bins/*.faa ~/Thrash/phylogeny/input/metagenome
done

cd ~/Thrash/phylogeny
python phylophlan.py -i metagenome -d phylophlan --diversity medium
