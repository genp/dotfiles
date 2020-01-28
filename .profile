export PATH=/usr/local/bin:/usr/local/sbin:/Users/gen/Library/Python/3.6/bin/:$PATH
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
. /Users/gen/torch/install/bin/torch-activate
ssh-add -K ~/.ssh/github_rsa
alias e="emacs -nw"

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
