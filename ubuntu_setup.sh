#!/usr/bin/sh

# make a new user for myself
export USERNAME='gen'
adduser $USERNAME
usermod -aG sudo $USERNAME
su - $USERNAME

# Switch to ZSH
sudo apt install zsh
chsh -s $(which zsh)

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


