#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nodejs
# Added by VSM
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
cd $HOME
if [ -d ./startup-dotfiles/ ]; then
    mv startup-dotfiles startup-dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/mullachv/startup-dotfiles.git
ln -sb startup-dotfiles/.screenrc .
ln -sb startup-dotfiles/.bash_profile .
ln -sb startup-dotfiles/.bashrc .
ln -sb startup-dotfiles/.bashrc_custom .
ln -sf startup-dotfiles/.emacs.d .

###
git config --global user.name "Vikram Mullachery"
git config --global user.email mullachv@gmail.com

### Install heroku toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
