#!/usr/bin/bash
# Install items that are not managed by package managers

# homebrew
if ! brew --version ; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# rust
if ! rustup --version ; then
    curl https://sh.rustup.rs -sSf | sh -s -- --help -q -y
fi

# oh-my-zsh
if ! [ -d ~/.oh-my-zsh ] ; then
    sudo apt update -y && sudo apt install -y zsh git
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
