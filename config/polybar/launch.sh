#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch the primary bar on primary screen
PRIMARY=$(xrandr -q | rg primary | awk '{print $1}')
MONITOR=$PRIMARY polybar mon1 -c ~/.config/polybar/config &

# Launch secondary bar for all other screens
MONS=$(xrandr -q | rg connected | rg -v disconnected | rg -v primary | awk '{print $1}')
for i in $MONS
do
    MONITOR=$i polybar mon2 -c ~/.config/polybar/config &
done

echo "Bars launched..."
