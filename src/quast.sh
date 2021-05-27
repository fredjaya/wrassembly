#!/bin/bash

#PBS -P RDS-FSC-WholeGenomeAssembly-RW
#PBS -l select=1:ncpus=8:mem=24GB
#PBS -l walltime=1:00:00

module load quast
module load python

quast.py -o ~/wrassembly/quast_results \
	--eukaryote \
	--no-html \
	--threads 8 \
	$FA
