#!/bin/bash

# This is a comparition test. It compares 2 files and show if there are any difference or not.


varia=$(awk 'FNR==NR{a[$1]++;next}!a[$1]' ../../work/rec_cnt_bef.rec ../../work/rec_cnt_aft.rec)

if [[ $varia == "" ]]; then
	#statements
	echo "No difference"
else
	echo "There are differences !!!"
	exit 1
fi
