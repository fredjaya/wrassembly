#!/bin/bash

cd $DIR

$scaff10x -nodes 12 \
	-plot barcode_length.png \
	FW_canu_purged_arrow.fasta \
	505_R1_sl.fastq.gz.4tenx.fastq.gz \
	505_R2_sl.fastq.gz.4tenx.fastq.gz

