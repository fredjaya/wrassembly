#!/bin/bash

scaff_reads=/home/meep/Desktop/Biocomputing/Scaff10X/src/scaff-bin/scaff_reads
DIR=/home/meep/Desktop/People/fred/Dropbox/assembly/02_working/2105_scaff10x
SRC=/home/meep/Desktop/People/fred/wrassembly/src

cd $DIR
$scaff_reads ${DIR}/reads.txt 505_R1-BC.fastq.gz 505_R2-BC.fastq.gz 
