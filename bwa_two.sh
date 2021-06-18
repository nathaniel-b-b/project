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

cd ~/Thrash/binning/bins_2

for bins in *.fa
do
bwa mem -t 2 $bins ~/Thrash/raw/SRR4342133_1.paired.trimmed.fastq.gz ~/Thrash/raw/SRR4342133_2.paired.trimmed.fastq.gz  > ~/Thrash/maps2/$bins.sam
samtools view -S -b ~/Thrash/maps2/$bins.sam > ~/Thrash/maps2/$bins.bam
rm ~/Thrash/maps2/$bins.sam
samtools sort ~/Thrash/maps2/$bins.bam > ~/Thrash/maps2/$bins.sorted.bam
rm ~/Thrash/maps2/$bins.bam
done
