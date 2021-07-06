#!/bin/bash
set -exo pipefail

ID=${1}
REF=FW_canu_purged_arrow_ARCS-LINKS_salsa-AD_arrow

# Split .bam into scaffolds for parallelisation
bamtools split -in ${1}/outs/possorted_bam.bam -reference
rename 's/possorted_bam\.REF_//g' ${1}/outs/*
rename 's/\|arrow//g' ${1}/outs/*
ls ${1}/outs/scaffold_*.bam | xargs -P 60 -n 1 -I {} bamtools index -in {}

# Call variants on each scaffold with freebayes
mkdir -p split_vcfs

ls ${1}/outs/scaffold_*.bam | \
	sed 's/${1}\/outs\///g' | \
	sed 's/\.bam//g' | \
	xargs -n 1 -I {} -P 60 \
	sh -c 'freebayes -f refdata-'${REF}'/fasta/genome.fa ${1}/outs/{}.bam > split_vcfs/{}.vcf'

# Compress and index .vcfs
ls split_vcfs/*.vcf | xargs -n 1 -I {} -P 60 sh -c "bgzip {}"
ls split_vcfs/*.vcf.gz | xargs -n 1 -I {} -P 60 sh -c "tabix {}"

# Concatenate .vcfs and normalise non-REF variants
bcftools concat -Ob split_vcfs/*.vcf.gz | \
	bcftools view -Ou -e 'type="ref"' | \
	bcftools norm -Ob -f refdata-${REF}/fasta/genome.fa -o ${1}.bcf --threads 60

# Filter variants and select only hom-ALT and het- non-REF sites
bcftools view -i 'QUAL>1 && (GT="AA" || GT="Aa")' -Oz --threads 60 ${1}.bcf > ${1}_filtered.vcf.gz
bcftools index ${1}_filtered.vcf.gz

# Generate consensus
bcftools consensus -Hla -f refdata-${REF}/fasta/genome.fa ${1}_filtered.vcf.gz > ${1}_canu_purged_arrow_ARCS-LINKS_salsa-AD_arrow_fb.fasta

#Warning: Sequence "scaffold_684|arrow" not in ${1}_filtered.vcf.gz
#Warning: Sequence "scaffold_724|arrow" not in ${1}_filtered.vcf.gz
#Warning: Sequence "scaffold_725|arrow" not in ${1}_filtered.vcf.gz
#Warning: Sequence "scaffold_726|arrow" not in ${1}_filtered.vcf.gz
#Warning: Sequence "scaffold_727|arrow" not in ${1}_filtered.vcf.gz

# Get number of bases subject to be polished
bcftools view -H -i 'QUAL>1 && (GT="AA" || GT="Aa")' -Ov ${1}_filtered.vcf.gz | \
	awk -F "\t" '{print $4"\t"$5}' | \
	awk '{lenA=length($1); lenB=length($2); if (lenA < lenB ) {sum+=lenB-lenA} else if ( lenA > lenB ) { sum+=lenA-lenB } else {sum+=lenA}} END {print sum}' \
	> ${1}.numvar
echo "Num. bases affected: `cat ${ID}.numvar`"
# 778981
