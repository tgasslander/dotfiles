#!/bin/bash
gbr=$(git branch 2>/dev/null) || return 1
gbr=$(printf %s "$gbr" | grep '*' | sed 's/*\ //g')
# local gst
gst=$(LC_ALL=C git status 2>&1)
if printf %s "$gst" | grep -q "nothing to commit"; then
	echo -e """\
\e[48;2;166;209;137m\
\e[38;2;54;58;79m \uf09b $gbr \
\e[0m\
\e[38;2;166;209;137m\ue0b4\e[0m"""
elif printf %s "$gst" | grep -q "Changes to be committed"; then # Untracked
	echo -e """\
\e[48;2;231;130;132m\
\e[38;2;54;58;79m \uf09b $gbr \
\e[0m\
\e[38;2;231;130;132m\
\ue0b4\e[0m"""
elif printf %s "$gst" | grep -q "Untracked files"; then # Untracked
	echo -e """\
\e[48;2;237;135;150m\
\e[38;2;54;58;79m \uf09b $gbr \
\e[0m\
\e[38;2;237;135;150m\
\ue0b4\e[0m"""
elif printf %s "$gst" | grep -q "must be run in a work tree"; then # Not in work tree
	echo -e "\01\e[1m\02@\01\e[0;37m\0002$gbr\01\e[0m\02"
elif printf %s "$gst" | grep -q "Changes not staged for commit"; then # Local changes
	echo -e """\
\e[48;2;238;212;159m\
\e[38;2;54;58;79m \uf09b $gbr \
\e[0m\
\e[38;2;238;212;159m\
\ue0b4\e[0m"""
else  # probably not a git repo
	# echo -e "\e[38;2;238;212;159m\ue0b4"
	echo -e "\e[38;2;140;170;238m\ue0b4"
fi
