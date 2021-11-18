#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N fastqc
#PBS -o 98_log_files/FastQC/__BASE__fastqc.out
#PBS -e 98_log_files/FastQC/__BASE__fastqc.err
#PBS -l nodes=1:ppn=4 # number of nodes, til 28
#PBS -l walltime=01:00:00
#PBS -l mem=8g
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

#module list
module load tools
module load ngs
module load anaconda3/4.4.0
module load jre/1.8.0-openjdk
module load perl/5.20.1
module load fastqc/0.11.8
module load samtools/1.12
module load samstat/1.5.1


#variables
DATAOUTPUT="QC/FastQC"
DATAINPUT="02_data"
base=__BASE__


#scripts
fastqc "$DATAINPUT"/"$base"_1.fq.gz
fastqc "$DATAINPUT"/"$base"_2.fq.gz


#moveThatShit
mv 02_data/*.html "$DATAOUTPUT"
mv 02_data/*.zip "$DATAOUTPUT"
