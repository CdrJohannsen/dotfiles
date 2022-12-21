#!/usr/bin/sh
swaync &
wlsunset -l 50 -L 10 &
# swayidle -w timeout 240 'gtklock & sleep 20 && hyprctl keyword monitor eDP-1,disable' resume 'hyprctl keyword monitor eDP-1,1920x1080@60,0x0,1'&
waybar &
hyprpaper &
flatpak run com.discordapp.Discord &
thunderbird &
flatpak run org.signal.Signal &
nwg-drawer -r -ovl -nocats -spacing 50 -nofs
