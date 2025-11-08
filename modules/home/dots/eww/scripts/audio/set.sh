#!/bin/sh

vol() {
    # Pipewire + Wireplumber
    if command -v wpctl >/dev/null 2>&1; then
	if [ "$1" = "up" ]; then
	    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${2}"%+
	elif [ "$1" = "down" ]; then
	    wpctl set-volume @DEFAULT_AUDIO_SINK@ "${2}"%-
	fi
    # Fall back to ALSA
    else
	if [ "$1" = "up" ]; then
	    amixer set Master "${2}"%+
	elif [ "$1" = "down" ]; then
	    amixer set Master "${2}"%-
	fi
    fi
}

mic() {
    # Pipewire + Wireplumber
    if command -v wpctl >/dev/null 2>&1; then
	if [ "$1" = "up" ]; then
	    wpctl set-volume @DEFAULT_SOURCE@ "${2}"%+
	elif [ "$1" = "down" ]; then
	    wpctl set-volume @DEFAULT_SOURCE@ "${2}"%-
	fi
    # Fall back to ALSA
    else
	if [ "$1" = "up" ]; then
	    amixer set Capture "${2}"%+
	elif [ "$1" = "down" ]; then
	    amixer set Capture "${2}"%-
	fi
    fi
}

if [ "$#" -eq 3 ]; then
    case "$1" in
	"vol") vol "$2" "$3" ;;
	"mic") mic "$2" "$3" ;;
    esac
else
    case "$1" in
	"vol") vol "$2" 1 ;;
	"mic") mic "$2" 1 ;;
    esac
fi
