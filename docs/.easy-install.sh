#!/usr/bin/sh
sudo apt update
sudo apt install -y curl git gpg
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init --apply https://github.com/jpmossman/dotfiles.git
