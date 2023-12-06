#!/bin/zsh

# Convenence script to quickly switch between SE and US layout

if [ $# -eq 0 ]
then
	echo "No arguments! 'se' or 'us' accepted values"
fi

case "$1" in
	se)
		setxkbmap -layout se,se
		echo "Keymap set to swedish"
		;;

	us)
		setxkbmap -layout us,us
		echo "Keymap set to us"
		;;

esac
