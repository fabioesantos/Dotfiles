##############################################################
#  _               _                           __ _ _        #
# | |__   __ _ ___| |__       _ __  _ __ ___  / _(_) | ___   #
# | '_ \ / _` / __| '_ \     | '_ \| '__/ _ \| |_| | |/ _ \  #
# | |_) | (_| \__ \ | | |    | |_) | | | (_) |  _| | |  __/  #
# |_.__/ \__,_|___/_| |_|____| .__/|_|  \___/|_| |_|_|\___|  #
#                     |_____|_|                              #
##############################################################

# Add '~/.local/bin' to $PATH
export PATH="${PATH}:/home/fabiosantos/.local/bin"

# Exporting locale
export LANG="en_US.UTF-8"

# Add '~/.local/share/man' to $MANPATH
export MANPATH="$HOME/.local/share/man:$MANPATH"

# Make sure iris is used by mesa
export MESA_LOADER_DRIVER_OVERRIDE=iris

# Default programs:
export EDITOR="vi"
export VISUAL="vi"
export BROWSER="qutebrowser"
export READER="zathura"
export TERMINAL="xterm"
export FILE="lf"

# XDG Defaults
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Cleaning $HOME
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"   #this line will break display managers.
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
#export WGETRC="$XDG_CONFIG_HOME/wgetrc" 
#export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache/.config"
#export CCACHE_DIR="$XDG_CACHE_HOME/ccache"

# Remove GTK CSD
#export GTK_CSD=0
#export LD_PRELOAD="/usr/lib64/libgtk3-nocsd.so.0"

# Execute my TERMINAL for terminal apps 
export TERMCMD="$TERMINAL"

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Qt theme
export QT_QPA_PLATFORMTHEME="qt5ct"

# Enable vkBasalt
export ENABLE_VKBASALT=1

# Fsync for wine
#export WINEFSYNC=1

# list for lf icons:
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
