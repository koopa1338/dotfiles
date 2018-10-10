#!/bin/sh

echo "" | rofi -dmenu -p "youtube" | xargs -I{} st youtube-viewer --video-player=mpv {}
