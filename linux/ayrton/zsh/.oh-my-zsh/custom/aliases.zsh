# Example aliases
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

# Source Config files
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

function vidl() {
    nvim -d ~/Git_Repositories/dotfiles/linux/ayrton/$1 ~/Git_Repositories/dotfiles/linux/wsl/$1
}

function vid() {
    nvim -d ~/Git_Repositories/dotfiles/linux/ayrton/$1 ~/Git_Repositories/dotfiles/macOS/noether/$1
}


#Terminal navigation
alias fs="du -sh"
alias l="ls -lha"
alias la="ls -a"
alias ls="eza -x --icons --group-directories-first"
alias lsh="ls --hyperlink"
alias ils="timg --grid=4x1 --center --upscale -F"
alias cpwd="pwd | xclip"
alias rm="rm -ir"
alias rmf="rm -irf"
alias gr="grep -r -n"
alias rgf="rg --files-with-matches"             #Return files which have query in them
alias cat='bat --plain --italic-text always'

# Pacman search and install commands
alias ps="sudo pacman -Ss"
alias pi="sudo pacman -S"
alias pl="sudo pacman -Q | grep"
alias ple="sudo pacman -Qe | grep"
alias pu="sudo pacman -Syu"
alias pr="sudo pacman -Rsu"

# Yay search and install commands
alias ys="yay -Ss"
alias yi="yay -S"
alias yl="yay -Q | grep"
alias yle="yay -Qe | grep"
alias yu="yay -Syu"
alias yr="yay -Rsu"

# Git related
alias glog="git log --color --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit --branches -5"
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
alias gri="git rebase -i"

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
function stow_adopt_test() { cd ~/Git_Repositories/dotfiles/linux/ayrton && stow --adopt -nvSt ~ $1 && cd - }
function stow_adopt() { cd ~/Git_Repositories/dotfiles/linux/ayrton && stow --adopt -vSt ~ $1 && cd - }
function stowth_test() { cd ~/Git_Repositories/dotfiles/linux/ayrton && stow -nvSt ~ $1 && cd - }
function stowth() { cd ~/Git_Repositories/dotfiles/linux/ayrton && stow -vSt ~ $1 && cd - }
function unstow_test() { cd ~/Git_Repositories/dotfiles/linux/ayrton && stow -nvDt ~ $1 && cd - }
function unstow() { cd ~/Git_Repositories/dotfiles/linux/ayrton && stow -vDt ~ $1 && cd - }

#Commonly accessed directories
alias win="cd /mnt/win/Users/soumi/"

# Aliases for kitty related commands
alias rgh="kitty +kitten hyperlinked_grep" # Return files which have query in them
alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
alias kdiff="kitty +kitten diff"
alias kcopy="kitty +kitten clipboard"
