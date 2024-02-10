#!/usr/bin/env bash

pna() {
  if [[ -z "$*" ]]; then
    echo "Usage: pna <package>"
    return 1
  fi

  pnpm add "$@"
}

pnad() {
  if [[ -z "$*" ]]; then
    echo "Usage: pnad <package>"
    return 1
  fi

  pnpm add -D "$@"
}

pnag() {
  if [[ -z "$*" ]]; then
    echo "Usage: pnag <package>"
    return 1
  fi

  pnpm add -g "$@"
}

pnu() {
  if [[ -z "$*" ]]; then
    pnpm update
  else
    pnpm update "$@"
  fi
}

pnug() {
  if [[ -z "$*" ]]; then
    pnpm update -g
  else
    pnpm update -g "$@"
  fi
}
