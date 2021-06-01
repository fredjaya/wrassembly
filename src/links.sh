#!/bin/bash

BIN=/home/meep/Desktop/Biocomputing/
OUT=/media/meep/GenomeAbyss/assembly

a=0.9
l=2
z=1000

cd ${OUT}/arcslinks

${BIN}/links_v1.8.7/LINKS \
	-f PF_canu_purged_arrow.renamed.fa \
	-s empty.fof \
	-b PF_canu_purged_arrow_c5_m50-10000_s98_r0.05_e30000_z${z}_l${l}_a${a} \
	-l ${l} \
	-a ${a} \
	-z ${z}
