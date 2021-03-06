export PYTHONDONTWRITEBYTECODE=1
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8
export ZSH=$HOME/.oh-my-zsh

setopt HIST_FIND_NO_DUPS

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U add-zsh-hook
function on_prompt {
    printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "" | base64)
}
function on_exec {
    cmd=$(echo "${1}" | cut -d ' ' -f 1-2)
    printf "\e]1337;SetBadgeFormat=%s\a" $(echo -n "${cmd}" | base64)
}
add-zsh-hook preexec on_exec
add-zsh-hook precmd on_prompt

ZSH_THEME="robbyrussell"
plugins=(git django docker)
source $ZSH/oh-my-zsh.sh

alias gs='git status'
alias gc='git checkout'
alias gl='git log'
alias gd='git diff --ignore-all-space'
alias gdl='git diff HEAD^'
alias gcm='git checkout master && git pull'
alias gcd='git checkout develop && git pull'
alias ll='ls -l'
alias dc='docker-compose'
alias ff='noglob find . -name'
alias vz='vim ~/.zshrc'
alias copy2='scp `git ls-files -m`'
alias pt='py.test -vv --looponfail --cov-report html --cov-config ~/.coveragerc --cov .'

# source ~/env/bin/activate
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
