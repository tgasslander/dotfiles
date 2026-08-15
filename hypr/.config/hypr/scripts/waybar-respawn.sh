#!/bin/bash
# waybar's mpris/playerctl module has a known SIGSEGV bug (crashes on a
# player property-change signal dispatched off the GTK main thread). It's
# launched via a bare `waybar &` with no supervision, so a crash just left
# the bar gone silently (2026-08-15). Restart on abnormal exit; stay down
# on a clean exit (0) or deliberate kill (SIGTERM/SIGINT) so `pkill waybar`
# for config reloads still works as expected.

while true; do
    waybar
    rc=$?

    if [ "$rc" -eq 0 ] || [ "$rc" -eq 130 ] || [ "$rc" -eq 143 ]; then
        exit 0
    fi

    sleep 1
done
