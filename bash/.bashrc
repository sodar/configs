#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


EDITOR=vim
export EDITOR

export PATH="${PATH}:${HOME}/bin"


# Aliases
alias ls='ls --color=auto'
alias start-ssh-agent="${HOME}/bin/start-ssh-agent.sh"
alias refresh-ssh-agent="source ${HOME}/bin/refresh-ssh-agent.sh"


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

#
# Simplistic Git prompt
#

function Git_IsInRepo() {
  if git 'status' &> /dev/null; then
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

function Git_GetPrompt() {
  if Git_IsInRepo; then
    local prefix=" \001$bldwht\002("
    local suffix="\001$bldwht\002)"

    local branch=`Git_GetBranch`
    local prompt="\001$bldwht\002git:\001$bldylw\002$branch"

    echo -e "${prefix}${prompt}${suffix}"
  fi
}


# Prompt
USER_AND_HOST="\[$bldblu\]\u\[$bldwht\]@\[$bldgrn\]\h"
CURR_DIR=" \[$bldwht\][\w]"
export PS1="${USER_AND_HOST}\$(Git_GetPrompt)${CURR_DIR}\n\[$bldwht\]$ \[$txtrst\]"

#
# Aliases
#
alias batterystate="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

#
# External programs, PATH extensions
#

# RVM
[ -f "${HOME}/.rvm/scripts/rvm" ] && source "${HOME}/.rvm/scripts/rvm"

# Rust
[ -d "${HOME}/.cargo/bin" ] && export PATH="${HOME}/.cargo/bin:${PATH}"

# Go
[ -d "${HOME}/dev/go" ] && export GOPATH="${HOME}/dev/go"

# Terraform
[ -d "/opt/terraform" ] && export PATH="${PATH}:/opt/terraform"

# doctl
[ -f "/usr/bin/doctl" ] && source <(doctl completion bash)
