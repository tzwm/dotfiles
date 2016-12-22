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
  export EDITOR='mvim'
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
