#!/bin/bash
set -exo pipefail

#conda activate pbmm2

PREFIX=FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD

gcpp --algorithm=arrow \
	-x 20 \
	-X80 \
	-q 20 \
	-j 0 \
	-r \
	FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD.fasta \
	-o FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD_arrow.fasta,FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD_arrow.fastq FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD_aligned.bam

