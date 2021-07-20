# _Cirrhilabrus aquamarinus_ (Fairy wrasse)

## PacBio assembly

Previously assembled with canu and polished with arrow.

**BUSCO:**
```
C:96.5%[S:94.8%,D:1.7%],F:0.7%,M:2.8%,n:3640
3514    Complete BUSCOs (C)
3452    Complete and single-copy BUSCOs (S)
62      Complete and duplicated BUSCOs (D)
26      Fragmented BUSCOs (F)
100     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```

**QUAST:**
```
Assembly        FW_canu_purged_arrow
# contigs (>= 0 bp)     15330
# contigs (>= 1000 bp)  15330
# contigs (>= 5000 bp)  15318
# contigs (>= 10000 bp) 15303
# contigs (>= 25000 bp) 13738
# contigs (>= 50000 bp) 9968
Total length (>= 0 bp)  1551167932
Total length (>= 1000 bp)       1551167932
Total length (>= 5000 bp)       1551134617
Total length (>= 10000 bp)      1551008292
Total length (>= 25000 bp)      1519935875
Total length (>= 50000 bp)      1380927793
# contigs       15330
Largest contig  1230500
Total length    1551167932
GC (%)  38.72
N50     149214
N75     85222
L50     3255
L75     6677
# N's per 100 kbp       0.05
```
## Linked read scaffolding  

**Process TELL-seq barcodes**
Raw TELL-seq reads previously demultiplexed and processed with Tell-Read.

TELL-seq barcodes converted and downsized to be 10X compatible:
```
ust10x -sz 4000000 \
  -i1 TellreadOutput_I1_T505.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -r1 TellreadOutput_R1_T505.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -r2 TellreadOutput_R2_T505.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -wl 4M-with-alts-february-2016.txt

pigz *_sl.fastq.gz.4tenx.fastq

mv R1_sl.fastq.gz.4tenx.fastq.gz FW-4M-BC_S1_L001_R1_001.fastq.gz
mv R2_sl.fastq.gz.4tenx.fastq.gz FW-4M-BC_S1_L001_R2_001.fastq.gz
```

Long Ranger barcode whitelist replaced with TELL-seq whitelist.

Generate interleaved fasta file with trimmed and processed barcodes using Long Ranger:
```
# Edited manually for PF and FW
qsub src/longranger_basic.sh
```

3868570 unique barcodes

 **ARCS/LINKS**
```
src/arcs.sh FW
```

Parameter sweep:
 c   | m        | z    | l   | a   | e      | num_scaffs
 --- | -------- | ---- | --- | --- | ------ | ---
 5   | 10-320   | 500  | 5   | 0.3 | 30000  | 15326
 3   | 10-320   | 500  | 3   | 0.9 | 30000  | 12253
 3   | 8-320    | 500  | 3   | 0.9 | 30000  | 12253
 3   | 10-320   | 500  | 3   | 0.9 | 50000  | 11576
 3   | 10-320   | 500  | 3   | 0.9 | 70000  | 11428
 *3* | *10-320* | *500*| *3* | *0.9*| *90000* | *11406*
 2   | 10-320   | 500  | 3   | 0.9 | 90000  | 11406
 3   | 10-320   | 500  | 2   | 0.9 | 90000  | 11406

```
src/arcs_stats.sh FW_canu_purged_arrow.sorted
```

83.84% reads mapped

**QUAST:**
```
Assembly        FW_canu_purged_arrow_c3_m10-320_s98_r0.05_e90000_z500_l3_a0.9.scaffolds
# contigs (>= 0 bp)     11406
# contigs (>= 1000 bp)  11406
# contigs (>= 5000 bp)  11394
# contigs (>= 10000 bp) 11379
# contigs (>= 25000 bp) 9897
# contigs (>= 50000 bp) 6835
Total length (>= 0 bp)  1551560332
Total length (>= 1000 bp)       1551560332
Total length (>= 5000 bp)       1551527017
Total length (>= 10000 bp)      1551400692
Total length (>= 25000 bp)      1522030578
Total length (>= 50000 bp)      1410807709
# contigs       11406
Largest contig  2488190
Total length    1551560332
GC (%)  38.72
N50     261589
N75     123333
L50     1614
L75     3740
# N's per 100 kbp       25.34
```

**BUSCO:**
```
C:91.3%[S:86.2%,D:5.1%],F:3.5%,M:5.2%,n:3640
3323    Complete BUSCOs (C)
3138    Complete and single-copy BUSCOs (S)
185     Complete and duplicated BUSCOs (D)
127     Fragmented BUSCOs (F)
190     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```

## Hi-C Scaffolding

98.85% mapped

**QUAST:**
```
Assembly        FW_canu_purged_arrow_ARCS-LINKS_salsa-AD
# contigs (>= 0 bp)     6110
# contigs (>= 1000 bp)  6110
# contigs (>= 5000 bp)  6099
# contigs (>= 10000 bp) 6084
# contigs (>= 25000 bp) 4965
# contigs (>= 50000 bp) 3460
Total length (>= 0 bp)  1554218332
Total length (>= 1000 bp)       1554218332
Total length (>= 5000 bp)       1554188451
Total length (>= 10000 bp)      1554062126
Total length (>= 25000 bp)      1532122409
Total length (>= 50000 bp)      1478721239
# contigs       6110
Largest contig  10253513
Total length    1554218332
GC (%)  38.72
N50     835054
N75     322650
L50     441
L75     1184
# N's per 100 kbp       196.32
```

**BUSCO:**
```
C:92.6%[S:89.4%,D:3.2%],F:2.7%,M:4.7%,n:3640
3372    Complete BUSCOs (C)
3254    Complete and single-copy BUSCOs (S)
118     Complete and duplicated BUSCOs (D)
100     Fragmented BUSCOs (F)
168     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```

## Long read polishing
```
arrow_align.sh
arrow_polish.sh
```

**QUAST:**
```
Assembly        FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD_arrow
# contigs (>= 0 bp)     6110
# contigs (>= 1000 bp)  6110
# contigs (>= 5000 bp)  6099
# contigs (>= 10000 bp) 6084
# contigs (>= 25000 bp) 4965
# contigs (>= 50000 bp) 3462
Total length (>= 0 bp)  1554132907
Total length (>= 1000 bp)       1554132907
Total length (>= 5000 bp)       1554103168
Total length (>= 10000 bp)      1553976841
Total length (>= 25000 bp)      1532032180
Total length (>= 50000 bp)      1478740373
# contigs       6110
Largest contig  10248503
Total length    1554132907
GC (%)  38.72
N50     837435
N75     322960
L50     441
L75     1184
# N's per 100 kbp       179.06
```

**BUSCO:**
```
C:92.4%[S:89.2%,D:3.2%],F:2.8%,M:4.8%,n:3640
3364    Complete BUSCOs (C)
3247    Complete and single-copy BUSCOs (S)
117     Complete and duplicated BUSCOs (D)
103     Fragmented BUSCOs (F)
173     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```

## Linked read polishing

```
freebayes.sh FW1
```

**QUAST:**
```
Assembly        FW_canu_purged_arrow_ARCS-LINKS_salsa2-AD_arrow_fb
# contigs (>= 0 bp)     6110
# contigs (>= 1000 bp)  6110
# contigs (>= 5000 bp)  6099
# contigs (>= 10000 bp) 6084
# contigs (>= 25000 bp) 4965
# contigs (>= 50000 bp) 3462
Total length (>= 0 bp)  1553908748
Total length (>= 1000 bp)       1553908748
Total length (>= 5000 bp)       1553879013
Total length (>= 10000 bp)      1553752783
Total length (>= 25000 bp)      1531814388
Total length (>= 50000 bp)      1478536196
# contigs       6110
Largest contig  10247579
Total length    1553908748
GC (%)  38.71
N50     837398
N75     322935
L50     441
L75     1184
# N's per 100 kbp       179.08
```

**BUSCO:**
```
C:92.9%[S:89.5%,D:3.4%],F:2.6%,M:4.5%,n:3640
3379    Complete BUSCOs (C)
3257    Complete and single-copy BUSCOs (S)
122     Complete and duplicated BUSCOs (D)
94      Fragmented BUSCOs (F)
167     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```

```
freebayes.sh FW2
```

**QUAST:**
```
Assembly        FW2_canu_purged_arrow_ARCS-LINKS_salsa-AD_arrow_fb
# contigs (>= 0 bp)     6110
# contigs (>= 1000 bp)  6110
# contigs (>= 5000 bp)  6099
# contigs (>= 10000 bp) 6084
# contigs (>= 25000 bp) 4964
# contigs (>= 50000 bp) 3462
Total length (>= 0 bp)  1553886075
Total length (>= 1000 bp)       1553886075
Total length (>= 5000 bp)       1553856345
Total length (>= 10000 bp)      1553730122
Total length (>= 25000 bp)      1531767074
Total length (>= 50000 bp)      1478514777
# contigs       6110
Largest contig  10247466
Total length    1553886075
GC (%)  38.71
N50     837331
N75     322935
L50     441
L75     1184
# N's per 100 kbp       179.09
```

**BUSCO:**
```
C:92.9%[S:89.5%,D:3.4%],F:2.6%,M:4.5%,n:3640
3379    Complete BUSCOs (C)
3257    Complete and single-copy BUSCOs (S)
122     Complete and duplicated BUSCOs (D)
94      Fragmented BUSCOs (F)
167     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```
