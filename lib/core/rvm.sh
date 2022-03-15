#!/usr/bin/env bash

xf_has_rvm() {
  xf_has_dir "$HOME/.rvm"
}

xf_rvm_init() {
  if ! xf_has_rvm; then return; fi

  xf_safe_source "$HOME/.rvm/environments/default" '> /dev/null 2>&1'
  xf_log_success "init rvm"
}
