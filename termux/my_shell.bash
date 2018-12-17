#!/bin/bash

#export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] \$ '

# MY_SHELL_PATH="${BASH_SOURCE[0]%/*}/../"
# . $MY_SHELL_PATH/lib/git_helper.sh
MY_SHELL_PATH=`dirname $(dirname $BASH_SOURCE)`
. $MY_SHELL_PATH/lib/git_helper.sh

export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] $(__git_ps1 "[\[\033[36m\]$(__my_git_prompt_repo_name) \[\033[31m\]%s\[\033[0m\]]")\n\$ '

# For loading applications
if [ -f $HOME/.ngrok2/ngrok ]; then
  alias ngrok="$HOME/.ngrok2/ngrok"
fi
