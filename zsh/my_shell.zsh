#!/bin/zsh

MY_SHELL_ZSH_ROOT=`dirname $0`
MY_SHELL_ROOT=`dirname ${MY_SHELL_ZSH_ROOT}`
GIT_HELPR_PATH="$MY_SHELL_ROOT/git_helper"
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

# For light theme
# In VScode Must set "terminal.integrated.env.osx": { "CONSOLE_THEME": "light", } first
if [[ $CONSOLE_THEME = "light" ]]; then
  # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=250,underline,fg_bold
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=251
else
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=8
fi

ZSH_GIT_PROMPT_SHOW_UPSTREAM="symbol"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}↯"

# PS1設定
# プロンプト表示直前にvcs_info呼び出し
precmd () {
  # psvar=()
  # LANG=en_US.UTF-8 vcs_info
  # [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_ "

  # Repo name
  if [ `git rev-parse --is-inside-work-tree 2>/dev/null` ]; then
    local repo_name=$(basename `git rev-parse --show-toplevel`)
    # psvar[1]="$repo_name "
    # RPROMPT="[%F{cyan}$repo_name%f $(gitprompt) %F{blue}%D{%Y/%m/%d} %T%f]"
    RPROMPT="[%F{cyan}$repo_name%f $(_zsh_git_prompt_git_status) %F{blue}%D{%m/%d} %T%f]"
  else
    # See: https://qiita.com/annyamonnya/items/97c5cb0cfa414b3592d7
    RPROMPT="[%F{blue}%D{%Y/%m/%d} %D{%a} %*%f]"
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

# ZSH_THEME_GIT_PROMPT_PREFIX="["
# ZSH_THEME_GIT_PROMPT_SUFFIX="] "
# ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
# ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
# ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
# ZSH_THEME_GIT_PROMPT_BEHIND="↓"
# ZSH_THEME_GIT_PROMPT_AHEAD="↑"
# ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
# ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
# ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
# ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"
# 
# PROMPT='%B%40<..<%~ %b$(gitprompt)%(?.%F{blue}❯%f%F{cyan}❯%f%F{green}❯%f.%F{red}❯❯❯%f) '
# RPROMPT=''
