# .profile
#
# Sourced by various shell sessions, never by zsh.
# If bash_profile exists, bash won't read this file.
#
# .dotenv and .dotenv_local are preferred config locations.
#



# source global profile
[[ -f '/etc/profile' ]] && . '/etc/profile'

# source machine-independent, shell-independent environment
[[ -f "$HOME/.dotenv" ]] && . "$HOME/.dotenv"

# source machine-dependent, shell-independent environment
[[ -f "$HOME/.dotenv_local" ]] && . "$HOME/.dotenv_local"
