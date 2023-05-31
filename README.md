# Shucking
# OysterAngsd

lcWGS _Ostrea edulis_
### WARNING

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

# Documentation



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
00_scripts/02_trimmomatic_launch.sh
```

### 02-AdapterRemoval


### Bwa-index genome
```
module load bwa/0.7.15
bwa index -b bwtsw 01_infofiles/fileOegenome10scaffoldC3G.fasta
```

### 3-Bwa-mem on entire genome
Because possible inversion at the beginning of chr 5

```
chmod +x 00_scripts/03_bwa_mem_launch.sh
```

```
 00_scripts/03_bwa_mem_launch.sh
```
### 4-MarkDuplicates


### 5-GATK IndelRealigner

### some stats after mapping and cleaning phase
```
module load samstat/1.5.1
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

module load fastqc/0.11.8
module load samtools/1.12
module load samstat/1.5.1
module load fastp/0.20.1
module load trimmomatic/0.38
module load picard-tools/2.6.0
module load parallel/20160822
module load bamutil/1.0.14
module load gatk/3.8-0
module load jre/1.8.0-openjdk
module load picard-tools/2.9.1

# Citation

Korneliussen T. S., Albrechtsen A. and Nielsen R. 2014. ANGSD: Analysis of Next Generation Sequencing Data. BMC Bioinformatics. DOI: 10.1186/s12859-014-0356-4

https://github.com/jleluyer/angsd_genotyping_workflow

https://github.com/BelenJM

https://github.com/mfumagalli/Copenhagen

https://github.com/therkildsen-lab



