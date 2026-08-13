#!/bin/bash
# hypridle's dpms('on') on-resume can lose a DRM commit race in aquamarine
# ("Cannot commit when a page-flip is awaiting" in hyprland.log) -- the
# dispatch returns "ok" but the connector stays dpmsStatus=false. Retry
# until every monitor actually reports dpmsStatus true, or give up.

max_attempts=5
delay=0.3

for i in $(seq 1 "$max_attempts"); do
    hyprctl dispatch "hl.dsp.dpms('on')" >/dev/null

    all_on=$(hyprctl monitors -j | jq '[.[] | .dpmsStatus] | all')
    if [ "$all_on" = "true" ]; then
        exit 0
    fi

    sleep "$delay"
done

notify-send "hypridle" "dpms(on) still failed after $max_attempts attempts" 2>/dev/null
exit 1
