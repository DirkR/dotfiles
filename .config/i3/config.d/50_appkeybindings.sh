# screen locker (first move to "safe" workspace without any chat app)
bindsym $mod+Control+l exec i3-msg workspace 1 && i3lock -c 111111 -d

# start a terminal
bindsym $mod+Return exec x-terminal-emulator

# start dmenu (a program launcher)
#bindsym $mod+d exec i3-dmenu-desktop
bindsym $mod+d exec rofi -show run
bindsym $mod+shift+t exec thunar

bindsym $mod+Shift+f exec firefox
