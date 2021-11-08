#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N Rename
#PBS -e 98_log_files/Import/Rename.err
#PBS -o 98_log_files/Import/Rename.out
#PBS -l nodes=1:ppn=4:thinnode
#PBS -l walltime=100:00:00
#PBS -l mem=12gb
#PBS -m n
#PBS -r n


for file in 02_data/AGA*.fq.gz; do
    mv "$file" "${file/AGA/AGAB}"
done

for file in 02_data/BOVAL*.fq.gz; do
    mv "$file" "${file/BOVAL/BOVA}"
done

for file in 02_data/GREVE*.fq.gz; do
    mv "$file" "${file/GREVE/GREV}"
done

for file in 02_data/SVALL*.fq.gz; do
    mv "$file" "${file/SVALL/SVAL}"
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


for file in 02_data/Veno*.fq.gz; do
    mv "$file" "${file/Veno/VENO}"
done

for file in 02_data/Ven*.fq.gz; do
    mv "$file" "${file/Ven/VENO}"
done

for file in 02_data/Oste*.fq.gz; do
    mv "$file" "${file/Oste/OSTE}"
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

for file in 02_data/HALS_swe*.fq.gz; do
    mv "$file" "${file/HALS_swe/HFJO}"
done

for file in 02_data/HAV*.fq.gz; do
    mv "$file" "${file/HAV/HAVS}"
done

for file in 02_data/Vade*.fq.gz; do
    mv "$file" "${file/Vade/VADE}"
done


#NO
#mv NO_B_EKDL200012859-1a-AK11436-AK16240_HNLVYDSXY_L1_1.fq.gz AGA_99_EKDL200012859-1a-AK11506-AK16290_HNLVYDSXY_L1_1.fq.gz  
#mv NO_B_EKDL200012859-1a-AK11436-AK16240_HNLVYDSXY_L1_2.fq.gz  AGA_99_EKDL200012859-1a-AK11506-AK16290_HNLVYDSXY_L1_2.fq.gz
#mv NO_HAF_01_EKDL200012859-1a-AK10139-AK9682_HNLVYDSXY_L1_1.fq.gz  HAFR_99_EKDL200012859-1a-AK11401-AK7949_HNLVYDSXY_L1_1.fq.gz
#mv NO_HAF_01_EKDL200012859-1a-AK10139-AK9682_HNLVYDSXY_L1_2.fq.gz HAFR_99_EKDL200012859-1a-AK11401-AK7949_HNLVYDSXY_L1_2.fq.gz

#SPAIN


#find the first 17 file called SPA... and mv them to another dir
#ls SPA*  | head -n 17 | xargs -I {} mv {} ../../temp/ # change path



#for file in SPA*.fq.gz; do
 #   mv "$file" "${file/SPA/RIAE}"
#done