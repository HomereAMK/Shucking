#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N bam_depth
#PBS -e 98_log_files/Covstat/__BASE__depth.err
#PBS -o 98_log_files/Covstat/__BASE__depth.out
#PBS -l nodes=1:ppn=4:thinnode
#PBS -l walltime=100:00:00
#PBS -l mem=16gb
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

#module
module load tools
module load ngs
module load samtools/1.12

#move to present working dir
cd $PBS_O_WORKDIR

base=__BASE__

######################################################################################################################
samtools depth -aa 06_realigned/"$base".nocig.dedup_clipoverlap.minq10_minq10.nocig.realigned.bam | cut -f 3 | gzip > 07_depth/"$base"_depth.gz



#file=Vade_02_EKDL210005548-1a-AK11630-AK16248_HHJKNDSX2_L4
#samtools depth -aa -@ 4 06_realigned/"$file".nocig.dedup_clipoverlap.minq10_minq10.nocig.realigned.bam | cut -f 3 | gzip > 07_depth/"$file"_depth.gz