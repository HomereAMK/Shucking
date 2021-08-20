#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N covstats_384
#PBS -e 98_log_files/Covstat/covstat_384.err
#PBS -o 98_log_files/Covstat/covstat_384.out
#PBS -l nodes=1:ppn=15:thinnode
#PBS -l walltime=10:00:00
#PBS -l mem=200gb
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

# Load module angsd
module load tools
module load ngs
module load htslib/1.11
module load angsd/0.931

## Load modules FOR R AND NGSLD
module load gsl/2.6
module load perl/5.20.1
module load samtools/1.11
module load imagemagick/7.0.10-13
module load gdal/2.2.3
module load geos/3.8.0
module load jags/4.2.0
module load hdf5
module load netcdf
module load boost/1.74.0
module load openssl/1.0.0
module load lapack
module load udunits/2.2.26
module load proj/7.0.0
module load gcc/10.2.0
module load intel/perflibs/64/2020_update2
module load R/4.0.0
module load ngstools/20190624

###############################################

R --slave -e 'source("00_scripts/06_covstats.R")'
