export DOTFILES="$HOME/.dotfiles"

# zsh
export ZSH="$DOTFILES/oh-my-zsh"

ZSH_THEME='robbyrussell'
DISABLE_AUTO_UPDATE='true'
COMPLETION_WAITING_DOTS='true'
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Common configuration
export PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin'
export PATH="$HOME/bin:$PATH"

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim -f'
fi

# Secrets
SECRETS="$DOTFILES/secrets"
if [ -f $SECRETS ]; then
  source $SECRETS
fi

# arcanist
export PATH="$PATH:$HOME/Repositories/arcanist/bin/"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Android SDK
export ANDROID_HOME=/usr/local/opt/android-sdk

# MySQL
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# Golang
export GOPATH="$HOME/gocode"
export PATH="$GOPATH/bin:$PATH"

# GPG
export GPG_TTY=$(tty)

# https://gist.github.com/tzwm/7402ded9cbf31d011417a7db0a8efe83
#
# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

# Rust
export CARGO_PATH="$HOME/.cargo"
export PATH=$PATH:$CARGO_PATH/bin

# kubectl
if [ -x "$(which kubectl)" ]; then
  source <(kubectl completion zsh)
fi
