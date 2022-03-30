#! /usr/bin/env bash

UNAME="$(uname -a)"
HOMEBREW_BIN_PATH="/opt/homebrew/bin"
HOMEBREW_BASH="$HOMEBREW_BIN_PATH/bash"
SYSTEM_BASH="$(which bash)"

if [[ "$UNAME" =~ Darwin ]]; then
  if [[ -x "$HOMEBREW_BASH" ]]; then
    alias bash="\$HOMEBREW_BASH"
  else
    alias bash="\$SYSTEM_BASH"
  fi
fi
