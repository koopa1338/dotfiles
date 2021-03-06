#!/bin/bash

shopt -s nullglob

cd ~/Wallpaper/resized

while true; do
        files=()
        for i in *.jpeg; do
                [[ -f $i ]] && files+=("$i")
        done
        range=${#files[@]}

        ((range)) && feh --bg-fill "${files[RANDOM % range]}" --bg-fill "${files[RANDOM % range]}"

        sleep 15m
done
