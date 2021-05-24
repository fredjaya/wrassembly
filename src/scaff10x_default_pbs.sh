#!/bin/bash

#PBS -P RDS-FSC-WholeGenomeAssembly-RW
#PBS -l select=1:ncpus=24:mem=64GB
#PBS -l walltime=24:00:00

scaff10x=/home/fjay0039/Scaff10X/src/scaff10x
DIR=/scratch/WholeGenomeAssembly/2105_scaff10x
SRC=/home/fjay0039/wrassembly/src

cd $DIR

$scaff10x -nodes 22 \
	-plot barcode_length.png \
	FW_canu_purged_arrow.fasta \
	505_R1_sl.fastq.gz.4tenx.fastq \
	505_R2_sl.fastq.gz.4tenx.fastq \
	505_scaff10x.fasta
