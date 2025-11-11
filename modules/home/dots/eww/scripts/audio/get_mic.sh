#!/bin/sh

pipevol() {
    mute=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep 'MUTED')

    val=$(
	wpctl get-volume @DEFAULT_AUDIO_SOURCE@ \
	| awk '{print $2}' \
	| sed 's/\.//g' \
	| sed 's/^0//'
    )

    if [ "$mute" = "" ]; then
	echo "$val"
    else
	echo "$(( -val - 1 ))"
    fi
}

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

# Pure pipewire and wireplumber
pipewire() {
    pw-mon -oa | while read -r line; do
	if echo "$line" | grep -q "changed"; then
	    pipevol
	fi
    done
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

if command -v pw-mon >/dev/null 2>&1 && command -v wpctl >/dev/null 2>&1; then
    pipevol
    pipewire
elif command -v pactl >/dev/null 2>&1; then
    pulsevol
    pulseaudio
else
    alsa
fi
