#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Novogene
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N import
#PBS -e import.err
#PBS -o import.out
#PBS -l nodes=1:ppn=4:thinnode
#PBS -l walltime=100:00:00
#PBS -l mem=12gb
#PBS -m n
#PBS -r n

#cp fq.gz
scp lib1/fX204SC20121682-Z01-F001.zip Raw_data_verified/
scp lib2_2/X204SC20121682-Z01-F002_1.zip Raw_data_verified/
scp lib2_2/X204SC20121682-Z01-F002_2.zip Raw_data_verified/
scp lib2_2/X204SC20121682-Z01-F002_3.zip Raw_data_verified/
scp lib2_2/X204SC20121682-Z01-F002_4.zip Raw_data_verified/
scp lib2_2/X204SC20121682-Z01-F003.zip Raw_data_verified/
scp lib2_2/flac_lib2/ChangeFileNames.txt Raw_data_verified/


#change path for new Novogene data
cd Raw_data_verified/
for zip in $(ls *.zip);
do unzip $zip
done

#change path too and name of receiving dir
cd /home/projects/dp_00007/people/hmon/Novogene/Raw_data_verified/
mkdir All_lib
find  -name *.fq.gz -exec scp '{}' "./All_lib/" ";"