#!/bin/bash

echo "System Health Snapshot"
echo "----------------------"
echo "Current Date and Time: $(date)"
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo "Disk Usage (Root):"
df -h / | tail -1
