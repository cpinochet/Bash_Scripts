#!/bin/bash
# This gets all pgp files from a remote server using sftp.
# Having the keys in place, no need to type password.
echo ""
# Obtaining files from server via sftp.
echo "Obtaining GPG files from sftp server."
sftp cpinochet@172.0.0.10:encrip/*.gpg
# moving files to encript folder
mv *.gpg encrip/
echo ""
echo "GPG files were placed in encript folder."
exit
