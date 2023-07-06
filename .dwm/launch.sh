#! /bin/bash
i=0
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    CMD="env MONITOR=${i} ~/.config/polybar/polybar-scripts/dwm-tags.sh"
    env TAG_CMD="$CMD" MONITOR="LVDS-1" /bin/polybar --reload --config=~/.config/polybar/config.ini
    i=$((i+1))
done
