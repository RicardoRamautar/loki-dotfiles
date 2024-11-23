#!/bin/bash

# Get the GPU temperature
mem=$(nvidia-settings -q [gpu:0]/UsedDedicatedGPUMemory -t 2>/dev/null)

# Print the temperature or fallback to "N/A"
if [ -n "$mem" ]; then
    echo "$mem"
else
    echo "N/A"
fi
