#!/bin/bash
# hypridle on-resume for the DPMS listener. A resume within CHURN_WINDOW
# seconds of dpms-off.sh is the output-churn bounce, not user input: wait for
# the churn to settle and blank again (the watchdog from dpms-off.sh keeps
# running). Otherwise it is real input: stop the watchdog and turn on.
#
# wlopm access goes through wlopm-guard.sh, which refuses to drive
# wlr-output-power while the output set is in flux. See
# hdmi-switch-wlopm-crashes-hyprland.
source "$(dirname "$0")/wlopm-guard.sh"

CHURN_WINDOW=15
run="${XDG_RUNTIME_DIR:-/tmp}"
off_ts=$(cat "$run/dpms-off-ts" 2>/dev/null || echo 0)

if [ $(( $(date +%s) - off_ts )) -lt "$CHURN_WINDOW" ]; then
    wlopm_set off 6     # churn bounce: settle, then re-blank
else
    [ -f "$run/dpms-watchdog.pid" ] && kill "$(cat "$run/dpms-watchdog.pid")" 2>/dev/null
    rm -f "$run/dpms-watchdog.pid"
    wlopm_set on 6      # real input: settle, then wake
fi
