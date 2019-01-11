#!/usr/bin/env bash

DEVICE=$(pactl list sinks | grep -B4 "Description: Built-in Audio Analog Stereo"|head -1|cut -f2 -d#)
CURRENT_VOLUME=$(pactl list sinks | grep "Volume: front-left" | awk '{ print $5 }' | tr -d %)

pactl set-sink-volume $DEVICE -7%
echo $(expr $CURRENT_VOLUME - 7) > $HOME/.xobpipe
