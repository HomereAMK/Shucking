#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N IndexGenome
#PBS -e 98_log_files/Map/IndexGenome.err
#PBS -o 98_log_files/Map/IndexGenome.out
#PBS -l nodes=1:ppn=4:thinnode
#PBS -l walltime=00:02:00:00
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

#ressources
module load tools
module load ngs
module load bwa/0.7.17
module load samtools/1.11
module load jre/1.8.0
module load picard-tools/2.6.0
module load parallel/20160822
module load java/1.8.0
module load bamutil/1.0.14

#var
REFERENCE="01_infofiles/fileOegenome10scaffoldC3G.fasta"   # This is a fasta file with the reference genome sequence we will map to 
REFBASENAME="fileOegenome10scaffoldC3G"

#bwa_index
#bwa index -b bwtsw 01_infofiles/fileOegenome10scaffoldC3G.fasta
bwa index 01_infofiles/fileOegenome10scaffoldC3G.fasta
#samtools faidx
samtools faidx "$REFERENCE"

#Picard dict
java -jar /services/tools/picard-tools/2.6.0/picard.jar \
CreateSequenceDictionary \
R="$REFERENCE" \
O=01_infofiles/"$REFBASENAME".dict

#bowtie2-build $REFERENCE $REFBASENAME
