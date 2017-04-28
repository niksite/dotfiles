export PYTHONDONTWRITEBYTECODE=1
export PYTHONPATH=$PYTHONPATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh

setopt HIST_FIND_NO_DUPS

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
autoload -U add-zsh-hook
update_badge()
{
    printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "" | base64)
}
add-zsh-hook precmd update_badge

ZSH_THEME="robbyrussell"
plugins=(git django docker)
source $ZSH/oh-my-zsh.sh

alias gs='git status'
alias gc='git checkout'
alias gl='git log'
alias gm='git checkout master && git pull'
alias ll='ls -l'
alias dc='docker-compose'
alias ff='noglob find . -name'
alias vz='vim ~/.zshrc'
alias copy2='scp `git ls-files -m`'
