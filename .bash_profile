# .bash_profile
#
# Sourced by bash login sessions.
# .profile is ignored by bash if this exists.
#
# .dotenv and .dotenv_local are preferred config locations.
#



# source global bash_profile
[[ -f '/etc/bash_profile' ]] && . '/etc/bash_profile'

# source machine-independent, shell-independent environment
[[ -f "$HOME/.dotenv" ]] && . "$HOME/.dotenv"

# source machine-dependent, shell-independent environment
[[ -f "$HOME/.dotenv_local" ]] && . "$HOME/.dotenv_local"

# source bashrc (bashrc is only loaded by non-login sessions)
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
