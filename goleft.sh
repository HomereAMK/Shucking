#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N indexbam
#PBS -e 98_log_files/indexbam.err
#PBS -o 98_log_files/indexbam.out
#PBS -l nodes=1:ppn=4:thinnode
#PBS -l walltime=00:100:00:00
#PBS -l mem=30g
#PBS -m n
#PBS -r n


# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

#TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
# Copy script as it was run
#SCRIPT=$0
#NAME=$(basename $0)
#LOG_FOLDER="98_log_files"
#cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"

# Load all required modules for the job
module load gcc/8.2.0
module load tools
module load ngs
module load bwa/0.7.16a
module load samtools/1.11
module load anaconda3/4.4.0  
module load goleft/0.2.3  

#
for file in $(ls bams/*.bam)
do bwa index $file 
done

#
BAMPATH=/home/projects/dp_00007/people/hmon/Shucking/bams

goleft indexcov --directory . $BAMPATH/*.bam
