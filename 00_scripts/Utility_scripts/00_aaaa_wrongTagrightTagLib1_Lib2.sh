
#pwd
cd /home/projects/dp_00007/people/hmon/Novogene/Raw_data_verified/All_lib
#file with all the fq.gz in the folder
find . > XXX.txt
#grep the wrong tag Lib1 
grep -f OldNames_lib1.txt XXX.txt | sort -k 1,1h | less -S -N
#File with the sorted wrong tag Lib1
grep -f OldNames_lib1.txt XXX.txt | sort -k 1,1h > OldNames_sorted_lib1.txt # on the manually deleted the not "EKDL200012859i"

#make the Hi_lib1.txt in excel
#Hi.txt: $1=wrongcompletename_tag $2=right_uncompleteName
awk '{split($1,a,"_"); print $0}' Hi_lib1.txt | less -S
awk '{split($1,a,"_"); print $2 a[3] a[4] a[5]}' Hi_lib1.txt | less -S
awk '{split($1,a,"_"); print "mv " $1 " " $2 "_" a[3] "_" a[4] "_" a[5] "_" a[6]}' Hi_lib1.txt | less -S
awk '{split($1,a,"_"); print "mv " $1 " " $2 "_" a[3] "_" a[4] "_" a[5] "_" a[6]}' Hi_lib1.txt > ChangeFileNames_lib1.txt
chmod 755 ChangeFileNames_lib1.txt
./ChangeFileNames_lib1.txt

