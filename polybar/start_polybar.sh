#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
# polybar example &
polybar -c ~/.config/polybar/bars/simple_tropical.ini simply_tropical

echo "Polybar launched..."
