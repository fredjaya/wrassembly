#!/bin/bash

scaff10x=/home/meep/Desktop/Biocomputing/Scaff10X/src/scaff10x
DIR=/home/meep/Desktop/People/fred/Dropbox/assembly/02_working/2105_scaff10x
SRC=/home/meep/Desktop/People/fred/wrassembly/src

cd $DIR

$scaff10x -nodes 12 \
	-plot barcode_length.png \
	FW_canu_purged_arrow.fasta \
	505_R1_sl.fastq.gz.4tenx.fastq.gz \
	505_R2_sl.fastq.gz.4tenx.fastq.gz

