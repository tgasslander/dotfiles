#!/bin/bash
# hypridle on-resume for the DPMS listener. A resume within CHURN_WINDOW
# seconds of dpms-off.sh is the output-churn bounce, not user input: wait for
# the churn to settle and blank again. Real input after that wakes the screen
# via misc:key_press_enables_dpms / mouse_move_enables_dpms in hyprland.lua.
CHURN_WINDOW=5
ts_file="${XDG_RUNTIME_DIR:-/tmp}/dpms-off-ts"
off_ts=$(cat "$ts_file" 2>/dev/null || echo 0)

if [ $(( $(date +%s) - off_ts )) -lt "$CHURN_WINDOW" ]; then
    sleep 2
    wlopm --off '*'
else
    wlopm --on '*'
fi
