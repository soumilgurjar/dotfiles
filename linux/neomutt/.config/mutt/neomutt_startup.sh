#!/home/linuxbrew/.linuxbrew/bin/zsh
gpgconf --kill -v gpg-agent
gpg-agent --pinentry-program=$(brew --prefix)/bin/pinentry --daemon
# source ~/VirtualEnvs/neomutt_env/bin/activate
# neomutt
