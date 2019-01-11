#!/usr/bin/env bash

CURRENT_BRIGHTNESS=$(brightnessctl -m | cut -d, -f4| tr -d %)
if [ $CURRENT_BRIGHTNESS = 1 ]; then
    brightnessctl -d intel_backlight set 0%
elif [ $CURRENT_BRIGHTNESS -le 8 ]; then
    brightnessctl -d intel_backlight set 1%
    echo 1 > $HOME/.xobpipe
else
    brightnessctl -d intel_backlight set 8%-
    echo $(expr $CURRENT_BRIGHTNESS - 8) > $HOME/.xobpipe
fi
