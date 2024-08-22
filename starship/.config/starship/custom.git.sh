#!/bin/zsh
# local gst
gst=$(LC_ALL=C git status 2>&1)
gbr=$(git branch 2>/dev/null)
gbr=$(printf %s "$gbr" | grep '*' | sed 's/*\ //g')
if printf %s "$gst" | grep -q "nothing added to commit"; then
	echo -e """\
\033[48;2;166;209;137m\
\033[38;2;54;58;79m \uf09b $gbr\
\033[0m\
\033[38;2;166;209;137m\ue0b4\033[0m"""
elif printf %s "$gst" | grep -q "working tree clean"; then
	echo -e """\
\033[48;2;166;209;137m\
\033[38;2;54;58;79m \uf09b $gbr\
\033[0m\
\033[38;2;166;209;137m\ue0b4\033[0m"""
e
elif printf %s "$gst" | grep -q "Changes to be committed"; then # Untracked
	echo -e """\
\033[48;2;231;130;132m\
\033[38;2;54;58;79m \uf09b $gbr\
\033[0m\
\033[38;2;231;130;132m\
\ue0b4\033[0m"""
elif printf %s "$gst" | grep -q "must be run in a work tree"; then # Not in work tree
	echo -e "\01\033[1m\02@\01\033[0;37m\0002$gbr\01\033[0m\02"
elif printf %s "$gst" | grep -q "Changes not staged for commit"; then # Local changes
	echo -e """\
\033[48;2;238;212;159m\
\033[38;2;54;58;79m \uf09b $gbr\
\033[0m\
\033[38;2;238;212;159m\
\ue0b4\033[0m"""
else  # probably not a git repo
	echo -e """\
\033[38;2;140;170;238m\
\ue0b4\
\033[0m"""
fi
return 0
