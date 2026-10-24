#!/bin/bash
# Blank the monitors and keep them blank until the user does something.
#
# The monitor drops its link on power-down, so aquamarine tears down and
# re-creates the wl_output -- and the new output comes up powered ON, often
# with no hypridle "resume" to react to. A watchdog therefore re-blanks any
# output that turns back on, until it sees real keyboard/mouse input (then it
# exits; Hyprland's key_press/mouse_move_enables_dpms wakes the screen) or
# dpms-resume.sh kills it.
#
# All wlopm access goes through wlopm-guard.sh, which refuses to drive
# wlr-output-power while the output set is in flux -- otherwise a wlopm call
# landing on a mid-teardown connector (e.g. an HDMI input switch) aborts the
# whole compositor. See hdmi-switch-wlopm-crashes-hyprland.
source "$(dirname "$0")/wlopm-guard.sh"

run="${XDG_RUNTIME_DIR:-/tmp}"
pidfile="$run/dpms-watchdog.pid"

[ -f "$pidfile" ] && kill "$(cat "$pidfile")" 2>/dev/null
date +%s > "$run/dpms-off-ts"
wlopm_set off 6     # wait out any churn before the initial blank

(
    echo "$BASHPID" > "$pidfile"
    # Real input devices only; power buttons etc. are not "the user came back".
    devs=$(awk -v RS= '/Handlers=.*(kbd|mouse[0-9])/ && /Name="[^"]*(Keyboard|Keeb|Mouse|Touchpad)/ {
        match($0, /event[0-9]+/); print "/dev/input/" substr($0, RSTART, RLENGTH) }' /proc/bus/input/devices)
    while :; do
        # Blocks up to 3s; any byte from a device means real input.
        if [ -n "$devs" ] && timeout 3 cat $devs 2>/dev/null | head -c1 | read -r -N1; then
            break
        fi
        [ -z "$devs" ] && sleep 3
        # Re-blank only if an output powered back on AND the set is settled
        # (wlopm_set skips this cycle otherwise; the loop retries in ~3s).
        any_output_on && wlopm_set off 0
    done
    rm -f "$pidfile"
) >/dev/null 2>&1 &
