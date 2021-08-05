
#!/bin/bash

# Clean session

rm 00_scripts/REALIGNINDEL*sh

# launch scripts for Colosse

for file in $(ls 05_dedup/*dedup_clipoverlap.bam|sed -e 's/.dedup_clipoverlap.bam//g'|sort -u)
do

base=$(basename "$file")

	toEval="cat 00_scripts/05_GATK_indelrealigner.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/REALIGNINDEL_$base.sh
done


#Submit jobs
for i in $(ls 00_scripts/REALIGNINDEL*sh); do qsub $i; done
