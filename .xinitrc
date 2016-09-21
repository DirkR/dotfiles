#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

export SSH_AUTH_SOCK
#PATH=$PATH:$HOME:$HOME/bin:$HOME/.scripts/

#compton &
#setxkbmap -option caps:swapescape &
WM=$( command -v i3 || command -v gnome-session )
exec $WM
