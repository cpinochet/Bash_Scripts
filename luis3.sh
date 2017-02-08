#!/bin/bash

# This script reads a text file coming from a windows exchange server (example3.txt)
# and checks if in the file appear a couple of strings.
# once found it counts, then it report to nagios an OK, Warning or Critical status.

function deletetemp {
  rm -f *.tmp
}
COUNTER=0
INFILE="example3.txt"
TEMPFILE="testing.tmp"
OUTPUT="output.tmp"
dos2unix -q $INFILE
tail -n +5 $INFILE > $TEMPFILE

> $OUTPUT
if grep -q "Dismounted" $TEMPFILE; then
  #echo "string found"
  input="$TEMPFILE"
  while IFS= read -r var
  do

    if `echo "$var" | grep -q "Dismounted"` || `echo "$var" | awk '{print $2}' | grep -q "Healthy"` ; then
        echo "$var" >> $OUTPUT
        COUNTER=$[$COUNTER +1]
    fi

  done < "$input"
  if [[ "$COUNTER" == 1 ]]; then
  	echo "WARNING! SOME BD is not looking good!"
    cat $OUTPUT
    deletetemp
    exit 1
  fi
  if [ "$COUNTER" -gt 1 ]; then
  	LINE="CRITICAL! "$COUNTER" DBs may be in Problems!"	#statements
  	echo $LINE
    cat $OUTPUT
    deletetemp
  	exit 2
  fi
else
  echo "OK! All BDs are Mounted."
  deletetemp
  exit 0

fi
deletetemp
