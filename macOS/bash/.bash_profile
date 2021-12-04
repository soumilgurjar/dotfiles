source ~/.bashrc

export PATH=/usr/local/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$PATH:/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin

alias man_page="osascript ~/Documents/terminal_profile_scripts/terminal_profile_man_page.scpt"
alias novel="osascript ~/Documents/terminal_profile_scripts/terminal_profile_novel.scpt"
alias novel_large="osascript ~/Documents/terminal_profile_scripts/terminal_profile_novel_largeFont.scpt"
alias light="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_light.scpt"
alias dark="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_dark.scpt"
alias dark_large="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_dark_largeFont.scpt"
alias light_large="osascript ~/Documents/terminal_profile_scripts/terminal_profile_solarized_light_largeFont.scpt"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Added following lines due to openssl issue from 'brew info openssl'
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"