#!/usr/bin/env bash

# Check if tailscale is running
if ! pgrep -x tailscaled >/dev/null 2>&1; then
    echo '{"text": "󰖂", "tooltip": "Tailscale: not running", "class": "down"}'
    exit 0
fi

# Check tailscale status
status=$(tailscale status --json 2>/dev/null)

if [ $? -ne 0 ]; then
    echo '{"text": "󰖂", "tooltip": "Tailscale: disconnected", "class": "down"}'
    exit 0
fi

# Extract current connection info
hostname=$(echo "$status" | jq -r '.Self.HostName')
tunnel_ip=$(echo "$status" | jq -r '.Self.TailscaleIPs[0]')
online=$(echo "$status" | jq -r '.Self.Online')

if [ "$online" = "true" ]; then
    echo "{\"text\": \"󰖂\", \"tooltip\": \"Tailscale: $hostname ($tunnel_ip)\", \"class\": \"up\"}"
else
    echo '{"text": "󰖂", "tooltip": "Tailscale: disconnected", "class": "down"}'
fi
