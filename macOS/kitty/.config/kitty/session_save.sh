#!/usr/local/bin/zsh
kitty @ ls >~/.config/kitty/sessions/kitty-session.json
# python3 ~/.config/kitty/session_save.py
python3 ~/Git_Repositories/kitty-save-session/kitty-convert-dump.py <~/.config/kitty/sessions/kitty-session.json >~/.config/kitty/sessions/session.conf
