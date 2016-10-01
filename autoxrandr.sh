#!/bin/bash
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1}'); do
	if [[ $output =~ ^eDP1 ]]; then
		edp=$output
	fi
done
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1}'); do
	if [[ $output =~ ^eDP1 ]]; then
		xrandr --output $edp --auto --primary --output $output --pos 0x0 --auto --below $edp
	fi
done