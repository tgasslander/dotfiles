# Shared guard for driving wlr-output-power (wlopm) safely from the DPMS scripts.
#
# WHY: calling wlopm while an output is mid add/remove makes Hyprland abort in
# COutputPowerProtocol::onGetOutputPower -> COutputPower::COutputPower(CMonitor)
# -- a whole-compositor crash that cascades into Xwayland/hyprlock and leaves a
# stuck `--safe-mode --locked` session. It is triggered by connector churn, e.g.
# switching the monitor's HDMI input to the MacBook. See the
# hdmi-switch-wlopm-crashes-hyprland note (2026-10-21 crash, coredumpctl 84133).
#
# RULES enforced here:
#   1. Never READ power state via wlopm -- `wlopm` with no args calls
#      get_output_power (the crashing path). Read Hyprland's dpmsStatus instead.
#   2. Never pass wlopm the '*' wildcard -- it enumerates ALL connectors,
#      including a half-dead one on another port. Target outputs by name.
#   3. Never touch wlopm while the enabled-output set is in flux. Require the
#      set to be stable across two quick samples first.
# Sourced by dpms-off.sh and dpms-resume.sh; not meant to be run directly.

# hyprctl needs the instance signature; hypridle normally exports it, but fall
# back to the newest instance dir so the guard still works if it is missing.
export HYPRLAND_INSTANCE_SIGNATURE="${HYPRLAND_INSTANCE_SIGNATURE:-$(ls -t "${XDG_RUNTIME_DIR:-/tmp}"/hypr 2>/dev/null | head -1)}"

SETTLE_INTERVAL="${SETTLE_INTERVAL:-0.5}"   # seconds between stability samples

# Names of currently enabled outputs, one per line (empty if none / monitor
# switched away to the other HDMI input).
_mon_names() {
    hyprctl monitors -j 2>/dev/null | jq -r '.[] | select(.disabled==false) | .name'
}

# Echo the enabled-output names IFF the set is non-empty and unchanged across
# two samples SETTLE_INTERVAL apart; otherwise fail. $1 = extra attempts: 0 does
# a single double-sample (for the watchdog poll -- skip this cycle if churning),
# a higher number waits through churn (for one-shot blank/unblank).
_stable_names() {
    local tries=$(( ${1:-0} + 1 )) a b
    a=$(_mon_names)
    while [ "$tries" -gt 0 ]; do
        sleep "$SETTLE_INTERVAL"
        b=$(_mon_names)
        if [ -n "$b" ] && [ "$a" = "$b" ]; then
            printf '%s\n' "$b"
            return 0
        fi
        a="$b"
        tries=$(( tries - 1 ))
    done
    return 1
}

# True if any enabled output currently has DPMS on. Replaces `wlopm | grep ' on$'`
# so we never issue a get_output_power read. dpmsStatus is Hyprland's view of the
# same output-power state wlopm sets.
any_output_on() {
    hyprctl monitors -j 2>/dev/null \
        | jq -e 'any(.[]; .disabled==false and .dpmsStatus==true)' >/dev/null 2>&1
}

# Guarded power set. wlopm_set <on|off> [extra-settle-attempts]
# Only acts once the output set is stable, and targets each output by name.
# Returns non-zero without calling wlopm if nothing stable/present to act on.
wlopm_set() {
    local state="$1" names n
    names=$(_stable_names "${2:-0}") || return 1
    while IFS= read -r n; do
        [ -n "$n" ] && wlopm --"$state" "$n"
    done <<< "$names"
}
