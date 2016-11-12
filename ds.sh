#!/bin/bash

# This is an example of script that uses date in strings and manipulate it to 
# read and write files where the filenames are based on a certain string structure.


#NOW=$(date +"%Y_%m_%d_%H_%M")
NOW=$(date +"%Y%m%d%H%M")
#NOW=$(date +"%Y%m%d")
STR1=${NOW:0:4}
STR2=${NOW:4:2}
STR3=${NOW:6:2}
STR4=${NOW:8:2}
STR5=${NOW:10:2}

VVFILE=`echo "reward_"$STR1"_"$STR2"_"$STR3"_"$STR4"_"$STR5".DAT"`

#echo "reward_ge_tk_$NOW.DAT"
#echo "reward_ge_tk_"$STR1"_"$STR2"_"$STR3"_"$STR4"_"$STR5".DAT"
#echo $VVFILE 
touch $VVFILE
echo "HEADER" >> $VVFILE
while read line           
do           
	#echo -e $line
	tok_str=${line:7:29}  # 4479942989665755
	cert_ant_str=${line:36:28} # 0000000000000000250000000000
	cod_str=${line:64:12} # DLXR4JM3K4N1
	exp_date=${line:76:8} # 20160630
	cyc_date=${line:84:8}
	#echo $cyc_date
	echo $tok_str"|"$cert_ant_str"|"$cod_str"|"$exp_date"|"$cyc_date >> $VVFILE

done </home/jason/test/enc/Certificate_small.txt.pgp.dec.tmp.tok
echo "EOF" >> $VVFILE

cat $VVFILE
