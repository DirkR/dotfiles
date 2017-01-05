#!/bin/sh

if [ -e  /usr/bin/gnome-settings-daemon ]; then
  echo "exec /usr/bin/gnome-settings-daemon"
elif [ -e  /usr/libexec/gnome-settings-daemon ]; then
  echo "exec /usr/libexec/gnome-settings-daemon"
elif [ -e  /usr/bin/xfsettingsd ]; then
  echo "exec --no-startup-id /usr/bin/xfsettingsd --replace --no-daemon"
elif [ -e  /usr/bin/xfsettingsd ]; then
  echo "exec --no-startup-id /usr/bin/lxsettings-daemon --replace --no-daemon"
fi

echo "exec_always --no-startup-id feh --bg-scale /home/dirk/.local/share/bg_kosmonaut.jpg"

for c in firefox thunderbird xchat-gnome owncloud nm-applet
do
  if [ -e "/usr/bin/${c}" ]; then
    echo "exec $c"
  fi
done

for c in xfce4-clipman clipit parcellite
do
  if [ -e "/usr/bin/${c}" ]; then
    echo "exec --no-startup-id $c"
    break
  fi
done
