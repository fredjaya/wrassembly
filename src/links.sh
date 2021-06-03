#!/bin/bash

BIN=/home/meep/Desktop/Biocomputing/
OUT=/media/meep/GenomeAbyss/assembly
ID=$1

a=0.9
l=2
z=1000

cd ${OUT}/arks/${ID}

${BIN}/links_v1.8.7/LINKS \
	-f ${ID}_canu_purged_arrow.renamed.fa \
	-s empty.fof \
	-b ${ID}_canu_purged_arrow_c5_m50-10000_s98_r0.05_e30000_z${z}_l${l}_a${a} \
	-l ${l} \
	-a ${a} \
	-z ${z}
