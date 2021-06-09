#!/bin/bash

BAM=$1

echo "Re-sorting .bam aligned via ARCS"
samtools sort -o ${BAM}.resorted.bam ${BAM}.bam

echo "Calculating depth"
samtools depth ${BAM}.resorted.bam > ${BAM}.resorted.bam.depth
cat ${BAM}.resorted.bam.depth | awk '{sum=+$4} END {print "Average = ", sum/NR}'

echo "Calculating % reads mapped"
samtools flagstat ${BAM}.resorted.bam > ${BAM}.resorted.bam.flagstat
cat ${BAM}.resorted.bam.flagstat
