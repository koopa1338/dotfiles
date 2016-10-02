#!/bin/bash
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1}'); do
	if [[ $output == eDP1 ]]; then
		edp=$output
	fi
	if [[ $output == VGA1 ]]; then
		vga=$output
	fi
	if [[ $output == HDMI1 ]]; then
		hdmi=$output
	fi
done
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1}'); do
	if [[ $output == eDP1 ]]; then
		xrandr --output $edp --auto --primary --output $vga --pos 0x0 --auto --above $edp
	fi
done
for output in $(xrandr | grep '\Wconnected' | awk '{ print $1}'); do
	if [[ $output == HDMI1 ]]; then
		xrandr --output $edp --auto --primary --output $hdmi --pos 0x0 --auto --right-of $edp
	fi
done
