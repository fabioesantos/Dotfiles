#!/bin/sh

# Add '~/.local/bin' to $PATH
export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.config/X11/xprofile ] && . ~/.config/X11/xprofile

exec dwm
