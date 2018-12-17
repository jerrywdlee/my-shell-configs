#!/bin/sh

# Git Prompt
GIT_HELPR_PATH=`dirname $(dirname $BASH_SOURCE)`/git_helper

__source_git_helper() {
  if [ -f $GIT_HELPR_PATH/git-completion.bash ]; then
    . $GIT_HELPR_PATH/git-completion.bash
  fi
  if [ -f $GIT_HELPR_PATH/git-prompt.sh ]; then
    . $GIT_HELPR_PATH/git-prompt.sh
  fi
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWUPSTREAM=auto
  GIT_PS1_SHOWUNTRACKEDFILES=1
  # no colored
  # export PS1='\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\] $(__git_ps1 "[\[\033[31m\]%s\[\033[0m\]]")\$ '

  # colored
  #GIT_PS1_SHOWCOLORHINTS=true
  #export PROMPT_COMMAND='__git_ps1 "\[\033[32m\]\u@\h\[\033[0m\] \[\033[33m\]\W\[\033[0m\]" "\\\$ "'
}

# show git status
__source_git_helper
if ! command -v __git_ps1 1>/dev/null 2>&1; then
  curl -L -sS https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > $GIT_HELPR_PATH/git-prompt.sh
  curl -L -sS https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $GIT_HELPR_PATH/git-completion.bash
  echo -e "Git Completion Scripts Downloaded!"
  echo -e "See $GIT_HELPR_PATH"
  __source_git_helper
fi

__my_git_prompt_repo_name() {
  # inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
  # preserve exit status
  local exit=$?
  local printf_format='%s'
  #local printf_format='[\033[36m%s \033[31m%s\033[0m]'
  if [ `git rev-parse --is-inside-work-tree 2>/dev/null` ]; then
    local repo_name=$(basename `git rev-parse --show-toplevel`)
    # local git_ps1=$(__git_ps1 %s)
    # echo "[%{${fg[cyan]}%}$repo_name %{${fg[red]}%}$git_ps1%{${reset_color}%}]"
    # echo -e -n "[\033[36m$repo_name \033[31m$git_ps1\033[0m]"
    printf -- "$printf_format" $repo_name
  else
    printf ""
  fi
  return $exit
}