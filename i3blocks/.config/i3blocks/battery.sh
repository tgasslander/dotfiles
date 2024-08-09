#!/bin/bash

# IMPORTANT!
# Make sure to edit this file with an editor
# that can display font awesome

BAT=$(cat /sys/class/power_supply/BAT0/capacity)

# DO NOT edit these. They contain font awesome icons that
# may not be rendered in some terminals (I'm looking at you xterm)
FULL=
GOOD= 
HALF=
LOW=
WARN=
# --> end "do not edit"

CHRG=$(cat /sys/class/power_supply/BAT0/status)
CHRGA=$(acpi -a | awk 'NR==1{print $3;exit}')
if [ $CHRG == "Charging," ] || [ $CHRGA == "on-line" ]; then
  CHARGING=
elif [ $CHRG == "Full," ]; then
  echo " $FULL 100%"
elif [ $CHRG == "Full," ]; then
  echo $L1
  echo $COLOR_FULL
  exit 0
fi

LE_WARN=10
GE_LOW=$(($LE_WARN+1))
LE_LOW=25
GE_HALF=$(($LE_LOW+1))
LE_HALF=60
GE_GOOD=$(($LE_HALF+1))
LE_GOOD=85
GE_FULL=$(($LE_GOOD+1))
LE_FULL=100

COLOR_WARN="#FF8000"
COLOR_LOW="#FF9000"
COLOR_HALF="#FFFF99"

if [ "$BAT" -ge 0 ] && [ "$BAT" -le $LE_WARN ]; then
  L1="$CHARGING $WARN $BAT" 
  L2=$L1
  L3=$COLOR_WARN
elif [ "$BAT" -ge $GE_LOW ] &&  [ "$BAT" -le $LE_LOW ]; then
  L1="$CHARGING $LOW $BAT" 
  L2=$L1
  L3=$COLOR_LOW
elif [ "$BAT" -ge $GE_HALF ] &&  [ "$BAT" -le $LE_HALF ]; then
  L1="$CHARGING $HALF $BAT"
  L2=$L1
  L3=$COLOR_HALF
elif [ "$BAT" -ge $GE_GOOD ] &&  [ "$BAT" -le $LE_GOOD ]; then
  L1="$CHARGING $GOOD $BAT"
  L2=$L1
  L3=$COLOR_GOOD
elif [ "$BAT" -ge $GE_FULL ] &&  [ "$BAT" -le $LE_FULL ]; then
  L1="$CHARGING $FULL $BAT"
  L2=$L1
  L3=$COLOR_FULL
elif [ "$BAT" -gt $GE_FULL ]; then
  L1="$CHARGING $FULL 100"
  L2=$L1
  L3=$COLOR_FULL
fi

echo $L1"%"
echo $L2"%"
echo $L3

exit 0
