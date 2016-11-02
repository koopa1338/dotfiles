#!/bin/bash

scrot /tmp/screen.png
#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png

if [[ -f $HOME/.i3lock/icon-flat.png ]]
then
    # placement x/y
    PX=0
    PY=
    # lockscreen image info
    R=$(file ~/.i3lock/icon.png | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)

    SR=$(xrandr --query | grep ' connected' | sed 's/primary //' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))

        #convert /tmp/screen.png $HOME/.i3lock/icon-flat.png -geometry +$PX+$PY -composite -matte  /tmp/screen.png
        ffmpeg -y -i /tmp/screen.png -i $HOME/.i3lock/icon-flat.png -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 /tmp/screen.png
        echo "done"
    done
fi
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
# i3lock  -I 10 -d -e -u -n -i /tmp/screen.png
i3lock -e -u -n -i /tmp/screen.png
