# Set colors for 'ls' command
eval `dircolors ~/Git_Repositories/dircolors-solarized/dircolors.256dark`
export TERM=xterm-256color        # for common 256 color terminals (e.g. gnome-terminal)
# Set editor to vim
export EDITOR=vim

# Path to your oh-my-zsh installation.
export ZSH="/home/soumilgurjar/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=62'
VIM_MODE_VICMD_KEY='jj'                 # This allows escape from insert to normal mode with 'jj'

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    themes
    web-search
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
    zsh-vim-mode                        # This vi-mode plugin keeps the push-line ^q functionality
    zsh-viexchange
    z
)

# Plugin preferences
# bindkey '^ ' autosuggest-accept # This sets the Ctrl+Space as the hotkey for acception the suggestions
MODE_CURSOR_VIINS="#ffff00 steady bar"
MODE_CURSOR_REPLACE="#ff0000 blinking block"
MODE_CURSOR_VICMD="#ffffff steady block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="#ffff00 steady block"
MODE_CURSOR_VLINE="#00ffff steady block"

source $ZSH/oh-my-zsh.sh


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For being able to view pdfs with zathura
export DISPLAY=127.0.0.1:0.0

# FZF configuration

# ripgrep configuration
