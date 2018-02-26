# use neovim
export VISUAL=nvim
export EDITOR=$VISUAL
alias vim='nvim'

# stuff since I'm lazy
alias ..="cd .."

alias c="clear"
alias e="exit"
alias t="tmux"
alias d="detox test"

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
alias gri="g rebase -i"
alias gl="g log"
alias gm="g merge"

alias x="gitx"

# direnv for spring in rails apps so i can do `rspec` instead of `bin/rspec`
export DIRENV_LOG_FORMAT=
eval "$(direnv hook zsh)"


# history
setopt append_history         # Append, not replace
setopt inc_append_history     # Immediately append history
setopt always_to_end          # Always go to end of line on complete
setopt correct                # Correct typos
setopt hist_ignore_dups       # Do not show dupes in history
setopt hist_ignore_space      # Ignore commands starting with space
setopt prompt_subst           # Necessary for pretty prompts
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

# use vi mode instead of emacs on the command line
bindkey -v

# remap escape to jj
bindkey -M viins 'jj' vi-cmd-mode

# asdf configuration: https://github.com/asdf-vm/asdf/blob/master/README.md
autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Josh's zsh prompt config:
#
# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

setopt promptsubst

_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [ -n $ref ]; then
    branch_name="${ref#refs/heads/}"
    branch_name_max_length=$(($COLUMNS/5))
    if [ ${#branch_name} -gt $branch_name_max_length ]; then
      echo "$branch_name[0,$(($branch_name_max_length-3))]..."
    else
      echo $branch_name
    fi
  fi
}

_git_status() {
  git_status=$(cat "/tmp/git-status-$$")
  if [ -n "$(echo $git_status | grep "Changes not staged")" ]; then
    echo "changed"
  elif [ -n "$(echo $git_status | grep "Changes to be committed")" ]; then
    echo "pending"
  elif [ -n "$(echo $git_status | grep "Untracked files")" ]; then
    echo "untracked"
  else
    echo "unchanged"
  fi
}

_git_prompt_color() {
  if [ -n "$1" ]; then
    current_git_status=$(_git_status)
    if [ "changed" = "$current_git_status" ]; then
      echo "$(_red $1)"
    elif [ "pending" = "$current_git_status" ]; then
      echo "$(_yellow $1)"
    elif [ "unchanged" = "$current_git_status" ]; then
      echo "$(_green $1)"
    elif [ "untracked" = "$current_git_status" ]; then
      echo "$(_cyan $1)"
    fi
  else
    echo "$1"
  fi
}

_color() {
  if [ -n "$1" ]; then
    echo "%{$fg_bold[$2]%}$1%{$reset_color%}"
  fi
}

_separate()               { if [ -n "$1" ]; then echo " $1"; fi }
_grey()                   { echo "$(_color "$1" grey)" }
_yellow()                 { echo "$(_color "$1" yellow)" }
_green()                  { echo "$(_color "$1" green)" }
_red()                    { echo "$(_color "$1" red)" }
_cyan()                   { echo "$(_color "$1" cyan)" }
_blue()                   { echo "$(_color "$1" blue)" }

_full_path()              { echo "$(_blue "%~")" }
_working_directory()      { echo "$(_blue "%c")" }

_colored_git_branch()     { echo "$(_git_prompt_color "$(_git_prompt_info)")" }

_display_current_vim_mode() {
  if [[ $VIMODE == 'vicmd' ]]; then
    echo "$(_red "✘")"
  else
    echo "$(_green "✔")"
  fi
}

function zle-line-init zle-keymap-select {
  VIMODE=$KEYMAP
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd {
  $(git status 2> /dev/null >! "/tmp/git-status-$$")
}

PROMPT='$(_working_directory)$(_separate $(_colored_git_branch)) $(_display_current_vim_mode) '

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
