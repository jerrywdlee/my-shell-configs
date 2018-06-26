#!/bin/sh

# $ echo $PS1
# \[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$

#git_ps1_type = "$(type -t __git_ps1 2> /dev/null)"

if [[ $(type -t __git_ps1) =~ 'function' ]]; then
  git config --global core.autoCRLF false

  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=auto
  # GIT_PS1_SHOWUNTRACKEDFILES=1
  # export PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[33m\]\W\[\033[36m\]`__git_ps1`\[\033[0m\]$'
else
  echo "Git Module not found"
fi

alias open="start"

# export PATH="$HOME/.rbenv-win/bin:$HOME/.rbenv-win/shims:$PATH"
# if command -v rbenv 1>/dev/null 2>&1; then
#   eval "$(rbenv init -)"
# fi

if [ -f $HOME/.ngrok/ngrok.exe ]; then
  alias ngrok="$HOME/.ngrok/ngrok.exe"
fi

if [ -f $HOME/.rbenv-win/bin/rbenv.bat ]; then
  alias rbenv="$HOME/.rbenv-win/bin/rbenv.bat"
fi
