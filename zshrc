alias vim='nvim'

alias b="bundle"
alias be="bundle exec"

alias s="rspec"

# use purer zsh prompt for git status, branch, dir, etc: 
# https://github.com/dfurnes/purer
PURE_PROMPT_SYMBOL="λ"
PURE_CMD_MAX_EXEC_TIME=9999999999999
autoload -U promptinit; promptinit
prompt purer

# asdf configuration: https://github.com/asdf-vm/asdf/blob/master/README.md
autoload -Uz compinit
compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
