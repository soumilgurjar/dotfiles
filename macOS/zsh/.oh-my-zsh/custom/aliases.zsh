# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias ohmyzsh="cd ~/.oh-my-zsh/custom/plugins/"
alias switch_zsh="chsh -s $(which zsh)"
alias switch_bash="chsh -s $(which bash)"

#To avoid brew python versions accidentally linking against a Pyenv-provided Python, we use a wrapper
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

#Python3 and pip3 alias
# alias pip=/usr/local/bin/pip3
# alias python=/usr/local/bin/python3

#Euler login with SSH
alias eu="ssh sgurjar@euler.ethz.ch"
alias euy="ssh -Y sgurjar@euler.ethz.ch"
alias eux="ssh -X sgurjar@euler.ethz.ch"

# Open and Source Config files
alias viz="vim ~/.zshrc"
alias via="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias vib="vim ~/.bashrc"
alias vibp="vim ~/.bash_profile"
alias viv="vim ~/.vimrc"
alias vit="vim ~/.tmux.conf"
alias viw="vim ~/Dropbox/Apps/vimwiki/index.md"
alias vsc="vim -S ~/.vim/sessions/configurations-session.vim"
alias vsn="vim -S ~/.vim/sessions/neomutt-session.vim"
alias vsnp="vim -S ~/.vim/sessions/neomutt-powerline-session.vim"
alias vsw="vim -S ~/.vim/sessions/vimwiki-session.vim"
alias vsk="vim -S ~/.vim/sessions/kitty-config.vim"
alias vscl="vim -S ~/.vim/sessions/cover-letter-jobsearch.vim"
alias vscv="vim -S ~/.vim/sessions/cv-jobsearch.vim"
alias soz="source ~/.zshrc"
alias sob="source ~/.bashrc"
alias sobp="source ~/.bash_profile"
alias sot="tmux source-file ~/.tmux.conf"

#Terminal navigation
alias fs="du -sh"
alias la="ls -la"
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
alias bi="brew install"
alias bic="brew install --cask"
alias bl="brew list"
alias buu="brew upgrade && brew update "
alias bun="brew uninstall"

# Neomutt related
alias nm="neomutt"
alias nme="neomutt -e 'source /Users/sgurjar/.config/mutt/accounts/soumil.gurjar@sam.math.ethz.ch.muttrc' "
alias nms="~/.config/mutt/neomutt_startup.sh"
alias nmenv="source ~/VirtualEnvs/neomutt_env/bin/activate && neomutt -e 'source /Users/sgurjar/.config/mutt/accounts/soumilgurjar@gmail.com.muttrc' "
alias nmeenv="source ~/VirtualEnvs/neomutt_env/bin/activate && neomutt -e 'source /Users/sgurjar/.config/mutt/accounts/soumil.gurjar@sam.math.ethz.ch.muttrc' "

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

# Open directory in finder
# function pfd() {
    # osascript 2>/dev/null <<EOF
#         tell application "Finder"
#            return POSIX path of (target of window 1 as alias)
#         end tell
#     EOF
# }

# function cdf() {
#     cd "$(pfd)"
# }

# Aliases for github scripts
alias termpdf="~/Github_Repositories/termpdf.py/termpdf.py $1"
alias mpv_server="~/Github_Repositories/play-with-mpv/play_with_mpv.py $1"

# Aliases for kitty related commands
alias icat="kitty +kitten icat"

#Commonly accessed directories
alias dlsc='cd ~/polybox/ETHZ_Material/Fall_2021/DeepLearningInScientificComputing/'
alias scr='cd /Users/sgurjar/Scratch_Bryant/'
alias of='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/'
alias matlab="/Applications/MATLAB_R2021a.app/bin/matlab -nojvm -nodesktop -nodisplay -nosplash"
alias thesis="/Users/sgurjar/Dropbox/Apps/Overleaf/Doctoral Thesis - Soumil"
alias wiki="/Users/sgurjar/Dropbox/Apps/vimwiki"
alias sem="cd /Users/sgurjar/polybox/ETHZ_Material/Spring_2022"
alias gmsh="/Applications/Gmsh.app/Contents/MacOS/gmsh"
alias mmgs="/Applications/mmgs_debug"
alias cases='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/Useful_Euler_Cases/'
alias plover='/Applications/Plover.app/Contents/MacOS/Plover'

# Activate environments with alias
alias neomutt_env='source ~/VirtualEnvs/neomutt_env/bin/activate'
alias dlsc_env='source ~/VirtualEnvs/dlsc_env/bin/activate'
alias vogelwarte_env='source ~/Git_Repositories/vogelwarte/vogelwarte-env/bin/activate'
