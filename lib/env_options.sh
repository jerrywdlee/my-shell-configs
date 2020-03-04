#!/bin/sh

# envs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  #eval "$(pyenv virtualenv-init -)"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi


export PATH="$HOME/.nodenv/bin:$PATH"
if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

export GOENV_ROOT="$HOME/.goenv"
if command -v goenv 1>/dev/null 2>&1; then
  eval "$(goenv init -)"
fi
export GOPATH="$HOME/.go"
if [[ ! -d $GOPATH ]]; then
  mkdir $GOPATH
fi
if [[ ! -d "$GOPATH/bin" ]]; then
  mkdir "$GOPATH/bin"
fi
export PATH="$GOENV_ROOT/bin:$GOPATH/bin:$PATH"
