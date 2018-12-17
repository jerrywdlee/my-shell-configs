#!/bin/bash

#export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] \$ '

# MY_SHELL_PATH="${BASH_SOURCE[0]%/*}/../"
# . $MY_SHELL_PATH/lib/git_helper.sh
MY_SHELL_PATH=`dirname $(dirname $BASH_SOURCE)`
. $MY_SHELL_PATH/lib/git_helper.sh

# GIT_PS1_SHOWDIRTYSTATE=0
# GIT_PS1_SHOWUPSTREAM=0
# GIT_PS1_SHOWUNTRACKEDFILES=0

export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] $(__git_ps1 "[\[\033[31m\]%s\[\033[0m\]]")\n\$ '

# For loading applications
if [ -f $HOME/.ngrok2/ngrok ]; then
  PATH="$HOME/.ngrok2/ngrok:$PATH"
  # alias ngrok="$HOME/.ngrok2/ngrok"
fi
