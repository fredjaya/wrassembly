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
ust10x -sz 4000000 \
  -i1 TellreadOutput_I1_T505.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -r1 TellreadOutput_R1_T505.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -r2 TellreadOutput_R2_T505.fastq.gz.corrected.fastq.err_barcode_removed.fastq.gz \
  -wl 4M-with-alts-february-2016.txt

pigz *_sl.fastq.gz.4tenx.fastq

mv R1_sl.fastq.gz.4tenx.fastq.gz PF-4M-BC_S1_L001_R1_001.fastq.gz
mv R2_sl.fastq.gz.4tenx.fastq.gz PF-4M-BC_S1_L001_R2_001.fastq.gz
```

Long Ranger barcode whitelist replaced with TELL-seq whitelist.

Generate interleaved fasta file with Long Ranger:
```
qsub src/longranger_basic.sh
```

Generate graphviz Dot file (.gv) with ARCS:
```
src/arcs.sh
```

Join nodes with LINKS:
```
src/links.sh
```

**To-do:**
- [ ] Check LINKS run/troubleshoot
- [ ] Run QUAST on LINKS output
- [ ] Re-run using error correction with tigmint?

### Test Scaff10X with fairy wrasse (ignore/remove)

**Debarcode linked reads with `scaff_reads`**
```
src/scaff_reads_local.sh
```  

**Run Scaff10X on debarcoded reads**

Scaff10X was run twice, one without `-plot`, and one without `-plot`. This is due to `scaff-bin/plot-10x-length.sh` requiring `gnuplot` and `inkscape`. The run with `-plot` is needed to generate the `.freq` files for plotting.

```
# Without plotting [tmp_rununik_191401]
src/scaff10x_default_pbs.sh

# With plotting [tmp_rununik_125005]
src/scaff10x_defaultPlot_pbs.sh
```
**Assess scaffolding quality with QUAST**
```
qsub src/quast_pbs.sh
```

Output .fa identical to input. Without specifying `-plot`, pipeline terminates (exit: 0) after `scaff_bwa` completed. Same as [this issue](https://github.com/wtsi-hpag/Scaff10X/issues/19).

**Running pipeline manually lol**
```
# Plot barcode length distribution
/home/fjay0039/Scaff10X/src/scaff-bin/

sort -k 2,2 -k 5,5n align.length-5 > align.length-sort
/home/fjay0039/Scaff10X/src/scaff-bin/scaff_barcode-cover align.length-sort break.dat cover.dat > break.out
```

**To-do**
- [ ] Troubleshoot identical pre-n50 vs. post-n50
- [ ] Get read depth to inform `reads` and `link`
