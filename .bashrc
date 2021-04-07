####################################
#  _               _               #
# | |__   __ _ ___| |__  _ __ ___  #
# | '_ \ / _` / __| '_ \| '__/ __| #
# | |_) | (_| \__ \ | | | | | (__  #
# |_.__/ \__,_|___/_| |_|_|  \___| #
#                                  #
####################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Define some color variables.
if tput setaf 1 &> /dev/null; then
    tput sgr0
fi
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 256)
      BLUE="\033[1;34m"
      BOLD=$(tput bold)
      RESET=$(tput sgr0)

# Set Prompt.
export PS1="\[$BOLD\]\[$BLUE\]\u\[$RESET\]@\h \[$BLUE\]\W\[$RESET\] "'\$ '

# Transparency for XTerm window.
[ -n "$XTERM_VERSION" ] && transset --id "$WINDOWID" 0.8 >/dev/null

# don't put duplicate lines or lines starting with space in the histor.
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTFILE=~/.cache/bash/history

# Enable Vi mode.
set -o vi

bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Source aliases.
[ -f "$HOME/.config/aliasrc" ] && source $HOME/.config/aliasrc

# Use lf to switch directories and bind it to ctrl-o.
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bind '"\C-o":"lfcd\n"'


# Image previews in LF file manager.
lf () {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [[ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" -eq 1 ]]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}


# Enable TAB completion.
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
