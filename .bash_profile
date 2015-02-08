alias proj="cd {HOME}/__Projects"
alias ..="cd .."
alias lsla="ls -l -a"
alias be="bundle exec"

lazytouch()
{
  touch $1
  open $1
}

function parse_git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
 echo "("${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;36m\]"

PS1="$BLUE\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ "

if [ -f ~/.git-completion.bash ]; then 
 . ~/.git-completion.bash 
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi