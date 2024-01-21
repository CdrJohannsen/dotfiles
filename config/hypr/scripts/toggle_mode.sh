#!/bin/sh
# set -x
if [ -f /tmp/color_mode ]; then
    rm -f /tmp/color_mode
    cp ~/.config/waybar/style_cyan_glow.css ~/.config/waybar/style.css
    cp ~/.config/alacritty/alacritty_cyan.toml ~/.config/alacritty/alacritty.toml
    cp ~/.config/nwg-drawer/drawer_cyan.css ~/.config/nwg-drawer/drawer.css
    cp ~/.config/btop/themes/green-cyan.theme ~/.config/btop/themes/current.theme
    cp ~/.config/cava/config_cyan ~/.config/cava/config
    killall -s SIGUSR2 waybar
    killall -s SIGUSR2 cava
    killall -s SIGUSR1 vis
    args="keyword general:col.active_border 0xffb5c0ff 0xff55ff60 ; "
    args+="keyword general:col.inactive_border 0xff95b5ff ; "
    args+="keyword group:col.border_active 0xa055ff60 ; "
    args+="keyword group:col.border_inactive 0xa095b5ff ; "
    args+="keyword group:groupbar:col.active 0xa055ff60 ; "
    args+="keyword group:groupbar:col.inactive 0xa095b5ff ; "
    args+="keyword decoration:col.shadow 0xff55e5e8 ; "
    args+="keyword decoration:col.shadow_inactive 0xff55a5e8 ; "

    hyprctl --batch "$args"
    hyprctl hyprpaper wallpaper "DP-1,~/.config/hypr/wallpapers/circle_green_boden_gray_no_fog.png"
    hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/wallpapers/circle_green_boden_gray_no_fog.png"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/.config/hypr/wallpapers/circle_green_boden_gray_no_fog.png"
    flatpak run --command=gradience-cli com.github.GradienceTeam.Gradience apply -n Cyan-glow --gtk both
else
    touch /tmp/color_mode
    cp ~/.config/waybar/style_orange_glow.css ~/.config/waybar/style.css
    cp ~/.config/alacritty/alacritty_orange.toml ~/.config/alacritty/alacritty.toml
    cp ~/.config/nwg-drawer/drawer_orange.css ~/.config/nwg-drawer/drawer.css
    cp ~/.config/btop/themes/orange.theme ~/.config/btop/themes/current.theme
    cp ~/.config/cava/config_orange ~/.config/cava/config
    killall -s SIGUSR2 waybar
    killall -s SIGUSR2 cava
    killall -s SIGUSR1 vis
    args="keyword general:col.active_border 0xffffeedd ; "
    args+="keyword general:col.inactive_border 0xffffddaa ; "
    args+="keyword group:col.border_active 0xffffeedd ; "
    args+="keyword group:col.border_inactive 0xffffcc00 ; "
    args+="keyword group:groupbar:col.active 0xffffee88 ; "
    args+="keyword group:groupbar:col.inactive 0xffffcc00 ; "
    args+="keyword decoration:col.shadow 0xffffff00 ; "
    args+="keyword decoration:col.shadow_inactive 0xffdd9900 ; "

    hyprctl --batch "$args"
    hyprctl hyprpaper wallpaper "DP-1,~/.config/hypr/wallpapers/ball_blocks_orange.png"
    hyprctl hyprpaper wallpaper "eDP-1,~/.config/hypr/wallpapers/ball_blocks_orange.png"
    hyprctl hyprpaper wallpaper "HDMI-A-1,~/.config/hypr/wallpapers/ball_blocks_orange.png"
    flatpak run --command=gradience-cli com.github.GradienceTeam.Gradience apply -n Orange-glow --gtk both
fi

killall nwg-drawer
nwg-drawer -r -ovl -nocats -spacing 50 -nofs & disown
