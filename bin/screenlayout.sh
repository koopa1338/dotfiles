#!/bin/sh

# A UI for detecting and selecting all displays.
# Probes xrandr for connected displays and lets user select one to use.
# User may also select "manual selection" which opens arandr.
# I plan on adding a routine from multi-monitor setups later.

twoscreen() { # If multi-monitor is selected and there are two screens.
	primary=$(echo "$screens" | rofi -dmenu -i -p "Select primary display")
	secondary=$(echo "$screens" | grep -v "$primary")
	direction=$(printf "above\\nleft-of\\nright-of\\nbelow" | rofi -dmenu -i -p "What side of $primary should $secondary be on?")
	xrandr --output "$primary" --auto --output "$secondary" --"$direction" "$primary" --auto
	}

morescreen() { # If multi-monitor is selected and there are more than two screens.
	primary=$(echo "$screens" | rofi -dmenu -i -p "asdf")
	secondary=$(echo "$screens" | grep -v "$primary" | rofi -dmenu -i -p "Select secondary display:")
	direction=$(printf "above\\nleft-of\\nright-of\\nbelow" | rofi -dmenu -i -p "What side of $primary should $secondary be on?")
	tertiary=$(echo "$screens" | grep -v "$primary" | grep -v "$secondary" | rofi -dmenu -i -p "Select third display:")
	xrandr --output "$primary" --auto --output "$secondary" --"$direction" "$primary" --auto --output "$tertiary" --"$(printf "above\\nleft-of\\nright-of\\nbelow" | grep -v "$direction")" "$primary" --auto
	}

multimon() { # Multi-monitor handler.
	case "$(echo "$screens" | wc -l)" in
		1) xrandr $(echo "$allposs" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ') ;;
		2) twoscreen ;;
		*) morescreen ;;
	esac ;}

# Get all possible displays
allposs=$(xrandr -q | grep "connected")

# Get all connected screens.
screens=$(echo "$allposs" | grep " connected" | awk '{print $1}')

# Get user choice including multi-monitor and manual selection:
chosen=$(printf "%s\\nmulti-monitor\\nmanual selection" "$screens" | rofi -dmenu -i -p "Select display arangement:") &&
case "$chosen" in
	"manual selection") arandr ; exit ;;
	"multi-monitor") multimon ;;
	*) xrandr --output "$chosen" --auto $(echo "$screens" | grep -v "$chosen" | awk '{print "--output", $1, "--off"}' | tr '\n' ' ') ;;
esac
