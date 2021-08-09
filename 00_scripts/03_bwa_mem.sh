#!/bin/bash
#PBS -d /home/projects/dp_00007/people/hmon/Shucking
#PBS -W group_list=dp_00007 -A dp_00007
#PBS -N bwa__BASE__
#PBS -e 98_log_files/Map/bwa__BASE__.err
#PBS -o 98_log_files/Map/bwa__BASE__.out
#PBS -l nodes=2:ppn=10:thinnode
#PBS -l walltime=00:05:00:00
#PBS -l mem=60g
#PBS -m n
#PBS -r n


# Go to the directory from where the job was submitted (initial directory is $HOME)
echo Working directory is $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

### Here follows the user commands:
# Define number of processors
NPROCS=`wc -l < $PBS_NODEFILE`
echo This job has allocated $NPROCS nodes

#TIMESTAMP=$(date +%Y-%m-%d_%Hh%Mm%Ss)
# Copy script as it was run
#SCRIPT=$0
#NAME=$(basename $0)
#LOG_FOLDER="98_log_files"
#cp $SCRIPT $LOG_FOLDER/"$TIMESTAMP"_"$NAME"

# Load all required modules for the job
module load gcc/8.2.0
module load tools
module load ngs
module load bwa/0.7.17
module load samtools/1.12


# Global variables
DATAOUTPUT="04_mapped"
DATAINPUT="03_trimmed"
GENOME="01_infofiles/fileOegenome10scaffoldC3G.fasta"
NCPU=8
base=__BASE__


#     Align reads
    echo "Aligning $base"
    ID=$(echo "@RG\tID:$base\tSM:$base\tPL:Illumina")

  # Align reads 1 step
    bwa mem -t "$NCPU" \
        -R "$ID" \
        "$GENOME" \
        "$DATAINPUT"/"$base"_1.paired.fq.gz "$DATAINPUT"/"$base"_2.paired.fq.gz >"$DATAOUTPUT"/"$base".sam


        # Create bam file
    echo "Creating bam for $base"

    samtools view -bS -h -q 10 -F 4 \
    "$DATAOUTPUT"/"$base".sam >"$DATAOUTPUT"/"$base".bam


     echo "Creating sorted bam for $base"
        samtools sort "$DATAOUTPUT"/"$base".bam -o "$DATAOUTPUT"/"$base".sort.minq10.bam
        samtools index "$DATAOUTPUT"/"$base".sort.minq10.bam
   
   # Clean up
    echo "Removing "$DATAOUTPUT"/"$base".sam"
    echo "Removing "$DATAOUTPUT"/"$base".bam"

        rm "$DATAOUTPUT"/"$base".sam
        rm "$DATAOUTPUT"/"$base".bam

#map only on scaffold5
# because of a possible inversin at the begin of the chr for the scandinavian populations (see  )
GENOME="01_infofiles/scaffold5.fa"
bwa mem -t "$NCPU" \
        -R "$ID" \
        "$GENOME" \
        "$DATAINPUT"/"$base"_1.paired.fq.gz "$DATAINPUT"/"$base"_2.paired.fq.gz >"$DATAOUTPUT"/"$base".sam

samtools view -bS -h -q 10 -F 4 \
    "$DATAOUTPUT"/"$base".sam >"$DATAOUTPUT"/"$base".bam

samtools sort "$DATAOUTPUT"/"$base".bam -o "$DATAOUTPUT"/"$base".sort.minq10.scaffold5.bam
samtools index "$DATAOUTPUT"/"$base".sort.minq10.scaffold5.bam

# Clean up
    echo "Removing "$DATAOUTPUT"/"$base".sam"
    echo "Removing "$DATAOUTPUT"/"$base".bam"

        rm "$DATAOUTPUT"/"$base".sam
        rm "$DATAOUTPUT"/"$base".bam