#!/usr/local/bin/zsh
PATH="/Users/sgurjar/.pyenv/shims:/Users/sgurjar/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/munki:/opt/local/bin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/kitty.app/Contents/MacOS:/usr/local/opt/fzf/bin"

# Are we in kitty?
if [[ $TERM = "xterm-kitty" ]]; then
  # Did we pass in an account?
  if [ -z "${1}" ]; then
    ####################################################
    # The -d flag tells tmux to create the new window,
    # but not switch focus to it
    ####################################################

    kitty @ launch --type=tab --tab-title "fetching mail..." --copy-env --keep-focus mw -Y > ~/.config/mutt/mailsync.log
  else
    kitty @ launch --type=tab --tab-title "fetching mail..." --copy-env --keep-focus mw -y "$1" > ~/.config/mutt/mailsync.log
  fi
  notmuch new 2>/dev/null

# Are we in tmux?
elif [ -z "${TMUX}" ]; then

  # Did we pass in an account?
  if [ -z "${1}" ]; then
    mw -Y
  else
    mw -y "$1"
  fi
  notmuch new 2>/dev/null

else
  # Did we pass in an account?
  if [ -z "${1}" ]; then
    ####################################################
    # The -d flag tells tmux to create the new window,
    # but not switch focus to it
    ####################################################

    tmux new-window -d -n "fetching mail..." mw -Y
  else
    tmux new-window -d -n "fetching mail..." mw -y "$1"
  fi
  notmuch new 2>/dev/null

fi
