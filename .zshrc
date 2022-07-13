export PATH="$PATH:/opt/homebrew/bin" 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

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

. ~/.zsh_private

eval "$(starship init zsh)"

if [ -f ~/.zsh_aliases ]; then
. ~/.zsh_aliases
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

export TERM=xterm-256color
eval "$(nodenv init -)"
eval "$(zoxide init zsh)"

source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh
