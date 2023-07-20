#!/bin/ksh

# Gentoo especific
set -A complete_eselect_1 -- arptables binutils ebtables editor env fontconfig gcc iptables kernel locale lua modules news pager pinentry profile python rc repository ruby rust vi visual wine
set -A complete_eselect_2 -- list set show
set -A complete_doas_1 -- $(dmenu_path)
set -A complete_equery -- belongs changes check depends depgraph files has hasuse keywords list meta size uses which
set -A complete_pkgdev -- manifest
set -A complete_emerge -- \--ask \--oneshot \--newuse \--deep \--columns \--depclean \--sync \--version \--info \--search \--help \--deselect \--list-sets \--unmerge \--pretend \--fetchonly \--onlydeps \--quiet \--usepkg \--update \--verbose

# System utilities
set -A complete_btrfs_1 -- balance device filesystem inspect-internal property qgroup quota replace rescue scrub subvolume
set -A complete_make_1 -- install uninstall clean repackage reinstall search makesum show oldconfig menuconfig modules_install
set -A complete_kill_1 -- -9 -HUP -INFO -KILL -TERM
set -A complete_adb_1 -- push pull sideload reboot

# Git
set -A complete_git_1 -- \
	$(git --list-cmds=main) \
	$(git config --get-regexp ^alias\. | awk -F '[\. ]' '{ print $2 }')

# Man pages
MAN_CACHE=$XDG_CACHE_HOME/ksh/man
if [ ! -f $MAN_CACHE ]; then
	mkdir -p $(dirname ${MAN_CACHE})
	for i in /usr{,/X11R6,/local}{,/share}/man/{,cat,man}[1-9lnp]{,f,p}
	do
		test -d $i && ls $i
	done | rev | cut -d. -f2- | rev | sort -u > $MAN_CACHE
fi

set -A complete_man -- $(cat $MAN_CACHE)
