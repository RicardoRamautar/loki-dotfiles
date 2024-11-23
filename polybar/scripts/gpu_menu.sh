#!/bin/bash

# State file to track visibility
STATE_FILE="/tmp/polybar_gpu_specs_toggle"

# Ensure state file exists
if [ ! -f "$STATE_FILE" ]; then
    echo "hidden" > "$STATE_FILE"
fi

# GPU stats commands
TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
MEMORY=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits | awk -F, '{printf "%d/%d MB", $1, $2}')
UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

# Check state and act accordingly
case "$1" in
    toggle)
        # Toggle visibility state
        if [ "$(cat $STATE_FILE)" == "hidden" ]; then
            echo "visible" > "$STATE_FILE"
        else
            echo "hidden" > "$STATE_FILE"
        fi
        ;;
    update)
        # Display content if visible
        if [ "$(cat $STATE_FILE)" == "visible" ]; then
            echo "Temp: $TEMP°C | Mem: $MEMORY | Util: $UTIL"
        else
            echo "$TEMP°"
        fi
        ;;
esac
