#!/bin/sh

play_pause() {
    if command -v playerctl >/dev/null 2>&1; then
	playerctl play-pause
    fi
}

next() {
    if command -v playerctl >/dev/null 2>&1; then
	playerctl next
    fi
}

previous() {
    if command -v playerctl >/dev/null 2>&1; then
	playerctl previous
    fi
}

case "$1" in
    "play-pause") play_pause ;;
    "next") next ;;
    "previous") previous ;;
esac
