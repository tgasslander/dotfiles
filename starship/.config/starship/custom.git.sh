#!/bin/bash
gbr=$(git branch 2>/dev/null) || return 1
gbr=$(printf %s "$gbr" | grep '*' | sed 's/*\ //g')
# local gst
gst=$(LC_ALL=C git status 2>&1)
if printf %s "$gst" | grep -q "nothing to commit"; then
	echo -e "\01\e[1m\02@\01\e[0;32m\0002$gbr\01\e[0m\02"
elif printf %s "$gst" | grep -q "nothing added to commit"; then # Untracked
	echo -e "\01\e[1m\02@\01\e[0;35m\0002$gbr\01\e[0m\02"
elif printf %s "$gst" | grep -q "must be run in a work tree"; then # Not in work tree
	echo -e "\01\e[1m\02@\01\e[0;37m\0002$gbr\01\e[0m\02"
else  # Change not added/not merged yet
	echo -e "\01\e[1m\02@\01$IRED\0002$gbr\01\e[0m\02"
fi
