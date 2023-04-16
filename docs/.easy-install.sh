#!/usr/bin/sh
sudo apt update
sudo apt install -y curl git gpg
sh -c "$(curl -fsLS get.chezmoi.io)"
./bin/chezmoi init https://github.com/jpmossman/dotfiles.git
