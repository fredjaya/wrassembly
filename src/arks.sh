#!/bin/bash

BIN=/home/meep/Desktop/Biocomputing/arcs
OUT=/media/meep/GenomeAbyss/assembly

export PATH=$PATH:/home/meep/Desktop/Biocomputing/links_v1.8.7

cd ${OUT}/arks

cp -s ../PF_canu_purged_arrow.fasta PF_canu_purged_arrow.fa
cp -s ../longranger/PF-3M/outs/barcoded.fastq.gz barcoded.fq.gz

${BIN}/Examples/arcs-make arks \
	draft=PF_canu_purged_arrow \
	reads=barcoded \
	c=2 \
	m=15-10000 \
	z=1000 \
		


