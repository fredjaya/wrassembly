#!/bin/bash

BIN=/home/meep/Desktop/Biocomputing/arcs
OUT=/media/meep/GenomeAbyss/assembly

cd ${OUT}/arcs

${BIN}/Examples/arcs-make arcs \
	draft=${OUT}/PF_canu_purged_arrow \
	reads=${OUT}/longranger/PF-4M/outs/barcoded \
	time=1 \
	t=11
