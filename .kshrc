#!/bin/ksh

# Source .profile in every new shell
. ~/.profile

# Source some aliases
. $XDG_CONFIG_HOME/aliasrc

# Source colors for the shell
. $XDG_CONFIG_HOME/shell_cols
. $XDG_CONFIG_HOME/ls_colorsrc

# Enable emacs mode
set -o emacs

# Bind keys
bind '^[[A'=up-history
bind '^[[B'=down-history
bind '^[[C'=forward-char
bind '^[[D'=backward-char
bind -m '^A'='sxiv *
'

# History settings
HISTFILE="$XDG_CACHE_HOME/ksh/history"
HISTSIZE=1000000
HISTCONTROL=ignoredups

# set prompt
if [[ "$USER" = "root" ]]; then
        PRO="#"
else
        PRO="$"
fi

PS1="${BOLD}${PURPLE}\u${RESET}@\H ${PURPLE}\W${RESET} $PRO "

# Image previews in LF file manager.
function lf {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [[ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" -eq 1 ]]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}

# Use lf to switch directories and bind it to ctrl-o.
function lfcd {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bind -m '^O'='lfcd
'
