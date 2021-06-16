#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 16:00:00
#SBATCH -J bwa

#load modules
module load bioinfo-tools
module load bwa
module load samtools

cd ~/Thrash/binning/bins_1

bwa mem -t 2 binning11.fa ~/Thrash/raw/SRR4342129_1.paired.trimmed.fastq.gz ~/Thrash/raw/SRR4342129_2.paired.trimmed.fastq.gz  > ~/Thrash/maps/bin11.sam
samtools view -S -b ~/Thrash/maps/bin11.sam > ~/Thrash/maps/bin11.bam
rm ~/Thrash/maps/bin11.sam
samtools sort ~/Thrash/maps/bin11.bam > ~/Thrash/maps/bin11_sorted.bam
rm ~/Thrash/maps/bin11.bam
