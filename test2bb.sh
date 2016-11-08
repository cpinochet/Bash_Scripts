#!/bin/bash

# This is an example of how to encrypt several files on a given directory with some given extentions.

pass="123456"
## declare an array variable
declare -a arr=("txt" "dat")
#file_ext={txt,dat}
directory="textos" 
echo ""
echo "Processing... "
echo ""
for ext in "${arr[@]}"; do
	for FILE in $directory/*$ext; do
    	echo "Encrypting $FILE to $FILE.gpg"
    	echo $pass|gpg --output $FILE.gpg --batch --passphrase-fd 0 --symmetric $FILE
    	#echo "$PASSPHRASE" | gpg --passphrase-fd 0 --batch -d --output "${FILE%.gpg}" "$FILE"
	done
done
echo "End."