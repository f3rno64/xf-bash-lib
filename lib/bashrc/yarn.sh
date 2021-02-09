#!/usr/bin/env bash

if ! xf_has_yarn; then return; fi

export YARN_RC_FILENAME=".yarnrc.yml"

ypi() {
  yarn plugin import "$1"
}

ypl() {
  yarn plugin list
}

y() {
  yarn "$@"
}

yo() {
  yarn outdated
}

yinit() {
  yarn init
}

ycl() {
  yarn config list -v --why
}
