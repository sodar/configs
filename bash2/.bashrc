#!/bin/bash

#
# ~/.bashrc
#

# Do not fail if .bashrc.d does not have *.sh files.
shopt -s nullglob

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

if [ -d "${HOME}/.bashrc.d/" ]; then
  for f in "${HOME}"/.bashrc.d/*.sh; do
    # I do not want to list each config file.
    # shellcheck disable=SC1090
    source "${f}"
  done
fi
