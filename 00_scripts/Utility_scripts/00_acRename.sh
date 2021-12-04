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

for file in 02_data/AGABB*.fq.gz; do
    mv "$file" "${file/AGABB/AGAB}"
done

for file in 06_realigned/Pont*.bam; do
    mv "$file" "${file/Pont/PONT}"
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


for file in 02_data/*.fq.gz; do
    mv "$file" "${file/__/_}"
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


#NO
mv 02_data/NO_B_EKDL200012859-1a-AK11436-AK16240_HNLVYDSXY_L1_1.fq.gz 02_data/AGAB_99_EKDL200012859-1a-AK11506-AK16290_HNLVYDSXY_L1_1.fq.gz  
mv 02_data/NO_B_EKDL200012859-1a-AK11436-AK16240_HNLVYDSXY_L1_2.fq.gz  02_data/AGAB_99_EKDL200012859-1a-AK11506-AK16290_HNLVYDSXY_L1_2.fq.gz
mv 02_data/NO_HAF_01_EKDL200012859-1a-AK10139-AK9682_HNLVYDSXY_L1_1.fq.gz  02_data/HAFR_99_EKDL200012859-1a-AK11401-AK7949_HNLVYDSXY_L1_1.fq.gz
mv 02_data/NO_HAF_01_EKDL200012859-1a-AK10139-AK9682_HNLVYDSXY_L1_2.fq.gz 02_data/HAFR_99_EKDL200012859-1a-AK11401-AK7949_HNLVYDSXY_L1_2.fq.gz

#SPAIN


#find the first 17 file called SPA... and mv them to another dir
#ls SPA*  | head -n 17 | xargs -I {} mv {} ../../temp/ # change path



#for file in SPA*.fq.gz; do
 #   mv "$file" "${file/SPA/RIAE}"
#done


for file in 02_data/Hals*; do
    mv "$file" "${file/Hals/HALS}"
done




#formatting loop 4char Pop
#for f in *.gz ; do
# mv "$f" "${f::4}_${f:4:100}"
#done