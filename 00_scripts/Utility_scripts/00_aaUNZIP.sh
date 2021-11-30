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

cd /home/projects/dp_00007/people/hmon/Novogene/lib4/temp

for file in 02_data/AGA*.fq.gz; do
    mv "$file" "${file/AGA/AGAB}"
done

for file in AGA*.fq.gz; do
    mv "$file" "${file/AGA/AGAB}"
done
for file in 02_data/BOVAL*.fq.gz; do
    mv "$file" "${file/BOVAL/BOVA}"
done

for file in Bova*.fq.gz; do
    mv "$file" "${file/Bova/BOVA}"
done

for file in Boval*.fq.gz; do
    mv "$file" "${file/Boval/BOVA}"
done

for file in 02_data/Cres*.fq.gz; do
    mv "$file" "${file/Cres/CRES}"
done

for file in 02_data/Dolv*.fq.gz; do
    mv "$file" "${file/Dolv/DOLV}"
done

for file in 02_data/GREVE*.fq.gz; do
    mv "$file" "${file/GREVE/GREV}"
done

for file in 02_data/SVALL*.fq.gz; do
    mv "$file" "${file/SVALL/SVAL}"
done

for file in Svall*.fq.gz; do
    mv "$file" "${file/Svall/SVAL}"
done

for file in 02_data/Logstor*.fq.gz; do
    mv "$file" "${file/Logstor/LOGS}"
done

for file in 02_data/Fur*.fq.gz; do
    mv "$file" "${file/Fur/FURI}"
done

for file in 02_data/Lang*.fq.gz; do
    mv "$file" "${file/Lang/LANG}"
done

for file in 02_data/LILLA*.fq.gz; do
    mv "$file" "${file/LILLA/LILL}"
done

for file in 02_data/Klev*.fq.gz; do
    mv "$file" "${file/Klev/KLEV}"
done

for file in 02_data/KAL*.fq.gz; do
    mv "$file" "${file/KAL/KALV}"
done

for file in 02_data/Inne*.fq.gz; do
    mv "$file" "${file/Inne/INNE}"
done

for file in 02_data/Kalv*.fq.gz; do
    mv "$file" "${file/Kalv/KALV}"
done

for file in 02_data/Lill2*.fq.gz; do
    mv "$file" "${file/Lill2/LILL}"
done

for file in Lill2*.fq.gz; do
    mv "$file" "${file/Lill2/LILL}"
done

for file in 02_data/Nell*.fq.gz; do
    mv "$file" "${file/Nell/NELL}"
done

for file in 02_data/Orie*.fq.gz; do
    mv "$file" "${file/Orie/ORIS}"
done

for file in Orie*.fq.gz; do
    mv "$file" "${file/Orie/ORIS}"
done


for file in 02_data/Ost*.fq.gz; do
    mv "$file" "${file/Ost/OSTE}"
done

for file in OSTEe*.fq.gz; do
    mv "$file" "${file/OSTEe/OSTE}"
done

for file in 02_data/Oste*.fq.gz; do
    mv "$file" "${file/Oste/OSTE}"
done

for file in oste*.fq.gz; do
    mv "$file" "${file/oste/OSTE}"
done

for file in 02_data/Molu*.fq.gz; do
    mv "$file" "${file/Molu/MOLU}"
done

for file in 02_data/Rams*.fq.gz; do
    mv "$file" "${file/Rams/RAMS}"
done

for file in 02_data/Riae*.fq.gz; do
    mv "$file" "${file/Riae/RIAE}"
done

for file in 02_data/Svall*.fq.gz; do
    mv "$file" "${file/Svall/SVALL}"
done

for file in 02_data/This*.fq.gz; do
    mv "$file" "${file/This/THIS}"
done

for file in 02_data/Toll*.fq.gz; do
    mv "$file" "${file/Toll/TOLL}"
done

for file in 02_data/Zece*.fq.gz; do
    mv "$file" "${file/Zece/ZECE}"
done

for file in 02_data/Veno*.fq.gz; do
    mv "$file" "${file/Veno/VENO}"
done

for file in 02_data/Ven*.fq.gz; do
    mv "$file" "${file/Ven/VENO}"
done

for file in 02_data/Oste*.fq.gz; do
    mv "$file" "${file/Oste/OSTR}"
done

for file in 02_data/OSTE*.fq.gz; do
    mv "$file" "${file/OSTE/OSTR}"
done


for file in 02_data/Sydk*.fq.gz; do
    mv "$file" "${file/Sydk/SYDK}"
done

for file in 02_data/SCO*.fq.gz; do
    mv "$file" "${file/SCO/NELL}"
done

for file in 02_data/COLNE*.fq.gz; do
    mv "$file" "${file/COLNE/COLN}"
done

for file in 02_data/Colne*.fq.gz; do
    mv "$file" "${file/Colne/COLN}"
done

for file in Colne*.fq.gz; do
    mv "$file" "${file/Colne/COLN}"
done

for file in 02_data/Gaso*.fq.gz; do
    mv "$file" "${file/Gaso/GASO}"
done


for file in 02_data/Colne*.fq.gz; do
    mv "$file" "${file/Colne/COLN}"
done

for file in 02_data/HALS_swe*.fq.gz; do
    mv "$file" "${file/HALS_swe/HFJO}"
done

for file in 02_data/Hals.fq.gz; do
    mv "$file" "${file/Hals/HALS}"
done


for file in 02_data/HAV*.fq.gz; do
    mv "$file" "${file/HAV/HAVS}"
done

for file in 02_data/Vade*.fq.gz; do
    mv "$file" "${file/Vade/VADE}"
done

for file in 02_data/Bunn*.fq.gz; do
    mv "$file" "${file/Bunn/BUNN}"
done


for file in 02_data/Hypp*.fq.gz; do
    mv "$file" "${file/Hypp/HYPP}"
done


for f in *.gz ; do
  mv "$f" "${f::4}_${f:4:100}"
done