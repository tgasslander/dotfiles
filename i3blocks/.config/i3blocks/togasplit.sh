#!/bin/zsh

# IMPORTANT!
# Make sure to edit this file with an editor
# that can display font awesome

BAT=$(cat /sys/class/power_supply/BAT0/capacity)

# DO NOT edit these. They contain font awesome icons that
# may not be rendered in some terminals (I'm looking at you xterm)
KEEB=
# --> end "do not edit"

NEEDLE='togasplit ble'
BATT_PERC="Battery Percentage"

DEVICES=$(bluetoothctl paired-devices | grep $NEEDLE)
if [ -z "$DEVICES" ]; then
	# $NEEDLE is not paired
	exit 0
fi

ADDR=($(echo $DEVICES | cut -f2 -d' '))

info=`bluetoothctl info $uuid`
if echo "$info" | grep -q "Connected: yes"; then
	BATT=$(echo $info | grep $BATT_PERC)
	BATTERY=$(awk '{print $4;exit}' <<< $BATT | sed 's/[()]//g')
	echo $KEEB $NEEDLE $BATTERY"%"
fi
exit 0
