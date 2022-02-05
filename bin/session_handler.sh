#!/bin/bash

case $(wmctrl -m | grep Name) in
*i3) cmd="i3-msg exit" ;;
*bspwm) cmd="bspc quit" ;;
*LG3D) cmd="bspc quit" ;;
*) exit 1 ;;
esac

yad --width 300 --title "System Logout" \
     --image=system-shutdown-symbolic \
     --text "Choose action:" \
     --button="Logout:$cmd" --button="Power Off:poweroff" --button="Reboot:reboot"
