#!/bin/bash

MONITORS_CONF="$HOME/.config/hypr/monitors.conf"

# List available monitors and their disabled state
list_monitors() {
    echo "Available monitors:"
    awk '/output =/ {name=$3} /disabled =/ {print "  " name " (disabled = " $3 ")"}' "$MONITORS_CONF"
    # Show monitors without a disabled field as enabled
    awk '
        /output =/ {name=$3; has_disabled=0}
        /disabled =/ {has_disabled=1}
        /^}/ {if (!has_disabled && name) print "  " name " (no disabled field)"; name=""; has_disabled=0}
    ' "$MONITORS_CONF"
}

# Toggle disabled state for a specific monitor
toggle_monitor() {
    local monitor="$1"

    # Check if monitor exists in config
    if ! grep -q "output = $monitor" "$MONITORS_CONF"; then
        echo "Error: Monitor '$monitor' not found in config."
        return 1
    fi

    # Check current disabled state
    local current_state
    current_state=$(awk -v mon="$monitor" '
        /output =/ {found=($3 == mon)}
        found && /disabled =/ {print $3; exit}
    ' "$MONITORS_CONF")

    if [[ "$current_state" == "true" ]]; then
        awk -v mon="$monitor" '
            /output =/ {found=($3 == mon)}
            found && /disabled =/ {gsub(/true/, "false")}
            {print}
        ' "$MONITORS_CONF" > "${MONITORS_CONF}.tmp"
        mv "${MONITORS_CONF}.tmp" "$MONITORS_CONF"
        echo "$monitor: disabled = true -> false"
    elif [[ "$current_state" == "false" ]]; then
        awk -v mon="$monitor" '
            /output =/ {found=($3 == mon)}
            found && /disabled =/ {gsub(/false/, "true")}
            {print}
        ' "$MONITORS_CONF" > "${MONITORS_CONF}.tmp"
        mv "${MONITORS_CONF}.tmp" "$MONITORS_CONF"
        echo "$monitor: disabled = false -> true"
    else
        echo "Error: No 'disabled' field found for monitor '$monitor'."
        return 1
    fi
}

# Main
if [[ $# -eq 0 ]]; then
    list_monitors
    echo ""
    read -rp "Enter monitor name(s) to toggle (space-separated, e.g. DP-1 DP-2): " -a selections
    for monitor in "${selections[@]}"; do
        toggle_monitor "$monitor"
    done
else
    for monitor in "$@"; do
        toggle_monitor "$monitor"
    done
fi

# Reload once after all toggles
hyprctl --batch "reload; dispatch exec hyprpaper"
