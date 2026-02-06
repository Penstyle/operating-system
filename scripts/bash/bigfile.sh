#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "File does not exist."
    exit 1
fi

SIZE=$(stat -c%s "$FILE")

if [ $SIZE -gt 1048576 ]; then
    echo "Warning: File is too large"
else
    echo "File size is within limits."
fi
