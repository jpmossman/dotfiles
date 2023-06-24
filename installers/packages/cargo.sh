#!/usr/bin/sh
# Install rust crates

. $HOME/.cargo/env

# sccache helps with build times
cargo install sccache
cargo install bat
cargo install exa
cargo install fd-find
cargo install sd
