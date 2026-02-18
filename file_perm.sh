#!/bin/bash

file=$1

if [ -z "$file" ]; then
    echo "$0 <enter_filename>"
    exit 1
else
    if [ ! -f "$file" ]; then
        echo "File '$file' does not exist."
        exit 1
    fi
fi

echo "Permissions for '$file':"
ls -l "$file" | awk '{print $1}'
if [ -x "$file" ]; then
    echo "The file is executable."
else
    echo "The file is not executable."
    echo "Adding execute permission for the user..."
    chmod +x "$file"
    if [ $? -eq 0 ]; then
        echo "Execute permission added successfully."
        ls -l "$file"
        echo " "
    else
        echo "Failed to add execute permission."
    fi
fi