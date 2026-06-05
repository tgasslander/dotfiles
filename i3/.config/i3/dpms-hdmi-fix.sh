#!/bin/bash

# Re-probe HDMI when DPMS wakes the display
HDMI_OUTPUT="HDMI-0"

was_off=0
while true; do
	state=$(xset q 2>/dev/null | awk '/Monitor is/{print $3}')
	case "$state" in
		Off|Standby|Suspend) was_off=1 ;;
		On)
			if [ "$was_off" = "1" ]; then
				was_off=0
				sleep 1
				xrandr --output "$HDMI_OUTPUT" --auto
			fi
			;;
	esac
	sleep 2
done
