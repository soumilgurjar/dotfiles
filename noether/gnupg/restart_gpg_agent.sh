#!/opt/homebrew/bin/zsh
gpgconf --kill -v gpg-agent
gpg-agent --pinentry-program=$(brew --prefix)/bin/pinentry-mac --daemon
