#!/bin/zsh

MY_SHELL_ZSH_ROOT=`dirname $0`
MY_SHELL_ROOT=`dirname ${MY_SHELL_ZSH_ROOT}`
GIT_HELPR_PATH=${MY_SHELL_ROOT}/git_helper
# echo $MY_SHELL_ZSH_ROOT
# echo $MY_SHELL_ROOT

curl -L git.io/antigen > $MY_SHELL_ZSH_ROOT/antigen.zsh

# TODO: remove if woefe/git-prompt.zsh Released
curl -L -sS https://raw.githubusercontent.com/woefe/git-prompt.zsh/master/git-prompt.zsh > ${GIT_HELPR_PATH}/git-prompt.zsh
