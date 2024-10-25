#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Remove duplicates from history
export HISTCONTROL=ignoredups

# User aliases
alias ll='ls -lah'
alias gits='git status'

# Rust env
. "$HOME/.cargo/env"
