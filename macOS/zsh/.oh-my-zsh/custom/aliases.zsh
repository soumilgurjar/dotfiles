# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias zalias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias zconfig="vim ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias reload="source ~/.zshrc"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

#To avoid brew python versions accidentally linking against a Pyenv-provided Python, we use a wrapper
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

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
alias la='ls -a'
alias ls='clear; ls'
alias rm='rm -i'
alias gr='grep -r -n'
alias cl='clear'

# Git related
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias gs="git status"
alias gco="git checkout"

# Change terminal profile and looks
alias man_page="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_man_page.scpt"
alias novel="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_novel.scpt"
alias novel_large="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_novel_largeFont.scpt"
alias light="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_solarized_light.scpt"
alias dark="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_solarized_dark.scpt"
alias dark_large="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_solarized_dark_largeFont.scpt"
alias light_large="osascript ~/.dotfiles/macOS/terminal_profile_scripts/terminal_profile_solarized_light_largeFont.scpt"

#Commonly accessed directories
alias dlsc='cd ~/polybox/ETHZ_Material/Fall_2021/DeepLearningInScientificComputing/'
alias scr='cd /Users/sgurjar/Scratch_Bryant/'
alias of='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/'
alias matlab="/Applications/MATLAB_R2021a.app/bin/matlab -nojvm -nodesktop -nodisplay -nosplash"
alias sem="cd /Users/sgurjar/polybox/ETHZ_Material/Spring_2022"
alias gmsh="/Applications/Gmsh.app/Contents/MacOS/gmsh"
alias mmgs="/Applications/mmgs_debug"
alias cases='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/Useful_Euler_Cases/'
alias plover='/Applications/Plover.app/Contents/MacOS/Plover'

# Activate environments with alias
alias dlsc_env='source ~/VirtualEnvs/dlsc_env/bin/activate'
alias vogelwarte_env='source ~/Git_Repositories/vogelwarte/vogelwarte-env/bin/activate'

# Brew search and install commands
alias bs="brew search"
alias bi="brew install"
alias bic="brew install --cask"
alias bl="brew list"
alias bu="brew upgrade && brew update"
alias bun="brew uninstall"

# TMUX plugin install and update
alias tpi="~/.tmux/plugins/tpm/bin/install_plugins"
alias tpu="~/.tmux/plugins/tpm/bin/update_plugins all"

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
