#!/usr/bin/env bash

# Description:
# Checks for available firmware updates using fwupdmgr.
# - If 0 updates: do nothing
# - If positive: show notification
# - If negative or error: show error notification

# Dependencies: fwupdmgr, jq, notify-send

set -euo pipefail

# Run the command and capture output
output=$(fwupdmgr get-updates --json 2>&1) || {
    notify-send "fwupdmgr Error" "Failed to run fwupdmgr: $output" -u critical
    exit 1
}

# Try to parse JSON safely
count=$(echo "$output" | jq -r '.Devices | length' 2>/dev/null) || {
    notify-send "fwupdmgr Error" "Failed to parse JSON output from fwupdmgr" -u critical
    exit 1
}

# Check if count is an integer
if ! [[ "$count" =~ ^-?[0-9]+$ ]]; then
    notify-send "fwupdmgr Error" "Invalid device count: $count" -u critical
    exit 1
fi

# Logic
if (( count < 0 )); then
    notify-send "fwupdmgr Error" "Device count is negative ($count)" -u critical
    exit 1
elif (( count == 0 )); then
    # Do nothing
    exit 0
else
    notify-send "Firmware Updates Available" "$count devices have available updates." -u normal
fi

