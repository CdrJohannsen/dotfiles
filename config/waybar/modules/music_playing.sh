#!/bin/sh

pstatus="$(playerctl status)"
if [[ $pstatus == "Stopped" ]]; then
    line="⏹"
elif [[ $pstatus == "Paused" ]]; then
    line="▶"
elif [[ $pstatus == "Playing" ]]; then
    line="⏸"
elif [[ $pstatus == "" ]]; then
    line="⏹"
else
    line="-"
fi
song="{\"text\":\"$line\"}",
echo "$song"
