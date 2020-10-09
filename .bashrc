#!/bin/bash
#
#.bashrc
#
# Sourced by bash interactive sessions.
# Manually sourced in .bash_profile.
#
# Machine-specific changes can be placed in ~/dotshell_local
#



#====================================================================
# Other Configs

# load global config
# shellcheck disable=SC1091
[[ -f '/etc/bashrc' ]] && . '/etc/bashrc'

# load fzf config
# shellcheck disable=SC1090
[[ -f "$HOME/.fzf.bash" ]] && . "$HOME/.fzf.bash"

# load personal, machine-independent, shell-independent config
# shellcheck disable=SC1090
[[ -f "$HOME/.dotshell" ]] && . "$HOME/.dotshell"

# load personal, machine-dependent, shell-independent config
# shellcheck disable=SC1090
[[ -f "$HOME/.dotshell_local" ]] && . "$HOME/.dotshell_local"



#====================================================================
# History

shopt -s histappend                     # don't overwrite history file
shopt -s cmdhist                        # write multi-line commands on one line

# store history immediately, rather than on exit
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$"\n"}history -a; history -c; history -r"

# ignore duplicates and lines starting with space
HISTCONTROL=ignoreboth

# ignore the listed commands
HISTIGNORE='ls:la:ll:bg:fg:history:clear:exit:logout:top:python:ipython'

# record timestamps 
HISTTIMEFORMAT=' %F %T '

# history file location
HISTFILE=$HOME/.bash_history

# how much history to keep 
HISTFILESIZE=10000                      # lines of history to keep on disk
HISTSIZE=10000                          # seems to be duplicate of HISTFILESIZE 

# change arrow keybindings
bind '"\e[A": history-search-backward'  # switch up arrow to search of previous history
bind '"\e[B": history-search-forward'   # switch down arrow to search of previous history



#====================================================================
# Prompt

# no colors
# export PS1='\u@\h \W $ '

# colors
# use \[\e[ccm\] to denote color cc
# use \[\e[1;ccm\] to denote bold color cc
# use \[\e[00m\] to clear color info
# 37 is white, 36 cyan
export PS1='\[\e[1;36m\]\u@\h \[\e[1;37m\]\W \[\e[1;36m\]$ \[\e[00m\]\[\033[37m\]'



#====================================================================
# Finalize 
