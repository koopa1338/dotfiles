#!/bin/bash

function get_volume {
    amixer -D pulse get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

function is_mute {
    amixer -D pulse get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

function while_muted {
	if is_mute ; then
		dunstify   -i "/usr/share/icons/Paper/48x48/status/audio-volume-muted.png" -u normal "Muted" -t 2000
	fi
}

case $1 in
    up)
	# Up the volume (+ 5%)
    volume=`get_volume`
	if [ "$volume" -lt "100" ]; then
		while_muted
		pactl set-sink-volume @DEFAULT_SINK@ +5%
	fi
	;;
    down)
	while_muted
	pactl set-sink-volume @DEFAULT_SINK@ -5%
	;;
    mute)
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	;;
esac
