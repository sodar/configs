#!/bin/bash

#
# ~/.bashrc
#

# Do not fail if .bashrc.d does not have *.sh files.
shopt -s nullglob

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

if [ -d "${HOME}/.bashrc.d/" ] && [ -f "${HOME}/.bashrc_config.sh" ]; then
  # Not available in the repo, because it is set up per user.
  # shellcheck disable=SC1091
  source "${HOME}/.bashrc_config.sh"

  for f in "${CONFIGS[@]}"; do
    # I do not want to list each config file.
    # shellcheck disable=SC1090
    [ -f "${HOME}/.bashrc.d/${f}" ] && source "${HOME}/.bashrc.d/${f}"
  done
fi
