#!/usr/bin/env bash

CURRENT_BRIGHTNESS=$(brightnessctl -m | cut -d, -f4| tr -d %)
if [ $CURRENT_BRIGHTNESS = 0 ]; then
    brightnessctl -d intel_backlight set 1%
elif [ $CURRENT_BRIGHTNESS -ge 92 ]; then
    brightnessctl -d intel_backlight set 100%
    echo 100 > $HOME/.xobpipe
else
    brightnessctl -d intel_backlight set 8%+
    echo $(expr $CURRENT_BRIGHTNESS + 8) > $HOME/.xobpipe
fi
