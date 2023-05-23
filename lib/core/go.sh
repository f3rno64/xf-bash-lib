#!/usr/bin/env bash

xf_has_go() {
  xf_has_dir "$HOME/.go"
}

xf_go_init() {
  if ! xf_has_go; then return; fi

  export GO_PATH="$HOME/.go"
  export GO_BIN="$GO_PATH/bin"

  xf_safe_add_dir_to_path "$GO_BIN"

  xf_log_success "init go"
}
