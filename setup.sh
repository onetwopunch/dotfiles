#!/usr/bin/bash

# Install essentials
sudo apt install -y i3 i3blocks vim-gtx tmux xclip silversearcher-ag net-tools nmap autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev xrandr git

# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build


# Install pip
sudo apt install -y python-setuptools python-dev build-essential
sudo easy_install pip
sudo pip install --upgrade virtualenv

# Install i3 blocks
git clone git://github.com/vivien/i3blocks
cd i3blocks
make clean debug # or make clean all
sudo make install
cd ..

# Create workspace
mkdir ~/Workspace 
mkdir -p ~/.config

# Install Powerline
sudo apt install -y powerline
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
curl -L -o ~/.fonts/PowerlineSymbols.otf https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
curl -L -o ~/.config/fontconfig/conf.d/10-powerline-symbols.conf \
  https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
fc-cache -vf ~/.fonts

# Install git prompt
curl -L -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# Copy configuration files
cp -R Scripts ~/
cp -R .vim ~/
cp -R .i3 ~/
cp .i3blocks.conf ~/
cp .vimrc	~/
cp powerline ~/.config/
cp .tmux.conf ~/
cp .bashrc ~/
