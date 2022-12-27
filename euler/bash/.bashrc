# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Load inputrc
bind -f ~/.inputrc

# User specific aliases and functions
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

## Better prompt with git branch and commit status
RESET=$(tput sgr0)
GREY=$(tput setaf 244)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)

git_prompt() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/\1/')

  if [ ! -z $BRANCH ]; then
    echo -n "${YELLOW}($BRANCH )"

    if [ ! -z "$(git status --short)" ]; then
      echo " ${RED}✗"
    else
      echo " ${GREEN}✓"
    fi
  fi
}
PS1="${GREEN} ${CYAN}\W $(git_prompt) ${RESET}"

#Bash history does not store duplicates and commands started with space are not stored in history
HISTCONTROL=ignorespace:erasedups

# Set editor to vim
export EDITOR="$(which vim)"
# Set command line to vim mode
set -o vi

#Vim related
alias vi="vim"
alias vib="vim ~/.bashrc"
alias sob="source ~/.bashrc"
alias vibp="vim ~/.bash_profile"
alias sobp="source ~/.bash_profile"
alias viv="vim ~/.vimrc"
alias vsc="vim -S ~/.vim/sessions/configuration-files.vim"
alias vjo="vim -S job.vim"
alias vit="vim ~/.tmux.conf"

function vvs() {
    vimdiff ~/Git_Repositories/dotfiles/euler/$1 ~/Git_Repositories/dotfiles/macOS/$1
}

# Terminal navigation
alias fs="du -sh"
alias l="ls -la --color=auto"
alias la="ls -a --color=auto"
alias ls="ls --color=auto"
alias rm="rm -ir"
alias rmf="rm -irf"
alias gr="grep -r -n"
alias cl="clear"

# Euler related
alias ms="module spider"
alias mli="module list"
alias mlo="module load"

# Tmux related
alias tn="tmux new -As Euler"
alias tnn="tmux new -As Test"
alias tds="tmux detach-client"
alias tpi="~/.tmux/plugins/tpm/bin/install_plugins"
alias tpu="~/.tmux/plugins/tpm/bin/update_plugins all"

# Git related
alias glog="git log --color --graph --pretty=format:'%C(yellow)%h%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gs="git status"
alias gst="git stash save "
alias gco="git checkout"
alias gaa="git add ."
alias ga="git add"
alias gap="git add -p"
alias gcm="git commit -m"

function gcam() {
  git add .
  git commit -m "$1"
}
function gcap() {
  git add .
  git commit -m "$1"
  git push
}

# Navigate Directories
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias scr="cd $SCRATCH/"

# Euler specific commands

# Old job manager commands
# alias bs="bjobs -w"
# alias bsj="bsub < job.sh"
# alias bsfte="bsub < job_foamToEnsight.sh"
# alias bp="bpeek -f"
# alias qs="quota -s"
# alias tfo="tail -f out.log"
# alias vio="vi slurm-*.out"

# New slurm job manager commands
alias ss="squeue"
alias sjo="sbatch job.sh"
alias sfte="sbatch job_foamToEnsight.sh"
alias sjj="myjobs -j"
alias qs="quota -s"
alias tfo="tail -f out*.log"
alias vio="vi out*.log"

# Openfoam specific commands
alias dir="cd $FOAM_RUN/2D_Cases"
alias tutl="cd $FOAM_RUN/tutorials/"
alias solv="cd $FOAM_RUN/../applications/solvers/"

# Matlab related
alias matlab="matlab -nojvm -nodesktop -nodisplay -nosplash"

# Load Modules
alias paraview="paraview --mesa"

# Source Openfoam-com files: Needed only for openfoam-com/v1806 and v1906 modules
source $OPENFOAM_COM_ROOT/etc/bashrc
