#!/bin/bash
cd /usr/testing
echo "Starting cleaning... please wait."
find redmine_db_bkp.sql.2* -mtime +30 -exec rm {} \;
echo "Done!"