#!/usr/bin/env bash

jctl() {
  if [[ -z "$1" ]]; then
    echo "Usage: jctl <unit>"
  fi

  sudo journalctl -u "$1"
}

jctlf() {
  jctl -f
}
