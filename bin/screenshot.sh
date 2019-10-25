#!/bin/bash

SCREENSHOTS_DIR="$HOME/Bilder/Screenshots"
TIMESTAMP="$(date +%d-%m-%Y_%H-%M-%S)"
FILENAME=screenshot-$TIMESTAMP.png
NOTIFY_TIME=4000
FILEPATH=$SCREENSHOTS_DIR/$FILENAME

# Full screenshot
scrot $FILENAME && mv $FILENAME $FILEPATH
sleep 0.5
dunstify 'Screenshot!' \
		"Name: <span color=\"#EA9090\">$FILENAME.png</span>  " \
		-t $NOTIFY_TIME \
		--urgency low  \
		-i $FILEPATH
