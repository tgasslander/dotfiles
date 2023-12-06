#!/bin/bash

# IMPORTANT!
# Make sure to edit this file with an editor
# that can display font awesome

ICON=
CURR_LANG="$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')"
US="us"
SE="se"
LANG=" "

if [ $CURR_LANG == $SE ]
then
	echo $ICON "SE" ""
elif [ $CURR_LANG == $US ]
then
	echo $ICON "US" ""
else
	$LANG="TBD"
fi

exit 0
