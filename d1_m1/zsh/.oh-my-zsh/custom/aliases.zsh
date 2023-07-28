# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

# To avoid brew python versions accidentally linking against a Pyenv-provided Python, we use a wrapper
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# Source Config files
# alias soza="kitty @ send-text --all soz\n" # TODO: Escape <CR> or \n properly
alias soz="clear && rm -f '$ZSH_COMPDUMP' && exec zsh"
alias sow="source ~/.zshrc"
alias sob="source ~/.bashrc"
alias sobp="source ~/.bash_profile"
alias sot="tmux source-file ~/.tmux.conf"

# Nvim related
alias vi="nvim"
alias viz="nvim ~/.zshrc"
alias via="nvim ~/.oh-my-zsh/custom/aliases.zsh"
alias vib="nvim ~/.bashrc"
alias vibp="nvim ~/.bash_profile"
alias viv="nvim ~/.vimrc"
alias vit="nvim ~/.tmux.conf"
alias viw="nvim ~/Dropbox/Apps/vimwiki/index.md"

function vidl() {
    nvim -d ~/.dotfiles/d1_m1/$1 ~/.dotfiles/linux/$1
}

function vid() {
    nvim -d ~/.dotfiles/d1_m1/$1 ~/.dotfiles/macOS/$1
}

#Terminal navigation
alias fs="du -sh"
alias lso="/bin/ls"
alias l="ls -lha"
alias la="ls -a"
alias ls="exa -x --icons --group-directories-first"
alias ils="timg --grid=4x1 -U -F --center"
alias cpwd="pwd | pbcopy"
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
alias bcl="brew cleanup"
alias bi="brew install"
alias bic="brew install --cask --no-quarantine"
alias bric="brew reinstall --cask --no-quarantine"
alias boc="brew outdated --cask --greedy --verbose"
alias bl="brew list"
alias buu="brew update && brew upgrade --greedy --verbose --no-quarantine"
alias buc="brew upgrade --cask --greedy --verbose --no-quarantine"
alias bun="brew uninstall"

# Neomutt related
alias nm="neomutt"
alias nme="neomutt -e 'source $HOME/.config/mutt/accounts/soumil.gurjar@sam.math.ethz.ch.muttrc' "
alias nmd="neomutt -e 'source $HOME/.config/mutt/accounts/soumil.gurjar@d-one.ai.muttrc' "
alias nms="~/.config/mutt/neomutt_startup.sh"

# Git related
alias glog="git log --color --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit --branches -15"
alias gs="git status"
alias gss="git stash save "
alias gsp="git stash pop"
alias gsw="git switch "
alias gco="git checkout"
alias gaa="git add ."
alias ga="git add"
alias gap="git add -p"
alias gcm="git commit -m"
alias gd="git df"
alias grt='cd "$(git rev-parse --show-toplevel)"'

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
function stow_adopt_test() { cd ~/.dotfiles/d1_m1 && stow --adopt -nvSt ~ $1 && cd - }
function stow_adopt() { cd ~/.dotfiles/d1_m1 && stow --adopt -vSt ~ $1 && cd - }
function stowth_test() { cd ~/.dotfiles/d1_m1 && stow -nvSt ~ $1 && cd - }
function stowth() { cd ~/.dotfiles/d1_m1 && stow -vSt ~ $1 && cd - }
function unstow_test() {  cd ~/.dotfiles/d1_m1 && stow -nvDt ~ $1 && cd - }
function unstow() {  cd ~/.dotfiles/d1_m1 && stow -vDt ~ $1 && cd - }

# Taskwarrior related
alias tt="taskwarrior-tui"

# Aliases for scripts
alias termpdf="~/Git_Repositories/termpdf.py/termpdf.py $1"
alias birdnet_backup="~/.dotfiles/macOS/birdnet/birdnet-pi_backup.sh"

# Aliases for kitty related commands
alias savekitty="~/.config/kitty/session_save.sh"
alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
