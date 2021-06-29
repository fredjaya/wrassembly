# Cirrhilabrus aquamarinus (Fairy wrasse)

## PacBio assembly

Previously assembled with canu and polished with arrow.

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

### To-do

Long Ranger barcode whitelist replaced with TELL-seq whitelist.

Generate interleaved fasta file with trimmed and processed barcodes using Long Ranger:
```
# Edited manually for PF and FW
qsub src/longranger_basic.sh
```

Scaffold draft assembly with linked-reads using ARKS/LINKS:
```
src/arks.sh FW
```

**ARKS/LINKS**  
c   | m        | z    | l   | a   | e     | num_scaffs  
--- | -------- | ---- | --- | --- | ----- | --- 
5   | 50-10000 | 500  | 5   | 0.3 | 30000 | 15330  
3   | 10-320   | 500  | 3   | 0.9 | 50000 | 14147
3   | 10-320   | 500  | 3   | 0.9 | 50000 | 14118

```
src/arcs.sh FW
```

**ARCS/LINKS**
c   | m        | z    | l   | a   | e     | num_scaffs  
--- | -------- | ---- | --- | --- | ----- | --- 
3   | 10-320   | 500  | 3   | 0.9 | 70000 | 5034 
3   | 10-320   | 500  | 3   | 0.9 | 90000 | 5019

```
src/arcs_stats.sh FW_canu_purged_arrow.sorted
```

XX% reads mapped
