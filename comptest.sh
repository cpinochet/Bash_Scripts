#!/bin/bash

# This is a comparition test. It compares 2 files and show if there are any difference or not.

#$ awk 'NR==FNR{a[FNR]=$1; next}$1==a[FNR]{print a[FNR-1]}' file2 file1

#awk 'FNR==NR{a[$1]++;next}a[$1]' file1 file2 ---> print lines that match in first column
#awk 'FNR==NR{a[$1]++;next}!a[$1]' file1 file2 ---> print lines that doesn't match in first column

varia=$(awk 'FNR==NR{a[$1]++;next}!a[$1]' ../../work/rec_cnt_bef.rec ../../work/rec_cnt_aft.rec)

if [[ $varia == "" ]]; then
	#statements
	echo "No difference"
else
	echo "There are differences !!!"
	exit 1
fi
