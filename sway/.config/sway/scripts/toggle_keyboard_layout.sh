#!/bin/bash
# Uses `swaymsg input type:keyboard xkb_layout` instead of setxkbmap.
# VERIFY: xkb_active_layout_name is a human-readable string (e.g.
# "English (US)" / "Swedish"), not a raw layout code — the substring match
# below assumes those names; check `swaymsg -t get_inputs | jq` on this
# hardware if toggling doesn't work as expected.
CURR_LAYOUT=$(swaymsg -t get_inputs | jq -r '[.[] | select(.type == "keyboard")][0].xkb_active_layout_name')

if [[ "$CURR_LAYOUT" == *"Swedish"* ]]; then
    swaymsg input type:keyboard xkb_layout us
else
    swaymsg input type:keyboard xkb_layout se
fi
