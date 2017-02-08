#!/bin/sh

# This script makes a backup of a mysql db into a compressed file 
# and transfer it to a windows shared folder.

current_time=$(date "+%Y-%m-%d-%H-%M")
file_name="remote_db_bkp.sql"
new_fileName=$file_name.$current_time

#Dumping DB
cd /usr/bkp/
mysqldump -u root -pMys.remotedb remote_db > $new_fileName

#Compressing the dump file
TARFILE="$new_fileName.tar.gz"
tar -cvzf $TARFILE $new_fileName

# decripting pass from enc file
# and cleaning the magic word if exists
OUTPUT="/var/scripts/magic.tmp"

if [ -f "$OUTPUT" ]; then
        rm -f $OUTPUT
fi

gpg --output $OUTPUT --decrypt /var/scripts/magic.gpg
# reading from temp file
VARIABLE=`cat $OUTPUT`

#Mounting external Windows repository
mount -t cifs -o username=jhonny,password=$VARIABLE "//host/folder" /mnt/respaldo

#Transfering the compressed file
cp /usr/bkp/$TARFILE /mnt/respaldo/
if [ "$?" == "0"  ]; then
    #unmounting the mount point
    sleep 5
    umount /mnt/respaldo
    #deleting the dumped bigger file
    rm -f /usr/bkp/$new_fileName
else
    echo "Error during file transfer, please check."
    # cleaning magic word
    rm -f $OUTPUT
    exit 1
fi

# cleaning magic word
rm -f $OUTPUT
