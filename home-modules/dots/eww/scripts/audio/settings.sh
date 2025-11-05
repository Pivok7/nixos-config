#!/bin/sh

if [ "$#" -eq 1 ]; then
    if command -v pavucontrol >/dev/null 2>&1; then
	case "$1" in
	    "vol") pwvucontrol -t 3 ;;
	    "mic") pwvucontrol -t 4 ;;
	esac
    else
	notify-send "From settings.sh" "No audio gui found"
    fi
fi
