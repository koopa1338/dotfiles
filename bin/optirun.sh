#!/bin/bash

echo "" | rofi -dmenu -p "optirun" | xargs -I{} optirun {}
