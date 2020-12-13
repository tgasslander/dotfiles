#!/bin/bash

BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')

# DO NOT edit these. They contain font awesome icons that
# may not be rendered in some terminals (I'm looking at you xterm)
FULL=
GOOD= 
HALF=
LOW=
WARN=
# --> end "do not edit"

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
COLOR_LOW="#ff9000"
COLOR_HALF="#FFFF99"
COLOR_GOOD="#FFFFFF"
COLOR_FULL="#FFFFFF"

VAL=${BAT%?}
if [ "$VAL" -ge 0 ] && [ "$VAL" -le $LE_WARN ]; then
  L1="$WARN $VAL" 
  L2=$L1
  L3=$COLOR_WARN
elif [ "$VAL" -ge $GE_LOW ] &&  [ "$VAL" -le $LE_LOW ]; then
  L1="$LOW $VAL" 
  L2=$L1
  L3=$COLOR_LOW
elif [ "$VAL" -ge $GE_HALF ] &&  [ "$VAL" -le $LE_HALF ]; then
  L1="$HALF $VAL"
  L2=$L1
  L3=$COLOR_HALF
elif [ "$VAL" -ge $GE_GOOD ] &&  [ "$VAL" -le $LE_GOOD ]; then
  L1="$GOOD $VAL"
  L1=$L1
  L3=$COLOR_GOOD
elif [ "$VAL" -ge $GE_FULL ] &&  [ "$VAL" -le $LE_FULL ]; then
  L1="$FULL $VAL"
  L2=$L1
  L3=$COLOR_FULL
fi

echo $L1"%"
echo $L2"%"
echo $L3

exit 0
