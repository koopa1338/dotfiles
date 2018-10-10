#!/bin/sh

choices="HDMI-left\nHDMI-right\nHDMI-top\nStandard\nVGA-left\nVGA-right\nVGA-top\nMirror\nManual"

chosen=$(echo -e "$choices" | rofi -dmenu -p "screenlayout" -i)

case "$chosen" in
	HDMI-left) xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output VGA1 --off && polybar_launch ;;
	HDMI-right) xrandr --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VGA1 --off && polybar_launch ;;
	HDMI-top) xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output VGA1 --off && polybar_launch ;;
	Standard) xrandr --output HDMI1 --off --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output VGA1 --off && polybar_launch ;;
	Mirror) xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --noprimary --same-as eDP1 --output VIRTUAL1 --off --output DP1 --off --output VGA1 --off && polybar_launch ;;
	Manual) arandr ;;
	VGA-left) xrandr --output VGA1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --off && polybar_launch ;;
	VGA-right) xrandr --output VGA1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --off && polybar_launch ;;
	VGA-top) xrandr --output VGA1 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --off && polybar_launch ;;
esac
