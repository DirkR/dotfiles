#!/bin/sh

# screen locker (first move to "safe" workspace without any chat app)
echo 'bindsym $mod+Control+l exec i3-msg workspace 1 && i3lock -c 111111 -d'

# start a terminal
echo 'bindsym $mod+Return exec x-terminal-emulator'

if [ -e /usr/bin/rofi ]; then
  echo 'bindsym $mod+d exec rofi -show run'
else
  echo 'bindsym $mod+d exec i3-dmenu-desktop'
fi
echo 'bindsym $mod+shift+t exec thunar'
echo 'bindsym $mod+Shift+f exec firefox'

if [ -e /usr/bin/scrot ]; then
  echo 'bindsym --release Shift+Print exec scrot -s "screenshot_%Y-%m-%d_$wx$h.png" -e "mv $f ~/Pictures/"'
elif [ -e /usr/bin/gnome-screenshot ]; then
  echo 'bindsym $mod+Shift+s exec "gnome-screenshot -a"'
fi
