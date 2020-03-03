#!/bin/zsh

MY_SHELL_ZSH_ROOT=`dirname $0`
MY_SHELL_ROOT=`dirname ${MY_SHELL_ZSH_ROOT}`
ANTIGEN="$MY_SHELL_ZSH_ROOT/antigen.zsh"

# Initialize antigen
source "$ANTIGEN"

# Setup dir stack
# DIRSTACKSIZE=10
# setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups cdablevars
# alias d='dirs -v | head -10'

########################################

ZSH_AUTOSUGGEST_USE_ASYNC=1

# completion detail
zstyle ':completion:*:complete:-command-:*:*' ignored-patterns '*.pdf|*.exe|*.dll'
zstyle ':completion:*:*sh:*:' tag-order files

# Declare modules
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:git:alias' skip 'yes'
zstyle ':prezto:module:prompt' theme 'redhat'
zstyle ':prezto:module:prompt' pwd-length 'short'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:autosuggestions' color 'yes'
zstyle ':prezto:module:python' autovenv 'yes'
zstyle ':prezto:load' pmodule \
	'environment' \
	'editor' \
	'history' \
	'git' \
	'utility' \
	'completion' \
	'history-substring-search' \
	'autosuggestions' \
	'prompt' \

# Initialize prezto
antigen use prezto


# default bundles
# antigen bundle rupa/z z.sh
# antigen bundle Vifon/deer
antigen bundle zdharma/fast-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle willghatch/zsh-cdr
# antigen bundle zsh-users/zaw

antigen apply

# options
# unsetopt share_history
# Disable correction
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true" 

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.

## PROMPT
# vcs_infoロード    
autoload -Uz vcs_info    

# PROMPT変数内で変数参照する    
setopt prompt_subst    

# vcsの表示    
# zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' enable git
# git の時のみに有効
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "*"
zstyle ':vcs_info:*' formats '%b%c%u%m'    
zstyle ':vcs_info:*' actionformats '%b(%a)%c%u%m'

# TODO: Tabtab対策
# https://github.com/mklabs/tabtab/issues/40
