#!/bin/bash

# Get the GPU temperature
temp=$(nvidia-settings -q GPUCoreTemp -t 2>/dev/null)

# Print the temperature or fallback to "N/A"
if [ -n "$temp" ]; then
    echo "$temp"
else
    echo "N/A"
fi
