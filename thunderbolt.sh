# toga - office setup
# force the external monitor to change resolution to kick start it when it won't start...
xrandr --output DP-1.1 --mode 1920x1080 && \
sleep 5 && \
xrandr --output DP-3 --auto --output DP-1.1 --auto --right-of DP-3
