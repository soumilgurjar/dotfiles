# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

#To avoid brew python versions accidentally linking against a Pyenv-provided Python, we use a wrapper
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

#Euler login with SSH
alias eu="ssh sgurjar@euler.ethz.ch"
alias euy="ssh -Y sgurjar@euler.ethz.ch"
alias eux="ssh -X sgurjar@euler.ethz.ch"

# Add Euler Keychain
function eus() {
    /usr/bin/keychain $HOME/.ssh/id_ed25519_euler
    source $HOME/.keychain/Dell-G5-sh
}

# Source Config files
alias soz="clear && rm -f '$ZSH_COMPDUMP' && exec zsh"
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

function vvs() {
    nvim -d ~/.dotfiles/linux/$1 ~/.dotfiles/macOS/$1
}

#Terminal navigation
alias fs="du -sh"
alias l="ls -la"
alias la="ls -a"
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
alias buu="brew update && brew upgrade "
alias bun="brew uninstall"

# Neomutt related
alias nm="neomutt"
alias nme="neomutt -e 'source ~/.config/mutt/accounts/soumil.gurjar@sam.math.ethz.ch.muttrc' "
alias nmd="neomutt -e 'source ~/.config/mutt/accounts/soumil.gurjar@d-one.ai.muttrc' "
alias nms="~/.config/mutt/neomutt_startup.sh"

# ZMK related
# alias zmk="pyenv activate zmk_build && source ~/Git_Repositories/zmk-build/zephyr/zephyr-env.sh && cd ~/Github_Repositories/zmk-config"
# alias lily_left="west build -s /Users/sgurjar/Git_Repositories/zmk-build/app/ -d build/left -b nice_nano_v2 -- -DSHIELD=lily58_left -DZMK_CONFIG='/Users/sgurjar/Github_Repositories/zmk-config/config/' > build_left.log 2>&1"
# alias lily_right="west build -s /Users/sgurjar/Git_Repositories/zmk-build/app/ -d build/right -b nice_nano_v2 -- -DSHIELD=lily58_right -DZMK_CONFIG='/Users/sgurjar/Github_Repositories/zmk-config/config/' > build_right.log 2>&1"
# alias lily_flash_left="cp ~/Git_Repositories/zmk-config/build/left/zephyr/zmk.uf2 /Volumes/NICENANO"
# alias lily_flash_right="cp ~/Git_Repositories/zmk-config/build/right/zephyr/zmk.uf2 /Volumes/NICENANO"

# Git related
alias glog="git log --color --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gs="git status"
alias gst="git stash save "
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
function stow_adopt_test() { cd ~/.dotfiles/linux && stow --adopt -nvSt ~ $1 && cd - }
function stow_adopt() { cd ~/.dotfiles/linux && stow --adopt -vSt ~ $1 && cd - }
function stowth_test() { cd ~/.dotfiles/linux && stow -nvSt ~ $1 && cd - }
function stowth() { cd ~/.dotfiles/linux && stow -vSt ~ $1 && cd - }
function unstow_test() {  cd ~/.dotfiles/linux && stow -nvDt ~ $1 && cd - }
function unstow() {  cd ~/.dotfiles/linux && stow -vDt ~ $1 && cd - }

# Taskwarrior related
alias tt="taskwarrior-tui"

# Zathura related
# alias zathura="zathura --mode fullscreen"

#Commonly accessed directories
alias win="cd /mnt/c/Users/soumi/"

# Winget save app list
alias winget_all="winget list > ~/.dotfiles/windows/winget_apps_all.txt"
alias winget_export="winget export -o ./winget_apps.json"               # Need to run this from a powershell window

function winget { (cd /mnt/c; cmd.exe /c "winget $@";) }
