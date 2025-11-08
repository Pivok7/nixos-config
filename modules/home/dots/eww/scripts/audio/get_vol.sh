#!/bin/sh

pulsevol() {
    mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

    val=$(
	pactl get-sink-volume @DEFAULT_SINK@ \
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
	amixer -D pulse sget Master \
	| awk -F '[^0-9]+' '/Left:/{print $3}'
    )

    if "$(amixer get Master)" | grep -q "\[off\]"; then
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
