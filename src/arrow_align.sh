#!/bin/bash
set -exo pipefail

#conda activate pbmm2

PREFIX=FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD

cd /data/fw_polishing 

ls *subreads*.bam > subreads.fofn

pbmm2 align \
	--sort \
	--preset "SUBREAD" \
	-j 0 -J 8 \
	${PREFIX}.fasta \
	subreads.fofn \
	${PREFIX}_aligned.bam
