#!/usr/bin/env bash
set -x

DEVICE=$(pactl list sinks | grep -B4 "Description: Built-in Audio Analog Stereo"|head -1|cut -f2 -d#)
MUTE_STATUS=$(pactl list sinks | grep Mute | awk '{ print $2 }')

if [ "$MUTE_STATUS" = "no" ]; then
    pactl set-sink-mute $DEVICE 1
    echo 0 > $HOME/.xobpipe
else
    pactl set-sink-mute $DEVICE 0
    CURRENT_VOLUME=$(pactl list sinks | grep "Volume: front-left" | awk '{ print $5 }' | tr -d %)
    echo $CURRENT_VOLUME > $HOME/.xobpipe
fi
