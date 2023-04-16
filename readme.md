# Easy install commands
```bash
sudo apt install -y curl
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply https://github.com/jpmossman/dotfiles.git
```

```bash
sudo apt install -y curl
sh -c "$(curl -fsLS https://raw.githubusercontent.com/jpmossman/dotfiles/main/docs/.easy-install.sh)"
```