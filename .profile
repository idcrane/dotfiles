#!/bin/bash
#
# .profile
#
# Sourced by various shell sessions, never by zsh.
# If bash_profile exists, bash won't read this file.
#
# .dotenv and .dotenv_local are preferred config locations.
#



# source global profile
# shellcheck disable=SC1091
[[ -f '/etc/profile' ]] && . '/etc/profile'

# source machine-independent, shell-independent environment
# shellcheck disable=SC1090
[[ -f "$HOME/.dotenv" ]] && . "$HOME/.dotenv"

# source machine-dependent, shell-independent environment
# shellcheck disable=SC1090
[[ -f "$HOME/.dotenv_local" ]] && . "$HOME/.dotenv_local"
