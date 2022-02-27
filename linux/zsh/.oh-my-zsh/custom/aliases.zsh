# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias zalias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias zconfig="vim ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias reload="source ~/.zshrc"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

#Python3 and pip3 alias
# alias pip=/usr/local/bin/pip3
# alias python=/usr/local/bin/python3

#Euler login with SSH
alias eu='ssh sgurjar@euler.ethz.ch'
alias euy='ssh -Y sgurjar@euler.ethz.ch'
alias eux='ssh -X sgurjar@euler.ethz.ch'

#Terminal navigation
alias vi=vim
alias vib='vim ~/.bashrc'
alias sob='source ~/.bashrc'
alias vibp='vim ~/.bash_profile'
alias sobp='source ~/.bash_profile'
alias vivim='vim ~/.vimrc'
alias fs='du -sh'
alias ls='clear; ls --color'
alias la='ls -a'
alias rm='rm -i'
alias gr='grep -r -n'
alias cl='clear'

# Git related
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gs="git status"
alias gaa="git add ."
alias ga="git add"
alias gcm="git commit -m"

# Stow related
function stowth_test() {
    stow -nvSt ~ $1
}
function stowth() {
    stow -vSt ~ $1
}
function unstow_test() {
    stow -nvDt ~ $1
}
function unstow() {
    stow -vDt ~ $1
}


#Commonly accessed directories
alias win='cd /mnt/c/Users/soumi/'

#Simple utility commands

#Activate environments with alias

# Adds commits and pushes files with the argument as the commit message
function gcam() {
  git add .
  git commit -m "$1"
}
# Adds commits and pushes files with the argument as the commit message
function gcap() {
  git add .
  git commit -m "$1"
  git push
}
