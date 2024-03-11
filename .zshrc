# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/opt/homebrew/sbin" 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

export PATH="$HOME/.yarn/bin:$PATH"

export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/development/flutter/bin"

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0

source "$HOME/.cargo/env"

function peco-cd {
  cd "$( ghq list --full-path | peco)"
  zle accept-line
}

function peco-run-docker-images {
  local imgid=$(docker images | peco | awk "{print \$3}")
  cmd="docker run -it $imgid"
  echo ${cmd}
  eval ${cmd}
}

zle -N peco-cd
bindkey '^o' peco-cd

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

. "$HOME/.cargo/env"


eval "$(starship init zsh)"
source /opt/homebrew/share/zsh-abbr/zsh-abbr.zsh

if [ -f ~/.zsh_aliases ]; then
. ~/.zsh_aliases
fi

if [ -f ~/.zsh_abbrs ]; then
. ~/.zsh_abbrs 1> /dev/null
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit && compinit
fi

export TERM=xterm-256color
eval "$(nodenv init -)"
eval "$(zoxide init zsh)"

export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

eval "$(anyenv init -)"

eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init -)"

. ~/.zsh_private

export PATH="/opt/homebrew/opt/php@8.1/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.1/sbin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
