# This file should be added to ~/.oh-my-zsh/custom/ directory
# Example aliases
alias zshalias="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
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

# Change terminal profile and looks
alias man_page="osascript ~/Documents/terminal_profile_scripts/terminal_profile_man_page.scpt"
alias novel="osascript ~/Documents/terminal_profile_scripts/terminal_profile_novel.scpt"
alias novel_large="osascript ~/Documents/terminal_profile_scripts/terminal_profile_novel_largeFont.scpt"
alias light="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_light.scpt"
alias dark="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_dark.scpt"
alias dark_large="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_dark_largeFont.scpt"
alias light_large="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_light_largeFont.scpt"

#Commonly accessed directories
alias dlsc='cd ~/polybox/ETHZ_Material/Fall_2021/DeepLearningInScientificComputing/'
alias scr='cd /Users/sgurjar/Scratch_Bryant/'
alias of='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/'
alias matlab="/Applications/MATLAB_R2017b.app/bin/matlab -nojvm -nodesktop -nodisplay -nosplash"
alias cmea="cd /Users/sgurjar/polybox/ETHZ_Material/Correction_Winter2020/CMEA/"
alias sem="cd /Users/sgurjar/polybox/ETHZ_Material/Fall_2019"
alias gmsh="/Applications/Gmsh.app/Contents/MacOS/gmsh"
alias mmgs="/Applications/mmgs_debug"
alias cases='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/Useful_Euler_Cases/'

#Activate environments with alias
alias dlsc_env='source ~/VirtualEnvs/dlsc_env/bin/activate'
alias vogelwarte_env='source ~/Git_Repositories/vogelwarte/vogelwarte-env/bin/activate'


# Adds commits and pushes files with the argument as the commit message
function gacp() {
  git add .
  git commit -m "$1"
  git push
}
