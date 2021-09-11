alias ls='exa'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias bat='batcat'
alias venv='source venv/bin/activate'
alias aslroff='sysctl -w kernel.randomize_va_space=0'
alias aslron='sysctl -w kernel.randomize_va_space=2'
alias sudo='sudo '
alias clip='win32yank.exe'
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/win32yank"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#export DISPLAY=:0.0

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

alias sd='peco-cd'

export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
. "$HOME/.cargo/env"
export PATH=$PATH:'/mnt/c/Users/Yukyan.000/AppData/Local/Programs/Microsoft VS Code/bin'

