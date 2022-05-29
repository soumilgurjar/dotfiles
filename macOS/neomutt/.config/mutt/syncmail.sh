#!/usr/local/bin/zsh
PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Are we in tmux?
if [ -z "${TMUX}" ]; then

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
