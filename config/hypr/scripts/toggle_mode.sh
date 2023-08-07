#!/bin/sh
gaps=$(hyprctl getoption general:col.active_border -j | jq '.data')
if [ $gaps == $gaps ]; then
    hyprctl --batch "keyword general:col.active_border 0xffffddcc ; keyword general:col.inactive_border 0xffff9999 ; keyword decoration:col.shadow 0xffff8822 ; keyword decoration:col.shadow_inactive 0xffff2222"
else
    hyprctl --batch "keyword general:col.active_border 0xffb5d5d8 ; keyword general:col.inactive_border 0xff95b5ff ; keyword decoration:col.shadow 0xff55e5e8 ; keyword decoration:col.shadow_inactive 0xff55a5e8"
fi
