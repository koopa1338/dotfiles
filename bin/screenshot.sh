#!/bin/bash

case $1 in
    full)
        flameshot full -p $HOME/Bilder/Screenshots/
	;;
    selection)
        flameshot gui
	;;
esac
