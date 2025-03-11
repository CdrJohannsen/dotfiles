#!/usr/bin/sh
loginctl lock-session & systemctl suspend && killall openrgb #&& openrgb --startminimized
