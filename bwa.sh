#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 16:00:00
#SBATCH -J bwa

module load bioinfo-tools
module load bwa
module load samtools

cd ~/Thrash/binning/bins_1

for bins in *.fa
do
bwa mem -t 2 $bins ~/Thrash/raw/SRR4342129_1.paired.trimmed.fastq.gz ~/Thrash/raw/SRR4342129_2.paired.trimmed.fastq.gz  > ~/Thrash/maps/$bins.sam
samtools view -S -b ~/Thrash/maps/$bins.sam > ~/Thrash/maps/$bins.bam
rm ~/Thrash/maps/$bins.sam
samtools sort ~/Thrash/maps/$bins.bam > ~/Thrash/maps/$bins.sorted.bam
rm ~/Thrash/maps/$bins.bam
done
