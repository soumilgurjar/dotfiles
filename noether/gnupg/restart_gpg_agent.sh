#!/opt/homebrew/bin/zsh
gpgconf --kill -v gpg-agent
gpg-agent --pinentry-program=$(brew --prefix)/opt/pinentry-touchid/bin/pinentry-touchid --daemon
