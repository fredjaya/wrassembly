#!/bin/bash

scaff_reads=/home/meep/Desktop/Biocomputing/Scaff10X/src/scaff-bin/scaff_reads
DIR=/media/meep/GenomeAbyss/assembly/scaff10x
SRC=/home/meep/Desktop/People/fred/wrassembly/src
ID=$1

cd $DIR
$scaff_reads ${ID}-reads.txt ${ID}-3M-BC-R1.fastq.gz ${ID}-4M-BC-R2.fastq.gz
