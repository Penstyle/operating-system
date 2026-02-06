#!/bin/bash

logfile="server.log"

if [ ! -f "$logfile" ]; then
    echo "Log file does not exist."
    exit 1
fi

count=$(grep -c "Error" "$logfile")
echo "Number of lines with 'Error': $count"#!/bin/bash

grep -c "Error" server.log
