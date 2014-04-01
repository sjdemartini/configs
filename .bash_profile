export PATH=/usr/local/share/python:/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias glg='git lg'
alias gs='git status'
alias gsh='git show'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gb='git branch'
alias gch='git checkout'
alias gpu='git pull'
alias gprom='git pull --rebase origin master'
alias gcl='git clone'
# Display files affected by a commit. Usage: gfiles <commit_id>
alias gfiles='git diff-tree --no-commit-id --name-status -r'

# Source the current bash profile:
alias s='source ~/.bash_profile'

# Add git tab-completion
source ~/.git-completion.bash

# Source the virtualenv wrapper
export WORKON_HOME=~/Envs
source `which virtualenvwrapper.sh`

# Use vi key bindings in the shell
set -o vi

# Git branch in prompt.
source ~/.bash_prompt
