#!/usr/bin/env bash

echo "LÖVE - 2d game engine"
sudo add-apt-repository ppa:bartbes/love-stable
sudo apt update
sudo apt install love -y

# install fennel and readline via luarocks and bootstrap scripts
