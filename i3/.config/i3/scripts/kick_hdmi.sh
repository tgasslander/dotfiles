#!/bin/bash
# 1. Log the execution time
echo "Kick script triggered at $(date)" >> /tmp/hdmi_kick.log

# 2. Get the monitor name
MON=$(xrandr | grep " connected" | grep "HDMI" | cut -d' ' -f1)

if [ -z "$MON" ]; then
    echo "Error: HDMI monitor not detected by xrandr" >> /tmp/hdmi_kick.log
    exit 1
fi

# 3. Try to send a notification (you'll see this on your laptop screen)
# This confirms the script reached this point.
notify-send "HDMI Kick" "Attempting to wake $MON..."

# 4. The Wake Actions
xrandr --output "$MON" --mode 1920x1080
sleep 0.5
xrandr --output "$MON" --mode 3840x2160
