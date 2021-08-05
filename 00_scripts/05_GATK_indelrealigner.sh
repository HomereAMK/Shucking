#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N indelreal__BASE__
#PBS -o 98_log_files/IndelRealign/__BASE__indelreal.out
#PBS -e 98_log_files/IndelRealign/__BASE__indelreal.err
#PBS -l nodes=1:ppn=14 # number of nodes, til 28
#PBS -l walltime=05:00:00
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

module load tools
module load ngs
module load samtools/1.9
module load parallel/20160822
module load java/1.8.0
module load bamutil/1.0.14
module load gatk/3.8-0
module load jre/1.8.0-openjdk
module load picard-tools/2.9.1

# Global variables
DATAOUTPUT="06_realigned"
DATAINPUT="05_dedup"
GENOME="01_infofiles/fileOegenome10scaffoldC3G.fasta"

#move to present working dir
cd $PBS_O_WORKDIR

base=__BASE__

#scripts
#fasta seq dictionary file ref picard
#java -jar /services/tools/picard-tools/2.9.1/picard.jar CreateSequenceDictionary R= $GENOME

#-fai ref
#samtools faidx $GENOME

# Index bam files
samtools index "$DATAINPUT"/"$base".dedup_clipoverlap.bam

## Create list of potential in-dels
java -jar /services/tools/gatk/3.8-0/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-R $GENOME \
-I "$DATAINPUT"/"$base".dedup_clipoverlap.bam \
-o "$DATAOUTPUT"/"$base".all_samples_for_indel_realigner.intervals 

## Run the indel realigner tool
java -jar /services/tools/gatk/3.8-0/GenomeAnalysisTK.jar \
-T IndelRealigner \
-R $GENOME \
-I "$DATAINPUT"/"$base".dedup_clipoverlap.bam \
-targetIntervals "$DATAOUTPUT"/"$base".all_samples_for_indel_realigner.intervals \
--consensusDeterminationModel USE_READS  --nWayOut _realigned.bam

##
mv *realigned.bam 06_realigned/
