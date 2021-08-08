# Shucking
# OysterAngsd

Low depth genomewidesequencing of oysters

### WARNING

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

# Documentation

### Prelim
              -clean name of the fastqc
```

for i in 02_data/*_XXX.fastq.gz
do
    mv "$i" "`echo $i | sed 's/_001//'`"
done
````

### 00-FastQC
```
module load tools   
module load ngs  
module load jre/1.8.0   
module load perl/5.20.1
module load fastqc/0.11.8
```
```
/services/tools/fastqc/0.11.8/fastqc  05_dedup/*.sort.bam
```

### 01-Trimmomatic
```
chmod +x 00_scripts/02_trimmomatic_launch.sh
```
```
qsub 00_scripts/02_trimmomatic_launch.sh
```

### 02-AdapterRemoval
```
.
```

### Bwa-index genome (need to build a script for that)
```
module load tools
module load ngs
module load bwa/0.7.15
bwa index -b bwtsw 01_infofiles/fileOegenome10scaffoldC3G.fasta
```

### 3-Bwa-mem on entire genome and chr5 
Because possible inversion at the beginning of chr 5
<br>

<img src="Rplots/NISS_INNEManhattanfst15kb_5indperPopsnptdata2.tiff" width="49%" height="20%" />

<br>
```
chmod +x 00_scripts/03_bwa_mem_launch.sh
```
```
 00_scripts/03_bwa_mem_launch.sh
```
### 4-MarkDuplicates
```
mkdir 05_dedup
```

### 5-GATK IndelRealigner

### some stats after mapping and cleaning phase
```
module load samstat/1.5.1
/services/tools/samstat/1.5.1/bin/samstat folder/duprm.cig.aln.XXXX.sort.bam
```

### 6-ANGSD
Before running the scripts, create the bam list
```
for i in 07_clean_bam/*.bam
do
    mv "$i" "`echo $i | sed 's/S*_L001.dedup_clipoverlap_realigned//'`"
done
```

```
ls -1 07_clean_bam/*.bam > 01_infofiles/list_bam
```
          -Call SNPs
          -Weighted pairwise <i>Fst</i> between locations
          -
          -
### 7-pcANGSD
          -Individual inbreeding coefficient
          -
          -
          -
          
### Calling Variants on MT genome
```
for i in 08_clean_bamMT/*.bam
do
    mv "$i" "`echo $i | sed 's/S*_L001_mt.dedup_clipoverlap//'`"
done
```
```
ls -1 08_clean_bamMT/*.bam > 01_infofiles/list_bamMT
```


# Prerequisities
[ANGSD](http://www.popgen.dk/angsd/index.php/ANGSD)\
[BBmap](https://sourceforge.net/projects/bbmap/)\
[Bwa](http://bio-bwa.sourceforge.net/bwa.shtml)\
[GATK](https://gatk.broadinstitute.org/hc/en-us) \
[Picard-tools](https://broadinstitute.github.io/picard/)\
[samtools](http://www.htslib.org/doc/samtools.html)\
[Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)\
[UniVec](https://www.ncbi.nlm.nih.gov/tools/vecscreen/univec/)

# Citation

Korneliussen T. S., Albrechtsen A. and Nielsen R. 2014. ANGSD: Analysis of Next Generation Sequencing Data. BMC Bioinformatics. DOI: 10.1186/s12859-014-0356-4

https://github.com/jleluyer/angsd_genotyping_workflow

https://github.com/BelenJM

https://github.com/mfumagalli/Copenhagen

https://github.com/therkildsen-lab


#Number of base per scaffold
``` grep -v '>' 01_infofiles/scaffold2| sed -e 's/\(.\)/&\n/g' | wc -l ```

#scaffold1 - 118329717
#scaffold2 - 115608069
#scaffold3 - 101022135
#scaffold3