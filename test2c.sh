#!/bin/bash
pass="123456"
echo ""
echo "Processing... "
echo ""
for FILE in textos/*.txt; do
    echo "Encrypting $FILE to $FILE.gpg"
    echo $pass|gpg --output $FILE.gpg --batch --passphrase-fd 0 --symmetric $FILE
    #echo "$PASSPHRASE" | gpg --passphrase-fd 0 --batch -d --output "${FILE%.gpg}" "$FILE"
done
mv textos/*.gpg encrip
echo ""
echo "Encrypted files were created and placed in the encrip folder."
echo ""
echo "End."