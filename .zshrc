# Enable completions
autoload -Uz compinit && compinit


# Shortcuts
alias ..='cd ..'
alias ...='cd ../..'

alias ls="ls -alhG"
alias c="clear"
alias h="history"
alias s="subl -a"
alias zshrc="subl -a $HOME/.zshrc"

alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

alias reloadcli="source $HOME/.zshrc"


# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias k="cd $HOME/Kitchen"
alias v="cd $HOME/Vault"


# Git
#alias commit="git add . && git commit -m"
#alias gcommit="git add . && git commit"
#alias amend="git commit --amend --no-edit"
#alias amendall="git add . && amend"
#alias wip="commit wip"
#alias gst="git status"
#alias gb="git branch"
#alias gc="git checkout"
#alias gd="git diff"
#alias resolve="git add . && git commit --no-edit"
#alias gl="git log --oneline --decorate --color"
#alias nuke="git clean -df && git reset --hard"