#!/bin/sh
gaps=$(hyprctl getoption general:gaps_out -j | jq '.int')
if [ $gaps == 20 ]; then
    hyprctl --batch "keyword general:border_size 0 ; keyword general:gaps_out 0 ; keyword general:gaps_in 0 ; keyword decoration:rounding 0"
else
    hyprctl --batch "keyword general:border_size 2 ; keyword general:gaps_out 20 ; keyword general:gaps_in 5 ; keyword decoration:rounding 10"
fi
