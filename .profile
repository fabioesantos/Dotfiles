#! /bin/ksh

# Set location of .kshrc file
export ENV="${HOME}/.config/ksh/kshrc"

# Add '~/.local/bin' to $PATH
export PATH="${HOME}/.local/bin:${PATH}"

# Add '~/.local/share/man' to $MANPATH
export MANPATH="${HOME}/.local/share/man:${MANPATH}"

# Use "vim" as manpager
export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# Make sure iris is used by mesa drivers
export MESA_LOADER_DRIVER_OVERRIDE="iris"

# Choose vaapi driver (i965 or iHD)
export LIBVA_DRIVER_NAME="i965"

# Default programs:
export BROWSER="/usr/bin/surf"
export READER="zathura"
export TERMINAL="urxvtc"
export FILE="lf"

# XDG Defaults
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Cleaning $HOME
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/X11/xserverrc"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
#export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/test"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export VIMINIT="set nocp | source ${XDG_CONFIG_HOME}/vim/vimrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RXVT_SOCKET="$XDG_DATA_HOME/urxvt/urxvtd-$(uname -n)"
export URXVT_PERL_LIB="$XDG_DATA_HOME/urxvt/ext"

# GCC colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Enable mesa vulkan overlay
#export VK_INSTANCE_LAYERS="VK_LAYER_MESA_overlay"
#export VK_LAYER_MESA_OVERLAY_CONFIG="width=310,format=0"

# Enable vkbasalt
export ENABLE_VKBASALT=1

# Enable fsync for wine
export WINEFSYNC=1

# list for lf icons:
export LF_ICONS="\
tw= :\
st= :\
ow= :\
dt= :\
di= :\
fi= :\
ln= :\
or= :\
ex= :\
*.c= :\
*.cc= :\
*.clj= :\
*.coffee= :\
*.cpp= :\
*.css= :\
*.d= :\
*.dart= :\
*.erl= :\
*.exs= :\
*.fs= :\
*.go= :\
*.h= :\
*.hh= :\
*.hpp= :\
*.hs= :\
*.html= :\
*.mhtml= :\
*.java= :\
*.jl= :\
*.js= :\
*.json= :\
*.lua= :\
*.md= :\
*.php= :\
*.pl= :\
*.pro= :\
*.py= :\
*.rb= :\
*.rs= :\
*.scala= :\
*.ts= :\
*.vim= :\
*.cmd= :\
*.ps1= :\
*.sh= :\
*.bash= :\
*.zsh= :\
*.fish= :\
*.tar= :\
*.tgz= :\
*.arc= :\
*.arj= :\
*.taz= :\
*.lha= :\
*.lz4= :\
*.lzh= :\
*.lzma= :\
*.tlz= :\
*.txz= :\
*.tzo= :\
*.t7z= :\
*.zip= :\
*.z= :\
*.dz= :\
*.gz= :\
*.lrz= :\
*.lz= :\
*.lzo= :\
*.xz= :\
*.zst= :\
*.tzst= :\
*.bz2= :\
*.bz= :\
*.tbz= :\
*.tbz2= :\
*.tz= :\
*.deb= :\
*.rpm= :\
*.jar= :\
*.war= :\
*.ear= :\
*.sar= :\
*.rar= :\
*.alz= :\
*.ace= :\
*.zoo= :\
*.cpio= :\
*.7z= :\
*.rz= :\
*.cab= :\
*.wim= :\
*.swm= :\
*.dwm= :\
*.esd= :\
*.jpg= :\
*.jpeg= :\
*.mjpg= :\
*.mjpeg= :\
*.gif= :\
*.bmp= :\
*.pbm= :\
*.pgm= :\
*.ppm= :\
*.tga= :\
*.xbm= :\
*.xpm= :\
*.tif= :\
*.tiff= :\
*.png= :\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg= :\
*.m2v=:\
*.mkv= :\
*.webm= :\
*.ogm=:\
*.mp4= :\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv= :\
*.asf=:\
*.rm=:\
*.rmvb= :\
*.flc= :\
*.avi= :\
*.fli=:\
*.flv= :\
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
*.flac=🎵:\
*.m4a= :\
*.mid= :\
*.midi= :\
*.mka= :\
*.mp3=🎵:\
*.mpc=🎵:\
*.ogg=🎵:\
*.ra= :\
*.wav= :\
*.oga= :\
*.opus= :\
*.spx= :\
*.xspf= :\
*.pdf= :\
*.nix= :\
*.R=ℝ :\
"
