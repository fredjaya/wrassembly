#!/bin/bash
set -exo pipefail

ID=${1}
REF=FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD_arrow

# Prepare 10X compatible reference
longranger mkref ${REF}.fasta

# Align linked reads to reference genome
longranger align \
	--id=${ID} \
	--fastq=/data/fw_polishing/tellseq \
	--reference=refdata-${REF} \
	--localcores=60 \
	--localmem=128 \
	--disable-ui \
	--nopreflight
