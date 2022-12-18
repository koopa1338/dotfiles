#!/bin/bash

CURRENT=/home/koopa/.config/wpg/.current
LIGHTDM=/usr/share/lightdm-webkit/themes/modern
CACHE=/home/koopa/.cache/betterlockscreen/current

betterlockscreen -u $CURRENT --blur 1 &
cp -f $CACHE/wall_blur.png $LIGHTDM/blur.png &
cp -f $CURRENT $LIGHTDM/wall.png &
