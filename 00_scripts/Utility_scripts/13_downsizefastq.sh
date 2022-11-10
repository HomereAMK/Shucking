

module load tools ngs  
module load jdk/19 openjdk/19 java/1.8.0-openjdk jre/1.8.0-openjdk 
module load bbmap/38.90

#samplerate=0.2 Randomly output only this fraction of reads; 1 means sampling is disabled.
reformat.sh in1=$file_1.fq.gz in2=$file_2.fq.gz out1=$file_0.2_1.fq.gz out2=$file_0.2_2.fq.gz samplerate=0.2
