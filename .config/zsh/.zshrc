#!/bin/zsh

# Enable colors and change prompt:
autoload -U colors && colors
setopt PROMPT_SUBST ; PS1='%B%{$fg[blue]%}%n%{$reset_color%}@%M%{$fg[blue]%} %{$fg[blue]%}%c$(__git_ps1)%{$reset_color%} %#%b '

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zmodload zsh/complist
compinit

# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

# Vi mode:
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# History search with arrow keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Change cursor shape for different vi modes:
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
bindkey -s '^a' 'bc -lq\n'
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases if existent.
[ -f "/home/fabiosantos/.config/aliasrc" ] && source "/home/fabiosantos/.config/aliasrc"

# LF file manager
lf () {
	LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" -eq 1 ]; then
		cd "$(cat "$LF_TEMPDIR/lastdir")"
	fi
	rm -r "$LF_TEMPDIR"
	unset LF_TEMPDIR
}

# Load some plugins: git, history substring search, autosuggestions and syntax highlighting.
source /usr/share/git/git-prompt.sh

source /home/fabiosantos/.local/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#source /home/fabiosantos/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /home/fabiosantos/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
