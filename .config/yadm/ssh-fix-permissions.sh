#!/bin/bash
#
# ssh-fix-permissions.sh
#
# Set required permissions on ~/.ssh and contents.
#
# Assumes all keyfiles begin with "id_" and public keyfiles end in ".pub"
#


# .ssh directory and keyfiles
if [[ -d "$HOME/.ssh" ]]; then
    chmod 700 "$HOME/.ssh"
    chmod 600 "$HOME/.ssh/id_*"
    chmod 644 "$HOME/.ssh/id_*.pub"
fi


# .ssh/config
if [[ -f "$HOME/.ssh/config" ]]; then
    chmod 600 "$HOME/.ssh/config"
fi


# .ssh/authorized_keys
if [[ -f "$HOME/.ssh/authorized_keys" ]]; then
    chmod 600 "$HOME/.ssh/authorized_keys"
fi
