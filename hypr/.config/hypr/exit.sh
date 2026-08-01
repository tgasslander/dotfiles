#!/bin/sh
lock() {
	hyprlock
}

case "$1" in
lock)
	lock
	;;
logout)
	hyprctl dispatch exit
	;;
suspend)
	# Deliberately NOT `lock && systemctl suspend`. That worked under Sway
	# because `swaylock -f` daemonizes; hyprlock has no fork flag at all
	# (its whole CLI is -h -V -v -q -c -g --immediate-render --no-fade-in
	# --display --immediate), so `lock` would block until the user typed
	# their password and the machine would only suspend after unlocking.
	# Locking on sleep is hypridle's job: hypridle.conf's
	# `before_sleep_cmd = loginctl lock-session` runs under a systemd sleep
	# inhibitor, so the lock is guaranteed to complete before the system
	# goes down — an ordering guarantee a backgrounded `hyprlock &` here
	# could not give. Do not "restore" the `lock &&`.
	systemctl suspend
	;;
hibernate)
	# Same as suspend: hyprlock cannot daemonize, and hypridle's
	# before_sleep_cmd inhibitor owns lock-before-sleep. See above.
	systemctl hibernate
	;;
reboot)
	systemctl reboot
	;;
shutdown)
	systemctl poweroff
	;;
*)
	echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
	exit 2
	;;
esac

exit 0
