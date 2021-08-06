#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N importfq.gz
#PBS -e 98_log_files/Import/unzip.err
#PBS -o 98_log_files/Import/unzip.out
#PBS -l nodes=1:ppn=4:thinnodels
#PBS -l walltime=300:00:00
#PBS -l mem=12gb
#PBS -m n
#PBS -r n

#cp fq.gz
scp /home/projects/dp_00007/people/hmon/Novogene/lib2_2/flac_lib2/*.fq.gz ./02_data
