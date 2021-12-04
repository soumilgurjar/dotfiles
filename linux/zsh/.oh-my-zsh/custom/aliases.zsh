# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias zshalias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias zshconfig="vim ~/.zshrc"
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
alias vib='vim ~/.bashrc'
alias sob='source ~/.bashrc'
alias vibp='vim ~/.bash_profile'
alias vi=vim
alias sobp='source ~/.bash_profile'
alias vivim='vim ~/.vimrc'
alias fs='du -sh'
alias la='ls -a'
alias ls='clear; ls'
alias rm='rm -i'
alias gr='grep -r -n'
alias cl='clear'

# Git related
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gs="git status"

#Commonly accessed directories

#Activate environments with alias

# Adds commits and pushes files with the argument as the commit message
function gacp() {
  git add .
  git commit -m "$1"
  git push
}
