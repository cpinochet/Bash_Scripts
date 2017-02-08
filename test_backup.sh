#!/bin/bash
echo "Backing up files"
echo " "
cd /home/juanito
echo " "
echo "removing old backups on local folder"
rm -f test.tar.gz
echo "Mounting remote folder..."
mount -t cifs -o username=juanito,password=colocolo //192.168.1.30/shared /mnt/myfolder
echo " "
echo "removing old backups on remote folder"
rm -f /mnt/myfolder/test.tar.gz
cd /home/juanito
echo " "
echo "creating new backup file..."
tar cvfz test.tar.gz test/
echo " "
echo "Copying compressed backup file to remote folder..."
cp -f test.tar.gz /mnt/myfolder
echo " "
echo "file copied, sleeping 5 seconds"
sleep 5
echo " "
echo "unmounting remote folder"
umount /mnt/myfolder
echo " "
echo "all Done."
