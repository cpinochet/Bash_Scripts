#!/bin/bash


function rec_count {
for file in $1*.dat.pgp.dec; do [ -f "$file" ] && wc -l "$file"; done | sort -n > rec.txt
}
rec_count $1

