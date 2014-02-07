export PATH=/usr/local/share/python:/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Display files affected by a commit. Usage: gfiles <commit_id>
alias gfiles='git diff-tree --no-commit-id --name-only -r'

# Add git tab-completion
source ~/.git-completion.bash

# Source the virtualenv wrapper
export WORKON_HOME=~/Envs
source `which virtualenvwrapper.sh`

# Use vi key bindings in the shell
set -o vi

# Git branch in prompt.
source ~/.bash_prompt
