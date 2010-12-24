autoload -U compinit promptinit
compinit
promptinit

# history
setopt extended_history
export HISTSIZE=5000
export HISTFILE=~/.history_zsh
export SAVEHIST=4000

# env
PATH="$PATH:$HOME/bin"
EDITOR="/usr/bin/vim"

# colors
local DARKBLUE=$'%{\033[0;34m%}'
local BLUE=$'%{\033[1;34m%}'
local WHITE=$'%{\033[0;39m%}'
local WHITEB=$'%{\033[0;1;39m%}'
local RED=$'%{\033[0;31m%}'

local GREEN=$'%{\e[0;32m%}'
local YELLOW='%{\e[0;33m%}'
local PINK=$'%{\e[0;35m%}'
local CYAN=$'%{\e[0;36m%}'
local GREY=$'%{\e[1;30m%}'
local NORMAL=$'%{\e[0m%}'

# prompt
if [[ ${UID} == "0" ]]; then
	export PS1="$(print "\n${DARKBLUE}[${BLUE}%*${DARKBLUE}] ${RED}%n@%M${BLUE} %~ ${RED}\$${WHITE} ")"
else
	export PS1="$(print "\n${DARKBLUE}[${BLUE}%*${DARKBLUE}] ${WHITE}%n@%M${BLUE} %~ ${RED}\$${WHITE} ")"
fi

# bindings
bindkey '\e[1~' beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "\e[7~" beginning-of-line
bindkey '\e[4~' end-of-line
bindkey "\e[8~" end-of-line
bindkey "^[[4~" end-of-line 
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "^R" history-incremental-search-backward

# aliases
alias grep='grep --color=auto'
alias d="ls --color -h"
alias ls="ls --color=auto -h"
alias ll="ls --color -l -h"
alias la="ls --color -a -h"
alias lal="ls --color -a -l -h"
alias lrt="ls -lrt"
alias df="pydf -h"
alias gs="git status"

# rvm (http://rvm.beginrescueend.com/)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

