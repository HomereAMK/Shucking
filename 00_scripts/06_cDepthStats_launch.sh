#!/bin/bash

# Clean session

rm 00_scripts/DEPTHSTATS*sh

# launch scripts for Colosse

for file in $(ls 01_infofiles/list* |sed -e 's/.depth//g'|sort -u)  #only the nocig retry
do

base=$(basename "$file")

	toEval="cat 00_scripts/06_cDepthStats.sh | sed 's/__BASE__/$base/g'"; eval $toEval > 00_scripts/DEPTHSTATS_$base.sh
done


#Submit jobs
for i in $(ls 00_scripts/DEPTHSTATS*sh); do qsub $i; done