#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Give commands colour
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Default prompt
PS1='[\u@\h \W]\$ '

# Remove duplicates from history
export HISTCONTROL=ignoredups

# User aliases
alias ll='ls -lah'
alias gits='git status'

# Rust env
. "$HOME/.cargo/env"

# Oh My Posh prompt theme (last line)
eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/perfect.toml)"