#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

service_name=${1:-}
if [[ -z "$service_name" ]]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

if ! sudo systemctl is-active --quiet "$service_name"; then
    echo "Service '$service_name' is not running. Attempting to restart..."
    if sudo systemctl restart "$service_name"; then
        echo "Service '$service_name' restarted successfully."
        exit 0
    else
        echo "Failed to restart service '$service_name'."
        exit 1
    fi
else
    echo "Service '$service_name' is running."
    exit 0
fi