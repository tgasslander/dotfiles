#!/bin/bash

# IMPORTANT!
# Make sure to edit this file with an editor
# that can display font awesome

ICON=

if [ -n "$SWAYSOCK" ]; then
	# Running under Sway (Wayland) — swaymsg replaces setxkbmap.
	# VERIFY: xkb_active_layout_name is a human-readable string (e.g.
	# "English (US)" / "Swedish"), not a raw layout code. Check
	# `swaymsg -t get_inputs | jq` on this hardware if this stops matching.
	CURR_NAME=$(swaymsg -t get_inputs | jq -r '[.[] | select(.type == "keyboard")][0].xkb_active_layout_name')
	case "$CURR_NAME" in
		*Swedish*) echo "$ICON SE" ;;
		*English*) echo "$ICON US" ;;
	esac
else
	# Running under i3 (X11) — unchanged from the original script.
	CURR_LANG="$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')"
	case "$CURR_LANG" in
		se) echo "$ICON SE" ;;
		us) echo "$ICON US" ;;
	esac
fi

exit 0
