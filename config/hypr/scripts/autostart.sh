#!/usr/bin/sh
swaync &
wlsunset -l 50 -L 10 &
#swayidle -w timeout 240 'gtklock & sleep 20 && hyprctl dispatch dpms' &
waybar &
hyprpaper &
nwg-drawer -r -ovl -nocats -spacing 50 -nofs &
gnome-clocks --gapplication-service &
/usr/libexec/polkit-gnome-authentication-agent-1 &
wl-paste -t text --watch clipman store --no-persist &
