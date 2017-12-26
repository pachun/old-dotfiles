alias vim='nvim'

# use purer zsh prompt for git status, branch, dir, etc: 
# https://github.com/dfurnes/purer
PURE_PROMPT_SYMBOL="λ"
autoload -U promptinit; promptinit
prompt purer
