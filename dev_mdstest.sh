#!/bin/bash

# This script can encrypt and decript files, just give it the correct parameters.

# Parameters:
# $1 - e or d (encrypt or decrypt)
# $2 - filename
# $3 - passphrase

opti="$1"
file="$2"
pass="$3"
EXT="dec"
echo ""
echo "Script for Encrypt / Decrypt GPG and PGP files."
echo ""
EXT2="pgp"
salida=$(echo ${file}.${EXT})
salida2=$(echo ${file}.${EXT2})

if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ]
then
	echo "No argument supplied or argument missing."
	echo "Usage: ./files_enc_dec.sh option filename passphase"
	echo "Example: ./files_enc_dec.sh d file.pgp lavidaesbella"
else

	if [ "$opti" == "e" ]; then
		#statements
		echo $pass|gpg --output $salida2 --batch --passphrase-fd 0 --symmetric $file
		echo "$file has been encrypted into $salida2 file."
	fi
	if [ "$opti" == "d" ]; then
		#statements
		echo $pass|gpg --output $salida --batch --passphrase-fd 0 --decrypt $file
		echo "$file has been decrypted into $salida file."
	fi
	if [ "$opti" != "e" ] && [ "$opti" != "d" ]; then
		#statements
		echo "No argument supplied or argument missing."
		echo "Usage: ./files_enc_dec.sh option filename passphase"
		echo "Example: ./files_enc_dec.sh d file.pgp lavidaesbella"
	fi
fi
echo ""
echo "End."
