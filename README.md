# wrassembly
De novo assembly of reef fishes with long and linked reads

## Resources and pipelines  

- [Towards complete and error-free genome assemblies of all vertebrate species](https://www.nature.com/articles/s41586-021-03451-0)
- [_Acropora millepora_ assembly](https://przeworskilab.com/wp-content/uploads/acropora-millepora-assembly.pdf)


## Installation and dependencies

Scaff10X v4.2  
- Fix broken link `sed s/pigz-2.4/pigz-2.6/g .../Scaff10X/install.sh` 

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

**To-do**
- [ ] Get read depth to inform `reads` and `link`
