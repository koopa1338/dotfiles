#!/bin/bash

CACHEDIR=/home/koopa/.cache/i3lock/current
MODERNDIR=/usr/share/lightdm-webkit/themes/modern

betterlockscreen -u /home/koopa/.config/wpg/.current -b 1
pkexec cp $CACHEDIR/{blur.png,wall.png} $MODERNDIR/ -u
