#!/bin/bash

# Get the GPU Utilization (Graphics field)
mem=$(nvidia-settings -q [gpu:0]/GPUUtilization -t 2>/dev/null | grep 'graphics' | awk -F '[=,]' '{print $2}')

# Print the GPU utilization or fallback to "N/A"
if [ -n "$mem" ]; then
    echo "$mem"
else
    echo "N/A"
fi
