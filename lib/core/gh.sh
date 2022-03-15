#!/usr/bin/env bash

xf_has_gh() {
  xf_has_cmd 'gh'
}

xf_gh_init() {
  export GH_EDITOR="$EDITOR"
  export GH_PAGER="$PAGER"
  export GLAMOUR_STYLE="dark"

  xf_log_success "init gh"
}
