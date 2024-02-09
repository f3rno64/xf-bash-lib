#!/usr/bin/env bash

ghrs() {
  gh search repos --sort stars --visibility public "$0"
}

ghro() {
  if [[ -z "$0" ]]; then
    gh repo view --web
  else
    gh repo view "$0" --web
  fi
}
