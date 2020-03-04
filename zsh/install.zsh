#!/bin/zsh

MY_SHELL_ZSH_ROOT=`dirname $0`
MY_SHELL_ROOT=`dirname ${MY_SHELL_ZSH_ROOT}`
GIT_HELPR_PATH=${MY_SHELL_ROOT}/git_helper
# echo $MY_SHELL_ZSH_ROOT
# echo $MY_SHELL_ROOT

curl -L git.io/antigen > $MY_SHELL_ZSH_ROOT/antigen.zsh

# TODO: remove if https://github.com/woefe/git-prompt.zsh/pull/17 merged
curl -L -sS https://raw.githubusercontent.com/jerrywdlee/git-prompt.zsh/master/git-prompt.zsh > ${GIT_HELPR_PATH}/git-prompt.zsh

# . $MY_SHELL_ZSH_ROOT/antigen_opts.zsh

# mkdir -p $MY_SHELL_ROOT/zsh/
