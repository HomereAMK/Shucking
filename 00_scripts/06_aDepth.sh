#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N bam_depth
#PBS -e 98_log_files/Covstat/covstat.err
#PBS -o 98_log_files/Covstat/covstat.out
#PBS -l nodes=2:ppn=10:thinnode
#PBS -l walltime=100:00:00
#PBS -l mem=100gb
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

######################################################################################################################
for file in $(ls 06_realigned/*.bam|sed -e 's/.nocig.dedup_clipoverlap.minq10_minq10.nocig.realigned.bam//'|sort -u); do
    samtools depth -aa "$file".nocig.dedup_clipoverlap.minq10_minq10.nocig.realigned.bam | cut -f 3 | gzip > 07_depth/"$file"_depth.gz

done
