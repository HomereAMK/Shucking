
SAMPLELIST=list_fastq_Jun22.txt # Path to a list of prefixes of the raw fastq files. It should be a subset of the the 1st column of the sample table. An example of such a sample list is /workdir/cod/greenland-cod/sample_lists/sample_list_pe_1.tsv



ls /home/projects/dp_00007/people/hmon/Shucking/02_data/*.fq.gz|sed -e 's/_[12].fq.gz//'|sort -u > list_fastq_Jun22.txt
ls /home/projects/dp_00007/people/hmon/Shucking/03_trimmed/*paired.fq.gz|sed -e 's/_[12].paired.fq.gz//'|sort -u > list_fastq_trimmed_Jun22.txt


# Create headers for the output
# Create headers for the output
printf 'sample_seq_id\traw_reads\traw_bases\n'

# Loop over each sample in the sample table
for SAMPLEFILE in `cat $SAMPLELIST`; do
	RAWFASTQFILES=$SAMPLEFILE'_1.fq.gz'  # The input path and file prefix
	
	# Count the number of reads in raw fastq files. We only need to count the forward reads, since the reverse will contain exactly the same number of reads. fastq files contain 4 lines per read, so the number of total reads will be half of this line number. 
	zcat $RAWFASTQFILES | wc -l  > ${SAMPLELIST}.count_fastq_1.tmp &
	
	# Count the number of bases in raw fastq files. We only need to count the forward reads, since the reverse will contain exactly the same number of bases. The total number of reads will be twice this count. 
	zcat $RAWFASTQFILES | awk 'NR%4==2' | tr -d "\n" | wc -m > ${SAMPLELIST}.count_fastq_2.tmp  &
	

	# Extract relevant values from a table of sample, sequencing, and lane ID (here in columns 4, 3, 2, respectively) for each sequenced library
	#SAMPLE_ID=`grep -P "${SAMPLEFILE}\t" $SAMPLETABLE | cut -f 4`
	#SEQ_ID=`grep -P "${SAMPLEFILE}\t" $SAMPLETABLE | cut -f 3`
	#LANE_ID=`grep -P "${SAMPLEFILE}\t" $SAMPLETABLE | cut -f 2`
	#SAMPLE_SEQ_ID=$SAMPLE_ID'_'$SEQ_ID'_'$LANE_ID

# Find all adapter clipped fastq files corresponding to this sample and store them in the object ADAPTERFILES.
	#ADAPTERFILES=$BASEDIR'adapter_clipped/'$SAMPLE_SEQ_ID'*.gz'
 #Count all bases in adapter clipped files. 
	#zcat $ADAPTERFILES | awk 'NR%4==2' | tr -d "\n" | wc -m  > ${SAMPLELIST}.count_fastq_3.tmp &
# When reads are not quality filtered, directly write the output 
		
		# Write the counts in appropriate order.
		wait
		RAWREADS=`cat ${SAMPLELIST}.count_fastq_1.tmp`
		RAWBASES=`cat ${SAMPLELIST}.count_fastq_2.tmp`
		printf "%s\t%s\t%s\n" $RAWFASTQFILES $((RAWREADS/4)) $RAWBASES >> Jun_rawbases.tsv

		
	rm ${SAMPLELIST}.count_fastq_?.tmp
done


	printf 'sample_seq_id\traw_reads\traw_bases\n' >> Jun_rawbases.tsv
