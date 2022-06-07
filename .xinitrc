#!/bin/sh

userresources=$XDG_CONFIG_HOME/X11/xinit/.Xresources
usermodmap=$XDG_CONFIG_HOME/X11/xinit/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
setxkbmap gb

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

# setup compositor, wallpaper, spotify, and desktop enviroment
picom -b &
feh --no-fehbg --bg-fill --randomize ~/.wallpaper/* &
spotifyd --no-daemon &
polkit-dumb-agent &
dunst &
dwmblocks &
exec dwm 


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
