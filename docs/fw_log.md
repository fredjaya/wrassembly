# Cirrhilabrus aquamarinus (Fairy wrasse)

## PacBio assembly

Previously assembled with canu and polished with arrow.

BUSCO:
```
C:96.5%[S:94.8%,D:1.7%],F:0.7%,M:2.8%,n:3640
3514    Complete BUSCOs (C)
3452    Complete and single-copy BUSCOs (S)
62      Complete and duplicated BUSCOs (D)
26      Fragmented BUSCOs (F)
100     Missing BUSCOs (M)
3640    Total BUSCO groups searched
```

QUAST:
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
# Fairy Wrasse (FW)
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

```
src/arcs.sh FW
```

 **ARCS/LINKS**
 c   | m        | z    | l   | a   | e      | num_scaffs
 --- | -------- | ---- | --- | --- | ------ | ---
 5   | 10-320   | 500  | 5   | 0.3 | 30000  | 15326
 3   | 10-320   | 500  | 3   | 0.9 | 30000  | 12253
 3   | 8-320    | 500  | 3   | 0.9 | 30000  | 12253
 3   | 10-320   | 500  | 3   | 0.9 | 50000  | 11576
 3   | 10-320   | 500  | 3   | 0.9 | 70000  | 11428
 3   | 10-320   | 500  | 3   | 0.9 | 90000  | 11406
 2   | 10-320   | 500  | 3   | 0.9 | 70000  | 11406
 3   | 10-320   | 500  | 2   | 0.9 | 70000  | 11406

```
src/arcs_stats.sh FW_canu_purged_arrow.sorted
```

83.84% reads mapped

QUAST:
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

BUSCO: TBA
