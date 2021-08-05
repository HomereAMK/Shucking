#!/bin/bash

rm 00_scripts/QC*sh

# launch scripts for Colosse
for file in $(ls 02_data/*.fq.gz|sed -e 's/_[12].fq.gz//'|sort -u)    #or #for file in $(ls 02_data/*fastq.gz|perl -pe 's/.f(ast)?q.gz//'|sort -u)

do
        base=$(basename "$file")
        toEval="cat 00_scripts/00_fastqc.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/QC_"$base".sh
done


#change jobs header

#Submit jobs
for i in $(ls 00_scripts/QC*sh); do qsub $i; done

