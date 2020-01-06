#!/bin/sh

# Install Node.js on Archlinux
pacman -Sqy --noconfirm gcc make python2 nodejs npm jq | cat
ln -s /usr/bin/python2 /usr/bin/python
