#!/bin/bash

for file in *.txt; do
    if [ -f "$file" ]; then
        mv "$file" "OLD_$file"
        echo "Renamed $file to OLD_$file"
    fi
done























