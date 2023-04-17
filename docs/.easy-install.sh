#!/usr/bin/sh
sudo apt update
sudo apt install -y curl git gpg
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin init --apply https://github.com/jpmossman/dotfiles.git
