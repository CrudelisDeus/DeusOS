#
# ~/.bashrc
#

export EDITOR=vim
export VISUAL=vim

alias ls='eza -lah --icons --group-directories-first --time-style=long-iso'
alias cat='bat' 
alias top='btop'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# exec
# fastfetch
