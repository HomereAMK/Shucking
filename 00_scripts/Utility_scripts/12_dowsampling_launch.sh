#!/bin/bash

# Clean session

rm 00_scripts/DOWNSAMP*sh
for file in $(ls 06_realigned/MORL*.bam|sed -e 's/.bam//g'|sort -u)
do

base=$(basename "$file")

	toEval="cat 00_scripts/Utility_scripts/12_downsamp.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/Utility_scripts/DOWNSAMP_$base.sh
done


#Submit jobs
for i in $(ls 00_scripts/Utility_scripts/DOWNSAMP*sh); do qsub $i; done

for file in $(ls 06_realigned/USAM*.bam|sed -e 's/.bam//g'|sort -u)
do

base=$(basename "$file")

	toEval="cat 00_scripts/Utility_scripts/12_downsamp.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/Utility_scripts/DOWNSAMP_$base.sh
done


#Submit jobs
for i in $(ls 00_scripts/Utility_scripts/DOWNSAMP*sh); do qsub $i; done