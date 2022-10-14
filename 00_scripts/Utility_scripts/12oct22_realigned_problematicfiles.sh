


#ressources
module load tools
module load ngs
module load samtools/1.12
module load parallel/20160822
module load java/1.8.0
module load bamutil/1.0.14
module load gatk/3.8-0
module load jre/1.8.0-openjdk
module load picard-tools/2.25.2

# Global variables
DATAOUTPUT="06_realigned"
DATAINPUT="05_dedup"
GENOME="01_infofiles/fileOegenome10scaffoldC3G.fasta"

#move to present working dir

POP=("CRES_08_EKDL210004789-1a-AK11178-AK16246_HHJYYDSX2_L2" "TRAL_08_EKDL210007862-1a-AK16177-AK16178_HLNT5DSX2_L2" "KLEV_12_EKDL210005548-1a-AK11401-AK7949_HHJKNDSX2_L4" "TRAL_10_EKDL210007862-1a-AK16209-AK16210_HLNT5DSX2_L2" "VADE_02_EKDL210005548-1a-AK11630-AK16248_HHJKNDSX2_L4" "MOLU_03_EKDL200012859-1a-AK11160-AK9453_HNLVYDSXY_L1" "VENO_03_EKDL210004790-1a-AK11204-AK16254_HHJYYDSX2_L3" "ORIS_02_EKDL210009122-1a-AK31117-AK31118_HTVH3DSX2_L3" "ORIS_03_EKDL210009122-1a-AK18657-AK31242_HTVH3DSX2_L3" "PONT_99_EKDL210007862-1a-AK16197-AK16198_HLNT5DSX2_L2" "PONT_98_EKDL210004789-1a-AK11164-AK16239_HHJYYDSX2_L2" "PONT_97_EKDL210007862-1a-AK16213-AK16214_HLNT5DSX2_L2" "BUNN_13_EKDL210007863-1a-AK19072-AK23726_HLNT5DSX2_L2" "CLEW_07_EKDL210007862-1a-AK16191-AK16192_HLNT5DSX2_L2" "CLEW_08_EKDL210007862-1a-AK16207-AK16208_HLNT5DSX2_L2" "CRES_12_EKDL210009123-1a-AK19017-AK23748_HTVH3DSX2_L3"
"CRES_15_EKDL210004788-1a-AK11674-AK2690_HHJYYDSX2_L1" "DOLV_18_EKDL210009122-1a-AK31173-AK31174_HTVH3DSX2_L3" "GREV_05_EKDL200012859-1a-AK11476-AK16258_HNLVYDSXY_L1" "HAUG_19_EKDL210009123-1a-AK18989-AK33821_HTVH3DSX2_L3" 
"INNE_25_EKDL200012859-1a-AK11495-AK16238_HNLVYDSXY_L1" "NISS_38_EKDL200012859-1a-AK11528-AK14283_HNLVYDSXY_L1" 
"ORNE_15_EKDL210004790-1a-AK11177-AK16280_HHJYYDSX2_L3")
    for query in ${POP[*]}
    do 
        samtools index "$DATAINPUT"/"${query}".nocig.dedup_clipoverlap.minq20.bam 
        ## Create list of potential in-dels nocig
        java -jar /services/tools/gatk/3.8-0/GenomeAnalysisTK.jar \
        -T RealignerTargetCreator \
        -R $GENOME \
        -I "$DATAINPUT"/"${query}".nocig.dedup_clipoverlap.minq20.bam  \
        -o "$DATAOUTPUT"/"${query}".all_samples_for_indel_realigner.nocig.minq20.intervals 
        ## Run the indel realigner tool nocig
        java -jar /services/tools/gatk/3.8-0/GenomeAnalysisTK.jar \
        -T IndelRealigner \
        -R $GENOME \
        -I "$DATAINPUT"/"${query}".nocig.dedup_clipoverlap.minq20.bam \
        -targetIntervals "$DATAOUTPUT"/"${query}".all_samples_for_indel_realigner.nocig.minq20.intervals \
        --consensusDeterminationModel USE_READS  --nWayOut _minq20.nocig.realigned.bam
        ##
        mv *realigned.bam 06_realigned/
        mv *realigned.bai 06_realigned/
    done
done

