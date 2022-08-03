#!/home/linuxbrew/.linuxbrew/bin/zsh
PATH="/home/soumilgurjar/.nvm/versions/node/v16.14.0/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/dotnet/:/mnt/c/Program Files/MATLAB/R2021a/bin:/mnt/c/Program Files/usbipd-win/:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/PuTTY/:/mnt/c/Program Files (x86)/gsudo/:/mnt/c/Program Files/GitHub CLI/:/mnt/c/Users/soumi/anaconda3:/mnt/c/Users/soumi/anaconda3/Library/mingw-w64/bin:/mnt/c/Users/soumi/anaconda3/Library/usr/bin:/mnt/c/Users/soumi/anaconda3/Library/bin:/mnt/c/Users/soumi/anaconda3/Scripts:/mnt/c/Users/soumi/AppData/Local/Programs/Python/Python310/Scripts/:/mnt/c/Users/soumi/AppData/Local/Programs/Python/Python310/:/mnt/c/Users/soumi/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/soumi/AppData/Local/GitHubDesktop/bin:/mnt/c/Users/soumi/AppData/Local/Programs/Microsoft VS Code/bin:/home/linuxbrew/.linuxbrew/opt/fzf/bin"

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
