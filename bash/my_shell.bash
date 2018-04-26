#!/bin/bash

# Git Prompt
__source_git_helper() {
  . $HOME/.git_helper/git-completion.bash
  . $HOME/.git_helper/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=auto
  GIT_PS1_SHOWUNTRACKEDFILES=1
  # no colored
  export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] $(__git_ps1 "[\[\033[31m\]%s\[\033[0m\]]")\$ '

  # colored
  #GIT_PS1_SHOWCOLORHINTS=true
  #export PROMPT_COMMAND='__git_ps1 "\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\]" "\\\$ "'
}

# show git status
if [ -f $HOME/.git_helper/git-prompt.sh ]; then
  __source_git_helper
else
  mkdir $HOME/.git_helper
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > $HOME/.git_helper/git-prompt.sh
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $HOME/.git_helper/git-completion.bash
  __source_git_helper
fi

# Aliases
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac

if [ -f $HOME/.ngrok/ngrok ]; then
  alias ngrok="$HOME/.ngrok/ngrok"
fi

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
export PATH="$GOENV_ROOT/bin:$GOPATH/bin:$PATH"
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
