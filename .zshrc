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

bindkey -v                              # vim mode
bindkey "^?" backward-delete-char       # have insert mode backspace behave as expected

# stop _z_precmd:1: nice(5) failed error messages in the Windows Subsystem for Linux
case $(uname -a) in
   *Microsoft*) unsetopt BG_NICE ;;
esac



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
bindkey -M vicmd 'k' down-line-or-search    # same for vim mode
bindkey -M vicmd 'j' up-line-or-search      # same for vim mode



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

# don't complete uninteresting users (courtesy of oh-my-zsh)
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

# load homebrew completions
if [[ -x "$(command -v brew)" ]]; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# NOTE: compinit is called at end of this file, as you don't want to call it more than once



#====================================================================
# Zinit Plugin Manager

# auto-install if not on system
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# load the plugin manager
# this will download any missing plugins
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node



#====================================================================
# Plugins and compinit

# moving around directories
# % z DIRNAME
zinit light agkozak/zsh-z

# one command to extract archive files
# % extract FILENAME
zinit light le0me55i/zsh-extract

# add additional completions
zinit light zsh-users/zsh-completions

# use fzf for completion
# note that fzf-tab needs to be loaded after compinit,
# but before plugins that wrap widgets like zsh-autosuggestions
if [[ -x "$(command -v fzf)" ]]; then
  zinit load Aloxaf/fzf-tab
else
  echo "WARNING: fzf not found in path"
fi

# run compinit
# ignore insecure directories if on my laptop with non admin account
autoload -Uz compinit
if [[ $(whoami) = "ian" ]] && [[ $(uname -s) = "Darwin" ]]; then
  compinit -i
else
  compinit
fi

# show history matches when typing
# must be loaded after fzf
zinit load zsh-users/zsh-autosuggestions

# search history for substrings
# note we switch above keybindings to those specific to plugin
# must be loaded after fzf
zinit load zsh-users/zsh-history-substring-search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
