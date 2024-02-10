#!/usr/bin/env bash

sysup() {
  if [[ -z "$*" ]]; then
    echo "Usage: sysup <...units>"
    return 1
  fi

  sudo systemctl start "$@"
}

sysdn() {
  if [[ -z "$*" ]]; then
    echo "Usage: sysdn <...units>"
    return 1
  fi

  sudo systemctl stop "$@"
}

sysre() {
  if [[ -z "$*" ]]; then
    echo "Usage: sysre <...units>"
    return 1
  fi

  sudo systemctl restart "$@"
}

sysst() {
  if [[ -z "$*" ]]; then
    echo "Usage: sysst <...units>"
    return 1
  fi

  sudo systemctl status "$@"
}

syson() {
  if [[ -z "$*" ]]; then
    echo "Usage: syson <...units>"
    return 1
  fi

  sudo systemctl enable "$@"
}

sysoff() {
  if [[ -z "$*" ]]; then
    echo "Usage: sysoff <...units>"
    return 1
  fi

  sudo systemctl disable "$@"
}
