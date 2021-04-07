#!/bin/sh

userprofile="$HOME/.config/X11/xprofile"
[ -f "$userprofile" ] && . $userprofile
exec dbus-launch --sh-syntax --exit-with-session dwm
