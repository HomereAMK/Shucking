#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N Rename
#PBS -e 98_log_files/Import/Rename.err
#PBS -o 98_log_files/Import/Rename.out
#PBS -l nodes=1:ppn=4:thinnodels
#PBS -l walltime=300:00:00
#PBS -l mem=12gb
#PBS -m n
#PBS -r n





for file in 02_data/Fur*.fq.gz; do
    mv "$file" "${file/Fur/FUR}"
done

for file in 02_data/Lang*.fq.gz; do
    mv "$file" "${file/Lang/LANG}"
done


for file in 02_data/Klev*.fq.gz; do
    mv "$file" "${file/Klev/KLEV}"
done

for file in 02_data/Veno*.fq.gz; do
    mv "$file" "${file/Veno/VENO}"
done

for file in 02_data/Oste*.fq.gz; do
    mv "$file" "${file/Oste/OSTE}"
done

for file in 02_data/Sydk*.fq.gz; do
    mv "$file" "${file/Sydk/SYDK}"
done

for file in 02_data/Sydk*.fq.gz; do
    mv "$file" "${file/Sydk/SYDK}"
done


#find the first 17 file called SPA... and mv them to another dir
#ls SPA*  | head -n 17 | xargs -I {} mv {} ../../temp/ # change path



#for file in SPA*.fq.gz; do
 #   mv "$file" "${file/SPA/RIAE}"
#done