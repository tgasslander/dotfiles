# toga - office setup
# force the external monitor to change resolution to kick start it when it won't start...
xrandr --output HDMI-0 --mode 1920x1080 && \
sleep 5 && \
xrandr --output DP-3 --auto --output HDMI-0 --auto --right-of DP-3
