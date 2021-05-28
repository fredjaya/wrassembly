#!/bin/bash

BIN=/home/meep/Desktop/Biocomputing/
OUT=/media/meep/GenomeAbyss/assembly

cd ${OUT}/links

${BIN}/links_v1.8.7/LINKS -f ${OUT}/arcs/PF_canu_purged_arrow.renamed.fa \
	-s ${OUT}/arcs/empty.fof \
	-b ${OUT}/arcs/PF_canu_purged_arrow_c5_m50-10000_s98_r0.05_e30000_z500_l5_a0.3 \
	-l 5 \
	-a 0.3 \
	-z 500
