# wrassembly
De novo assembly of reef fishes with long and linked reads

## Installation and dependencies

Long Ranger v2.2.2
ARCS v1.2.1
LINKS v1.8.7
[Scaff10X v4.2](https://github.com/fredjaya/Scaff10X/commit/7e8e77e6ebe4be5bb4c4e22a58010ba48d7d2a39)

## PacBio assembly

Previously assembled with canu and polished with arrow.

Get assembly quality:
```
qsub -v FA=/project/WholeGenomeAssembly/parrotfish/PF_canu_purged_arrow.fasta src/quast.sh
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

```
# Parrotfish (PF)
ust10x -sz 4000000 \
  -i1 TellreadOutput_I1_T506.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -r1 TellreadOutput_R1_T506.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -r2 TellreadOutput_R2_T506.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -wl 4M-with-alts-february-2016.txt

pigz *_sl.fastq.gz.4tenx.fastq

mv R1_sl.fastq.gz.4tenx.fastq.gz PF-4M-BC_S1_L001_R1_001.fastq.gz
mv R2_sl.fastq.gz.4tenx.fastq.gz PF-4M-BC_S1_L001_R2_001.fastq.gz
```

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
c   | m        | z    | l   | a   | num_scaffs  
--- | -------- | ---- | --- | --- | ---  
5   | 50-10000 | 500  | 5   | 0.3 | 2670  
5   | 50-10000 | 1000 | 2   | 0.9 | 2644  
3   | 50-10000 | 500  | 5   | 0.3 | 2213
 

**To-do:**
- [ ] Check mapping % and coverage of longranger reads
- [ ] Run arks
