#!/bin/zsh
# IMPORTANT!
# Make sure to edit this file with an editor
# that can display font awesome
# DO NOT edit these. They contain font awesome icons that
# may not be rendered in some terminals
KEEB=
# --> end "do not edit"

BATT_PERC="Battery Percentage"

# Get all paired devices
DEVICES=$(bluetoothctl paired-devices)

# Initialize the result variable
RESULT="$KEEB"

while IFS= read -r device; do
    if [ -n "$device" ]; then
        # Extract the MAC address and name from the device info
        ADDR=$(echo "$device" | cut -f2 -d' ')
        NAME=$(echo "$device" | cut -f3- -d' ')

        # Get device info
        info=$(bluetoothctl info $ADDR)

        # Check if device is connected and is a keyboard
        if echo "$info" | grep -q "Connected: yes" && echo "$info" | grep -q "Icon: input-keyboard"; then
            # Build the keyboard status string
            keyboard_status="$NAME"
            if echo "$info" | grep -q "$BATT_PERC"; then
                BATTERY=$(echo "$info" | grep "$BATT_PERC" | awk '{print $4;exit}' | sed 's/[()]//g')
		keyboard_status="$keyboard_status $BATTERY%"
            else
                keyboard_status="$keyboard_status N/A%"
            fi

            # Append to result with separator if not first entry
            if [ -n "$RESULT" ]; then
                RESULT="$RESULT $keyboard_status"
            else
                RESULT="$keyboard_status"
            fi
        fi
    fi
done <<< "$DEVICES"

# Output the final result if any keyboards were found
if [ -n "$RESULT" ]; then
    echo "$RESULT"
fi

exit 0
