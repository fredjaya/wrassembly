# wrassembly
De novo assembly of reef fishes with long and linked reads

## Installation and dependencies

[Scaff10X v4.2](https://github.com/fredjaya/Scaff10X/commit/7e8e77e6ebe4be5bb4c4e22a58010ba48d7d2a39)

### Scaff10X

**Run Scaff10X with default settings (local):**
```
${SRC}/scaff10x.sh
```
Start run ~ 20 May 18:40, < 5GB RAM, 1 CPU during BWA steps so far

bwa mem - n specified cores, < 12GB RAM

End run ~ 23:41 - segmentation fault `[main] Version: 0.7.17-r1198-dirty`

**Run Scaff10X on HPC:**
```
qsub src/scaff10x_default_pbs.sh
```

Identical error as local run (segfault at scaff_bwa)

**Attempt with gunzipped fastq**

Same error

**Debarcode linked reads with `scaff_reads`**
```
src/scaff_reads_local.sh
```

**To-do**
- [ ] Get read depth to inform `reads` and `link`
