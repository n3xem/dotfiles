# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/opt/homebrew/sbin"
export PYENV_ROOT="$HOME/.pyenv"
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

function gh-otui {
  cd $(gh otui)
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
# eval "$(nodenv init -)"
eval "$(zoxide init zsh)"

export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"

export EDITOR=vim
eval "$(direnv hook zsh)"

# anyenv
eval "$(anyenv init -)"

export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"



. ~/.zsh_private

export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/vault vault

eval "$(zoxide init zsh)"

source /Users/yukyan/ghq/github.com/junegunn/fzf-git.sh/fzf-git.sh

export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yukyan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yukyan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yukyan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yukyan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export GH_OTUI_SELECTOR=fzf

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
source <(kubectl completion zsh)
alias claude="/Users/yukyan/.claude/local/claude"
export PATH="$PATH:$HOME/.claude/local"

# gwq を使って、今いるリポジトリのgwqの管理下のworktreeに移動する
wq() {
    local selected
    selected=$(gwq list --json | jq -r '.[] | "\(.path)\t\(.branch)\t\(.commit_hash[0:7])"' | \
      fzf --delimiter='\t' \
          --with-nth=2,3 \
          --preview 'git -C {1} log -1 --color=always --pretty=format:"%C(yellow)%h%Creset%C(cyan)%ad%Creset%C(auto)%d%Creset%n%C(white)%s%Creset%n%n%b" --date=relative && echo && echo "---" && git -C {1} log -1 --stat --color=always' \
          --preview-window=right:60% \
          --header='Select worktree to cd' | \
      cut -f1)

    if [ -n "$selected" ]; then
      cd "$selected" || return 1
    fi
}

function notify-github-actions-ci-finish() {
  gh run watch -i10 && osascript -e 'display notification "run is done!" with title "Terminal"'
}

alias nci=notify-github-actions-ci-finish
