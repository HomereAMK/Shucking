#!/bin/bash

# Clean up
rm 00_scripts/Utility_scripts/USAMMORLCOUNTS*sh

# launch scripts for Colosse
for file in $(ls /home/projects/dp_00007/people/hmon/Novaseq_MLX_USA/*1445*.fastq.gz | sed -e 's/_R[12].fastq.gz//'|sort -u)    #or #for file in $(ls 02_data/*fastq.gz|perl -pe 's/.f(ast)?q.gz//'|sort -u)

do
	base=$(basename "$file")
	toEval="cat 00_scripts/Utility_scripts/06_MORLUSAM_COUNTS.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/Utility_scripts/USAMMORLCOUNTS_"$base".sh
done


#change jobs header

#Submit jobs
for i in $(ls 00_scripts/Utility_scripts/USAMMORLCOUNTS*sh); do qsub $i; done

#create the receiving txt file

touch 07_depth/Summary_USAMMORLdepth_lcWGS_19oct22.txt