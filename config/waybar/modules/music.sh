#!/bin/sh
pstatus=$(playerctl status)
if [[ $pstatus == "Stopped" ]]; then
    exit 0
elif [[ $pstatus == "" ]]; then
    exit 0
fi
title=$(playerctl metadata xesam:title)
artist="$(playerctl metadata xesam:artist)"
album="$(playerctl metadata xesam:album)"

line="${title/.mp3/}"
tooltip="${title/.mp3/}"

if [ "$artist" != "" ]; then
    if [ "$artist" != "Unknown" ]; then
        tooltip="${tooltip} - ${artist/ - Topic/}"
    fi
fi

if [ "$album" != "" ]; then
    if [ "$album" != "Unknown" ]; then
        tooltip="${tooltip} - ${album}"
    fi
fi

song="{\"text\":\"$line\", \"tooltip\":\"$tooltip\"}"
echo "${song//\&/and}"
