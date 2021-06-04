#!/bin/bash

BIN=/home/meep/Desktop/Biocomputing/arcs
OUT=/media/meep/GenomeAbyss/assembly

export PATH=$PATH:/home/meep/Desktop/Biocomputing/links_v1.8.7
ID=$1

cd ${OUT}/arcs/${ID}

cp -s ${OUT}/${ID}_canu_purged_arrow.fasta ${ID}_canu_purged_arrow.fa
cp -s ${OUT}/longranger/${ID}-barcoded.fastq.gz ${ID}-barcoded.fq.gz

${BIN}/Examples/arcs-make arcs \
	draft=${ID}_canu_purged_arrow \
	reads=${ID}-barcoded \
	c=3 \
	a=0.9 \
	l=3 \
	z=500 \
	e=70000 \
	m=10-250
