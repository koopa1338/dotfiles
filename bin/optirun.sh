#!/bin/sh

echo "" | rofi -dmenu -p "optirun" | xargs -I{} optirun {}
