#!/bin/bash
set -exo pipefail

BIN=/home/meep/Desktop/Biocomputing/arcs
OUT=/media/meep/GenomeAbyss/assembly

export PATH=$PATH:/home/meep/Desktop/Biocomputing/links_v1.8.7
ID=$1

cd ${OUT}/arcs/${ID}

cp -su ${OUT}/${ID}_canu_purged_arrow.fasta ${ID}_canu_purged_arrow.fa
cp -su ${OUT}/longranger/${ID}-barcoded.fastq.gz ${ID}-barcoded.fq.gz

${BIN}/Examples/arcs-make arcs \
	draft=${ID}_canu_purged_arrow \
	reads=${ID}-barcoded \
	c=5 \
	a=0.1 \
	l=6 \
	z=500 \
	e=30000 \
	m=10-320

