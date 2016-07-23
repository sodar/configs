#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


EDITOR=vim
export EDITOR

export PATH=$PATH:$HOME/bin


# Aliases
alias ls='ls --color=auto'


# Colors
txtblk='\e[0;30m'
txtred='\e[0;31m'
txtgrn='\e[0;32m'
txtylw='\e[0;33m'
txtblu='\e[0;34m'
txtpur='\e[0;35m'
txtcyn='\e[0;36m'
txtwht='\e[0;37m'

bldblk='\e[1;30m'
bldred='\e[1;31m'
bldgrn='\e[1;32m'
bldylw='\e[1;33m'
bldblu='\e[1;34m'
bldpur='\e[1;35m'
bldcyn='\e[1;36m'
bldwht='\e[1;37m'

txtrst='\e[0m'

# For working with git
function Git_IsInRepo() {
  if git st &> /dev/null; then
    return 0
  else
    return 1
  fi
}

function Git_GetBranch() {
  if Git_IsInRepo; then
   echo `git branch --all | awk '/^\* / { gsub("\* ", ""); print $0 }' 2> /dev/null`
  fi
}

function Git_IsChanged() {
  if Git_IsInRepo; then
    # Command returns 0 if repository is not modified
    if [[ $(git diff --shortstat 2> /dev/null | tail -n1) == "" ]]; then
      return 1
    else
      return 0
    fi
  fi
}

function Git_UntrackedCount() {
  if Git_IsInRepo; then
    # Command returns 0 if there are any untracked files
    expr `git status --porcelain | grep "^??" | wc -l`
    return 0
  else
    echo "0"
    return 1
  fi
}

function Git_GetPrompt() {
  if Git_IsInRepo; then
    B=" \001$bldwht\002("
    E="\001$bldwht\002)"

    branch=`Git_GetBranch`
    prompt="\001$bldwht\002git:\001$bldylw\002$branch"
    if Git_IsChanged; then
      prompt="$prompt \001$bldred\002*"
    fi
    untracked_count=`Git_UntrackedCount`
    if [ $untracked_count -gt 0 ]; then
      prompt="$prompt \001$bldred\002U"
    fi

    echo -e "${B}${prompt}${E}"
  fi
}

# RVM
[ -f $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm

# pyenv
if [ -d $HOME/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Prompt
USER_AND_HOST="\[$bldblu\]\u\[$bldwht\]@\[$bldgrn\]\h"
CURR_DIR=" \[$bldwht\][\w]"
export PS1="${USER_AND_HOST}\$(Git_GetPrompt)${CURR_DIR}\n\[$bldwht\]$ \[$txtrst\]"

# Aliases
alias batterystate="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
