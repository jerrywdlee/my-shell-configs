#!/bin/zsh

MY_SHELL_ZSH_ROOT=`dirname $0`
MY_SHELL_ROOT=`dirname ${MY_SHELL_ZSH_ROOT}`
# echo $MY_SHELL_ZSH_ROOT
# echo $MY_SHELL_ROOT

curl -L git.io/antigen > $MY_SHELL_ZSH_ROOT/antigen.zsh

# . $MY_SHELL_ZSH_ROOT/antigen_opts.zsh

# mkdir -p $MY_SHELL_ROOT/zsh/
