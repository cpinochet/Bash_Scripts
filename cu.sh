#!/bin/bash
# Script for Nagios
# This script checks the uptime on a linux server.
TA=`uptime`
NUM=`echo $TA | grep -aob 'day' | grep -oE '[0-9]+'`
DAYS=`echo ${TA:12:NUM} | cut -d " " -f1`
if [[ "$DAYS" -lt 150 ]]; then
  #statements
  echo "OK. Uptime is $DAYS days."
  exit 0
fi
if [ "$DAYS" -ge 150 ] && [ "$DAYS" -le 270 ]; then
  #statements
  echo "WARNING! Uptime is $DAYS days."
  exit 1
fi
if [[ "$DAYS" -gt 270 ]]; then
  #statements
  echo "CRITICAL! Uptime is $DAYS days."
  exit 2
fi
