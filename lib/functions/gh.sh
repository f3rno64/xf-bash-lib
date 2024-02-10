#!/usr/bin/env bash

ghrs() {
  if [[ -z "$*" ]]; then
    echo "Usage: ghrs <search query>"
    return 1
  fi

  gh search repos --sort stars --visibility public "$@"
}

ghro() {
  if [[ -z "$1" ]]; then
    gh repo view --web
  else
    gh repo view "$1" --web
  fi
}
