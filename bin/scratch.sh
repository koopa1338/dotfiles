#!/bin/bash

send_scratchpad() {
	id=$(bspc query -N -n "focused")
	if [ -n "$id" ];then
		xprop -id $id -f _SCRATCH 32ii -set _SCRATCH $(date +%s,%N)
		bspc node -t "floating"
		xdotool windowunmap $id
	fi
}

cycle_scratchpad() {
	i=$(bspc query -N -n "focused.floating");
	if [ -n "$i" ];then
		xprop -id $i -f _SCRATCH 32ii -set _SCRATCH $(date +%s,%N)
		xdotool windowunmap $i
	else
		i=`for w in $(xwininfo -root -children | grep -e "^\s*0x[0-9a-f]\+" -o);do
			t=$(xprop -id $w _SCRATCH | grep ' = \(.*\)')
			if [ -n "$t" ];then
				echo $t $w
			fi;
		   done|sort -n|head -n1|cut -d" " -f 5`
		if [ -n "$i" ];then
			xprop -id $i -remove _SCRATCH
			bspc rule -a \* state=floating center=on --one-shot
			xdotool windowmap $i
			bspc node -f $i
		fi
	fi
}


case "$1" in
    send) send_scratchpad ;;
	cycle) cycle_scratchpad ;;
	*) ;;
esac
