#!/bin/bash
# Turn monitors off and remember when, so dpms-resume.sh can tell a real
# wake-up from the output-churn "resume" that follows (monitor drops its link
# on power-down, aquamarine re-creates the wl_output, hypridle sees "resumed").
date +%s > "${XDG_RUNTIME_DIR:-/tmp}/dpms-off-ts"
wlopm --off '*'
