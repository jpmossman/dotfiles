#!/usr/bin/sh
sudo apt update
sudo apt install -y curl git python3
git clone https://github.com/jpmossman/dotfiles.git ./.dotfiles
python3 ./.dotfiles/dotmanager.py --copy-missing --ask-different
