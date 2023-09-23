# .bashrc

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# Bash history does not store duplicates and commands started with space are not stored in history
HISTCONTROL=ignorespace:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

#### Command Line Prompt - Show git branch and commit status

RESET=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)

PS1="${GREEN} ${CYAN}\W ${RESET}"

# Export environment variables
export EDITOR="$(which vi)"
export VIMINIT='source ~/.config/soumilgurjar/.vimrc'
export STARSHIP_CONFIG=~/.config/soumilgurjar/starship.toml

#### Vim related

# Set command line to vim mode
set -o vi

# Vim aliases
alias vi="vim"
alias vib="vi ~/.bashrc"
alias sob="source ~/.bashrc"
alias vibp="vi ~/.bash_profile"
alias sobp="source ~/.bash_profile"
alias viv="vi ~/.vimrc"
alias vit="vi ~/.tmux.conf"

function vvs() {
	vimdiff ~/Git_Repositories/dotfiles/server/$1 ~/Git_Repositories/dotfiles/noether/$1
}

#### Terminal navigation
alias fs="du -sh"
alias l="ls -lha --color=auto"
alias la="ls -a --color=auto"
alias ls="ls --color=auto"
alias lsh="ls --color=auto --hyperlink=auto"
alias rm="rm -ir"
alias rmf="rm -irf"
alias gr="grep -r -n"
alias cl="clear"

# Navigate Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#### Tmux related
alias tn="tmux new -As Server"
alias tnn="tmux new -As Test"
alias tds="tmux detach-client"
alias tpi="~/.tmux/plugins/tpm/bin/install_plugins"
alias tpu="~/.tmux/plugins/tpm/bin/update_plugins all"

#### Git related
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

function gcam() {
	git add .
	git commit -m "$1"
}
function gcap() {
	git add .
	git commit -m "$1"
	git push
}

eval "$(starship init bash)"
