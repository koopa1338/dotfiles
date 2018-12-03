#!/bin/sh

echo "" | rofi -dmenu -p "youtube" | xargs -I{} kitty youtube-viewer --video-player=mpv {}
