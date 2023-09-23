## DO NOT REMOVE OR CHANGE THE FOLLOWING LINE
[ -r /u/.defaults/bashrc ] && . /u/.defaults/bashrc
##
## The line above ensures you have all the standard system settings for the
## programs, like a usefull $PATH and the like. It also writes out the current
## D-MATH messages.
## 
## To customize the system according to your needs, change or add things below.
## Everything on a line after a "#" mark is a comment, thus the lines beginning
## with # will NOT be executed.
##
## If you have a 'bin' directory and use your own programs:
#export PATH=${HOME}/bin:${PATH}
#export PATH=/usr/local/bin:$PATH
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH" #This is to ensure that pyenv location is earlier in $PATH
export LANG=en_US.UTF-8

# Show current git branch in command line
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
## export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ ' 

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

#Bash history does not store duplicates and commands started with space are not stored in history
HISTCONTROL=ignorespace:erasedups

#Play nice with pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# To avoid brew python versions accidentally linking against a Pyenv-provided Python,
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

####Create some aliases####
#Python3 and pip3 alias
alias pip=/usr/local/bin/pip3
alias python=/usr/local/bin/python3

#Euler login with SSH
alias eu='ssh sgurjar@euler.ethz.ch'
alias euy='ssh -Y sgurjar@euler.ethz.ch'
alias eux='ssh -X sgurjar@euler.ethz.ch'

#Terminal navigation
alias ..='cd ..'
alias ...='cd ../../'
alias vib='vim ~/.bashrc'
alias sob='source ~/.bashrc'
alias vibp='vim ~/.bash_profile'
alias vi=vim
alias sobp='source ~/.bash_profile'
alias vivim='vim ~/.vimrc'
alias sovim='source ~/.vimrc'
alias fs='du -sh'
alias la='ls -a'
alias ls='clear; ls'
alias rm='rm -i'
alias gr='grep -r -n'
alias cl='clear'

#Commonly accessed directories
alias dlsc='cd ~/polybox/ETHZ_Material/Fall_2021/DeepLearningInScientificComputing/'
alias dlsc_env='source ~/VirtualEnvs/dlsc_env/bin/activate'
alias scr='cd /Users/sgurjar/Scratch_Bryant/'
alias of='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/'
alias matlab="/Applications/MATLAB_R2017b.app/bin/matlab -nojvm -nodesktop -nodisplay -nosplash"
alias cmea="cd /Users/sgurjar/polybox/ETHZ_Material/Correction_Winter2020/CMEA/"
alias sem="cd /Users/sgurjar/polybox/ETHZ_Material/Fall_2019"
alias gmsh="/Applications/Gmsh.app/Contents/MacOS/gmsh"
alias mmgs="/Applications/mmgs_debug"
alias cases='cd /Users/sgurjar/Scratch_Bryant/OpenFOAM_Cases/Useful_Euler_Cases/'

#When using g14 function, one needs to pass code_filename.cpp as 1st argument and executable_file_name as 2nd
g11(){ 
    g++ -std=gnu++11 -I/usr/local/include/eigen3/ $1 -o $2
}
#When using g14 function, one needs to pass code_filename.cpp as 1st argument and executable_file_name as 2nd
g14(){ 
    g++ -std=gnu++14 -I/usr/local/include/eigen3/ $1 -o $2
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
