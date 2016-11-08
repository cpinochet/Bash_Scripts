#!/bin/bash
# Another way to upload files to remote repository. This time with sftp protocol.

clear

printf "\n\nConnecting....\nCopying files....\n" 
file_ext=*.pgp

sftp bsultanov@172.17.101.167:portal/*$file_ext 
sftp bsultanov@172.17.101.167:portal << EOF
rm *.pgp  
EOF
printf "'\nThe copied files located at: \n"
pwd


#exit
