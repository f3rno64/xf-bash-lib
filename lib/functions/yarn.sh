#!/usr/bin/env bash

if ! xf_has_yarn; then return; fi

export YARN_RC_FILENAME=".yarnrc.yml"

ypi() {
  yarn plugin import "$1"
}

ya() {
  yarn add "$@"
}

yad() {
  yarn add -D "$@"
}

ycl() {
  yarn config list -v --why
}
