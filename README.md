# wrassembly
De novo assembly of reef fishes with long and linked reads

## Installation and dependencies

[Scaff10X v4.2](https://github.com/fredjaya/Scaff10X/commit/7e8e77e6ebe4be5bb4c4e22a58010ba48d7d2a39)

### Scaff10X

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
- [ ] Get read depth to inform `reads` and `link`
