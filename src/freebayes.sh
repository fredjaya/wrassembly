#!/bin/bash
set -ex

ID=${1}
REF=FW1_canu_purged_arrow_ARCS-LINKS_salsa2-AD_arrow_fb

# Call variants on entire bam
freebayes -f refdata-${REF}/fasta/genome.fa ${ID}/outs/possorted_bam.bam > ${ID}.vcf

# Compress and index .vcf
bgzip ${ID}.vcf
tabix ${ID}.vcf.gz

# Normalise and filter variants and select only hom-ALT and het- non-REF sites
bcftools norm -Ob -f refdata-${REF}/fasta/genome.fa --threads 60 ${ID}.vcf.gz | \
bcftools view -i 'QUAL>1 && (GT="AA" || GT="Aa")' -Oz --threads 60 \
> ${ID}_filtered.vcf.gz
# Lines   total/split/realigned/skipped:  22940316/0/3655497/0

bcftools index ${ID}_filtered.vcf.gz

# Generate consensus
bcftools consensus -Hla -f refdata-${REF}/fasta/genome.fa ${ID}_filtered.vcf.gz > ${ID}_canu_purged_arrow_ARCS-LINKS_salsa-AD_arrow_fb.fasta

#Warning: Sequence "scaffold_4211|arrow" not in FW1_filtered.vcf.gz
#Warning: Sequence "scaffold_6104|arrow" not in FW1_filtered.vcf.gz
#Warning: Sequence "scaffold_6105|arrow" not in FW1_filtered.vcf.gz
#Warning: Sequence "scaffold_6106|arrow" not in FW1_filtered.vcf.gz
#Warning: Sequence "scaffold_6108|arrow" not in FW1_filtered.vcf.gz
#Warning: Sequence "scaffold_6110|arrow" not in FW1_filtered.vcf.gz

# Get number of bases subject to be polished
bcftools view -H -i 'QUAL>1 && (GT="AA" || GT="Aa")' -Ov ${ID}_filtered.vcf.gz | \
	awk -F "\t" '{print $4"\t"$5}' | \
	awk '{lenA=length($1); lenB=length($2); if (lenA < lenB ) {sum+=lenB-lenA} else if ( lenA > lenB ) { sum+=lenA-lenB } else {sum+=lenA}} END {print sum}' \
	> ${ID}.numvar
echo "Num. bases affected: `cat ${ID}.numvar`"
# Num. bases affected: 337200
