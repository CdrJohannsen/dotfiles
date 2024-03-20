#!/bin/sh

function handle {
    if [[ ${1:0:12} == "monitoradded" ]]; then
        hyprctl --batch 'dispatch moveworkspacetomonitor "1 1"; dispatch moveworkspacetomonitor "2 1" ;dispatch moveworkspacetomonitor "4 1"; dispatch moveworkspacetomonitor "5 1"; dispatch moveworkspacetomonitor "6 1"; dispatch moveworkspacetomonitor "7 1"'
    fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done
