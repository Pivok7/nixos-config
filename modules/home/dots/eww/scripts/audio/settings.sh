#!/bin/sh

if [ "$#" -eq 1 ]; then
    if command -v pwvucontrol >/dev/null 2>&1; then
	pwvucontrol
    elif command -v pactl >/dev/null 2>&1; then
	case "$1" in
	    "vol") pavucontrol -t 3 ;;
	    "mic") pavucontrol -t 4 ;;
	esac
    else
	notify-send "From settings.sh" "No audio gui found"
    fi
fi
