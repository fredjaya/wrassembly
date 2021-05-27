#!/bin/bash

#PBS -P RDS-FSC-WholeGenomeAssembly-RW
#PBS -l select=1:ncpus=4:mem=32GB
#PBS -l walltime=12:00:00

LR=/home/fjay0039/longranger-2.2.2/longranger
DATA=/project/WholeGenomeAssembly/parrotfish
OUT=/scratch/WholeGenomeAssembly/2105_longranger

cd ${OUT}
$LR basic --id=PF-4M --fastqs=${DATA}
