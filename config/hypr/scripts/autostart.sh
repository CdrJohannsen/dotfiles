#!/usr/bin/sh
swaync &
wlsunset -l 50 -L 10 &
#swayidle -w timeout 240 'gtklock & sleep 20 && hyprctl dispatch dpms' &
waybar &
hyprpaper &
/usr/libexec/polkit-gnome-authentication-agent-1 &
wl-paste -p --watch clipman store --no-persist &
