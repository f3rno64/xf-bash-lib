#!/usr/bin/env bash

xf_has_maven() {
  xf_has_cmd 'mvn'
}

xf_maven_init() {
  if ! xf_has_maven; then return; fi

  local -r MAVEN_RC_PATH="$HOME/.mavenrc"

  xf_safe_source "$MAVEN_RC_PATH"
  xf_log_success "init maven"
}
