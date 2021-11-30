#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N unzip
#PBS -e 98_log_files/Import/unzip.err
#PBS -o 98_log_files/Import/unzip.out
#PBS -l nodes=1:ppn=4:thinnode
#PBS -l walltime=300:00:00
#PBS -l mem=12gb
#PBS -m n
#PBS -r n

# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

#change path for new Novogene data
#for zip in $(ls /home/projects/dp_00007/people/hmon/Novogene/lib2_2/*.zip);
#do unzip $zip
#done

for zip in $(ls /home/projects/dp_00007/people/hmon/Novogene/lib3/*.zip);
do unzip $zip
done


#change path too and name of receiving dir
#cd /home/projects/dp_00007/people/hmon/Novogene/lib2_2/
#mkdir flac_lib2
#find  -name *.fq.gz -exec cp '{}' "./flac_lib2/" ";"

#change path too and name of receiving dir
cd /home/projects/dp_00007/people/hmon/Novogene/lib4/
#mkdir temp in lib3 folder
find  -name *.fq.gz -exec scp '{}' "./temp/" ";"
