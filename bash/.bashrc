# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias hx='helix'

# git aliases
alias gs='git status'
alias tatus='git status --short'
alias gd='git diff'
alias ga='git add'
alias gap='git add --patch'
alias gc='git commit'
alias gp='git push'
alias gu='git pull'
alias gl='git log'
alias gb='git branch'
alias gi='git init'
alias gcl='git clone'

PS1='\u@\h \W $ '

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
