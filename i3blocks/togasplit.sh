#!/bin/zsh

# IMPORTANT!
# Make sure to edit this file with an editor
# that can display font awesome

BAT=$(cat /sys/class/power_supply/BAT0/capacity)

# DO NOT edit these. They contain font awesome icons that
# may not be rendered in some terminals (I'm looking at you xterm)
KEEB=
# --> end "do not edit"

NEEDLE='togasplit'
BATT_PERC="Battery Percentage"

DEVICES=$(bluetoothctl paired-devices | grep $NEEDLE)
if [ -z "$DEVICES" ]; then
	# $NEEDLE is not paired
	exit 0
fi
ADDR=$(echo $DEVICES | awk 'NR==1{print $2;exit}')
IFS=$'\n' INFO=($(bluetoothctl info $ADDR))

for i in $INFO; do

	CONN=$(grep "Connected" <<< "$i")
	if [ ! -z $CONN ]; then
		CONNECTED=$(awk '{print $2;exit}' <<< $CONN)
	fi

	BATT=$(grep $BATT_PERC <<<"$i")
	if [ ! -z $BATT ]; then
		BATTERY=$(awk '{print $4;exit}' <<< $BATT | sed 's/[()]//g')
	fi
done

if [ "$CONNECTED" = "yes" ]; then
	echo $KEEB $NEEDLE $BATTERY"%"
fi
exit 0
