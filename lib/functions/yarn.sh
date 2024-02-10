#!/usr/bin/env bash

if ! xf_has_yarn; then return; fi

export YARN_RC_FILENAME=".yarnrc.yml"

ypi() {
  if [[ -z "$1" ]]; then
    echo "Usage: ypi <plugin>"
    return 1
  fi

  yarn plugin import "$1"
}

ya() {
  if [[ -z "$*" ]]; then
    echo "Usage: ya <...packages>"
    return 1
  fi

  yarn add "$@"
}

yad() {
  if [[ -z "$*" ]]; then
    echo "Usage: yad <...packages>"
    return 1
  fi

  yarn add -D "$@"
}

ycl() {
  yarn config list -v --why
}
