#!/bin/sh
# Replaces Sway's `swaynag -t warning -m '... really want to exit sway?'`.
# swaynag is Sway-specific and has no Hyprland equivalent; rofi is already
# installed and themed, and preserves the confirmation guard rather than
# binding a bare `exit`.
choice=$(printf 'No\nYes, exit Hyprland\n' |
	rofi -dmenu -i -p 'Exit Hyprland?' -selected-row 0)

if [ "$choice" = "Yes, exit Hyprland" ]; then
	hyprctl dispatch exit
fi

exit 0
