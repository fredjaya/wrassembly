# wrassembly
De novo assembly of reef fishes with long and linked reads

## Installation and dependencies

Scaff10X v4.2  
- Fix broken link `sed s/pigz-2.4/pigz-2.6/g .../Scaff10X/install.sh` 

```
export scaff10x=/home/meep/Desktop/Biocomputing/Scaff10X/src/scaff10x
export DIR=/home/meep/Desktop/People/fred/Dropbox/assembly/02_working/2105_scaff10x
export SRC=/home/meep/Desktop/People/fred/wrassembly/src

# Run Scaff10X with default settings 
${SRC}/scaff10x.sh
```

Start run ~ 20 May 18:40, < 5GB RAM, 1 CPU during BWA steps so far

bwa mem - n specified cores, < 12GB RAM

End run ~ 23:41 - segmentation fault `[main] Version: 0.7.17-r1198-dirty

** To-do **  
- [ ] Get read depth to inform `reads` and `link`
