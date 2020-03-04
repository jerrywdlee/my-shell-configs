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

# PS1設定
# プロンプト表示直前にvcs_info呼び出し
precmd () {
	psvar=()
	# LANG=en_US.UTF-8 vcs_info
	# [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_ "

	# Repo name
	if [ `git rev-parse --is-inside-work-tree 2>/dev/null` ]; then
		local repo_name=$(basename `git rev-parse --show-toplevel`)
        # psvar[1]="$repo_name "
		RPROMPT="[%F{cyan}$repo_name%f $(_zsh_git_prompt_git_status) %F{blue}%D %T%f]"
	else
		RPROMPT="[%F{blue}%D %T%f]"
	fi
}

# PROMPT="%{${fg[green]}%}%n%{${reset_color}%}@%F{blue}localhost%f:%1(v|%F{red}%1v%f|) $ "
# PROMPT="%F{green}%n@%m%f:%1(v|%F{red}%1v%f|) $ "
# RPROMPT="[%1(v|%F{cyan}%2v%f|)%1(v|%F{red}%1v%f|)%F{magenta}%D%f]"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{yellow}⎇%f "
# ZSH_THEME_GIT_PROMPT_PREFIX="⌥ "
ZSH_THEME_GIT_PROMPT_SUFFIX=""

PROMPT="%F{green}%n@%m%f %F{yellow}%~%f %# "
# RPROMPT="[%1(v|%F{cyan}%2v%f|)$(_zsh_git_prompt_git_status)%F{blue}%D %T%f]"
# RPROMPT="[%1(v|%F{cyan}%1v%f|)$_ZSH_GIT_PROMPT_STATUS_OUTPUT%F{blue}%D %T%f]"
