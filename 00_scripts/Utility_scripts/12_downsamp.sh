#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N dowsamp
#PBS -e downsamp.err
#PBS -o downsamp.out
#PBS -l nodes=1:ppn=14:thinnode
#PBS -l walltime=03:00:00
#PBS -l mem=60gb
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

# Load all required modules for the job
module load gcc/8.2.0
module load tools
module load ngs
module load samtools/1.10

# Global variables
DATAOUTPUT="USAM_MORL"
DATAINPUT="06_realigned"
REF=01_infofiles/fileOegenome10scaffoldC3G.fasta
base=__BASE__

##downsampled Arno 1X https://odelaneau.github.io/GLIMPSE/tutorial_b38.html#run_preliminaries
samtools view -T "$REF" -s 1.6 -bo "$DATAOUTPUT"/"$base".1.6X.bam "$DATAINPUT"/"$base".bam
samtools index "$DATAOUTPUT"/"$base".1X.bam