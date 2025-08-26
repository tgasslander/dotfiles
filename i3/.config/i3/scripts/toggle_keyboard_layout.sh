#!/bin/bash

CURR_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$CURR_LAYOUT" == "us" ]; then
    setxkbmap se
else
    setxkbmap us
fi
