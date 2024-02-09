#!/usr/bin/env bash

ghrs() {
  if [[ -z "$1" ]]; then
    echo "Usage: ghrs <search query>"
    return 1
  fi

  gh search repos --sort stars --visibility public "$1"
}

ghro() {
  if [[ -z "$1" ]]; then
    gh repo view --web
  else
    gh repo view "$1" --web
  fi
}
