#!/bin/bash
#
# run_keygen
#
# Create ed25519 keys
#

if [[ -x "$(command -v ssh-keygen)" ]]; then
    echo "Please enter file path ($HOME/.ssh/id_ed25519):"
    read -r FILEPATH
    if [[ -z "${FILEPATH}" ]]; then
        FILEPATH="$HOME/.ssh/id_ed25519"
    fi
        ssh-keygen -o -a 64 -t ed25519 -f "$FILEPATH"

else
    echo "ERROR: ssh-keygen could not be found"
fi    
    