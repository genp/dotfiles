#!/usr/bin/sh

# Switch to ZSH
echo 'exec zsh' >> ~/.bashrc
source ~/.bashrc
# In terminal must manually set profile to 'use option as meta'

# Homebrew
mkdir homebrew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C homebrew
echo 'export PATH=~/homebrew/bin:$PATH' >> ~/.zshrc
source ~/.zshrc
which brew
brew update

# wget
brew install wget

# Manually install JDK

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

echo 'zstyle :omz:plugins:ssh-agent agent-forwarding on' >> ~/.zshrc
echo 'zstyle :omz:plugins:ssh-agent identities mac_rsa github_rsa trash_rsa' >> ~/.zshrc
source ~/.zshrc


