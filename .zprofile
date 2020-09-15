# .zprofile
#
# Sourced by zsh sessions.
# zsh, unlike bash, alwayrs reads .zshrc.
#
# .dotenv and .dotenv_local are preferred config locations
#



# source global zprofile
[[ -f '/etc/zprofile' ]] && . '/etc/zprofile'

# source machine-independent, shell-independent environment
[[ -f "$HOME/.dotenv" ]] && . "$HOME/.dotenv"

# source machine-dependent, shell-independent environment
[[ -f "$HOME/.dotenv_local" ]] && . "$HOME/.dotenv_local"
