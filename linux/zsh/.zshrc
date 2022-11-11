# Set colors for 'ls' command
eval `dircolors ~/Git_Repositories/dircolors-solarized/dircolors.256dark`
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python" #Necessary for pipenv to respect pyenv local/global versions?
export PIPENV_DEFAULT_PYTHON_VERSION=$(pyenv which python)  #Necessary for pipenv to respect pyenv local/global versions
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/openssl@3/lib" #Necessary because openssl is not found otherwise
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openssl@3/include" #Necessary because openssl is not found otherwise
export BROWSER="/usr/bin/wslview"

[[ -n $TMUX ]] && export TERM="xterm-256color"

# Set editor to vim
export VISUAL="nvim"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# Path to your oh-my-zsh installation.
export ZSH="/home/soumilgurjar/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# OMZ auto-update behavior
zstyle ":omz:update" mode auto      # update automatically without asking
zstyle ":omz:update" frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=62"
VIM_MODE_VICMD_KEY="jj"                 # This allows escape from insert to normal mode with 'jj'

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    fzf-tab
    colored-man-pages
    themes
    web-search
    zsh-autosuggestions
    zsh-history-substring-search
    zsh-syntax-highlighting
    zsh-vim-mode                        # This vi-mode plugin keeps the push-line ^q functionality
    z
    fzf
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
# export DISPLAY=127.0.0.1:0.0

# FZF configuration
# One needs to run the '/usr/local/opt/fzf/install' script after brew install for shortcuts and ** to start working
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_COMPLETION_TRIGGER="'"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --smart-case"
export FZF_CTRL_T_COMMAND="rg --files --hidden --follow --smart-case"
export FZF_ALT_C_COMMAND="fd --type directory --follow --ignore --color=never . "
# export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window :nohidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_OPTS="-m --height 90% --layout=reverse --border --inline-info
--preview-window=:nohidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--bind 'ctrl-d:preview-page-down' --bind 'ctrl-u:preview-page-up' --bind '?:toggle-preview'
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

# fz / Alt-C - cd to selected directory
bindkey "ç" fzf-cd-widget                           # Allows use of Alt-C for directory search with fzf
fz() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
        -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}
# fh - search in your command history and execute selected command
fh() {
    eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# ripgrep configuration
export RIPGREP_CONFIG_PATH="$HOME/.ripgrep"

# Switch to vim for editing current command
bindkey '^x^x' edit-command-line

# Testing if this fixes gpg-agent issues on computer restart
GPG_TTY=$(tty)
export GPG_TTY

# Lesspipe
export LESS='-R --ignore-case --LONG-PROMPT --tabs=4 --window=-4'
if type /usr/local/bin/lesspipe.sh >/dev/null 2>&1; then
    export LESSOPEN="|/home/linuxbrew/.linuxbrew/bin/lesspipe.sh %s"
fi

# FZF-Tab configuration
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':fzf-tab:complete:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:*' fzf-preview '([[ -f $realpath ]] && [[ $realpath =~ ('.jpg'|'.JPG'|'.jpeg'|'.png'|'.PNG'|'.gif')$ ]] && (timg -clear -g60x30 --frames=1 $realpath)) || ([[ -f $realpath ]] && (bat --style=numbers --color=always $realpath || cat $realpath)) || ([[ -d $realpath ]] && (tree -L 1 --gitignore -C $realpath | less)) || echo $realpath 2> /dev/null | head -200'
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
# zstyle ':fzf-tab:complete:-command-:*' fzf-preview '(out=$(tldr --color always "$word") 2>/dev/null && echo $out) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out) || (out=$(which "$word") && echo $out) || echo "${(P)word}"'
zstyle ':fzf-tab:complete:*' fzf-pad 4
zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
zstyle ':fzf-tab:*' accept-line enter
zstyle ':fzf-tab:*' continuous-trigger 'space'
zstyle ':fzf-tab:*' switch-group ',' '.'
