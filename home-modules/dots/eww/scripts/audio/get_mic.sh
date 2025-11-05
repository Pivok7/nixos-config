#!/bin/sh

pulsevol() {
    mute=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

    val=$(
	pactl get-source-volume @DEFAULT_SOURCE@ \
	| grep -o '[0-9]\+%' \
	| head -n1 \
	| tr -d '%'
    )

    if [ "$mute" = "yes" ]; then
	echo "$(( -val - 1 ))"
    else
	echo "$val"
    fi
}

alsavol() {
    vol=$(
	amixer get Capture\
	| grep -i 'Front Left:'\
	| awk -F'[][]' '{print $2}'\
	| tr -d '%'
    )

    if "$(amixer get Capture)" | grep -q "\[off\]"; then
	echo "$(( -val - 1 ))"
    else
	echo "$vol"
    fi
}

# PulseAudio or pipewire-pulse
pulseaudio() {
    pactl subscribe sink | while read -r line; do
	#if echo "$line" | grep -q "change"; then
	    pulsevol
	#fi
    done
}

# Last resort. Polling amixer
alsa() {
    while true; do
	alsavol
	sleep 1
    done
}

if command -v pactl >/dev/null 2>&1; then
    pulsevol
    pulseaudio
else
    alsa
fi
