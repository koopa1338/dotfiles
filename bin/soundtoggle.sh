#!/bin/bash

INDEX=$(pacmd list-sinks | grep "*" | awk '{print $3}')
if [[ $INDEX = "1" ]]; then
	pactl set-default-sink 0
else
	pactl set-default-sink 1
fi
polybar_launch&
