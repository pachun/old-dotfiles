alias vim='nvim'

alias ..="cd .."

alias c="clear"
alias e="exit"
alias t="tmux"

alias b="bundle"
alias be="bundle exec"
alias migrate="rails db:migrate db:test:prepare"

alias s="rspec"

alias g="hub"
alias gs="g status"
alias pr="g pull-request"
alias gco="g checkout"
alias gb="g branch"
alias gr="g rebase"
alias sq="g rebase -i HEAD~"

alias x="gitx"

# use purer zsh prompt for git status, branch, dir, etc:
# https://github.com/dfurnes/purer
PURE_PROMPT_SYMBOL="λ"
PURE_CMD_MAX_EXEC_TIME=9999999999999
autoload -U promptinit; promptinit
prompt purer

# use vi mode instead of emacs on the command line
bindkey -v

# remap escape to jj
bindkey -M viins 'jj' vi-cmd-mode

# asdf configuration: https://github.com/asdf-vm/asdf/blob/master/README.md
autoload -Uz compinit
compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
