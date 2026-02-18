#!/bin/bash

service_name=$1
if [ -z "$service_name" ]; then
    echo "$0 <enter_service_name>"
    exit 1
fi

sudo systemctl is-active --quiet "$service_name"
if [ $? -ne 0 ]; then
    echo "Service '$service_name' is not running. Attempting to restart..."
    sudo systemctl restart "$service_name"
    if [ $? -eq 0 ]; then
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