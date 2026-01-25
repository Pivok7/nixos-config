#!/bin/sh

vol() {
    # Pipewire + Wireplumber
    if command -v wpctl >/dev/null 2>&1; then
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    # Fall back to ALSA
    else
	amixer set Master toggle
    fi
}

mic() {
    # Pipewire + Wireplumber
    if command -v wpctl >/dev/null 2>&1; then
	wpctl set-mute @DEFAULT_SOURCE@ toggle
    # Fall back to ALSA
    else
	amixer set Capture toggle
    fi
}

case "$1" in
    "vol") vol ;;
    "mic") mic ;;
esac

