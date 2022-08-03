# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

#Python3 and pip3 alias
# alias pip=/usr/local/bin/pip3
# alias python=/usr/local/bin/python3

#Euler login with SSH
alias eu="ssh sgurjar@euler.ethz.ch"
alias euy="ssh -Y sgurjar@euler.ethz.ch"
alias eux="ssh -X sgurjar@euler.ethz.ch"

# Add Euler Keychain
function eus() {
    /usr/bin/keychain $HOME/.ssh/id_ed25519_euler
    source $HOME/.keychain/Dell-G5-sh
}

# Open and Source Config files
alias viz="vim ~/.zshrc"
alias via="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias vib="vim ~/.bashrc"
alias vibp="vim ~/.bash_profile"
alias viv="vim ~/.vimrc"
alias vit="vim ~/.tmux.conf"
alias viw="vim /mnt/c/Users/soumi/Dropbox/Apps/vimwiki/index.md"
alias vsc="vim -S ~/.vim/sessions/configurations-session.vim"
alias vsn="vim -S ~/.vim/sessions/neomutt-session.vim"
alias vsnp="vim -S ~/.vim/sessions/neomutt-powerline-session.vim"
alias vsw="vim -S ~/.vim/sessions/vimwiki-session.vim"
alias vscl="vim -S ~/.vim/sessions/cover-letter-jobsearch.vim"
alias vscv="vim -S ~/.vim/sessions/cv-jobsearch.vim"
alias soz="source ~/.zshrc"
alias sob="source ~/.bashrc"
alias sobp="source ~/.bash_profile"
alias sot="tmux source-file ~/.tmux.conf"

#Terminal navigation
alias vi="vim"
alias fs="du -sh"
alias ls="clear; ls --color"
alias la="ls -la"
alias cpwd="pwd | clip.exe"
alias rm="rm -ir"
alias rmf="rm -irf"
alias gr="grep -r -n"
alias rgf="rg --files-with-matches"             #Return files which have query in them
alias cat='bat'

# Tmux related
alias tn="tmux new -As Local"
alias tnn="tmux new -As Test"
alias tds="tmux detach-client"
alias tpi="~/.tmux/plugins/tpm/bin/install_plugins"
alias tpu="~/.tmux/plugins/tpm/bin/update_plugins all"

# Brew search and install commands
alias bs="brew search"
alias bi="brew install"
alias bic="brew install --cask"
alias bl="brew list"
alias buu="brew upgrade && brew update "
alias bun="brew uninstall"

# Neomutt related
alias nm="neomutt"
alias nme="neomutt -e 'source /Users/sgurjar/.config/mutt/accounts/soumil.gurjar@sam.math.ethz.ch.muttrc' "
# Git related
alias glog="git log --color --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gs="git status"
alias gst="git stash save "
alias gco="git checkout"
alias gaa="git add ."
alias ga="git add"
alias gap="git add -p"
alias gcm="git commit -m"

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

# Stow related
function stow_adopt_test() { stow --adopt -nvSt ~ $1 }
function stow_adopt() { stow --adopt -vSt ~ $1 }
function stowth_test() { stow -nvSt ~ $1 }
function stowth() { stow -vSt ~ $1 }
function unstow_test() { stow -nvDt ~ $1 }
function unstow() { stow -vDt ~ $1 }

# Taskwarrior related
alias tt="taskwarrior-tui"

#Commonly accessed directories
alias win="cd /mnt/c/Users/soumi/"

# Winget save app list
alias winget_all="winget list > ~/.dotfiles/windows/winget_apps_all.txt"
alias winget_export="winget export -o ./winget_apps.json"               # Need to run this from a powershell window


function winget { (cd /mnt/c; cmd.exe /c "winget $@";) }

