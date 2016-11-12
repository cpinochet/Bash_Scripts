#!/bin/bash

# This script is used to move the Database backup .tar.gz files created by anoter script to a remote location.
# there is no hard coded passwords to mount the remote folder, it decripts a password from an encrypted file.
# and deletes the temporal decripted file before exiting.

cd /var/lib/postgresql
FILECOUNT="$(ls *.tar.gz | wc -l)"
VARIABLE=""
if [[ "$FILECOUNT" > 0 ]]; then

    echo "Mounting remote backup repository."
    # decripting pass from enc file
    gpg --output /var/scripts/magic.tmp --decrypt /var/scripts/magic.gpg

    # reading from temp file
    VARIABLE=`cat /var/scripts/magic.tmp`

    # mounting using variable
    mount -t cifs -o username=staffing,password=$VARIABLE //172.17.100.44/staffingdb /mnt/respaldo

    for FILE in /var/lib/postgresql/*.tar.gz; do
        echo "copying $FILE"
        cp -f $FILE /mnt/respaldo
        if [ "$?" -eq "0" ]; then
            echo "$FILE has been transfered succesfully. Removing it from local folder."
                    rm -f $FILE
        else
            echo "$FILE couldn't be copied, failure ... please check ."

        fi
    done

    # deleting temp file
    rm -f /var/scripts/magic.tmp

    echo "Unmounting remote repo."
    sleep 5

    umount /mnt/respaldo

    echo "transfer done"
else
    echo "No file to transfer."
fi
