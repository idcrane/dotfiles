# .zshrc
#
# Sourced by zsh interactive sessions.
#
# Machine-specific changes can be placed in ~/.dotshell_local
#
# Parts taken from oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
# by Robby Russell, available under MIT License.
#



#====================================================================
# Other Configs

# load global config
[[ -f '/etc/zshrc' ]] && . '/etc/zshrc'

# load fzf config
[[ -f "$HOME/.fzf.zsh" ]] && . "$HOME/.fzf.zsh"

# load personal, machine-independent, shell-independent config
[[ -f "$HOME/.dotshell" ]] && . "$HOME/.dotshell"

# load personal, machine-dependent, shell-independent config
[[ -f "$HOME/.dotshell_local" ]] && . "$HOME/.dotshell_local"



#====================================================================
# Miscellaneous

setopt NO_CASE_GLOB                     # case insensitive globbing
setopt AUTO_CD                          # auto cd into dir if only name of dir is passed
setopt MULTIOS                          # allow multiple opening of file descriptors



#====================================================================
# History

setopt SHARE_HISTORY                    # share history across multiple zsh sessions
setopt HIST_VERIFY                      # show substitution when using `!!`
setopt EXTENDED_HISTORY                 # add time and date information to history
setopt APPEND_HISTORY                   # don't overwrite history file
setopt INC_APPEND_HISTORY               # update history file after every command
setopt HIST_EXPIRE_DUPS_FIRST           # expire duplicate entries in history file first
setopt HIST_IGNORE_DUPS                 # don't store duplicate entries
setopt HIST_FIND_NO_DUPS                # ignore duplicates when searching
setopt HIST_REDUCE_BLANKS               # remove blank lines from history
setopt HIST_IGNORE_SPACE                # ignore commands that start with space

# history file location
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# how much history to keep 
SAVEHIST=10000                           # lines of history to keep on disk
HISTSIZE=5000                           # lines of history to keep in memory

# change arrow keybindings
bindkey "^[[A" up-line-or-search        # switch up arrow to search of previous history
bindkey "^[[B" down-line-or-search      # switch down arrow to search of previous history



#====================================================================
# Correction and Completion 

# setopt CORRECT                          # enable correction for commands
# setopt CORRECT_ALL                      # enable correction for all arguments
setopt AUTO_MENU                          # insert completion on second TAB press

# show completion menu on successive tab press
zstyle ':completion:*:*:*:*:*' menu select

# make completition case-insensitive, hyphen-insensitive 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# complete . and .. directories
zstyle ':completion:*' special-dirs true

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# NOTE: compinit is called at end of this file, as you don't want to call it more than once



#====================================================================
# Colors

# oh-my-zsh had good color handling for other OSs

autoload -U colors && colors            # load colors

# set macOS/BSD LSCOLORS, which is very different from GNU/Linux LS_COLORS
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# use LS_COLORS for completion colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# set process completion colors
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# borrowed from oh-my-zsh
if [[ $(uname) == "Darwin" ]]; then

    ## macOS installation ##

    # this is a good alias, it works by default just using $LSCOLORS
    ls -G . &>/dev/null && alias ls='ls -G'

    # only use coreutils ls if there is a dircolors customization present 
    #($LS_COLORS or .dircolors file)
    # otherwise, gls will use the default color scheme which is ugly af
    [[ -n "$LS_COLORS" || -f "$HOME/.dircolors" ]] && \
        gls --color -d . &>/dev/null && alias ls='gls --color=tty'

  else

    ## linux installation ##

    # For GNU ls, we use the default ls color theme. They can later be overwritten by themes.
    if [[ -z "$LS_COLORS" ]]; then
      (( $+commands[dircolors] )) && eval "$(dircolors -b)"
    fi
fi

ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }



#====================================================================
# Prompt

# Notes:
# %B sets bold, %b cancels it. %F sets color, %f resets it
# vcs_info check-for-changes finds staged and unstaged changes but not untracked files
# vcs_info explanation: https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html

autoload -Uz vcs_info                   # load zsh's VCS features for git integration in prompt

setopt PROMPT_SUBST                     # expand prompt string

# define function to determine if there are untracked files in working tree
# https://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     [[ $(git ls-files --other --directory --no-empty-directory --exclude-standard | \
           sed q | wc -l | tr -d ' ') == 1 ]] ; then
  hook_com[unstaged]+='%F{208}?%f '
fi
}

# vcs prompt integration
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:*' formats '%B%F{green} [%b] %F{208}%c%u%f'
zstyle ':vcs_info:*' actionformats '%B%F{green} [%b %F{208}%a%F{green}] %F{208}%c%u%f'

# vcs prompt integration -- status symbols (slow on large repos)
zstyle ':vcs_info:*' stagedstr 's' 
zstyle ':vcs_info:*' unstagedstr 'n' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

precmd () { vcs_info }

# prompt formats
PS1='%B%F{cyan}%n@%m %% %b%F{white}'
RPS1='%B${vcs_info_msg_0_}%F{white}%2~%f%b'



#====================================================================
# Finalize

# enable completion
# TODO: Fix insecure directories. Currently those directories are ignored with -i
autoload -Uz compinit && compinit -i
