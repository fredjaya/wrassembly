#!/bin/bash

scaff_reads=/home/meep/Desktop/Biocomputing/Scaff10X/src/scaff-bin/scaff_reads
DIR=/media/meep/GenomeAbyss/assembly/scaff10x
SRC=/home/meep/Desktop/People/fred/wrassembly/src

cd $DIR
$scaff_reads ${DIR}/reads.txt PF-4M-BC-R1.fastq.gz PF-4M-BC-R2.fastq.gz
