#!/bin/zsh

MY_SHELL_ZSH_ROOT=`dirname $0`
MY_SHELL_ROOT=`dirname ${MY_SHELL_ZSH_ROOT}`
ANTIGEN="$MY_SHELL_ZSH_ROOT/antigen.zsh"

if [ ! -f "$ANTIGEN" ]; then
    print -P "%B%F{green}Installing...%f%b"
    sh $MY_SHELL_ZSH_ROOT/install.zsh
fi

## ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Load local bash/zsh compatible settings
_INIT_SH_NOFUN=1
_INIT_SH_NOLOG=1
[ -f "$HOME/.local/etc/init.sh" ] && source "$HOME/.local/etc/init.sh"

# active colors
autoload -Uz colors && colors
export TERM="xterm-256color"

# check login shell
if [[ -o login ]]; then
	[ -f "$HOME/.local/etc/login.sh" ] && source "$HOME/.local/etc/login.sh"
	[ -f "$HOME/.local/etc/login.zsh" ] && source "$HOME/.local/etc/login.zsh"
fi

# load local config
[ -f "$HOME/.local/etc/config.zsh" ] && source "$HOME/.local/etc/config.zsh" 
[ -f "$HOME/.local/etc/local.zsh" ] && source "$HOME/.local/etc/local.zsh"

# source function.sh if it exists
[ -f "$HOME/.local/etc/function.sh" ] && . "$HOME/.local/etc/function.sh"

. $MY_SHELL_ZSH_ROOT/antigen_opts.zsh
. $MY_SHELL_ZSH_ROOT/color_opts.zsh
. $MY_SHELL_ZSH_ROOT/key_bind.zsh





# # Disable correction
# unsetopt correct_all
# unsetopt correct
# DISABLE_CORRECTION="true" 
# 
# # completion detail
# zstyle ':completion:*:complete:-command-:*:*' ignored-patterns '*.pdf|*.exe|*.dll'
# zstyle ':completion:*:*sh:*:' tag-order files
#add-zsh-hook precmd _update_vcs_info_msg
PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{blue}localhost%f:%1(v|%F{red}%1v%f|) $ "
RPROMPT='[%F{green}%d%f]'
