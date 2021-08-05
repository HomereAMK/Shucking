#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N markdupnClip__BASE__
#PBS -e 98_log_files/DuplicateClip/__BASE__markdnClip.err
#PBS -o 98_log_files/DuplicateClip/__BASE__markdnClip.out
#PBS -l nodes=1:ppn=12 # number of nodes, til 28
#PBS -l walltime=02:00:00
#PBS -l mem=20g
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes
TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)


#loading modules
module load tools
module load ngs
module load jre/1.8.0
module load picard-tools/2.6.0
module load parallel/20160822
module load java/1.8.0
module load bamutil/1.0.14

# Global variables
DATAOUTPUT="05_dedup"
DATAINPUT="04_mapped"
base=__BASE__

#scripts MarkDuplicates
java -jar /services/tools/picard-tools/2.6.0/picard.jar MarkDuplicatesWithMateCigar \
I="$DATAINPUT"/"$base".sort.minq20.bam \
O="$DATAOUTPUT"/"$base".dedup.bam \
M="$DATAOUTPUT"/"$base".duprmmetrics.txt \
REMOVE_DUPLICATES=true VALIDATION_STRINGENCY=SILENT

#scripts ClipOverlap
/services/tools/bamutil/1.0.14/bam clipOverlap \
--in "$DATAOUTPUT"/"$base".dedup.bam \
--out "$DATAOUTPUT"/"$base".dedup_clipoverlap.bam \
--stats

