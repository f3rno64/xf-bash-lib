#!/usr/bin/env bash

x() {
  exit
}

c() {
  clear
}

# Attempts to open the manpage with vim or a vim clone if possible. Otherwise
# defaults to `man`.
man() {
  local -r EDITOR="$(xf_resolve_editor)"
  local -r VIMS="$(
    "nvim"
    "vim"
    "vi"
  )"

  if [[ "$(${VIMS[*]}) " =~ $EDITOR ]]; then
    "$EDITOR" -c "Man $*" -c 'only'
  else
    man "$*"
  fi
}
