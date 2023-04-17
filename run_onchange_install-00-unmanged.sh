#!/usr/bin/bash
# Install items that are not managed by package managers
sudo apt update

# homebrew
# if ! brew --version ; then
#     NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#     echo "export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH" >> ~/.bashrc
# fi

# rust
if ! rustup --version ; then
    curl https://sh.rustup.rs -sSf | sh -s -- -q -y
fi

# oh-my-zsh
if ! [ -d ~/.oh-my-zsh ] ; then
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# oh-my-posh
if ! /usr/local/bin/oh-my-posh --version ; then
    sudo apt install -y wget
    sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
fi
