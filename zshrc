alias vim='nvim'

# use purer zsh prompt for git status, branch, dir, etc: 
# https://github.com/dfurnes/purer
PURE_PROMPT_SYMBOL="λ"
PURE_CMD_MAX_EXEC_TIME=9999999999999
autoload -U promptinit; promptinit
prompt purer
