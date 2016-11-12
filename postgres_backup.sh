#!/bin/bash

echo ""
echo "deleting old backup..."
#rm -f postgres_backup*.tar.gz
NOW=$(date +"%Y%m%d%H%M")
cd backup/
rm -f *.bak
echo ""
echo "creating new backup..."
PBFILE=`echo "postgres_db_"$NOW".bak"`
echo "backing up postgres database as $PBFILE ..."
#pg_dump postgres > postgres_db.bak
pg_dump postgres > $PBFILE

IBFILE=`echo "interviews_db_"$NOW".bak"`
echo "backing up interviews database as $IBFILE ..."
pg_dump interviews > $IBFILE
echo ""
echo "Database dump complete."

echo "Now compressing..."
cd ..
TBFILE=`echo "postgres_backup_"$NOW".tar.gz"`
tar -zcvf $TBFILE backup/
echo ""
echo "Listing..."
#exit
ls /var/lib/postgresql -l
