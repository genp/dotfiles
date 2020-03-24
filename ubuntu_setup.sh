#!/bin/sh

# Switch to ZSH
sudo apt install zsh
sudo chsh -s $(which zsh) ubuntu

# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo 'export ZSH_THEME="robbyrussell"' >> ~/.zshrc
echo 'export DISABLE_UPDATE_PROMPT=true' >> ~/.zshrc
echo 'plugins=(
  cp
  git
  colored-man-pages
  ssh-agent
  web-search
  tmux
  tmuxinator
  pip
  python
  pyenv
  virtualenv
  virtualenvwrapper
  osx
)' >> ~/.zshrc

# Setup git attribution
git config --global --edit
