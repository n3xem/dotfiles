export PATH="$PATH:/usr/local/win32yank"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0

source "$HOME/.cargo/env"

function peco-cd {
  cd "$( ghq list --full-path | peco)"
}

. "$HOME/.cargo/env"

. ~/.bash_private

eval "$(starship init bash)"

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
