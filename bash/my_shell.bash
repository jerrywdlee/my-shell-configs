#!/bin/bash

__source_git_helper() {
  . $HOME/.git_helper/git-completion.bash
  . $HOME/.git_helper/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=auto
  GIT_PS1_SHOWUNTRACKEDFILES=1
  # no colored
  # export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] $(__git_ps1 "[\[\033[31m\]%s\[\033[0m\]]")\$ '

  # colored
  GIT_PS1_SHOWCOLORHINTS=true
  export PROMPT_COMMAND='__git_ps1 "\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\]" "\\\$ "'
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

