# Cirrhilabrus aquamarinus (Fairy wrasse)

## PacBio assembly

Previously assembled with canu and polished with arrow.

Get assembly quality:
```
qsub -v FA=/project/WholeGenomeAssembly/parrotfish/FW_canu_purged_arrow.fasta src/quast.sh
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
src/arks.sh PF
```

FW and PF - original.gv populated but no scaffolding - change parameters

**ARKS/LINKS parameter sweep**  
c   | m        | z    | l   | a   | e     | num_scaffs  
--- | -------- | ---- | --- | --- | ----- | --- 
5   | 50-10000 | 500  | 5   | 0.3 | 30000 | 2670  
5   | 50-10000 | 1000 | 2   | 0.9 | 30000 | 2644  
3   | 50-10000 | 500  | 5   | 0.3 | 30000 | 2213
2   | 50-10000 | 500  | 5   | 0.3 | 30000 | 2213
3   | 50-10000 | 500  | 5   | 0.9 | 30000 | 2209
3   | 50-10000 | 500  | 3   | 0.9 | 30000 | 2209
3   | 50-10000 | 500  | 3   | 0.9 | 30000 | 1894
3   | 50-10000 | 500  | 2   | 0.9 | 30000 | 1894
3   | 50-10000 | 1000 | 3   | 0.9 | 30000 | 1894
3   | 50-10000 | 500  | 3   | 0.9 | 50000 | 1731
3   | 50-10000 | 500  | 3   | 0.9 | 70000 | 1696
3   | 50-10000 | 500  | 3   | 0.9 | 90000 | 1711 
3   | 10-250   | 500  | 3   | 0.9 | 70000 | 1616 

Run arcs to test coverage and % reads mapping:

```
src/arcs.sh
```
Actually achieved better results:
c   | m        | z    | l   | a   | e     | num_scaffs  
--- | -------- | ---- | --- | --- | ----- | --- 
3   | 10-250   | 500  | 3   | 0.9 | 70000 | 1215

```
src/arcs_stats.sh
```

97% reads mapped

