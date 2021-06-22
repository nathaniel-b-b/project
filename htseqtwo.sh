#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J htseq

module load bioinfo-tools
module load htseq/0.9.1

cd binning/bins_2

for bins in *.fa
do
htseq-count -f bam -r pos -t CDS -i ID -s no ~/Thrash/maps2/$bins.sorted.bam <(sed '/##FASTA/,$d' ~/Thrash/prokktwo/$bins/$bins.gff) > ~/Thrash/countstoo/$bins.readcount.out
done
