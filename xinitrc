#!/bin/sh

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f ~/.xprofile ] && source ~/.xprofile
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

numlockx &
exec ~/dotfiles/scripts/autoxrandr.sh &
exec compton -b -f &
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec --no-startup-id dunst &
exec dropbox start -i &
exec nm-applet --sm-disable &

exec i3
