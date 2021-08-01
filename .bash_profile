#!/bin/bash
#
# .bash_profile
#
# Sourced by bash login sessions.
# .profile is ignored by bash if this exists.
#
# .dotenv and .dotenv_local are preferred config locations.
#



# source global bash_profile
# shellcheck disable=SC1091
[[ -f '/etc/bash_profile' ]] && . '/etc/bash_profile'

# source /usr/local/etc/profile.d bash completion
[[ -r '/usr/local/etc/profile.d/bash_completion.sh' ]] && . '/usr/local/etc/profile.d/bash_completion.sh'

# source machine-independent, shell-independent environment
# shellcheck disable=SC1090
[[ -f "$HOME/.dotenv" ]] && . "$HOME/.dotenv"

# source machine-dependent, shell-independent environment
# shellcheck disable=SC1090
[[ -f "$HOME/.dotenv_local" ]] && . "$HOME/.dotenv_local"

# source bashrc (bashrc is only loaded by non-login sessions)
# shellcheck disable=SC1090
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
