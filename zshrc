autoload -U compinit promptinit
compinit
promptinit
# history
setopt extended_history
export HISTSIZE=5000
export HISTFILE=~/.history_zsh
export SAVEHIST=4000

# env
export PATH="$PATH:/usr/local/sbin:$HOME/bin"

export EDITOR="/usr/bin/vim"

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

# bindings
bindkey -M viins "\e[1~" beginning-of-line
bindkey -M viins "^[[1~" beginning-of-line
bindkey -M viins "^[[H" beginning-of-line
bindkey -M viins "\e[7~" beginning-of-line
bindkey -M viins "^[OH" beginning-of-line
bindkey -M viins "\e[5~" beginning-of-history
bindkey -M viins '\e[4~' end-of-line
bindkey -M viins "\e[8~" end-of-line
bindkey -M viins "^[[4~" end-of-line 
bindkey -M viins "^[[F" end-of-line
bindkey -M viins "^[OF" end-of-line
bindkey -M viins "\e[6~" end-of-history
bindkey -M viins "^[[A" up-line-or-history
bindkey -M viins "^[[B" down-line-or-history
bindkey -M viins "^[[3~" delete-char
bindkey -M viins "^[3;5~" delete-char
bindkey -M viins "^R" history-incremental-search-backward
bindkey -M viins "\e[2~" quoted-insert
bindkey -v # vi key bindings

# aliases
alias grep='grep --color=auto'
alias d="ls -hG"
alias ls="ls -hG"
alias ll="ls -G -l -h"
alias la="ls -G -a -h"
alias lal="ls -G -a -l -h"
alias lrt="ls -lrtG"
alias df="pydf -h"
alias gs="git status"

# executed before each prompt
precmd() {
    # prompt
    if [[ ${UID} == "0" ]]; then
        PS1="$(print "\n${DARKBLUE}[${BLUE}%*${DARKBLUE}] ${RED}%n@%M${BLUE} %~ ${RED}\$${WHITE} ")"
    else
        PS1="$(print "\n${DARKBLUE}[${BLUE}%*${DARKBLUE}] ${WHITE}%n@%M$(rvm_current)${BLUE} %~ ${RED}\$${WHITE} ")"
    fi
}

# funcshuns
function rvm_current {
    ruby_version=$(~/.rvm/bin/rvm-prompt g)
    if [ -n "$ruby_version" ]; then
        echo " [${GREEN}$ruby_version${WHITE}]"
    fi
}

# rvm (http://rvm.beginrescueend.com/)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
fi
