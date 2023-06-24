#!/usr/bin/sh
# Install rust crates

. $HOME/.cargo/env

# sccache helps with build times
cargo install cargo-binstall
cargo binstall -y sccache
cargo binstall -y bat
cargo binstall -y exa
cargo binstall -y fd-find
cargo binstall -y sd
cargo binstall -y bob-nvim
bob use latest
