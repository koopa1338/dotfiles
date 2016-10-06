#!/bin/bash
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1}'); do
	if [[ $output == eDP1 ]]; then
		xrandr --output eDP1 --auto --primary --output VGA1 --pos 0x0 --auto --above eDP1
	fi
	if [[ $output == VGA1 ]]; then
		xrandr --output VGA1 --pos 0x0 --auto --above eDP1
	fi
	if [[ $output == HDMI1 ]]; then
		xrandr --output HDMI1 --pos 0x0 --auto --right-of eDP1
	fi
done
for output in $(xrandr | grep '\Wdisconnected' | awk '{ print $1}'); do
	if [[ $output == VGA1 ]]; then
		xrandr --output VGA1 --off
	fi
	if [[ $output == HDMI1 ]]; then
		xrandr --output HDMI1 --off
	fi
done