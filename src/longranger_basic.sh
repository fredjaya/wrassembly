#!/bin/bash

#PBS -P RDS-FSC-WholeGenomeAssembly-RW
#PBS -l select=1:ncpus=4:mem=64GB
#PBS -l walltime=12:00:00

LR=/home/fjay0039/longranger-2.2.2/longranger
DATA=/scratch/WholeGenomeAssembly/convert_tellseq_10x_4M/FW
#DATA=/scratch/WholeGenomeAssembly/convert_tellseq_10x_4M/PF
OUT=/scratch/WholeGenomeAssembly/longranger

cd ${OUT}
#$LR basic --id=PF-4M --fastqs=${DATA}
$LR basic --id=FW-4M --fastqs=${DATA}

